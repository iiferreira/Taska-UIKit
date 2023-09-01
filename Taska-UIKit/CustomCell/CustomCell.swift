//
//  CustomCell.swift
//  Taska-UIKit
//
//  Created by Iuri Ferreira on 01/09/23.
//

import UIKit

protocol TaskaCustomCellDelegate : AnyObject {
    func didTapCheckButton()
}

class TaskaCustomCell : UITableViewCell {
    
    weak var delegate : TaskaCustomCellDelegate?
    
    static let cellIdentifier = "cell"
    
    let label = UILabel()
    let checkButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cellStyle()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func cellStyle() {
        self.selectionStyle = .none
        
        label.translatesAutoresizingMaskIntoConstraints = false
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .label
        
        checkButton.setBackgroundImage(UIImage(systemName: "circle")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        checkButton.contentMode = .scaleAspectFit
        //checkButton.addTarget(self, action: #selector(tapChekButton), for: .touchUpInside)
    }
    
    private func layout() {
        contentView.addSubview(checkButton)
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            checkButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 1.5),
            checkButton.widthAnchor.constraint(equalToConstant: 32),
            checkButton.heightAnchor.constraint(equalToConstant: 32),
        
        ])
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 3)
        ])
    }
}

//MARK: - Actions

extension TaskaCustomCell {
    @objc func tapChekButton() {
        delegate?.didTapCheckButton()
    }
}
