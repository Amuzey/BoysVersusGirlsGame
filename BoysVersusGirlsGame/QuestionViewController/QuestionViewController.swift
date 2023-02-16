//
//  QuestionViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 04.02.2023.
//

import Foundation

import UIKit

class QuestionViewController: BasicViewController {
    
    // MARK: - Private properties
    private let flowLayout = UICollectionViewFlowLayout()
    private let girlQuestions = QuestionManager.getGirlQuestions()
    private let boyQuestions = QuestionManager.getBoysQuestions()
    
    private var questionNumber = 0
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
    // MARK: - Life cycles
    override func loadView() {
        view = collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(QuestionCell.self, forCellWithReuseIdentifier: "QuestionCell")
    }
    
    // MARK: - Private methods
    private func setupNavigationBar() {
        let exitButton = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        exitButton.setImage(UIImage(named: "exitButton"), for: .normal)
        exitButton.addTarget(self, action: #selector(moveToStartVC), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: exitButton)
    }
}

// MARK: - Actions
extension QuestionViewController {
    @objc private func moveToStartVC() {
        navigationController?.popToRootViewController(animated: true)
    }
}

// MARK: - UIColectionsViewDataSourse, UICollecrionsViewDelegate
extension QuestionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCell", for: indexPath) as? QuestionCell else { return UICollectionViewCell() }
        let question = SetupTeam.shared.isGirl ?? true
        ? girlQuestions[questionNumber]
        : boyQuestions[questionNumber]
        
        cell.configure(question: question, indexPath: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? QuestionCell else { return }
        
        //Briefly fade the cell on selection
        UIView.animate(withDuration: 0.1,
                       animations: {
            //Fade-out
            cell.alpha = 0.5
        }) { (completed) in
            UIView.animate(withDuration: 0.1,
                           animations: {
                //Fade-out
                cell.alpha = 1
            })
        }
        chekSelectAnswer(indexPath: indexPath)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.questionSwich()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if indexPath.item <= 1 {
            return false
        }
        return true
    }
    
    private func chekSelectAnswer(indexPath: IndexPath) {
       let selectAnswerIndex = indexPath.item - 2
       
        if SetupTeam.shared.isGirl ?? true {
            let answer = girlQuestions[questionNumber].answer
            if answer[selectAnswerIndex].correct {
                SetupTeam.shared.addCorrectAnswerGirls()
            }
        } else {
            let answer = boyQuestions[questionNumber].answer
            if answer[selectAnswerIndex].correct {
                SetupTeam.shared.addCorrectAnswerBoys()
            }
        }
    }
    
    private func questionSwich() {
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
}

// MARK: - UICollectionViewDelegateFlowLayout
extension QuestionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.item {
        case 0:
            return CGSize(width: view.frame.width - 60, height: view.frame.width - 60)
        case 1:
            return CGSize(width: view.frame.width - 60, height: 100)
        default:
            return CGSize(width: view.frame.width - 60, height: 60)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
