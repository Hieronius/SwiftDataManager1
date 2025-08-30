import SwiftData

final class SwiftDataManager {
	
	var context: ModelContext
	
	init(context: ModelContext) {
		self.context = context
	}
	
	// MARK: - CRUD for GameState
	
	func saveGameState(_ state: GameState) {
		
		let fetchedState = loadGameState()
		
		if fetchedState == nil {
			context.insert(state)
		}
		
		do {
			try context.save()
			
		} catch {
			fatalError("Failed to Save Game State")
		}
	}
	
	func loadGameState() -> GameState? {
		
		do {
			let descriptor = FetchDescriptor<GameState>()
			let result = try context.fetch(descriptor)
			guard let state = result.first else { return nil }
			return state
			
		} catch {
			fatalError("Failed to Fetch Main State")
		}
	}
}
