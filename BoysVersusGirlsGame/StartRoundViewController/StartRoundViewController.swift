//
//  StartRoundViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 27.10.2022.
//

import UIKit

class StartRoundViewController: BasicViewController {
    
    private lazy var comandNameLabel = SetupTeam.shared.isGirl ?? true
    ? CustomLabel(text: SetupTeam.shared.girlsName ?? "Нет имени")
    : CustomLabel(text: SetupTeam.shared.boysName ?? "Нет имени")
    
    private lazy var gameButton = UIButton(title: "Играть",
                                      titleColor: .white,
                                      backgroundColor: SetupTeam.shared.isGirl ?? true
                                      ? .lightPinkColor()
                                      : .lightBlueColor(),
                                      cornerRadius: 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        setupConstrains()
    }
}

//MARK: - objc Method
extension StartRoundViewController {
    @objc func startGame() {
        let gameVC = GameViewController()
        navigationController?.pushViewController(gameVC, animated: true)
    }
}

//MARK: - Setup Constraints
extension StartRoundViewController {
    private func setupConstrains() {
        setupSubviews(comandNameLabel, gameButton)
        
        NSLayoutConstraint.activate([
            comandNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            comandNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            comandNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            gameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gameButton.heightAnchor.constraint(equalTo: gameButton.widthAnchor),
            gameButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ])
    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
