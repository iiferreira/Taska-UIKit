//
//  ViewController.swift
//  Taska-UIKit
//
//  Created by Iuri Ferreira on 31/08/23.
//

import UIKit

class ViewController: UIViewController {

    let logo = UIImageView()
    let itemListLabel = UILabel()
    let addItemButton = UIButton()
    
    let tableViewBackGround = UIView()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 44
        tableView.showsVerticalScrollIndicator = false
    }
    
    private func style() {
        view.backgroundColor = .systemBrand
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        itemListLabel.translatesAutoresizingMaskIntoConstraints = false
        addItemButton.translatesAutoresizingMaskIntoConstraints = false
        tableViewBackGround.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //Logo
        let logoImage = UIImage(named: "taska")
        logo.image = logoImage
        logo.contentMode = .scaleAspectFit
        
        //Item List Label
        itemListLabel.text = "X coisas a fazer"
        itemListLabel.textColor = .white
        itemListLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        
        //Add button
        addItemButton.setBackgroundImage(UIImage(systemName: "plus.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        
        tableViewBackGround.backgroundColor = .white
        tableViewBackGround.layer.cornerRadius = 45
    }
    
    private func layout() {
        configureView()
    }

}

//MARK: - Actions uitableview data source and delegate methods

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello"
        return cell
    }
    
}




