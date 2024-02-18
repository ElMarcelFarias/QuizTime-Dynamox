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
    }
    
}

