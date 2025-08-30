import SwiftUI
import SwiftData

@MainActor
final class CompositionRoot {
	
	let navigationManager = NavigationManager()
	var modelContainer: ModelContainer
	var swiftDataManager: SwiftDataManager
	
	// MARK: Make a single source of truth with GameState class
	
	var mainState: MainState
	var secondState: SecondState
	var thirdState: ThirdState
	var fourthState: FourthState
	
	init() {
		
		do {
			self.modelContainer = try ModelContainer(for: MainState.self,
													 SecondState.self,
													 ThirdState.self,
													 FourthState.self)
			
			self.swiftDataManager = SwiftDataManager(
				context: self.modelContainer.mainContext
			)
			
			// if it's a new game -> get default one and save it to SwiftData.
			// Otherwise load from SwiftData
			self.mainState = swiftDataManager.loadMainState() ?? MainState(items: 111)
			self.secondState = swiftDataManager.loadSecondState() ?? SecondState(doors: 11)
			self.thirdState = swiftDataManager.loadThirdState() ?? ThirdState(words: 99)
			self.fourthState = swiftDataManager.loadFourthState() ?? FourthState(maps: 49)
			
		} catch {
			fatalError("Failed to initialize Composition Root")
		}
	}
	
	func buildMenuView() -> MenuView {
		
		let viewModel = MenuViewModel(
			compositionRoot: self,
			navigationManager: self.navigationManager,
			swiftDataManager: self.swiftDataManager
		)
		let view = MenuView(viewModel: viewModel)
		return view
	}
	
	func buildRoom() -> RoomView {
		
		let viewModel = RoomViewModel(
			swiftDataManager: self.swiftDataManager,
			navigationManager: self.navigationManager,
			mainState: self.mainState,
			secondState: self.secondState
		)
		let view = RoomView(viewModel: viewModel)
		return view
	}
	
	func buildDungeon() -> DungeonView {
		
		let viewModel = DungeonViewModel(
			swiftDataManager: self.swiftDataManager,
			navigationManager: self.navigationManager,
			thirdState: self.thirdState
		)
		
		let view = DungeonView(viewModel: viewModel)
		return view
	}
	
	func buildTown() -> TownView {
		
		let viewModel = TownViewModel(
			navigationManager: self.navigationManager,
			swiftDataManager: self.swiftDataManager,
			fourthState: self.fourthState
		)
		let view = TownView(viewModel: viewModel)
		return view
	}
}
