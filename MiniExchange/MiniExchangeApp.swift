//
//  MiniExchangeApp.swift
//  MiniExchange
//
//  Created by MAA on 3.12.2022.
//

import SwiftUI

@main
struct MiniExchangeApp: App {
    //let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
            //ContentView()
               // .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
