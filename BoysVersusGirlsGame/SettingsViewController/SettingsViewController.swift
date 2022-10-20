//
//  SettingsViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 19.10.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    private var viewModel: SettingViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SettingViewModel()
        view.backgroundColor = .blue
    }
}

//MARK: - Setup View
extension SettingsViewController {
    private func setupConstraints() {
        
    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { view.addSubview($0) }
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
}

//MARK: - SwiftUI
import SwiftUI

struct SettingsVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = SettingsViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
