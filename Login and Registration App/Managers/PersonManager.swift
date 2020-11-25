//
//  PersonManager.swift
//  Login and Registration App
//
//  Created by Shashank Mishra on 24/11/20.
//

import Foundation
import CoreData

struct PersonManager
{
    private let _personDataRepository = PersonDataRepository()
    
    func createPerson(person:Person) {
        _personDataRepository.create(person: person)
        PersistentStorage.shared.saveContext()
        
    }
   
    func fetchPerson() -> [Person]? {
        return _personDataRepository.getAll()
    }
}
