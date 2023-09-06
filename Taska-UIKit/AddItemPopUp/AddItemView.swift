//
//  AddItemPop.swift
//  Taska-UIKit
//
//  Created by Iuri Ferreira on 01/09/23.
//

import UIKit

protocol AddItemDelegate: AnyObject {
    func didAddItem(item:String)
    func didCloseWindow()
}

class AddItemView : UIView {
    
    weak var delegate : AddItemDelegate?
    
   // let viewModel = ItemListViewModel()
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
        closeButton.addTarget(self, action: #selector(closeButtonTapped(_:)), for: .touchUpInside)
        
        label.text = "O que você deseja adicionar ?"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .label
        
        textfield.placeholder = "Ex: Reunião as 15h"
        textfield.autocapitalizationType = .none
        textfield.textColor = .systemGray
        textfield.autocorrectionType = .no
        
        addItemButton.setBackgroundImage(UIImage(systemName: "plus.circle")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal), for: .normal)
        addItemButton.addTarget(self, action: #selector(addItemButtonTapped(_:)), for: .touchUpInside)
    }
    
    private func layout() {
        addSubview(closeButton)
        addSubview(label)
        addSubview(textfield)
        addSubview(addItemButton)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            closeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 1),
            label.leadingAnchor.constraint(equalTo: closeButton.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            textfield.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 3),
            textfield.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            textfield.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            addItemButton.topAnchor.constraint(equalTo: topAnchor,constant: 2),
            addItemButton.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: -2),
            addItemButton.widthAnchor.constraint(equalToConstant: 40),
            addItemButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}

extension AddItemView {
    @objc func closeButtonTapped(_ sender:UIButton) {
        delegate?.didCloseWindow()
    }
    
    @objc func addItemButtonTapped(_ sender:UIButton) {
        if textfield.text != "" {
            guard let itemName = textfield.text else { return }
            delegate?.didAddItem(item: itemName)
        }
    }
}
