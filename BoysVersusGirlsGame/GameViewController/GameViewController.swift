//
//  GameViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 27.10.2022.
//

import UIKit

class GameViewController: BasicViewController {
    
    private let questionView = QuestionView(
        questionImage: UIImageView(image: UIImage(named: "fly")),
        questionLabel: UILabel(text: "Для чего педали самолету?", tintColor: .white)
    )
    
    private let firstAnswerButton = UIButton(title: "A. Управлять хвостом", titleColor: .white)
    private let seconAnswerButton = UIButton(title: "B. Набирать скорость", titleColor: .white)
    private let thirdAnswerButton = UIButton(title: "C. Заряжать аккумулятор", titleColor: .white)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupConstraint()
    }
    
    private func setupNavigationBar() {
        let exitButton = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        exitButton.setImage(UIImage(named: "infoButton"), for: .normal)
        exitButton.addTarget(self, action: #selector(moveToStartVC), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: exitButton)
    }
}

extension GameViewController {
    @objc private func moveToStartVC() {
        self.dismiss(animated: true)
    }
}
    
//MARK: - Setup Constraints
extension GameViewController {
    func setupConstraint() {
        let buttonStackView = UIStackView(arrangedSubviews: [firstAnswerButton, seconAnswerButton, thirdAnswerButton], axis: .vertical, spacing: 10, distribution: .fillEqually)
        let stackView = UIStackView(arrangedSubviews: [questionView, buttonStackView], axis: .vertical, spacing: 70, distribution: .fill)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            questionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }
}
