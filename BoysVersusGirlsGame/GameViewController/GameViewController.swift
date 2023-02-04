//
//  GameViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 04.02.2023.
//

import Foundation

import UIKit

class GameViewController: BasicViewController {
    
    private let flowLayout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    private let girlQuestions = QuestionManager.getGirlQuestions()
    private let boyQuestions = QuestionManager.getBoysQuestions()
    
    private var questionNumber = 0
    private var selectAnswerIndex: Int? = nil
    
    override func loadView() {
        view = collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(QuestionCollectionViewCell.self, forCellWithReuseIdentifier: "QuestionCell")
    }
    
    private func setupNavigationBar() {
        let exitButton = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        exitButton.setImage(UIImage(named: "infoButton"), for: .normal)
        exitButton.addTarget(self, action: #selector(moveToStartVC), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: exitButton)
    }
}

extension GameViewController {
    @objc private func moveToStartVC() {
        navigationController?.popToRootViewController(animated: true)
    }
}

extension GameViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCell", for: indexPath) as? QuestionCollectionViewCell else { return UICollectionViewCell() }
        let question = SetupTeam.shared.isGirl ?? true
        ? girlQuestions[questionNumber]
        : boyQuestions[questionNumber]
        
        cell.configure(question: question, indexPath: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectAnswerIndex = indexPath.item - 2
        
        if SetupTeam.shared.isGirl ?? true {
            let answer = girlQuestions[questionNumber].answer
            guard let index = selectAnswerIndex else { return }
            if answer[index].correct {
                SetupTeam.shared.addCorrectAnswerGirls()
            }
        } else {
            let answer = boyQuestions[questionNumber].answer
            guard let index = selectAnswerIndex else { return }
            if answer[index].correct {
                SetupTeam.shared.addCorrectAnswerBoys()
            }
        }
        
        if questionNumber < girlQuestions.count - 1 {
            questionNumber += 1
            collectionView.reloadData()
        } else {
            if SetupTeam.shared.isGirl ?? true {
                let startRoundVC = StartRoundViewController()
                SetupTeam.shared.isGirlToggle()
                navigationController?.pushViewController(startRoundVC, animated: true)
            } else {
                let resultVC = ResultViewController()
                navigationController?.pushViewController(resultVC, animated: true)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if indexPath.item <= 1 {
            return false
        }
        return true
    }
}

// MARK: UICollectionViewDelegate
extension GameViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.item {
        case 0:
            return CGSize(width: view.frame.width, height: view.frame.width)
        case 1:
            return CGSize(width: view.frame.width, height: 100)
        default:
            return CGSize(width: view.frame.width, height: 60)
        }
    }
    
    
}
