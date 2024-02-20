//
//  ErrorControllerViewModel.swift
//  QuizTime-Dynamox
//
//  Created by Marcel Leite de Farias on 18/02/24.
//

import Foundation

protocol ErrorScreenViewModelProtocol {
    //definir todos os itens que vamos receber
    var titleLabel: String { get }
    var descriptionErrorLabel: String { get }
    var backButton: String { get }
    var tryAgainButton: String { get }
    
}

final class ErrorScreenViewModel: ErrorScreenViewModelProtocol {
    
    var titleLabel = "QUIZ TIME"
    var descriptionErrorLabel = "Erro inesperado!"
    var backButton = "TENTAR NOVAMENTE"
    var tryAgainButton = "VOLTAR PARA O INICIO"
    
}
