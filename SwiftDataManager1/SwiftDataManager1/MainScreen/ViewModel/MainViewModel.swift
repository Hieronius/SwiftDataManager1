import SwiftUI

final class MainViewModel: ObservableObject {
	
	let swiftDataManager: SwiftDataManager
	
	@Published var mainState: MainState
	@Published var secondState: SecondState
	
	init(swiftDataManager: SwiftDataManager,
		 mainState: MainState,
		 secondState: SecondState) {
		
		self.swiftDataManager = swiftDataManager
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
}
