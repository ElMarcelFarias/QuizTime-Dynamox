//
//  HomeViewController.swift
//  QuizTime-Dynamox
//
//  Created by Marcel Leite de Farias on 18/02/24.
//

import UIKit

//final == a classe não vai ter herança

final class HomeViewController: UIViewController {
    
    private var homeView: HomeView? {
        return view as? HomeView
    }
    
    private let viewModel: HomeViewModelProtocol
    
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture) // dismiss do teclado
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = HomeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView?.viewModel = viewModel
    }
    
    @objc private func hideKeyboard() {
        self.view.endEditing(true)
    }
    
}
