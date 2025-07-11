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
		self.secondState: SecondState
	}
	
	func addItem() {
		mainState.items += 1
	}
	
	func removeItem() {
		mainState.items -= 1
	}
	
	func saveState() {
		swiftDataManager.saveState(mainState)
	}
	
	func loadState() {
		let state = swiftDataManager.loadState()
		print(state?.items)
		mainState = state ?? MainState(items: 555)
	}
}
