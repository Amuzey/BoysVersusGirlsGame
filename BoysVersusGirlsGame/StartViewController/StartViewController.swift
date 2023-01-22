//
//  StartViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 19.10.2022.
//

import UIKit

class StartViewController: BasicViewController {
    
    private let logoImageView = UIImageView(image: UIImage(named: "Logo"),
                                            contentMode: .scaleAspectFit)
    
    private let startButton = UIButton(title: "Начать", titleColor: .white)
    
    private var viewModel: StartViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = StartViewModel()
        startButton.addTarget(self, action: #selector(moveToStart), for: .touchUpInside)
        setupNavigationBar()
        setupConstraints()
    }
    
    private func setupNavigationBar() {
        
        let rulesButton = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        rulesButton.setImage(UIImage(named: "infoButton"), for: .normal)
        rulesButton.addTarget(self, action: #selector(moveToRules), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: rulesButton)
        
        let settingsButton = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        settingsButton.setImage(UIImage(named: "settingbutton"), for: .normal)
        settingsButton.addTarget(self, action: #selector(moveToSettings), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: settingsButton)
    }
}

//MARK: - Actions
extension StartViewController {
    @objc private func moveToRules() {
        let rulesVC = RulesViewController()
        navigationController?.pushViewController(rulesVC, animated: true)
    }
    
    @objc private func moveToSettings() {
        let settingVC = SettingsViewController()
        navigationController?.pushViewController(settingVC, animated: true)
    }
    
    @objc private func moveToStart() {
        let teamBuildingVC = TeamBuildingViewController()
        navigationController?.pushViewController(teamBuildingVC, animated: true)
    }
}

//MARK: - Setup Constraints
extension StartViewController {
    private func setupConstraints() {
        setupSubviews(logoImageView, startButton)
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
            
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
