//
//  ErrorScreenView.swift
//  QuizTime-Dynamox
//
//  Created by Marcel Leite de Farias on 18/02/24.
//

import UIKit

final class ErrorScreenView: UIView {
    
    private let titleLabel = UILabel()
    private let descriptionErrorLabel = UILabel()
    private let backButton = UIButton()
    private let tryAgainButton = UIButton()
    
    var viewModel: ErrorScreenViewModelProtocol? {
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
            descriptionErrorLabel.text = viewModel.descriptionErrorLabel
            backButton.setTitle(viewModel.backButton, for: .normal)
            tryAgainButton.setTitle(viewModel.tryAgainButton, for: .normal)
        }
    }
    
}




extension ErrorScreenView: ViewCodeProtocol {
    func addSubViews() {
        addSubview(titleLabel)
        addSubview(descriptionErrorLabel)
        addSubview(backButton)
        addSubview(tryAgainButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 88)
        ])
        
        NSLayoutConstraint.activate([
            descriptionErrorLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionErrorLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: descriptionErrorLabel.bottomAnchor, constant: 48),
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
        descriptionErrorLabel.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        tryAgainButton.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .systemRed
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 44)
        titleLabel.textColor = .white
        
        descriptionErrorLabel.font = UIFont.boldSystemFont(ofSize: 24)
        descriptionErrorLabel.textColor = .white
        
        backButton.backgroundColor = .white
        backButton.setTitleColor(.black, for: .normal)
        backButton.layer.cornerRadius = 4
        
        tryAgainButton.backgroundColor = .white
        tryAgainButton.setTitleColor(.black, for: .normal)
        tryAgainButton.layer.cornerRadius = 4
    }
    
    
}
