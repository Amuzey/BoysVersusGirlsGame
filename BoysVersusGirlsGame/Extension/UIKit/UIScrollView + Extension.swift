//
//  UIScrollView + Extension.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 20.10.2022.
//

import UIKit

extension UIScrollView {
    convenience init(arrangedSubviews: UIView, backgroundColor: UIColor, cornerRadius: CGFloat) {
        self.init()
        self.addSubview(arrangedSubviews)
        arrangedSubviews.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.showsVerticalScrollIndicator = false
        
        NSLayoutConstraint.activate([
            arrangedSubviews.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            arrangedSubviews.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            arrangedSubviews.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            arrangedSubviews.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            arrangedSubviews.widthAnchor.constraint(equalTo: widthAnchor, constant: -20)
        ])
        
    }
}
