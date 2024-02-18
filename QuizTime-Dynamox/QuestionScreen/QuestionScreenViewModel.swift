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
    
}

final class QuestionScreenViewModel: QuestionScreenViewModelProtocol {
    
    var titleLabel = "PERGUNTA"
    var questionTitle = "QUAL E AAOA?"
    var optionsTitle = ["Pergunta 1", "Oergunta 2", "Oergunta 3", "Oergunta 4", "Oergunta 5"]
    var sendAnswer = "ENVIAR"
    
}
