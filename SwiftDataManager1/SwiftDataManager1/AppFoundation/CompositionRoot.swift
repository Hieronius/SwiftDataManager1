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
			self.modelContainer = try ModelContainer(for: MainState.self)
			self.swiftDataManager = SwiftDataManager(context: self.modelContainer.mainContext)
			self.mainState = swiftDataManager.loadState() ?? MainState(items: 111)
			self.secondState = swiftDataManager.loadState() ?? 
			
		} catch {
			fatalError("Failed to initialize Composition Root")
		}
	}
	
	func buildMainView() -> MainView {
		
		let viewModel = MainViewModel(
			swiftDataManager: self.swiftDataManager,
			mainState: self.mainState
		)
		let view = MainView(viewModel: viewModel)
		return view
	}
}
