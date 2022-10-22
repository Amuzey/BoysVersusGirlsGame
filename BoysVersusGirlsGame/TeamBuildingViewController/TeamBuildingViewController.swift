//
//  TeamBuildingViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 21.10.2022.
//

import UIKit

class TeamBuildingViewController: UIViewController {
    
    let headerLabel = UILabel(text: "Введите название Женской команды:", font: .avenir35(), numberOfLines: 0, tintColor: .black)
    let teamNameTextField = OneLineTextField(font: .avenir20())
    let continuedButton = UIButton(title: "Продолжить", titleColor: .white, backgroundColor: .red)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
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
extension TeamBuildingViewController {
    
    private func setupConstraints() {
        setupSubviews(headerLabel, teamNameTextField, continuedButton)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            headerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            teamNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            teamNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            teamNameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            continuedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            continuedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            continuedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { view.addSubview($0) }
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
}

//MARK: - SwiftUI
import SwiftUI

struct TeamBuildingVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = TeamBuildingViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
