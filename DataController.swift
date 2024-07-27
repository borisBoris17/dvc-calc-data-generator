//
//  DataController.swift
//  dvc-calc-data-generator
//
//  Created by tucker bichsel on 17/07/2024.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "DVCCalcModel")
    
    init() {
        container.loadPersistentStores { desctription, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
        
        self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    }
}
