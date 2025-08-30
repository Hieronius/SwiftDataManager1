import SwiftUI

struct RoomView: View {
	
	@StateObject private var viewModel: RoomViewModel
	
	init(viewModel: RoomViewModel) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}
	
    var body: some View {
		
		VStack {
			Spacer()
			Text("Items - \(viewModel.gameState.items)")
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
			Text("Doors - \(viewModel.gameState.doors)")
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
			
			VStack {
				
				Spacer()
				Button("Move to Dungeon") {
					viewModel.moveToDungeon()
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
}
