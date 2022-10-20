//
//  StartViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 19.10.2022.
//

import UIKit

class StartViewController: UIViewController {
    
    let logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        
        return logoImageView
    }()
    
//    let button = UIButton(title: "Start", titleColor: .white, backgroundColor: .orange, font: .systemFont(ofSize: 21), isShadow: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
//        view.addSubview(button)
    }
}

// MARK: - SwiftUI
import SwiftUI

struct StartVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = StartViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
