//
//  StartViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 19.10.2022.
//

import UIKit

class StartViewController: UIViewController {
    let logoImageView = UIImageView(image: UIImage(systemName: "trash.square.fill"))
    let startButton = UIButton(title: "Начать",
                               titleColor: .white,
                               backgroundColor: .blue,
                               font: .systemFont(ofSize: 30),
                               isShadow: true)
    
    private var viewModel: StartViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = StartViewModel()
        view.backgroundColor = .systemPink
        setupNavigationBar()
        setupConstraints()
    }

    private func setupNavigationBar() {
        let settingsButton = UIBarButtonItem(image: UIImage(systemName: "gearshape.circle.fill"),
                                             style: .plain,
                                             target: self,
                                             action: #selector(moveToSettings))
        self.navigationItem.rightBarButtonItem = settingsButton
        let rulesButton = UIBarButtonItem(image: UIImage(systemName: "list.bullet.rectangle.portrait.fill"),
                                          style: .plain, target: self,
                                          action: #selector(moveToRules))
        self.navigationItem.leftBarButtonItem = rulesButton
    }
    
    @objc private func moveToSettings() {
        let settingViewController = SettingsViewController()
        present(settingViewController, animated: true)
    }
    
    @objc private func moveToRules() {
        let rulesViewController = RulesViewController()
        present(rulesViewController, animated: true)
    }
}

//MARK: - Setup View
extension StartViewController {
    private func setupConstraints() {
        setupSubviews(logoImageView, startButton)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            startButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { view.addSubview($0) }
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
}

//MARK: - SwiftUI
import SwiftUI

struct StartVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = StartViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
