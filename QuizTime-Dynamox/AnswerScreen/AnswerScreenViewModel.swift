//
//  AnswerScreenViewModel.swift
//  QuizTime-Dynamox
//
//  Created by Marcel Leite de Farias on 18/02/24.
//

import Foundation
import UIKit

protocol AnswerScreenViewModelProtocol {
    //definir todos os itens que vamos receber
    var titleLabel: String { get }
    var resultQuestion: String { get }
    var nextQuestion: String { get }
    var backgroundResult: UIColor { get }
    
}

final class AnswerScreenViewModel: AnswerScreenViewModelProtocol {
    //todas os textos serao dinamicas
    var titleLabel = "QUIZ TIME"
    var resultQuestion = "RESPOSTA CORRETA!"
    var nextQuestion = "PRÓXIMA PERGUNTA"
    var backgroundResult: UIColor = .systemGreen
    
}
