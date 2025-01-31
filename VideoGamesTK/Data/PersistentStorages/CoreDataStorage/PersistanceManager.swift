//
//  PersistanceManager.swift
//  VideoGamesTK
//
//  Created by Jose Miguel Serrato Moreno on 29/01/25.
//
import CoreData

final class PersistanceManager {
    static let shared = PersistanceManager()
    
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                print("Error cargando los datos: \(error)")
            } else {
                print("Carga de datos exitosa")
            }
        }
    }
}
