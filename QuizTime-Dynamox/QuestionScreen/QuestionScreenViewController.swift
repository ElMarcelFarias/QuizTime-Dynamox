//
//  QuestionScreenViewController.swift
//  QuizTime-Dynamox
//
//  Created by Marcel Leite de Farias on 18/02/24.
//

import UIKit

class QuestionScreenViewController: UIViewController {
    
    private var questionScreenView: QuestionScreenView? {
        return view as? QuestionScreenView
    }
    
    
    
    private let viewModel: QuestionScreenViewModelProtocol
    
    init(viewModel: QuestionScreenViewModelProtocol) {
        
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        fetchQuestion()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = QuestionScreenView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionScreenView?.viewModel = viewModel
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func fetchQuestion() {
        
        let endPoint = QMNetworkEndpoint.fetchQuestions.endPoint
        
        
        QMNetwork.getRequest(endpoint: endPoint, responseType: QuestionsModel.self) { result in
            switch result {
                
            case .success(_):
                print("sucess")
            case .failure(_):
                print("error mas s[o pra testar msm")
            }
        }
        
        
        
    }
    
}

