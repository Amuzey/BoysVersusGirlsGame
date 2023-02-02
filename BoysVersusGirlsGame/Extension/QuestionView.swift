//
//  QuestionView.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 29.10.2022.
//

import UIKit

class QuestionView: UIView {
    
    let questionImage = UIImage()
    let questionLabel = UILabel()
    
    convenience init(questionImage: UIImage,
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
        
        let questionImageView = UIImageView(image: questionImage)
        questionImageView.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionImageView.contentMode = .scaleAspectFill
        addSubview(questionLabel)
        addSubview(questionImageView)
        
        NSLayoutConstraint.activate([
            questionImageView.topAnchor.constraint(equalTo: topAnchor),
            questionImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            questionImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        
        ])
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: questionImageView.bottomAnchor,constant: 20),
            questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            questionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}
