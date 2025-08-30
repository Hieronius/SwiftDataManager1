import SwiftUI

final class TownViewModel: ObservableObject {
	
	let navigationManager: NavigationManager

	@Published var gameState: GameState
	
	init(navigationManager: NavigationManager,
		 gameState: GameState
	) {
		
		self.navigationManager = navigationManager
		self.gameState = gameState
	}
	
	func addMaps() {
		gameState.maps += 1
	}
	
	func removeMaps() {
		gameState.maps -= 1
	}
	
	func moveToRoom() {
		navigationManager.pop()
		navigationManager.push(.room)
	}
	
	func moveToDungeon() {
		navigationManager.pop()
		navigationManager.push(.dungeon)
	}
	
	func backToMenu() {
		navigationManager.pop()
	}
}
