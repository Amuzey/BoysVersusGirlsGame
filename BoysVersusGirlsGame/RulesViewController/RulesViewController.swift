//
//  RulesViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 19.10.2022.
//

import UIKit

class RulesViewController: UIViewController {

    private var viewModel: RulesViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = RulesViewModel()
        view.backgroundColor = .green
    }
}

// MARK: - SwiftUI
import SwiftUI

struct RulesVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = RulesViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
