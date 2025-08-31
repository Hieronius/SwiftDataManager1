import SwiftUI

struct RoomView: View {
	
	@StateObject private var viewModel: RoomViewModel
	
	init(viewModel: RoomViewModel) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}
	
	var body: some View {
		
		VStack {
			
			Spacer()
			
			Text(viewModel.gameState.isHeroTurn ? "Hero Turn" : "Enemy Turn")
			
			Spacer()
			
			HStack {
				
				Spacer()
				
				VStack {
					Text("Hero")
					Text("\(viewModel.gameState.heroCurrentHP)/\(viewModel.gameState.heroMaxHP)")
						.foregroundStyle(.red)
					Rectangle()
						.frame(width: 80, height: 80)
						.foregroundColor(.black)
						.border(Color.yellow, width: 5)
					
				}
				Spacer()
				
				VStack {
					Text("Enemy")
					Text("\(viewModel.gameState.enemyCurrentHP)/\(viewModel.gameState.enemyMaxHP)")
						.foregroundStyle(.red)
					Rectangle()
						.frame(width: 80, height: 80)
						.foregroundColor(.black)
						.border(Color.white, width: 5)
				}
				
				Spacer()
			}
		}
		
		Spacer()
		
		List {
			
			Section(header: Text("Actions")) {
				
				Button("Attack") {
					
					viewModel.attackAndToogleCurrentTurn()
				}
			}
			
			Section(header: Text("Navigation")) {
				
				Button("Move to Dungeon") {
					viewModel.moveToDungeon()
				}
				Button("Move to Town") {
					viewModel.moveToTown()
				}
				Button("Back to Menu") {
					viewModel.backToMenu()
				}
			}
		}
		
		Spacer()
		
		.navigationBarBackButtonHidden(true)
	}
}
