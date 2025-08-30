import SwiftData

final class SwiftDataManager {
	
	var context: ModelContext
	
	init(context: ModelContext) {
		self.context = context
	}
	
	// MARK: - CRUD for MainState
	
	func saveMainState(_ mainState: MainState) {
		
		if let fetchedState = self.loadMainState() {
			fetchedState.items = mainState.items
		} else {
			context.insert(mainState)
		}
		
		do {
			try context.save()
		} catch {
			fatalError("failed to save any state")
		}
		
	}
	
	func loadMainState() -> MainState? {
		
		do {
			let descriptor = FetchDescriptor<MainState>()
			let result = try self.context.fetch(descriptor)
			guard let state = result.first else { return nil }
			return state
			
		} catch {
			fatalError("Failed to load state")
		}
	}
	
	// MARK: - CRUD for SecondState
	
	func saveSecondState(_ secondState: SecondState) {
		
		if let fetchedState = self.loadSecondState() {
			fetchedState.doors = secondState.doors
		} else {
			self.context.insert(secondState)
		}
		
		do {
			try context.save()
			
		} catch {
			fatalError("Failed to save SecondState")
		}
		
	}
	
	func loadSecondState() -> SecondState? {
		
		do {
			let descriptor = FetchDescriptor<SecondState>()
			let result = try self.context.fetch(descriptor)
			guard let state = result.first else { return nil }
			return state
			
		} catch {
			fatalError("Failed to load SecondState")
		}
	}
	
	// MARK: - CRUD for ThirdState
	
	func saveThirdState(_ thirdState: ThirdState) {
		
		if let fetchedState = loadThirdState() {
			fetchedState.words = thirdState.words
		} else {
			context.insert(thirdState)
		}
		
		do {
			try context.save()
			
		} catch {
			fatalError("Failed to save ThirdState")
		}
	}
	
	func loadThirdState() -> ThirdState? {
		
		do {
			let descriptor = FetchDescriptor<ThirdState>()
			let result = try context.fetch(descriptor)
			guard let state = result.first else { return nil }
			return state
			
		} catch {
			fatalError("Failed to load ThirdState")
		}
	}
	
	// MARK: - CRUD for FourthState
	
	func saveFourthState(_ fourthState: FourthState) {
		
		if let fetchedState = loadFourthState() {
			fetchedState.maps = fourthState.maps
		} else {
			context.insert(fourthState)
		}
		
		do {
			try context.save()
			
		} catch {
			fatalError("Failed to save FourthState")
		}
	}
	
	func loadFourthState() -> FourthState? {
		
		do {
			let descriptor = FetchDescriptor<FourthState>()
			let result = try context.fetch(descriptor)
			guard let state = result.first else { return nil }
			return state
			
		} catch {
			fatalError("Failed to load FourthState")
		}
	}
}
