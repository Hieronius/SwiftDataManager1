import SwiftUI

final class TownViewModel: ObservableObject {
	
	// MARK: - Dependencies
	
	let navigationManager: NavigationManager
	
	// MARK: - Properties

	@Published var gameState: GameState
	
	// MARK: - Init
	
	init(navigationManager: NavigationManager,
		 gameState: GameState
	) {
		
		self.navigationManager = navigationManager
		self.gameState = gameState
	}
	
	// MARK: - Operations
	
	func upgradeHP() {
		
	}
	
	func upgradeDamage() {
		
	}
	
	func sellItems() {
		
	}
	
	// MARK: - Navigation
	
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
