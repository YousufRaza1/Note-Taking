//
//  CoreDataManager.swift
//  Note-Taking
//
//  Created by Yousuf on 11/28/23.
//

import CoreData
import Foundation

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    static let shared: CoreDataManager = .init()

    private init() {
        ValueTransformer.setValueTransformer(UIImageTransformer(), forName: NSValueTransformerName("UIImageTransformer"))

        persistentContainer = NSPersistentContainer(name: "CDNoteModel")
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
    }
}
