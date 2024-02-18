//
//  HomeViewModel.swift
//  QuizTime-Dynamox
//
//  Created by Marcel Leite de Farias on 18/02/24.
//

import Foundation

protocol HomeViewModelProtocol {
    //definir todos os itens que vamos receber
    var titleLabel: String { get }
    var textFieldTitle: String { get }
    var nickNameTextFieldPlaceholder: String { get }
    var startButton: String { get }
    
}

final class HomeViewModel: HomeViewModelProtocol {
    
    var titleLabel = "QUIZ TIME"
    var textFieldTitle = "INSIRA SEU USUÁRIO"
    var nickNameTextFieldPlaceholder = "EX: MARCEL"
    var startButton = "COMEÇAR"
    
}
