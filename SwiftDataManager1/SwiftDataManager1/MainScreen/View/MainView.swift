import SwiftUI

struct MainView: View {
	
	@StateObject private var viewModel: MainViewModel
	
	init(viewModel: MainViewModel) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}
	
    var body: some View {
		
		VStack {
			Spacer()
			Text("Items - \(viewModel.mainState.items)")
			Spacer()
			Button("Save Main State") {
				viewModel.saveMainState()
			}
			Spacer()
			
			HStack {
				Spacer()
				Button("Add Item") {
					viewModel.addItem()
				}
				Spacer()
				Button("Remove Item") {
					viewModel.removeItem()
				}
				Spacer()
			}
			
			Spacer()
			Text("Doors - \(viewModel.secondState.doors)")
			Spacer()
			Button("Save Second State") {
				viewModel.saveSecondState()
			}
			Spacer()
			
			HStack {
				Spacer()
				Button("Add Door") {
					viewModel.addDoor()
				}
				Spacer()
				Button("Remove Door") {
					viewModel.removeDoor()
				}
				Spacer()
			}
			
			Spacer()
			
		}
    }
}
