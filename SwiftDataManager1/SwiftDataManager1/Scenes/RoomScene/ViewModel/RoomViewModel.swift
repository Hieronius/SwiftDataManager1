import SwiftUI

final class RoomViewModel: ObservableObject {
	
	let navigationManager: NavigationManager
	
	@Published var gameState: GameState
	
	init(navigationManager: NavigationManager,
		 gameState: GameState
	) {
		
		self.navigationManager = navigationManager
		self.gameState = gameState
		
	}
	
	func addItem() {
		gameState.items += 1
	}
	
	func removeItem() {
		gameState.items -= 1
	}
	
	func addDoor() {
		gameState.doors += 1
	}
	
	func removeDoor() {
		gameState.doors -= 1
	}
	
	func moveToDungeon() {
		navigationManager.pop()
		navigationManager.push(.dungeon)
	}
	
	func moveToTown() {
		navigationManager.pop()
		navigationManager.push(.town)
	}
	
	func backToMenu() {
		navigationManager.pop()
	}
}
