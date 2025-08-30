import SwiftUI
import SwiftData

@MainActor
final class CompositionRoot {
	
	// MARK: - Dependencies
	
	let navigationManager = NavigationManager()
	var modelContainer: ModelContainer
	var swiftDataManager: SwiftDataManager
	var gameState: GameState
	
	// MARK: - Init
	
	init() {
		
		do {
			
			// 1. Setup Container for SwiftData
			
			self.modelContainer = try ModelContainer(for: GameState.self)
			
			self.swiftDataManager = SwiftDataManager(
				context: self.modelContainer.mainContext
			)
			
			// 2. If User start playing first time -> Create new Game State
			//    If User start previous game -> Load an existing Game State
			
			if let fetchedState = swiftDataManager.loadGameState() {
				self.gameState = fetchedState
				
			} else {
				
				let freshGameState = GameState(items: 111,
											   doors: 11,
											   maps: 49,
											   words: 99)
											   
				self.gameState = freshGameState
				swiftDataManager.saveGameState(gameState)
				
			}
			
		} catch {
			fatalError("Failed to initialize Composition Root")
		}
	}
	
	// MARK: - Dependency Graph
	
	
	
	// MARK: BuildMenu
	
	func buildMenuView() -> MenuView {
		
		let viewModel = MenuViewModel(
			compositionRoot: self,
			navigationManager: self.navigationManager,
			swiftDataManager: self.swiftDataManager
		)
		let view = MenuView(viewModel: viewModel)
		return view
	}
	
	// MARK: BuildRoom
	
	func buildRoom() -> RoomView {
		
		let viewModel = RoomViewModel(
			navigationManager: self.navigationManager,
			gameState: self.gameState
		)
		let view = RoomView(viewModel: viewModel)
		return view
	}
	
	// MARK: BuildDungeon
	
	func buildDungeon() -> DungeonView {
		
		let viewModel = DungeonViewModel(
			navigationManager: self.navigationManager,
			gameState: self.gameState)
		
		let view = DungeonView(viewModel: viewModel)
		return view
	}
	
	// MARK: BuildTown
	
	func buildTown() -> TownView {
		
		let viewModel = TownViewModel(
			navigationManager: self.navigationManager,
			gameState: self.gameState)
		
		let view = TownView(viewModel: viewModel)
		return view
	}
}
