import SwiftUI

final class RoomViewModel: ObservableObject {
	
	// MARK: - Dependencies
	
	let navigationManager: NavigationManager
	
	// MARK: - Properties
	
	@Published var gameState: GameState
	
	// MARK: - Initialization
	
	init(navigationManager: NavigationManager,
		 gameState: GameState
	) {
		
		self.navigationManager = navigationManager
		self.gameState = gameState
		
	}
	
	// MARK: - Combat
	
	func attackAndToogleCurrentTurn() {
		
		gameState.isHeroTurn ?
		(gameState.enemyCurrentHP -= gameState.heroDamage) :
		(gameState.heroCurrentHP -= gameState.enemyDamage)
		
		gameState.isHeroTurn.toggle()
		print("is hero turn ? - \(gameState.isHeroTurn)")
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
