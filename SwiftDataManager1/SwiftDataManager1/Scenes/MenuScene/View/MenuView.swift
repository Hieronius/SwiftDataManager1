import SwiftUI

struct MenuView: View {
	
	@StateObject private var viewModel: MenuViewModel
	
	init(viewModel: MenuViewModel) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}
	
	var body: some View {
		
		NavigationStack(path: $viewModel.path) {
			
			
			List {
				
				Section(header: Text("Locations")) {
					
					Button("Room") {
						viewModel.goToRoom()
					}
					Button("Dungeon") {
						viewModel.goToDungeon()
					}
					Button("Town") {
						viewModel.goToTown()
					}
				}
				
				Section(header: Text("Options")) {
					
					Button("Start New Game") {
						
					}
					Button("Save") {
						//
					}
					Button("Exit") {
						
					}
					Button("Game Config") {
						
					}
				}
			}
			
			.navigationTitle("Main Menu")
			.navigationDestination(for: AppScreen.self) { screen in
				
				// 2. Build the screen accordingly to it's type

				switch screen {

					// MARK: RoomBuilder

				case .room: viewModel.buildRoom()

					// MARK: DungeonBuilder

				case .dungeon: viewModel.buildDungeon()

					// MARK: TownBuilder

				case .town: viewModel.buildTown()

				}
			}
		}
	}
}
