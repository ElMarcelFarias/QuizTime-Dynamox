//
//  ResultScreenViewController.swift
//  QuizTime-Dynamox
//
//  Created by Marcel Leite de Farias on 18/02/24.
//

import UIKit

class ResultScreenViewController: UIViewController {
    
    private var resultScreenView: ResultScreenView? {
        return view as? ResultScreenView
    }
    
    private let viewModel: ResultScreenViewModelProtocol
    
    init(viewModel: ResultScreenViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = ResultScreenView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultScreenView?.viewModel = viewModel
    }
    
}
