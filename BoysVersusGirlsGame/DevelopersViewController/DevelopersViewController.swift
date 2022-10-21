//
//  DevelopersViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 21.10.2022.
//

import UIKit

class DevelopersViewController: UIViewController {
    
    let alexeyView = DeveloperView(
        imageView: UIImageView(image: UIImage(named: "Alexey")),
        text: UILabel(text: "iOSDeveloper, Alexey Ivanov",
                      font: .avenir20(),
                      numberOfLines: 0,
                      tintColor: .white),
        backgroundColor: .red,
        cornerRadius: 20,
        isShadow: true
    )
    
    let antonView = DeveloperView(
        imageView: UIImageView(image: UIImage(named: "Anton")),
        text: UILabel(text: "iOS Developer, Anton Mazur",
                      font: .avenir20(), numberOfLines: 0,
                      tintColor: .white),
        backgroundColor: .red,
        cornerRadius: 20,
        isShadow: true
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

//MARK: - Setup Constrains
extension DevelopersViewController {
    
    private func setupConstraints() {
        
        let developerStackView = UIStackView(arrangedSubviews: [alexeyView, antonView], axis: .vertical, spacing: 20)
        
        
        setupSubviews(developerStackView)
        
        NSLayoutConstraint.activate([
            developerStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            developerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            developerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        ])
        
    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { view.addSubview($0) }
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
}

//MARK: - SwiftUI
import SwiftUI

struct DevelopersVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = DevelopersViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}