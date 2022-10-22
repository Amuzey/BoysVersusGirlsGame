//
//  DeveloperView.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 21.10.2022.
//

import UIKit

class DeveloperView: UIView {
    convenience init(imageView: UIImageView, text: UILabel, backgroundColor: UIColor, cornerRadius: CGFloat, isShadow: Bool) {
        self.init()
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        
        if isShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        self.addSubview(imageView)
        self.addSubview(text)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
           
        ])
        
        NSLayoutConstraint.activate([
            text.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
            text.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            text.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            text.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
}
