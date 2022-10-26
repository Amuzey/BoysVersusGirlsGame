//
//  TeamBuildingViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 21.10.2022.
//

import UIKit

class TeamBuildingViewController: UIViewController {
    
    let headerLabel = CustomLabel(label: UILabel(text: "Введите название женской команды:", numberOfLines: 2, tintColor: .white), cornerRadius: 20)
    let teamNameTextField = CustomTextField(imageView: UIImageView(image: UIImage(named: "GirlsLogo")), cornerRadius: 20)
    let continuedButton = UIButton(title: "Продолжить",
                                   titleColor: .white,
                                   backgroundColor: .lightPinkColor(),
                                   cornerRadius: 25)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainColor()
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
            teamNameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            teamNameTextField.heightAnchor.constraint(equalToConstant: 75)
        ])
        
        NSLayoutConstraint.activate([
            continuedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            continuedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            continuedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            continuedButton.heightAnchor.constraint(equalToConstant: 75)
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
