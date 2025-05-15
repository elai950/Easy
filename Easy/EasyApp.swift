//
//  EasyApp.swift
//  Easy
//
//  Created by Elai Zuberman on 15/05/2025.
//

import SwiftUI

@main
struct EasyApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
                    .environmentObject(dataController)
                    .environment(\.managedObjectContext, dataController.container.viewContext)
            }
        }
    }
}
