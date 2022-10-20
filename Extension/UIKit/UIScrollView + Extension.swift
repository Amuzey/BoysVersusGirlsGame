//
//  UIScrollView + Extension.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 20.10.2022.
//

import UIKit

extension UIScrollView {
    
    convenience init(arrangedSubviews: UIView) {
        self.init()
        
        self.addSubview(arrangedSubviews)
        arrangedSubviews.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            arrangedSubviews.topAnchor.constraint(equalTo: topAnchor),
            arrangedSubviews.bottomAnchor.constraint(equalTo: bottomAnchor),
            arrangedSubviews.leadingAnchor.constraint(equalTo: leadingAnchor),
            arrangedSubviews.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
