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
                     step: Float,
                     minimumColor: UIColor = .lightBlueColor(),
                     maximumColor: UIColor = .lightPinkColor()) {
        self.init()
        let roundedValue = round(self.value / step) * step
        self.value = roundedValue
        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
        self.minimumTrackTintColor = minimumColor
        self.maximumTrackTintColor = maximumColor
    }
}
