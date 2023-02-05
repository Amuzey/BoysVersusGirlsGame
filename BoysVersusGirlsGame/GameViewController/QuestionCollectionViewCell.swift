//
//  QuestionCollectionViewCell.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 04.02.2023.
//

import UIKit

class QuestionCollectionViewCell: UICollectionViewCell {
    
    var imageView = UIImageView()
    var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        contentView.backgroundColor = .buttonColor()
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .сhalkboard20()
        label.textColor = .white
    
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

        imageView.image = nil
        label.text = ""
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(question: Question, indexPath: IndexPath) {
        
        switch indexPath.item {
        case 0:
            imageView.image = UIImage(named: question.image)
        case 1:
            label.text = question.title
        case 2:
            label.text = question.answer[0].title
        case 3:
            label.text = question.answer[1].title
        case 4:
            label.text = question.answer[2].title
        default:
            break
        }
    }
}
