//
//  DevelopersViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 21.10.2022.
//

import UIKit

class DevelopersViewController: BasicViewController {
    private let alexeyView = DeveloperView(
        imageView: UIImageView(image: UIImage(named: "Alexey")),
        text: UILabel(text: "iOS Developer Aleksey Ivanov"),
        cornerRadius: 20
    )
    
    private let antonView = DeveloperView(
        imageView: UIImageView(image: UIImage(named: "Anton")),
        text: UILabel(text: "iOS Developer Anton Mazur"),
        cornerRadius: 20
    )
    
    private let aleksandView = DeveloperView(
        imageView: UIImageView(image: UIImage(named: "Aleksandr")),
        text: UILabel(text: "UX/UI Designer Aleksandr Ivanov"),
        cornerRadius: 20
    )
    
    private let anastasiaView = DeveloperView(
        imageView: UIImageView(image: UIImage(named: "Anastasia")),
        text: UILabel(text: "Content manager Anastasia Shmeleva"),
        cornerRadius: 20)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
    }
}

//MARK: - Setup Constraints
extension DevelopersViewController {
    private func setupConstraints() {
        let developerStackView = UIStackView(arrangedSubviews: [alexeyView, antonView, aleksandView, anastasiaView],
                                             axis: .vertical,
                                             spacing: 20,
                                             distribution: .fillEqually)
        
        setupSubviews(developerStackView)
        
        NSLayoutConstraint.activate([
            developerStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            developerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            developerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            developerStackView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1)
        ])
        
    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { view.addSubview($0) }
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
}
