//
//  ResultScreenView.swift
//  QuizTime-Dynamox
//
//  Created by Marcel Leite de Farias on 18/02/24.
//

import UIKit

final class ResultScreenView: UIView {
    
    private let titleLabel = UILabel()
    private let rightAnswer = UILabel()
    private let wrongAnswer = UILabel()
    private let backButton = UIButton()
    private let tryAgainButton = UIButton()
    
    var viewModel: ResultScreenViewModelProtocol? {
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
            rightAnswer.text = viewModel.rightAnswer
            wrongAnswer.text = viewModel.wrongAnswer
            backButton.setTitle(viewModel.backButton, for: .normal)
            tryAgainButton.setTitle(viewModel.tryAgainButton, for: .normal)
        }
    }
    
}

extension ResultScreenView: ViewCodeProtocol {
    func addSubViews() {
        addSubview(titleLabel)
        addSubview(rightAnswer)
        addSubview(wrongAnswer)
        addSubview(backButton)
        addSubview(tryAgainButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 88)
        ])
        
        NSLayoutConstraint.activate([
            rightAnswer.centerXAnchor.constraint(equalTo: centerXAnchor),
            rightAnswer.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            wrongAnswer.topAnchor.constraint(equalTo: rightAnswer.bottomAnchor, constant: 12),
            wrongAnswer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            wrongAnswer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            //wrongAnswer.heightAnchor.constraint(equalToConstant: 44)
        ])  
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: wrongAnswer.bottomAnchor, constant: 48),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            backButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            backButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            tryAgainButton.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 24),
            tryAgainButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            tryAgainButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            tryAgainButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        
    }
    
    func setupStyle() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        rightAnswer.translatesAutoresizingMaskIntoConstraints = false
        wrongAnswer.translatesAutoresizingMaskIntoConstraints = false
        tryAgainButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .systemPurple
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 44)
        titleLabel.textColor = .white
        
        rightAnswer.font = UIFont.boldSystemFont(ofSize: 44)
        rightAnswer.textColor = .white
        
        wrongAnswer.textAlignment = .center
        wrongAnswer.font = UIFont.boldSystemFont(ofSize: 44)
        wrongAnswer.textColor = .white
        
        backButton.backgroundColor = .white
        backButton.setTitleColor(.black, for: .normal)
        backButton.layer.cornerRadius = 4
        
        tryAgainButton.backgroundColor = .white
        tryAgainButton.setTitleColor(.black, for: .normal)
        tryAgainButton.layer.cornerRadius = 4
    }
    
    
}

