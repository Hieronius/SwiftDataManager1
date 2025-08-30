import SwiftUI

struct TownView: View {
	
	@StateObject private var viewModel: TownViewModel
	
	init(viewModel: TownViewModel) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}
	
	var body: some View {
		
		Spacer()
		VStack {
			Spacer()
			Text("Maps -\(viewModel.gameState.maps)")
			Spacer()
			Button("Add Maps") {
				viewModel.addMaps()
			}
			Spacer()
			Button("Remove Maps") {
				viewModel.removeMaps()
			}
			Spacer()
			Button("Move to Room") {
				viewModel.moveToRoom()
			}
			Spacer()
			Button("Move to Dungeon") {
				viewModel.moveToDungeon()
			}
			Spacer()
			Button("Back to Menu") {
				viewModel.backToMenu()
			}
		}
	}
}


