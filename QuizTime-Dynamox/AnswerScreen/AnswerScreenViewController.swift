//
//  AnswerScreenViewController.swift
//  QuizTime-Dynamox
//
//  Created by Marcel Leite de Farias on 18/02/24.
//

import UIKit

final class AnswerScreenViewController: UIViewController {
    
    private var answerScreenView: AnswerScreenView? {
        return view as? AnswerScreenView
    }
    
    private let viewModel: AnswerScreenViewModelProtocol
    
    init(viewModel: AnswerScreenViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = AnswerScreenView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerScreenView?.viewModel = viewModel
        checkAnswer()
    }
    
    func checkAnswer() {
        
        let awnserBody = AnswersModel(answer: "teste")
        let endPoint = QMNetworkEndpoint.postCheckAnswer(questionId: "22").endPoint
        
        QMNetwork.request(endpoint: endPoint, method: .post, requestBody: awnserBody, responseType: ResultModel.self) { result in
            switch result {
                
            case .success(_):
                print("sucess")
            case .failure(_):
                print("error mas s[o pra testar msm")
            }
            
        }
    }
    
}

