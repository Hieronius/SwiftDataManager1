import SwiftData

@Model
final class GameState {
	
	// MARK: Room State
	
	var heroCurrentHP = 100
	var heroMaxHP = 100
	var heroDamage = 10
	
	var isHeroTurn = true
	
	var enemyCurrentHP = 100
	var enemyMaxHP = 100
	var enemyDamage = 5
	
	// MARK: Dungeon State
	
	
	
	// MARK: Town State
	
	var items = 10
	var doors = 15
	var maps = 20
	var words = 25
	
	init() {
		
	}
}
