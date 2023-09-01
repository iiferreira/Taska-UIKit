//
//  ItemListModel.swift
//  Taska-UIKit
//
//  Created by Iuri Ferreira on 01/09/23.
//

import Foundation

struct Item {
    var name : String
    var done : Bool
}

class ItemListViewModel {
    var listOfItems : [Item] = []
    
    init() {
        
    }
    
    func loadMockData() {
        let item1 = Item(name: "Estudar python", done: false)
        let item2 = Item(name: "Ligar francina", done: false)
        let item3 = Item(name: "Fazer banco de dados.", done: true)
        
        listOfItems.append(item1)
        listOfItems.append(item2)
        listOfItems.append(item3)
    }
    
}
