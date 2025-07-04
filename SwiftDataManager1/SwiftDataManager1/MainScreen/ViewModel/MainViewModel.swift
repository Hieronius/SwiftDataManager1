import SwiftUI

final class MainViewModel: ObservableObject {
	
	let swiftDataManager: SwiftDataManager
	@Published var mainState: MainState
	
	init(swiftDataManager: SwiftDataManager,
		 mainState: MainState) {
		
		self.swiftDataManager = swiftDataManager
		self.mainState = mainState
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
