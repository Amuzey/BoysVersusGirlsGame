//
//  ResultViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 22.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    let cupImageView = UIImageView(image: UIImage(named: "cup"))
    let resultLabel = CustomLabel(label: UILabel(text: "Победила команда Дереволазы",
                                                 numberOfLines: 0,
                                                 tintColor: .white),
                                  cornerRadius: 20)
    
    let resultView = ResultView(boysResult: "4", girlsResult: "7")
    let answerButton = UIButton(title: "Ответы", titleColor: .white)
    let repeatButton = UIButton(title: "Меню", titleColor: .white)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainColor()
        setupConstraints()
    }
}

//MARK: - Setup Constrains
extension ResultViewController {
    
    private func setupConstraints() {
        
        let infoStackView = UIStackView(arrangedSubviews: [resultLabel, resultView, answerButton], axis: .vertical, spacing: 10, distribution: .fillProportionally)
        let resultStackView = UIStackView(arrangedSubviews: [cupImageView, infoStackView, repeatButton], axis: .vertical, spacing: 40, distribution: .equalCentering)
        
        setupSubviews(resultStackView)
        
        NSLayoutConstraint.activate([
            resultStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
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
