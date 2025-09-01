import SwiftUI

struct TownView: View {
	
	@StateObject private var viewModel: TownViewModel
	
	init(viewModel: TownViewModel) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}
	
	var body: some View {
		
		List {
			
			// Use overlay views for each location functionality
			
			Section(header: Text("Areas")) {
				
				Button("Training Center") {
					// Improve your skills for money
				}
				Button("Market") {
					// Sell/Buy stuff
				}
				Button("Adventure Guild") {
					// Grab Quest
				}
				Button("Blacksmith") {
					// Buy/Sell/Repair equipment
				}
				Button("Alchemy Store") {
					// Buy/Sell potions
				}
			}
		}
		
		.navigationBarBackButtonHidden(true)
	}
}


