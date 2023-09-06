//
//  ItemListModel.swift
//  Taska-UIKit
//
//  Created by Iuri Ferreira on 01/09/23.
//

import Foundation

//struct Item {
//    var id : Int
//    var name : String
//    var done : Bool
//}

class ItemListViewModel {
    var listOfItems : [Item] = []
    
    init() {
        
    }
    
    func createItem(name:String, done:Bool) {
        CoreDataManager.shared.createItem(id: listOfItems.count+1, name: name, done: done)
    }
    
    func fetchData() {
        listOfItems = CoreDataManager.shared.fetchItems()
    }
    
    func loadMockData() {
        CoreDataManager.shared.createItem(id: listOfItems.count+1, name: "Manga", done: true)
    }
    
}
