import SwiftData

@Model
final class GameState {
	
	var items: Int
	var doors: Int
	var maps: Int
	var words: Int
	
	init(items: Int,
		 doors: Int,
		 maps: Int,
		 words: Int) {
		
		self.items = items
		self.doors = doors
		self.maps = maps
		self.words = words
	}
}
