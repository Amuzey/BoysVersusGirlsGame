//
//  QuestionView.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 29.10.2022.
//

import UIKit

class QuestionView: UIView {
    convenience init(questionImage: UIImageView,
                     questionLabel: UILabel,
                     isShadow: Bool = true
    ) {
        self.init()
        
        clipsToBounds = true
        layer.cornerRadius = 20
        backgroundColor = .buttonColor()
        
        if isShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
        }

        questionImage.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionImage.contentMode = .scaleAspectFill
        addSubview(questionLabel)
        addSubview(questionImage)
        
        NSLayoutConstraint.activate([
            questionImage.topAnchor.constraint(equalTo: topAnchor),
            questionImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            questionImage.trailingAnchor.constraint(equalTo: trailingAnchor),
        
        ])
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: questionImage.bottomAnchor,constant: 20),
            questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            questionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}
