//
//  ViewController.swift
//  Embed SwiftUI in UIKit
//
//  Created by Bartosz Strzecha on 25/08/2025.
//

import UIKit
import SwiftUI

final class ViewController: UIViewController {
    private let showButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Show SwiftUI Screen"
        let btn = UIButton(configuration: config)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        view.addSubview(showButton)
        NSLayoutConstraint.activate([
            showButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        showButton.addTarget(self, action: #selector(showSwiftUIScreen), for: .touchUpInside)
    }

    @objc private func showSwiftUIScreen() {
        let swiftUIView = SwiftUIView()
        let hosting = UIHostingController(rootView: swiftUIView)
        hosting.modalPresentationStyle = .fullScreen
        present(hosting, animated: true)
    }
}

