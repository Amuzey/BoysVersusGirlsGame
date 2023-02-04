//
//  UIImageView + Extension.swift
//  BoysVersusGirlsGame
//
//  Created by Клоун on 15.11.2022.
//

import UIKit

extension UIImageView {
    convenience init(image: UIImage?,
                     contentMode: UIView.ContentMode = .scaleAspectFit) {
        self.init()
        self.image = image
        self.contentMode = contentMode
    }
}
