//
//  HomeView.swift
//  QuizTime-Dynamox
//
//  Created by Marcel Leite de Farias on 18/02/24.
//

//desenvolveremos todas as nossas estruturas de view.

import UIKit

protocol HomeViewDelegate: AnyObject {
    func startDidTap()
}

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
    
    weak var delegate: HomeViewDelegate?
    
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
            textFieldTitle.text = viewModel.textFieldTitle
            nickNameTextField.placeholder = viewModel.nickNameTextFieldPlaceholder
            startButton.setTitle(viewModel.startButton, for: .normal)
        }
    }
    
    @objc func startDidTap() {
        delegate?.startDidTap()
    }
    
}

extension HomeView: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string
        startButton.isEnabled = !newText.isEmpty
        startButton.isHidden = newText.isEmpty
        return true
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
            textFieldTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            textFieldTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
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
        textFieldTitle.textAlignment = .center
        textFieldTitle.numberOfLines = 0
        textFieldTitle.textColor = .white
        
        nickNameTextField.backgroundColor = .white
        nickNameTextField.layer.cornerRadius = 4
        nickNameTextField.textAlignment = .center
        nickNameTextField.delegate = self
        
        startButton.backgroundColor = .white
        startButton.setTitleColor(.black, for: .normal)
        startButton.isEnabled = false
        startButton.isHidden = true
        startButton.addTarget(self, action: #selector(startDidTap), for: .touchUpInside)
    }
    
    
}
