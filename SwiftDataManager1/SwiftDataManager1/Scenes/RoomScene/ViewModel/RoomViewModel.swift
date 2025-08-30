import SwiftUI

final class RoomViewModel: ObservableObject {
	
	let swiftDataManager: SwiftDataManager
	let navigationManager: NavigationManager
	
	@Published var mainState: MainState
	@Published var secondState: SecondState
	
	init(swiftDataManager: SwiftDataManager,
		 navigationManager: NavigationManager,
		 mainState: MainState,
		 secondState: SecondState) {
		
		self.swiftDataManager = swiftDataManager
		self.navigationManager = navigationManager
		self.mainState = mainState
		self.secondState = secondState
	}
	
	func addItem() {
		mainState.items += 1
	}
	
	func removeItem() {
		mainState.items -= 1
	}
	
	func saveMainState() {
		swiftDataManager.saveMainState(mainState)
	}
	
	func addDoor() {
		secondState.doors += 1
	}
	
	func removeDoor() {
		secondState.doors -= 1
	}
	
	func saveSecondState() {
		swiftDataManager.saveSecondState(secondState)
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
