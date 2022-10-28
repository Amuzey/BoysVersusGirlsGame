//
//  GameViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 27.10.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    private let questionView = QuestionView(
        questionImage: UIImageView(image: UIImage(named: "fly")),
        questionLabel: UILabel(text: "Для чего педали самолету?", tintColor: .white))
    
    private let firstAnswerButton = UIButton(title: "A. Управлять хвостом", titleColor: .white)
    private let seconAnswerButton = UIButton(title: "B. Набирать скорость", titleColor: .white)
    private let thirdAnswerButton = UIButton(title: "C. Заряжать аккумулятор", titleColor: .white)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainColor()
        setupConstraint()
    }
    
    
}

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

//MARK: - SwiftUI
import SwiftUI

struct GameVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = GameViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
