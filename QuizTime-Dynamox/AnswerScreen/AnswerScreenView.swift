//
//  AnswerScreenView.swift
//  QuizTime-Dynamox
//
//  Created by Marcel Leite de Farias on 18/02/24.
//

import UIKit

final class AnswerScreenView: UIView {
    
    private let titleLabel = UILabel()
    private let resultQuestion = UILabel()
    private let answerTitle = UILabel()
    private let nextQuestion = UIButton()
    
    var viewModel: AnswerScreenViewModelProtocol? {
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
            resultQuestion.text = viewModel.resultQuestion
            nextQuestion.setTitle(viewModel.nextQuestion, for: .normal)
            backgroundColor = viewModel.backgroundResult
        }
        
    }
    
    
    
}



extension AnswerScreenView: ViewCodeProtocol {
    func addSubViews() {
        addSubview(titleLabel)
        addSubview(resultQuestion)
        addSubview(nextQuestion)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 88)
        ])
        
        NSLayoutConstraint.activate([
            resultQuestion.centerXAnchor.constraint(equalTo: centerXAnchor),
            resultQuestion.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nextQuestion.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -48),
            nextQuestion.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            nextQuestion.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            nextQuestion.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func setupStyle() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        resultQuestion.translatesAutoresizingMaskIntoConstraints = false
        nextQuestion.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 44)
        titleLabel.textColor = .white
        
        resultQuestion.font = UIFont.boldSystemFont(ofSize: 32)
        resultQuestion.textColor = .white
        
        nextQuestion.backgroundColor = .white
        nextQuestion.setTitleColor(.black, for: .normal)
        nextQuestion.layer.cornerRadius = 4
    }
    
    
}
