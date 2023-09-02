//
//  ViewController+Layout.swift
//  Taska-UIKit
//
//  Created by Iuri Ferreira on 01/09/23.
//

import UIKit

extension ViewController {
    func configureView() {
        view.addSubview(logo)
        view.addSubview(itemListLabel)
        view.addSubview(addItemButton)
        view.addSubview(tableViewBackGround)
        tableViewBackGround.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 3),
            logo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 3),
            logo.widthAnchor.constraint(equalToConstant: 200),
            logo.heightAnchor.constraint(equalToConstant: 80),
        ])
        
        NSLayoutConstraint.activate([
            itemListLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 35),
            itemListLabel.topAnchor.constraint(equalTo: logo.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            addItemButton.centerYAnchor.constraint(equalTo: logo.centerYAnchor),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: addItemButton.trailingAnchor, multiplier: 3),
            addItemButton.widthAnchor.constraint(equalToConstant: 48),
            addItemButton.heightAnchor.constraint(equalToConstant: 48),
        ])
        
        NSLayoutConstraint.activate([
            tableViewBackGround.topAnchor.constraint(equalTo: itemListLabel.bottomAnchor, constant: 75),
            tableViewBackGround.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 35),
            tableViewBackGround.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -35),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: tableViewBackGround.bottomAnchor, multiplier: 20)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: tableViewBackGround.topAnchor,constant: 25),
            tableView.leadingAnchor.constraint(equalTo: tableViewBackGround.leadingAnchor, constant: 6),
            tableView.trailingAnchor.constraint(equalTo: tableViewBackGround.trailingAnchor, constant: -6),
            tableView.bottomAnchor.constraint(equalTo: tableViewBackGround.bottomAnchor, constant: -25)
            
        ])
    }
}

extension UIColor {
    static let systemBrand = UIColor(named: "brandBackground")
}
