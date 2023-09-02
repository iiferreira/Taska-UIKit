//
//  AddItemPop.swift
//  Taska-UIKit
//
//  Created by Iuri Ferreira on 01/09/23.
//

import UIKit

protocol AddItemDelegate: AnyObject {
    func didAddItem(item:Item)
}

class AddItemView : UIView {
    
    weak var delegate : AddItemDelegate?
    
    let closeButton = UIButton()
    let label = UILabel()
    let textfield = UITextField()
    let addItemButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 320, height: 120)
    }
    
    private func setup() {
        backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 12
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        textfield.translatesAutoresizingMaskIntoConstraints = false
        addItemButton.translatesAutoresizingMaskIntoConstraints = false
        
        closeButton.setBackgroundImage(UIImage(systemName: "x.circle")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal), for: .normal)
        
        label.text = "O que você deseja adicionar ?"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .label
        
        textfield.placeholder = "Ex: Reunião as 15h"
        
        addItemButton.setBackgroundImage(UIImage(systemName: "plus.circle")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal), for: .normal)
    }
    
    private func layout() {
        addSubview(closeButton)
        addSubview(label)
        addSubview(textfield)
        addSubview(addItemButton)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            closeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            closeButton.widthAnchor.constraint(equalToConstant: 32),
            closeButton.heightAnchor.constraint(equalToConstant: 32),
        ])
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 1),
            label.leadingAnchor.constraint(equalTo: closeButton.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            textfield.topAnchor.constraint(equalTo: label.bottomAnchor),
            textfield.leadingAnchor.constraint(equalTo: label.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            addItemButton.topAnchor.constraint(equalTo: textfield.bottomAnchor),
            addItemButton.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 1),
            addItemButton.widthAnchor.constraint(equalToConstant: 32),
            addItemButton.heightAnchor.constraint(equalToConstant: 32),
        ])
    }
}
