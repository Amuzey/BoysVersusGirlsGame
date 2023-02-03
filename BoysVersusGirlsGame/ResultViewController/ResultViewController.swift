//
//  ResultViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 22.10.2022.
//

import UIKit

class ResultViewController: BasicViewController {

    private var winningTeam: String? = nil
    private let cupImageView = UIImageView(image: UIImage(named: "CupPicture"))
    private lazy var resultLabel = CustomLabel(text: winningTeam ?? "Что то пошло не так...",
                                          cornerRadius: 20)
    
    private lazy var resultBoysView = CustomLabel(
        text: String(SetupTeam.shared.boysAnswerCorrectCount),
        imageView: UIImageView(image: UIImage(named: "Star")),
        backgroundColor: .lightBlueColor(),
        cornerRadius: 20,
        isShadow: true
    )
    
    private lazy var resultGirlsView = CustomLabel(
        text: String(SetupTeam.shared.girlsAnswerCorrectCount),
        imageView: UIImageView(image: UIImage(named: "Star")),
        backgroundColor: .lightPinkColor(),
        cornerRadius: 20,
        isShadow: true)
    
    private let answerButton = UIButton(title: "Ответы", titleColor: .white)
    private let repeatButton = UIButton(title: "Меню", titleColor: .white)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if SetupTeam.shared.girlsAnswerCorrectCount > SetupTeam.shared.boysAnswerCorrectCount {
            winningTeam = "Победила команда: \(String(describing: SetupTeam.shared.girlsName))"
        } else if SetupTeam.shared.girlsAnswerCorrectCount < SetupTeam.shared.boysAnswerCorrectCount {
            winningTeam = "Победила команда: \(String(describing: SetupTeam.shared.boysName))"
        } else {
            winningTeam = "Ничья!!!"
        }
        
        repeatButton.addTarget(self, action: #selector(repeatGame), for: .touchUpInside)
        
        cupImageView.contentMode = .scaleAspectFit
        setupConstraints()
    }
}

//MARK: - Setup Constrains
extension ResultViewController {
    
    private func setupConstraints() {
        let resultBoysAndGirsStackView = UIStackView(arrangedSubviews: [resultBoysView, resultGirlsView], axis: .horizontal, spacing: 10, distribution: .fillEqually)
        let infoStackView = UIStackView(arrangedSubviews: [resultLabel, resultBoysAndGirsStackView], axis: .vertical, spacing: 10, distribution: .fillProportionally)
        let buttonStackView = UIStackView(arrangedSubviews: [repeatButton, answerButton], axis: .vertical, spacing: 10, distribution: .fillEqually)
        let resultStackView = UIStackView(arrangedSubviews: [cupImageView, infoStackView, buttonStackView], axis: .vertical, spacing: 30, distribution: .fill)
        
        setupSubviews(resultStackView)
        
        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor.constraint(equalTo: resultStackView.leadingAnchor, constant: 30),
            buttonStackView.trailingAnchor.constraint(equalTo: resultStackView.trailingAnchor, constant: -30),
            resultLabel.heightAnchor.constraint(equalToConstant: 100),
            resultStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            resultStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            resultStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            resultStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { view.addSubview($0) }
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
}

extension ResultViewController {
    @objc func repeatGame() {
        navigationController?.popToRootViewController(animated: true)
    }
}
