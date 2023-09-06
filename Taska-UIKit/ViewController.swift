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
    
    let addItemView = AddItemView()
    
    let tableViewBackGround = UIView()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchData()
        style()
        layout()
        setupTableView()
        addItemView.delegate = self
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
        addItemView.translatesAutoresizingMaskIntoConstraints = false
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
        addItemButton.addTarget(self, action: #selector(addItemButtonTapped(_:)), for: .touchUpInside)
        
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
        let imageName = item.done ? "checkmark.circle" : "circle"
        let tintColor = item.done ? UIColor.systemGreen : UIColor.black

        cell.checkButton.setBackgroundImage(UIImage(systemName: imageName)?.withTintColor(tintColor, renderingMode: .alwaysOriginal), for: .normal)
        
        cell.checkButton.tag = indexPath.row
        cell.checkButton.addTarget(self, action: #selector(checkmarkClick(_:)), for: .touchUpInside)
        cell.delegate = self
        cell.label.text = viewModel.listOfItems[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
          
          let itemToRemove = indexPath.row
          print(viewModel.listOfItems[itemToRemove].name)
          guard let item = viewModel.listOfItems[itemToRemove].name else { return }
          CoreDataManager.shared.removeItem(itemName: item)
          viewModel.listOfItems = CoreDataManager.shared.fetchItems()
          tableView.reloadData()
          setupLabel(items: viewModel.listOfItems)
      }
    }
}

//MARK: -Actions

extension ViewController {
    @objc func addItemButtonTapped(_ sender:UIButton) {
        view.addSubview(addItemView)
        addItemView.textfield.becomeFirstResponder()
        
        NSLayoutConstraint.activate([
            addItemView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            addItemView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
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

extension ViewController : AddItemDelegate {
    func didAddItem(item: String) {
        viewModel.createItem(name: item, done: false)
        addItemView.textfield.text = ""
        addItemView.removeFromSuperview()
        viewModel.listOfItems = CoreDataManager.shared.fetchItems()
        tableView.reloadData()
        setupLabel(items: viewModel.listOfItems)
    }
    
    func didCloseWindow() {
        addItemView.removeFromSuperview()
    }
}

