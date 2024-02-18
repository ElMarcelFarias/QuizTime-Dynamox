//
//  ErrorScreenViewController.swift
//  QuizTime-Dynamox
//
//  Created by Marcel Leite de Farias on 18/02/24.
//

import UIKit

final class ErrorScreenViewController: UIViewController {
    
    private var errorScreenView: ErrorScreenView? {
        return view as? ErrorScreenView
    }
    
    private let viewModel: ErrorScreenViewModelProtocol
    
    init(viewModel: ErrorScreenViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = ErrorScreenView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorScreenView?.viewModel = viewModel
    }
    
}
