import SwiftUI

final class DungeonViewModel: ObservableObject {
	
	let navigationManager: NavigationManager

	@Published var gameState: GameState
	
	init(navigationManager: NavigationManager,
		 gameState: GameState
	) {
		
		self.navigationManager = navigationManager
		self.gameState = gameState
	}
	
	func addWords() {
		gameState.words += 1
	}
	
	func removeWords() {
		gameState.words -= 1
	}
	
	func moveToRoom() {
		navigationManager.pop()
		navigationManager.push(.room)
	}
	
	func moveToTown() {
		navigationManager.pop()
		navigationManager.push(.town)
	}
	
	func backToMenu() {
		navigationManager.pop()
	}
	
}
