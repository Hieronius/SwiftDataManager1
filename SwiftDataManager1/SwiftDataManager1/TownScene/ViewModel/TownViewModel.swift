import SwiftUI

final class TownViewModel: ObservableObject {
	
	let navigationManager: NavigationManager
	let swiftDataManager: SwiftDataManager
	
	@Published var fourthState: FourthState
	
	init(navigationManager: NavigationManager,
		 swiftDataManager: SwiftDataManager,
		 fourthState: FourthState) {
		
		self.navigationManager = navigationManager
		self.swiftDataManager = swiftDataManager
		self.fourthState = fourthState
	}
	
	func addMaps() {
		fourthState.maps += 1
	}
	
	func removeMaps() {
		fourthState.maps -= 1
	}
	
	func saveFourthState() {
		swiftDataManager.saveFourthState(fourthState)
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
