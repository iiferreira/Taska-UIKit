//
//  CoreDataManager.swift
//  Taska-UIKit
//
//  Created by Iuri Ferreira on 05/09/23.
//

import UIKit
import CoreData

struct CoreDataManager {
    //let viewModel = ItemListViewModel()
    
    static let shared = CoreDataManager()
    
    let persistentContainer : NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Taska")
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("Error loading store: \(error)")
            }
        }
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        
        do {
            try context.save()
        } catch {
            print("Error saving context.")
        }
    }
    
    func createItem(id: Int, name: String, done: Bool) {
        let context = persistentContainer.viewContext
        let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: context)
   
        item.setValue(id, forKey: "id")
        item.setValue(name, forKey: "name")
        item.setValue(done, forKey: "done")
        
        do {
            try context.save()
        } catch {
            print("Failed creating item")
        }
    }
    
    func fetchItems() -> [Item] {
        let context = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Item>(entityName: "Item")
        
        do {
            let items = try context.fetch(fetchRequest)
            return items
        } catch {
            print("Failed loading item")
            return []
        }
    }
    
    func removeItem(itemName: String) {
        let context = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Item>(entityName: "Item")
        
        do {
            let items = try context.fetch(fetchRequest)
            items.forEach { fetchedItem in
                if fetchedItem.name == itemName {
                    print(fetchedItem)
                    context.delete(fetchedItem)
                }
            }
            try context.save()
        } catch {
            print("Failed deleting item")
        }
    }
}
