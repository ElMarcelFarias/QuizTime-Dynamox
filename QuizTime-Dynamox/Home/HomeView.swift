//
//  HomeView.swift
//  QuizTime-Dynamox
//
//  Created by Marcel Leite de Farias on 18/02/24.
//

//desenvolveremos todas as nossas estruturas de view.

import UIKit

final class HomeView: UIView {
    
    private let titleLabel = UILabel()
    private let textFieldTitle = UILabel()
    private let nickNameTextField = UITextField()
    private let startButton = UIButton()
    var viewModel: HomeViewModelProtocol? {
        didSet {
            setupModel()
        }
    }
    
    init() {
        super.init(frame: .zero) //iremos utilizar constraints.
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupModel() {
        if let viewModel = viewModel {
            titleLabel.text = viewModel.titleLabel
            textFieldTitle.text = viewModel.textFieldTitle
            nickNameTextField.placeholder = viewModel.nickNameTextFieldPlaceholder
            startButton.setTitle(viewModel.startButton, for: .normal)
        }
    }
    
    
}


extension HomeView: ViewCodeProtocol {
    func addSubViews() {
        addSubview(titleLabel)
        addSubview(textFieldTitle)
        addSubview(nickNameTextField)
        addSubview(startButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 88)
        ])
        
        NSLayoutConstraint.activate([
            textFieldTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            textFieldTitle.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nickNameTextField.topAnchor.constraint(equalTo: textFieldTitle.bottomAnchor, constant: 24),
            nickNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            nickNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            nickNameTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: nickNameTextField.bottomAnchor, constant: 24),
            startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            startButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func setupStyle() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        textFieldTitle.translatesAutoresizingMaskIntoConstraints = false
        nickNameTextField.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .systemPurple
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 44)
        titleLabel.textColor = .white
        
        textFieldTitle.font = UIFont.boldSystemFont(ofSize: 24)
        textFieldTitle.textColor = .white
        
        nickNameTextField.backgroundColor = .white
        nickNameTextField.layer.cornerRadius = 4
        nickNameTextField.textAlignment = .center
        
        startButton.backgroundColor = .white
        startButton.setTitleColor(.black, for: .normal)
    }
    
    
}
