//
//  SwiftDataManager1App.swift
//  SwiftDataManager1
//
//  Created by Арсентий Халимовский on 04.07.2025.
//

import SwiftUI

@main
@MainActor
struct SwiftDataManager1App: App {
	
	let compositionRoot = CompositionRoot()
	
    var body: some Scene {
        WindowGroup {
			compositionRoot.buildMainView()
        }
    }
}
