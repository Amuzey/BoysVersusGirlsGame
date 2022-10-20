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
                             font: .avenir20(),
                             numberOfLines: 0,
                             tintColor: .green)
    
    let showDevelopersButton = UIButton(title: "Разработчики",
                                        titleColor: .white,
                                        backgroundColor: .red)
    
    let rateTheAppButton = UIButton(title: "Оценить",
                                    titleColor: .white,
                                    backgroundColor: .red)
    var scrollView = UIScrollView() {
        didSet {
            scrollView = UIScrollView(arrangedSubviews: rulesLabel)
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = RulesViewModel()
        setupConstraints()
        scrollView.addSubview(rulesLabel)
        view.backgroundColor = .white
        
    
    }
}

// MARK: - Setup constrains
extension RulesViewController {
    
   private func setupConstraints() {
        
        let stackViewButton = UIStackView(arrangedSubviews: [showDevelopersButton, rateTheAppButton],
                                          axis: .vertical, spacing: 10)
        
       setupSubviews(stackViewButton, scrollView)
       
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40),
            scrollView.bottomAnchor.constraint(equalTo: stackViewButton.topAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            stackViewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackViewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            stackViewButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { view.addSubview($0) }
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
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
