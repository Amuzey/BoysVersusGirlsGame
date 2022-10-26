//
//  ResultViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 22.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    private let cupImageView = UIImageView(image: UIImage(named: "CupPicture"))
    private let resultLabel = CustomLabel(label: UILabel(text: "Победила команда: Дереволазы",
                                                         numberOfLines: 0,
                                                         tintColor: .white),
                                          cornerRadius: 20)
    
    private let resultBoysView = CustomLabel(
        label: UILabel(text: "7", tintColor: .white),
        imageView: UIImageView(image: UIImage(named: "Star")),
        backgroundColor: .lightBlueColor(),
        cornerRadius: 20,
        isShadow: true
    )
    
    private let resultGirlsView = CustomLabel(
        label: UILabel(text: "3", tintColor: .white),
        imageView: UIImageView(image: UIImage(named: "Star")),
        backgroundColor: .lightPinkColor(),
        cornerRadius: 20,
        isShadow: true)
    
    private let answerButton = UIButton(title: "Ответы", titleColor: .white)
    private let repeatButton = UIButton(title: "Меню", titleColor: .white)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainColor()
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

//MARK: - SwiftUI
import SwiftUI

struct ResultVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = ResultViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
