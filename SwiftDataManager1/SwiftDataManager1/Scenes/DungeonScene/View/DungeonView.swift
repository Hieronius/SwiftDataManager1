import SwiftUI

struct DungeonView: View {
	
	@StateObject private var viewModel: DungeonViewModel
	
	init(viewModel: DungeonViewModel) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}
	
	var body: some View {
		
		Spacer()
		
		VStack {
			Spacer()
			Button("Save Third State") {
				viewModel.saveThirdState()
			}
			Spacer()
			Text("Words - \(viewModel.thirdState.words)")
			Spacer()
			Button("Add Words") {
				viewModel.addWords()
			}
			Spacer()
			Button("Remove Words") {
				viewModel.removeWords()
			}
			Spacer()
		}
		Spacer()
		
		VStack {
			Spacer()
			Button("Move to Room") {
				viewModel.moveToRoom()
			}
			Spacer()
			Button("Move to Town") {
				viewModel.moveToTown()
			}
			Spacer()
			Button("Back to Menu") {
				viewModel.backToMenu()
			}
			Spacer()
		}
	}
}
