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
                     action: (() -> ())? = nil,
                     backgroundColor: UIColor = .buttonColor(),
                     font: UIFont? = .avenir20(),
                     borderWidth: CGFloat = 2,
                     borderColor: CGColor? = UIColor.black.cgColor,
                     isShadow: Bool = true,
                     cornerRadius: CGFloat = 15) {
        self.init(type: .system)
        self.addAction(closure: action)
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        titleLabel?.font = font
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor
        
        if isShadow {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowRadius = 4
            layer.shadowOpacity = 0.8
            layer.shadowOffset = CGSize(width: 0, height: 5)
        }
    }
}
