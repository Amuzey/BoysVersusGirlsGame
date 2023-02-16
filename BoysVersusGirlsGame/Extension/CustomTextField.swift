//
//  CustomTextField.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 26.10.2022.
//

import UIKit

class CustomTextField: UIView  {
    
    let textField = UITextField()
    
    convenience init(imageView: UIImageView,
                     backgroundColor: UIColor = .buttonColor(),
                     cornerRadius: CGFloat,
                     isShadow: Bool = true,
                     tintColor: UIColor,
                     font: UIFont? = .сhalkboard20()) {
        self.init()
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        textField.tintColor = tintColor
        textField.textColor = .white
        textField.borderStyle = .none
        textField.font = font
        
        
        if isShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: "Введите название команды...",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.placeholderTextColor()]
        )
        addSubview(imageView)
        addSubview(textField)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            textField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}
