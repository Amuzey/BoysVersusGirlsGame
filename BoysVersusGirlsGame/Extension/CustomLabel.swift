//
//  CustomLabel.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 26.10.2022.
//

import UIKit

class CustomLabel: UIView  {
    convenience init(label: UILabel,
                     imageView: UIImageView? = nil,
                     backgroundColor: UIColor = .buttonColor(),
                     cornerRadius: CGFloat,
                     isShadow: Bool = true) {
        self.init()
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        if isShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.8
            self.layer.shadowOffset = CGSize(width: 0, height: 5)
        }
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        
        if let imageView = imageView {
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            addSubview(imageView)
            
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
                label.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
                label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            ])
            
            NSLayoutConstraint.activate([
                imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
                imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2)
            ])
        } else {
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                label.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
                label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            ])
        }
    }
}
