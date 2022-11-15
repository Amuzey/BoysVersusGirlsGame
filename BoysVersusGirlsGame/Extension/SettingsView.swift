//
//  UIView.swift
//  BoysVersusGirlsGame
//
//  Created by Клоун on 26.10.2022.
//

import UIKit

class SettingsView: UIView {
    convenience init(backgroundColor: UIColor = .buttonColor(),
                     textLabel: UILabel,
                     valueLabel: UILabel,
                     stepForSlider: Float,
                     minimumValue: Float,
                     maximumValue: Float,
                     isShadow: Bool = true) {
        self.init()
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 30
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        
        if isShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.8
            self.layer.shadowOffset = CGSize(width: 0, height: 5)
        }
        
        let settingSlider = UISlider(minimumValue: minimumValue, maximumValue: maximumValue, step: stepForSlider)
        
        let labelStackView = UIStackView(arrangedSubviews: [textLabel, valueLabel],
                                         axis: .horizontal,
                                         spacing: 20,
                                         distribution: .fillProportionally)
        
        let sliderAndLabelStack = UIStackView(arrangedSubviews: [labelStackView, settingSlider],
                                              axis: .vertical,
                                              spacing: 5,
                                              distribution: .fillProportionally)
        
        setupSubviews(sliderAndLabelStack)
        
        NSLayoutConstraint.activate([
            sliderAndLabelStack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            sliderAndLabelStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            sliderAndLabelStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            sliderAndLabelStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
        func setupSubviews(_ subviews: UIView...) {
            subviews.forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        }
    }
}
