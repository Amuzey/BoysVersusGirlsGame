//
//  UISlider + Extension.swift
//  BoysVersusGirlsGame
//
//  Created by Клоун on 26.10.2022.
//

import UIKit

extension UISlider {
    convenience init(minimumValue: Float,
                     maximumValue: Float,
                     minimumColor: UIColor = .lightBlueColor(),
                     maximumColor: UIColor = .lightPinkColor()) {
        self.init()
        self.value = minimumValue
        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
        self.minimumTrackTintColor = minimumColor
        self.maximumTrackTintColor = maximumColor
    }
}
