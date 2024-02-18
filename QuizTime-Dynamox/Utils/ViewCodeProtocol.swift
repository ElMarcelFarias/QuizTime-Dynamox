//
//  ViewCodeProtocol.swift
//  QuizTime-Dynamox
//
//  Created by Marcel Leite de Farias on 18/02/24.
//

import Foundation

protocol ViewCodeProtocol {
    func addSubViews()
    func setupConstraints()
    func setupStyle()
}

extension ViewCodeProtocol {
    func setupLayout() {
        addSubViews()
        setupConstraints()
        setupStyle()
    }
}

//utilizamos extension do protocolo ViewCodeProtocol chama inicializar as funções.
