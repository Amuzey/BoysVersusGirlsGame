//
//  GameViewController.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 01.02.2023.
//

import UIKit

class GameViewController: BasicViewController {
    
    private let tableView = UITableView()
    private let questions = QuestionManager.getQuestions()
    
    private var questionNumber = 0
    
    override func loadView() {
        view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
                
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "QuestionCell")
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

extension GameViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath)
        let question = questions[questionNumber]
        var content = cell.defaultContentConfiguration()
        
        switch indexPath.row {
        case 0:
            content.image = UIImage(named: question.image)
        case 1:
            content.text = question.title
        case 2:
            content.text = question.answer[0].title
        case 3:
            content.text = question.answer[1].title
        case 4:
            content.text = question.answer[2].title
        default:
            break
        }
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if questionNumber < questions.count - 1{
            questionNumber += 1
            tableView.reloadData()
        } else {
            if SetupTeam.shared.isGirl {
                let startRoundVC = StartRoundViewController()
                SetupTeam.shared.isGirlToggle()
                navigationController?.pushViewController(startRoundVC, animated: true)
            } else {
                let resultVC = ResultViewController()
                navigationController?.pushViewController(resultVC, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 250
        case 1:
            return 100
        default:
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row <= 1 {
            return nil
        }
        return indexPath
    }
}
