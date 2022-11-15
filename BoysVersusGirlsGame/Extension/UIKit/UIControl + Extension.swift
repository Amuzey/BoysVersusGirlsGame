//
//  UIControl + Extension.swift
//  BoysVersusGirlsGame
//
//  Created by Клоун on 14.11.2022.
//

import UIKit

extension UIControl {
    func addAction(for controlEvent: UIControl.Event = .touchUpInside, closure: (() -> ())?) {
        addAction(UIAction(handler: { action in closure?() }), for: controlEvent)
    }
}
