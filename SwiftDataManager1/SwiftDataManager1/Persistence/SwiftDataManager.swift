import SwiftData

final class SwiftDataManager {
	
	var context: ModelContext
	
	init(context: ModelContext) {
		self.context = context
	}
	
	func saveState(_ state: MainState) {
		
		if let fetchedState = self.loadState() {
			fetchedState.items = state.items
		} else {
			context.insert(state)
		}
		
		do {
			try context.save()
		} catch {
			fatalError("failed to save any state")
		}
		
	}
	
	func loadState() -> MainState? {
		
		do {
			let descriptor = FetchDescriptor<MainState>()
			let result = try self.context.fetch(descriptor)
			guard let state = result.first else { return nil }
			return state
			
		} catch {
			fatalError("Failed to load state")
		}
	}
}
