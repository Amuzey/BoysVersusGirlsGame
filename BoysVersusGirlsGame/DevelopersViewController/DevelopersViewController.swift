//
//  DevelopersViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 21.10.2022.
//

import UIKit

class DevelopersViewController: BasicViewController {
    private let alexeyView = DeveloperView(
        imageView: UIImageView(image: UIImage(named: "Alexey")),
        text: UILabel(text: "iOS Developer Alexey Ivanov",
                      font: .avenir20(),
                      numberOfLines: 0,
                      tintColor: .white),
        cornerRadius: 20
    )
    
    private let antonView = DeveloperView(
        imageView: UIImageView(image: UIImage(named: "Anton")),
        text: UILabel(text: "iOS Developer Anton Mazur",
                      font: .avenir20(),
                      numberOfLines: 0,
                      tintColor: .white),
        cornerRadius: 20
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainColor()
        setupConstraints()
    }
}

//MARK: - Setup Constraints
extension DevelopersViewController {
    private func setupConstraints() {
        let developerStackView = UIStackView(arrangedSubviews: [alexeyView, antonView],
                                             axis: .vertical,
                                             spacing: 20,
                                             distribution: .fillEqually)
        
        setupSubviews(developerStackView)
        
        NSLayoutConstraint.activate([
            developerStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            developerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            developerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            developerStackView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        
            
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
