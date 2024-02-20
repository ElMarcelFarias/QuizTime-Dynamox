//
//  QMNetwork.swift
//  QuizTime-Dynamox
//
//  Created by Marcel Leite de Farias on 18/02/24.
//

import Foundation

enum QMNetworkEndpoint {
    case fetchQuestions
    case postCheckAnswer(questionId: String)
    
    var endPoint: String {
        switch self {
        case .fetchQuestions:
            return "question"
        case .postCheckAnswer(let questionId):
            return "answer?questionId=\(questionId)"
        }
    }
}

class QMNetwork {

    

    // Método genérico para fazer solicitações HTTP
    static func postRequest<T: Codable, U: Codable>(endpoint: String, requestBody: T?, responseType: U.Type, completion: @escaping (Result<U, Error>) -> Void) {

        guard let url = URL(string: "https://quiz-api-bwi5hjqyaq-uc.a.run.app/" + endpoint) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        if let requestBody = requestBody {
            do {
                let jsonData = try JSONEncoder().encode(requestBody)
                request.httpBody = jsonData
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            } catch {
                completion(.failure(error))
                return
            }
        }
        
        

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? NSError(domain: "Unknown error", code: -1, userInfo: nil)))
                print("=======> CAI NO ERRO DO GUARD LET")
                return
            }

            do {
                let responseObject = try JSONDecoder().decode(U.self, from: data)
                completion(.success(responseObject))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
    
    
    
    static func getRequest<U: Codable>(endpoint: String, responseType: U.Type, completion: @escaping (Result<U, Error>) -> Void) {

        guard let request = URL(string: "https://quiz-api-bwi5hjqyaq-uc.a.run.app/" + endpoint) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? NSError(domain: "Unknown error", code: -1, userInfo: nil)))
                print("=======> CAI NO ERRO DO GUARD LET")
                return
            }

            do {
                let responseObject = try JSONDecoder().decode(U.self, from: data)
                completion(.success(responseObject))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
}
