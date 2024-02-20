//
//  QuestionTableViewCell.swift
//  QuizTime-Dynamox
//
//  Created by Marcel Leite de Farias on 18/02/24.
//

import UIKit

final class QuestionTableViewCell: UITableViewCell {

    private let container: UIView = UIView()
    private let optionLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "questionCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(title: String) {
        optionLabel.text = title
        setupLayout()
    }
    
}

extension QuestionTableViewCell: ViewCodeProtocol {
    
    func addSubViews() {
        self.contentView.addSubview(optionLabel)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            optionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            optionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            optionLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            optionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
        
    }
    
    func setupStyle() {
        
        optionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        optionLabel.font = UIFont.boldSystemFont(ofSize: 18)
        optionLabel.textAlignment = .center
        optionLabel.numberOfLines = 0
    
        
    }
    
    
}


