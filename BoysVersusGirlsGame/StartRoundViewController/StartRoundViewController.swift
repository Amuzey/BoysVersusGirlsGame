//
//  StartRoundViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 27.10.2022.
//

import UIKit

class StartRoundViewController: BasicViewController {
    private let comandNameLabel = CustomLabel(label: UILabel(text: "Начинает команда: Дереволазы", tintColor: .white),
                                              cornerRadius: 20)
    
    private let gameButton = UIButton(title: "Играть",
                                      titleColor: .white,
                                      backgroundColor: .lightPinkColor(),
                                      cornerRadius: 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstrains()
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

//MARK: - SwiftUI
import SwiftUI

struct StartRoundVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = StartRoundViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
