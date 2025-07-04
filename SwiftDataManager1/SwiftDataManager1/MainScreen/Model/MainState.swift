import SwiftData

@Model
final class MainState {
	
	var items: Int
	
	init(items: Int) {
		self.items = items
	}
}
