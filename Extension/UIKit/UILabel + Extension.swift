//
//  UILabel + Extension.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 20.10.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont?) {
        self.init()
        
        self.text = text
        self.font = font
    }
}
