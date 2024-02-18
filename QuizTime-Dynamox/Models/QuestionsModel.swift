//
//  QuestionsModel.swift
//  QuizTime-Dynamox
//
//  Created by Marcel Leite de Farias on 18/02/24.
//
import Foundation

// MARK: - QuestionsModel
struct QuestionsModel: Codable {
    let id, statement: String
    let options: [String]
}
