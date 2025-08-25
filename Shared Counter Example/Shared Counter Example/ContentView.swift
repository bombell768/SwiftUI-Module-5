//
//  ContentView.swift
//  Shared Counter Example
//
//  Created by Bartosz Strzecha on 25/08/2025.
//

import SwiftUI

final class Counter: ObservableObject {
    @Published var counterValue: Int = 0
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 24) {
            CounterDisplayView()
            HStack(spacing: 16) {
                DecrementCounterView()
                IncrementCounterView()
            }
        }
        .padding()
    }
}

struct CounterDisplayView: View {
    @EnvironmentObject var counter: Counter
    
    var body: some View {
        Text("Counter: \(counter.counterValue)")
            .font(.largeTitle)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct IncrementCounterView: View {
    @EnvironmentObject var counter: Counter
    
    var body: some View {
        Button {
            counter.counterValue += 1
        } label: {
            Label("+1", systemImage: "plus.circle.fill")
                .font(.title2)
        }
        .buttonStyle(.borderedProminent)
    }
}

struct DecrementCounterView: View {
    @EnvironmentObject var counter: Counter
    
    var body: some View {
        Button {
            counter.counterValue -= 1
        } label: {
            Label("-1", systemImage: "minus.circle.fill")
                .font(.title2)
        }
        .buttonStyle(.bordered)
    }
}

#Preview {
    ContentView()
        .environmentObject(Counter()) 
}
