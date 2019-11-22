//
//  CoreDataManager.swift
//  MusicLibrary
//
//  Created by Consultant on 11/21/19.
//  Copyright © 2019 Consultant. All rights reserved.
//

import Foundation
import CoreData

extension CodingUserInfoKey {
    static let context = CodingUserInfoKey(rawValue: "context")!
}

class CoreDataManager {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MusicLibrary")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unreloved error \(error), \(error.userInfo)")
            }
            
        })
        return container
    }()
    
    lazy var mainMOC: NSManagedObjectContext = {
        return self.persistentContainer.viewContext
    }()
    
    init() {
        
    }
    
    func debugAllContries(){
        
    }
    
    
    //coreData Saving Support
    
    func saveContext(){
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch{
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
        
    }
    
}




