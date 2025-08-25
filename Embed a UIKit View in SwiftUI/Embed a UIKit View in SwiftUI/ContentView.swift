//
//  ContentView.swift
//  Embed a UIKit View in SwiftUI
//
//  Created by Bartosz Strzecha on 25/08/2025.
//

import SwiftUI
import UIKit

final class ViewController: UIViewController {
    private let label: UILabel = {
        let l = UILabel()
        l.text = "Hello, from UIKit!"
        l.font = .systemFont(ofSize: 22, weight: .semibold)
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

struct UIKitWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        ViewController()
    }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("This is SwiftUI")
                .font(.title2)

            UIKitWrapper()
                .frame(height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 5)

            Text("SwiftUI + UIKit side by side")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
