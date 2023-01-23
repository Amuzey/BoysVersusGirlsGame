//
//  RulesViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 19.10.2022.
//

import UIKit

class RulesViewController: BasicViewController {
    private var viewModel: RulesViewModelProtocol?
    
    private let showDevelopersButton = UIButton(title: "Разработчики",
                                                titleColor: .white)
    
    private let rateTheAppButton = UIButton(title: "Оценить",
                                            titleColor: .white)
    
    private let scrollView = UIScrollView(
        arrangedSubviews: UILabel(text: DataStorage.shared.rules, numberOfLines: 0, tintColor:.white),
        backgroundColor: .buttonColor(),
        cornerRadius: 15
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = RulesViewModel()
        showDevelopersButton.addTarget(self, action: #selector(moveToDevelopers), for: .touchUpInside)
        setupConstraints()
    }
}

//MARK: - Actions
extension RulesViewController {
    @objc private func moveToDevelopers() {
        let developersVC = DevelopersViewController()
        navigationController?.pushViewController(developersVC, animated: true)
    }
}

// MARK: - Setup Constraints
extension RulesViewController {
    private func setupConstraints() {
        let stackViewButton = UIStackView(arrangedSubviews: [showDevelopersButton, rateTheAppButton],
                                          axis: .vertical, spacing: 10, distribution: .fill)
        
        setupSubviews(stackViewButton, scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40),
            scrollView.bottomAnchor.constraint(equalTo: stackViewButton.topAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            stackViewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            stackViewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            stackViewButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { view.addSubview($0) }
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
}
