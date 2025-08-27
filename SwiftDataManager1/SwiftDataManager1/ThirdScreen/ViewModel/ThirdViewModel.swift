import SwiftUI

final class ThirdViewModel: ObservableObject {
	
	let swiftDataManager: SwiftDataManager
	let navigationManager: NavigationManager
	
	@Published var thirdState: ThirdState
	
	init(swiftDataManager: SwiftDataManager,
		 navigationManager: NavigationManager,
		 thirdState: ThirdState) {
		
		self.swiftDataManager = swiftDataManager
		self.navigationManager = navigationManager
		self.thirdState = thirdState
	}
	
	func addWords() {
		thirdState.words += 1
	}
	
	func removeWords() {
		thirdState.words -= 1
	}
	
	func saveThirdState() {
		swiftDataManager.saveThirdState(thirdState)
	}
	
}
