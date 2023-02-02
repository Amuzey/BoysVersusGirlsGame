//
//  TeamBuildingViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 21.10.2022.
//

import UIKit

class TeamBuildingViewController: BasicViewController {
    
    private let headerLabel = CustomLabel(
        text: "Введите названия команд: ", 
        cornerRadius: 20)
    
    private let girlsTeamNameTextField = CustomTextField(
        imageView: UIImageView(image: UIImage(named: "GirlsLogo")),
        cornerRadius: 20, tintColor: UIColor.lightPinkColor())
    
    private let boysTeamNameTextField = CustomTextField(
        imageView: UIImageView(image: UIImage(named: "BoysLogo")),
        cornerRadius: 20, tintColor: UIColor.lightBlueColor())
    
    private let continuedButton = UIButton(title: "Продолжить",
                                           titleColor: .white,
                                           backgroundColor: .buttonColor(),
                                           cornerRadius: 25)
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        continuedButton.addTarget(self, action: #selector(continueButtonTaped), for: .touchUpInside)
        setupConstraints()
    }
}

//MARK: - @objc Methods
extension TeamBuildingViewController {
    @objc private func continueButtonTaped() {
        guard let girlsName = girlsTeamNameTextField.textField.text else { return }
        guard let boysName = boysTeamNameTextField.textField.text else { return }
        if girlsName.isEmpty || boysName.isEmpty {
            showAlert(title: "Введите название команд", message: "Названия отсутствуют, или введены неверно")
        } else {
            SetupTeam.shared.addGirl(name: girlsName)
            SetupTeam.shared.addBoy(name: boysName)
            let startRoundVC = StartRoundViewController()
            navigationController?.pushViewController(startRoundVC, animated: true)
        }
    }
}

//MARK: - UIAlertController
extension TeamBuildingViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.girlsTeamNameTextField.textField.text = ""
            self.boysTeamNameTextField.textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


//MARK: - Setup Constraints
extension TeamBuildingViewController {
    
    private func setupConstraints() {
        let teamNameStackView = UIStackView(
            arrangedSubviews: [girlsTeamNameTextField, boysTeamNameTextField],
            axis: .vertical, spacing: 10, distribution: .fillEqually
        )
        setupSubviews(headerLabel, teamNameStackView, continuedButton)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            headerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            teamNameStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            teamNameStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            teamNameStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            teamNameStackView.heightAnchor.constraint(equalToConstant: 170)
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
