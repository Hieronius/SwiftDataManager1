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
			
			HStack {
				Spacer()
				Button("Save State") {
					viewModel.saveState()
				}
				Spacer()
				Button("Load State") {
					viewModel.loadState()
				}
				Spacer()
			}
			
			Spacer()
			
		}
    }
}
