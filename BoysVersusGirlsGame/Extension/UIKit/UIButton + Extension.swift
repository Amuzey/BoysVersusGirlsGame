//
//  UIButton + Extension.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 20.10.2022.
//

import UIKit

extension UIButton {
    
    convenience init(title: String,
                     titleColor: UIColor,
                     backgroundColor: UIColor = .buttonColor(),
                     font: UIFont? = .avenir20(),
                     borderWidth: CGFloat = 2,
                     borderColor: CGColor? = UIColor.black.cgColor,
                     isShadow: Bool = true,
                     cornerRadius: CGFloat = 15) {
        self.init(type: .system)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        
        if isShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.8
            self.layer.shadowOffset = CGSize(width: 0, height: 5)
        }
    }
}
