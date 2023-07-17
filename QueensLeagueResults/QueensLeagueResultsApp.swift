//
//  QueensLeagueResultsApp.swift
//  QueensLeagueResults
//
//  Created by Ibrahim Hernández Jorge on 18/7/23.
//

import SwiftUI

@main
struct QueensLeagueResultsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
