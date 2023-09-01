//
//  ViewController.swift
//  Taska-UIKit
//
//  Created by Iuri Ferreira on 31/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel = ItemListViewModel()
    var buttonIndex : Int?
    
    let logo = UIImageView()
    let itemListLabel = UILabel()
    let addItemButton = UIButton()
    
    let tableViewBackGround = UIView()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.loadMockData()
        style()
        layout()
        setupTableView()
        
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TaskaCustomCell.self, forCellReuseIdentifier: TaskaCustomCell.cellIdentifier)
        tableView.rowHeight = 60
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
        setupLabel(items: viewModel.listOfItems)
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


extension ViewController {
    private func setupLabel(items: [Item]) {
        if items.isEmpty {
            itemListLabel.text = "Você não possui nenhum item na lista."
        } else if items.count == 1 {
            itemListLabel.text = "Você possui \(items.count) item na lista."
        } else if items.count > 1 {
            itemListLabel.text = "Você possui \(items.count) itens na lista."
        }
    }
}
//MARK: - Actions uitableview data source and delegate methods

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listOfItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskaCustomCell.cellIdentifier, for: indexPath) as! TaskaCustomCell
        
        let item = viewModel.listOfItems[indexPath.row]
        let imageName = item.done ? "circle.fill" : "circle"
        let tintColor = item.done ? UIColor.systemGreen : UIColor.black

        cell.checkButton.setBackgroundImage(UIImage(systemName: imageName)?.withTintColor(tintColor, renderingMode: .alwaysOriginal), for: .normal)
        
        cell.checkButton.tag = indexPath.row
        cell.checkButton.addTarget(self, action: #selector(checkmarkClick(_:)), for: .touchUpInside)
        cell.delegate = self
        cell.label.text = viewModel.listOfItems[indexPath.row].name
        return cell
    }
}

//MARK: -Actions

extension ViewController {
    @objc func checkmarkClick(_ sender:UIButton) {
        let index = sender.tag
        viewModel.listOfItems[index].done.toggle()
        setupLabel(items: viewModel.listOfItems)
        tableView.reloadData()
    }
}

extension ViewController : TaskaCustomCellDelegate {
    func didTapCheckButton() {
        print("Check button was tapped at index: \(buttonIndex ?? 0) ")
    }
}




