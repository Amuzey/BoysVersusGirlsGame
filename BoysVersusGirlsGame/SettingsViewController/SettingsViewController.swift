//
//  SettingsViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 19.10.2022.
//

import UIKit

class SettingsViewController: BasicViewController {
    private var viewModel: SettingViewModelProtocol?
    
    private let numberOfQuestionsView = SettingsView(
        textLabel: UILabel(text: "Количество вопросов:", numberOfLines: 1, tintColor: .white),
        valueLabel: UILabel(text: String(Int(UserSetting.numberOfQuestion)), numberOfLines: 1, tintColor: .white),
        stepForSlider: 1,
        minimumValue: 5,
        maximumValue: 20,
        value: UserSetting.numberOfQuestion
    )
    
    private let timeForAnswerView = SettingsView(
        textLabel: UILabel(text: "Время на ответ:", numberOfLines: 1, tintColor: .white),
        valueLabel: UILabel(text: String(Int(UserSetting.timeForAnswer)), numberOfLines: 1, tintColor: .white),
        stepForSlider: 5,
        minimumValue: 10,
        maximumValue: 50,
        value: UserSetting.timeForAnswer
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SettingViewModel()
        setupConstraints()
        
        numberOfQuestionsView.settingSlider.addTarget(self, action: #selector(sliderNumberValueChanged), for: .valueChanged)
        timeForAnswerView.settingSlider.addTarget(self, action: #selector(sliderTimeValueChanged), for: .valueChanged)
    }
}

extension SettingsViewController {
    
    @objc func sliderNumberValueChanged(sender: UISlider) {
        UserSetting.numberOfQuestion = sender.value
    }
        
    @objc func sliderTimeValueChanged(sender: UISlider) {
        UserSetting.timeForAnswer = sender.value
    }
}


//MARK: - Setup Constraints
extension SettingsViewController {
    private func setupConstraints() {
        let settingsStackView = UIStackView(arrangedSubviews: [numberOfQuestionsView, timeForAnswerView],
                                            axis: .vertical,
                                            spacing: 15,
                                            distribution: .fillEqually)
        setupSubviews(settingsStackView)
        
        NSLayoutConstraint.activate([
            settingsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            settingsStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            settingsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            settingsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
