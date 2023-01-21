//
//  UIButton + Extension.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 20.10.2022.
//

import UIKit

extension UIButton {
    convenience init(title: String = "",
                     image: UIImage? = nil,
                     titleColor: UIColor = .black,
                     backgroundColor: UIColor = .buttonColor(),
                     font: UIFont? = .avenir20(),
                     isShadow: Bool = true,
                     cornerRadius: CGFloat = 15) {
        self.init(type: .system)
        setTitle(title, for: .normal)
        setImage(image, for: .normal)
        setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        titleLabel?.font = font
        layer.cornerRadius = cornerRadius
        
        if isShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
    }
}
