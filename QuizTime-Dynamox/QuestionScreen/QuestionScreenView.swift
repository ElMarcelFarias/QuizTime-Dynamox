//
//  QuestionScreenView.swift
//  QuizTime-Dynamox
//
//  Created by Marcel Leite de Farias on 18/02/24.
//

import UIKit

final class QuestionScreenView: UIView {
    
    private let titleLabel = UILabel()
    private let quitGame = UIButton()
    private let questionTitle = UILabel()
    private let optionsTitle = UIButton()
    private let sendAnswer = UIButton()
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    
    var viewModel: QuestionScreenViewModelProtocol? {
        didSet {
            setupModel()
        }
    }
    
    init() {
        super.init(frame: .zero) //iremos utilizar constraints.
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupModel() {
        if let viewModel = viewModel {
            
            
            titleLabel.text = viewModel.titleLabel
            questionTitle.text = viewModel.questionTitle
            //optionsTitle.setTitle(viewModel.nextQuestion, for: .normal)
            sendAnswer.setTitle(viewModel.sendAnswer, for: .normal)
            quitGame.setTitle(viewModel.quitGame, for: .normal)
            tableView.reloadData()
        }
        
    }
    
}

extension QuestionScreenView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath) as? QuestionTableViewCell else {
            return UITableViewCell()
        }
        
        let question = viewModel?.optionsTitle[indexPath.row]
        cell.configure(title: question ?? String())
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(section)
        return viewModel?.optionsTitle.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let question = viewModel?.optionsTitle[indexPath.row]
        print("Questao selecionada: \(question)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}


extension QuestionScreenView: ViewCodeProtocol {
    func addSubViews() {
        addSubview(titleLabel)
        addSubview(questionTitle)
        addSubview(optionsTitle)
        addSubview(tableView)
        addSubview(sendAnswer)
        addSubview(quitGame)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            quitGame.topAnchor.constraint(equalTo: topAnchor, constant: 48),
            quitGame.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: quitGame.bottomAnchor, constant: 24)
        ])
        
        NSLayoutConstraint.activate([
            questionTitle.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            questionTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            questionTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: questionTitle.bottomAnchor, constant: 24),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
            
//
//            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
//            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
//            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8),
//            sendAnswer.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            sendAnswer.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 24),
            sendAnswer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            sendAnswer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            sendAnswer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -48),
            sendAnswer.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        
    }
    
    func setupStyle() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        questionTitle.translatesAutoresizingMaskIntoConstraints = false
        sendAnswer.translatesAutoresizingMaskIntoConstraints = false
        quitGame.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(QuestionTableViewCell.self, forCellReuseIdentifier: "questionCell")
        tableView.layer.cornerRadius = 4
        tableView.backgroundColor = .systemPurple
        backgroundColor = .systemPurple

        titleLabel.font = UIFont.boldSystemFont(ofSize: 44)
        titleLabel.textColor = .white
        
        questionTitle.font = UIFont.boldSystemFont(ofSize: 24)
        questionTitle.textColor = .white
        questionTitle.textAlignment = .center
        
        sendAnswer.backgroundColor = .white
        sendAnswer.setTitleColor(.black, for: .normal)
        sendAnswer.layer.cornerRadius = 4
        
        quitGame.backgroundColor = .systemRed
        quitGame.setTitleColor(.white, for: .normal)
        quitGame.layer.cornerRadius = 4
        
    }
    
    
    
    
}
