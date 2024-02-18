//
//  ResultScreenViewModel.swift
//  QuizTime-Dynamox
//
//  Created by Marcel Leite de Farias on 18/02/24.
//

import Foundation

protocol ResultScreenViewModelProtocol {
    //definir todos os itens que vamos receber
    var titleLabel: String { get }
    var rightAnswer: String { get }
    var wrongAnswer: String { get }
    var backButton: String { get }
    var tryAgainButton: String { get }
    
}

final class ResultScreenViewModel: ResultScreenViewModelProtocol {
    
    var titleLabel = "RESULTADO"
    var rightAnswer = "Acertos:"
    var wrongAnswer = "Erros:"
    var backButton = "VOLTAR PARA O INICIO"
    var tryAgainButton = "TENTAR NOVAMENTE"
    
}
