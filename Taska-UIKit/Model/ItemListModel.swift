//
//  ItemListModel.swift
//  Taska-UIKit
//
//  Created by Iuri Ferreira on 01/09/23.
//

import Foundation

struct Item {
    var id : Int
    var name : String
    var done : Bool
}

class ItemListViewModel {
    var listOfItems : [Item] = []
    
    init() {
        
    }
    
    func loadMockData() {
        let item1 = Item(id:0, name: "Estudar python", done: false)
        let item2 = Item(id:1, name: "Ligar francina", done: false)
        let item3 = Item(id:2, name:"Fazer banco de dados.", done: true)
        
        listOfItems.append(item1)
        listOfItems.append(item2)
        listOfItems.append(item3)
    }
    
}
