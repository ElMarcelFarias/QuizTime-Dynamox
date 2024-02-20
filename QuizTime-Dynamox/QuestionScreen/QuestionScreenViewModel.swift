//
//  QuestionScreenModel.swift
//  QuizTime-Dynamox
//
//  Created by Marcel Leite de Farias on 18/02/24.
//

import Foundation

protocol QuestionScreenViewModelProtocol {
    //definir todos os itens que vamos receber
    var titleLabel: String { get }
    var questionTitle: String { get }
    var optionsTitle: [String] { get }
    var sendAnswer: String { get }
    var quitGame: String { get }
    
}

final class QuestionScreenViewModel: QuestionScreenViewModelProtocol {
    
    var titleLabel = "PERGUNTA"
    var questionTitle = "QUAL É A PERGUNTA?"
    var optionsTitle = ["Pergunta 1", "Pergunta 2", "Pergunta 3", "Pergunta 4", "Pergunta 5"]
    var sendAnswer = "ENVIAR"
    var quitGame = "DESISTIR"
    
}
