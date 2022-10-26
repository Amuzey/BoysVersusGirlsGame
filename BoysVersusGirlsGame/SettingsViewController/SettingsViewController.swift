//
//  SettingsViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 19.10.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    private var viewModel: SettingViewModelProtocol?
    
    private let numberOfQuestionsView = SettingsView(
        textLabel: UILabel(text: "Количество вопросов:", numberOfLines: 1, tintColor: .white),
        valueLabel: UILabel(text: "12", numberOfLines: 1, tintColor: .white),
        stepForSlider: 2,
        minimumValue: 5,
        maximumValue: 20
    )
    
    private let timeForAnswerView = SettingsView(
        textLabel: UILabel(text: "Время на ответ:", numberOfLines: 1, tintColor: .white),
        valueLabel: UILabel(text: "0", numberOfLines: 1, tintColor: .white),
        stepForSlider: 5,
        minimumValue: 20,
        maximumValue: 50
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SettingViewModel()
        view.backgroundColor = .mainColor()
        setupConstraints()
    }
}

//MARK: - Setup View
extension SettingsViewController {
    private func setupConstraints() {
        let settingsStackView = UIStackView(arrangedSubviews: [numberOfQuestionsView, timeForAnswerView], axis: .vertical, spacing: 15, distribution: .fillEqually)
        setupSubviews(settingsStackView)
        
        NSLayoutConstraint.activate([
            settingsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            settingsStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            settingsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            settingsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
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

struct SettingsVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = SettingsViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
