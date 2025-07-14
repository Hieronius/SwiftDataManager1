import SwiftUI
import SwiftData

@MainActor
final class CompositionRoot {
	
	var modelContainer: ModelContainer
	var swiftDataManager: SwiftDataManager
	var mainState: MainState
	var secondState: SecondState
	
	init() {
		
		do {
			self.modelContainer = try ModelContainer(for: MainState.self,
													 SecondState.self)
			self.swiftDataManager = SwiftDataManager(context: self.modelContainer.mainContext)
			self.mainState = swiftDataManager.loadMainState() ?? MainState(items: 111)
			self.secondState = swiftDataManager.loadSecondState() ?? SecondState(doors: 11)
			
		} catch {
			fatalError("Failed to initialize Composition Root")
		}
	}
	
	func buildMainView() -> MainView {
		
		let viewModel = MainViewModel(
			swiftDataManager: self.swiftDataManager,
			mainState: self.mainState,
			secondState: self.secondState
		)
		let view = MainView(viewModel: viewModel)
		return view
	}
}
