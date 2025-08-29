import Foundation

/// An entity to create a comprehensive list of screens to navigation between for our `NavigationManager`
enum AppScreen: String, Hashable, Identifiable {

	/// Unique but stable ID for each screen
	var id: AppScreen { self }

	case main = "MainScreen"
	
	case third = "ThirdScreen"
}
