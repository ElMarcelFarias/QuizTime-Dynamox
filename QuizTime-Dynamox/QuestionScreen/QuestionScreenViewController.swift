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
    }
    
}

