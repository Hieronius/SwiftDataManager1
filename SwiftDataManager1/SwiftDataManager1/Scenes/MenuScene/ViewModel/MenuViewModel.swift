import SwiftUI

@MainActor
final class MenuViewModel: ObservableObject {
	
	let compositionRoot: CompositionRoot
	var navigationManager: NavigationManager
	let swiftDataManager: SwiftDataManager
	
	@Published var path: NavigationPath
	
	init(compositionRoot: CompositionRoot,
		 navigationManager: NavigationManager,
		 swiftDataManager: SwiftDataManager) {
		
		self.compositionRoot = compositionRoot
		self.navigationManager = navigationManager
		self.swiftDataManager = swiftDataManager
		
		// Observe navigationManager.path updates
		
		self.path = navigationManager.path
		navigationManager.$path
			.receive(on: DispatchQueue.main)
			.assign(to: &$path)
	}
	
	// MARK: - Navigation
	
	func goToRoom() {
		navigationManager.push(.room)
	}
	
	func goToDungeon() {
		navigationManager.push(.dungeon)
	}
	
	func goToTown() {
		navigationManager.push(.town)
	}
	
	// MARK: - Building of the Sceens
	
	func buildRoom() -> some View {
		compositionRoot.buildRoom()
	}
	
	func buildDungeon() -> some View {
		compositionRoot.buildDungeon()
	}
	
	func buildTown() -> some View {
		compositionRoot.buildTown()
	}
}
