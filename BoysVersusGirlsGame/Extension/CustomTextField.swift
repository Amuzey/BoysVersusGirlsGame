//
//  CustomTextField.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 26.10.2022.
//

import UIKit

class CustomTextField: UIView  {
    convenience init(imageView: UIImageView,
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
        
        let textField = UITextField()
        textField.borderStyle = .none
        textField.placeholder = "Введите название"
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        self.addSubview(imageView)
        self.addSubview(textField)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1)
           
        ])
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
            textField.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            textField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
}
