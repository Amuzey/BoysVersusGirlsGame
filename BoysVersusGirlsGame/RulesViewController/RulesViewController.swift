//
//  RulesViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 19.10.2022.
//

import UIKit

class RulesViewController: UIViewController {
    
    private var viewModel: RulesViewModelProtocol?
    
    
    let rulesLabel = UILabel(text: DataStorage.shared.rules,
                             font: .avenir20())
    
    let showDevelopersButton = UIButton(title: "Разработчики",
                                        titleColor: .white,
                                        backgroundColor: .red)
    
    let rateTheAppButton = UIButton(title: "Оценить",
                                    titleColor: .white,
                                    backgroundColor: .red)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = RulesViewModel()
        setupConstraints()
    }
}

// MARK: - Setup constrains
extension RulesViewController {
    
    func setupConstraints() {
        
        let stackViewButton = UIStackView(arrangedSubviews: [showDevelopersButton, rateTheAppButton],
                                          axis: .vertical, spacing: 10)
        
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        stackViewButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(rulesLabel)
        view.addSubview(stackViewButton)
        
        NSLayoutConstraint.activate([
            rulesLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            stackViewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackViewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            stackViewButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }
}

// MARK: - SwiftUI
import SwiftUI

struct RulesVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = RulesViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
