//
//  Task_Manager_ExampleApp.swift
//  Task Manager Example
//
//  Created by Bartosz Strzecha on 25/08/2025.
//

import SwiftUI

@main
struct Task_Manager_ExampleApp: App {
    @StateObject private var manager = TaskManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
        }
    }
}
