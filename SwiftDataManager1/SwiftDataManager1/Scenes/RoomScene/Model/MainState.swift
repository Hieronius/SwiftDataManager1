import SwiftData

@Model
final class MainState {
	
	enum RoomState {
		static let roomSize = 5
		static let roomDifficulty = 10
	}
	
	enum DungeonState {
		static let dungeonSize = 10
		static let dungeonLevels = 99
	}
	
	enum TownState {
		static let potionPrice = 50
		static let swoftPrice = 100
	}
	
	var items: Int
	
	init(items: Int) {
		self.items = items
	}
}
