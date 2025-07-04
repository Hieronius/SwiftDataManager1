import SwiftUI
import SwiftData

@MainActor
final class CompositionRoot {
	
	var modelContainer: ModelContainer
	var swiftDataManager: SwiftDataManager
	var mainState: MainState
	
	init() {
		
		do {
			self.modelContainer = try ModelContainer(for: MainState.self)
			self.swiftDataManager = SwiftDataManager(context: self.modelContainer.mainContext)
			self.mainState = swiftDataManager.loadState() ?? MainState(items: 111)
			
		} catch {
			fatalError("Failed to initialize Composition Root")
		}
	}
	
	func buildMainView() -> MainView {
		
		let viewModel = MainViewModel(swiftDataManager: self.swiftDataManager,
									  mainState: self.mainState)
		let view = MainView(viewModel: viewModel)
		return view
	}
}
