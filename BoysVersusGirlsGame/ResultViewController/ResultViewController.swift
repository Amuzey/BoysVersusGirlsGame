//
//  ResultViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 22.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    let cupImageView = UIImageView(image: UIImage(named: "cup"))
    let resultLabel = UILabel(text: "Победила команда Дереволазы ", font: .avenir20(), numberOfLines: 2, tintColor: .red)
    let resultView = ResultView(boysResult: "4", girlsResult: "7")
    let answerButton = UIButton(title: "Ответы", titleColor: .white, backgroundColor: .red)
    let repeatButton = UIButton(title: "Начать заново", titleColor: .white, backgroundColor: .red)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
//MARK: - Setup Constrains
extension ResultViewController {
    
    private func setupConstraints() {
        
        
        let infoStackView = UIStackView(arrangedSubviews: [resultLabel, resultView, answerButton], axis: .vertical, spacing: 5, distribution: .fillEqually)
        
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
