//
//  SwiftUIView.swift
//  Embed SwiftUI in UIKit
//
//  Created by Bartosz Strzecha on 25/08/2025.
//

import SwiftUI

struct SwiftUIView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Hello from SwiftUI 👋")
                .font(.title2)
            
            Button("Close") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    SwiftUIView()
}
