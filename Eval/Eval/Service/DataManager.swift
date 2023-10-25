//
//  DataManager.swift
//  Eval
//
//  Created by Tony Izzi on 25/10/2023.
//
import Foundation
import CoreData

class DataManager{
    
    static let shared = DataManager()
    let context: NSManagedObjectContext
    
    init() {
        let container = NSPersistentContainer(name: "Favorite")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading persistant store:", error)
            }
        }
        context = container.viewContext
    }
    
    // MARK: - Utilitaires
    
    private func saveContext() {
        guard context.hasChanges else { return }
        
        do {
            try context.save()
        } catch {
            print("Error saving context", error)
        }
    }
    
    private func cleanUp(){
        var clean = [Favorite]()
        
        let fetchRequest = NSFetchRequest<Favorite>(entityName: "Favorite")
        
        do{
            clean = try context.fetch(fetchRequest)
        }catch{
            print("Error fetching initial data", error)
        }
        
        clean.forEach{ item in
            context.delete(item)
        }
        saveContext()
    }
    
    // MARK: - Favori
    func addFav(idGame: Int, nameGame: String){
        
        let fav = Favorite(context: context)
        fav.id = Int32(idGame)
        fav.name = nameGame
        fav.insertDate = Date()
        
        saveContext()
    }
    
    func delFav(idGame: Int){
        
        var del = [Favorite]()
        
        let fetchRequest = NSFetchRequest<Favorite>(entityName: "Favorite")
        fetchRequest.predicate = NSPredicate(format: "id == \(idGame)")
        
        
        do{
            del = try context.fetch(fetchRequest)
        }catch{
            print("Error fetching initial data", error)
        }
        
        guard let item = del.first else { return }
        context.delete(item)
        saveContext()
    }
    
    // Methode de verifiaction dans les page détail
    func isFav(idGame: Int) -> Bool{
        
        var isOk = [Favorite]()
        
        let fetchRequest = NSFetchRequest<Favorite>(entityName: "Favorite")
        fetchRequest.predicate = NSPredicate(format: "id == \(idGame)")
        
        do{
            isOk = try context.fetch(fetchRequest)
        }catch{
            print("Error fetching initial data", error)
        }
        
        return isOk.count == 0 ? false : true
    }
    
    func getListFav() -> [Favorite]{
        let fetchRequest = NSFetchRequest<Favorite>(entityName: "Favorite")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "insertDate", ascending: false)]
        var list = [Favorite]()
        
        do{
            list = try context.fetch(fetchRequest)
        }catch{
            print("Error fetching initial data", error)
        }
        
        return list
    }
    
    
    
}

