//
//  ResultView.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 22.10.2022.
//

import UIKit

class ResultView: UIView {
    
    convenience init(boysResult: String, girlsResult: String) {
        self.init()
        self.backgroundColor = .systemPink
        
        let boysLabel = UILabel(text: boysResult, font: .avenir26(), numberOfLines: 1, tintColor: .white)
        let girlsLabel = UILabel(text: girlsResult, font: .avenir26(), numberOfLines: 1, tintColor: .white)
        
        let stackView = UIStackView(arrangedSubviews: [boysLabel, girlsLabel], axis: .horizontal, spacing: 20, distribution: .fill)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 1),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1)
        ])
    }
}
