//
//  Shared_Counter_ExampleApp.swift
//  Shared Counter Example
//
//  Created by Bartosz Strzecha on 25/08/2025.
//

import SwiftUI

@main
struct Shared_Counter_ExampleApp: App {
    @StateObject private var counter = Counter()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(counter)
        }
    }
}
