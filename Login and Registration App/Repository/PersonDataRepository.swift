//
//  PersonDataRepository.swift
//  Login and Registration App
//
//  Created by Shashank Mishra on 24/11/20.
//

import Foundation
import CoreData
protocol PersonRepository {
    func create(person: Person)
    func getAll () -> [Person]?
}


struct PersonDataRepository : PersonRepository {
    func create(person: Person) {
        let cdPerson = CDPerson(context: PersistentStorage.shared.context)
        cdPerson.firstname = person.firstname
        cdPerson.lastname = person.lastname
        cdPerson.emailid = person.emailid
        cdPerson.password = person.password
        cdPerson.confirmPassword = person.confirmPassword
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [Person]? {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDPerson.self)
        var person : [Person] = []
        result?.forEach({(cdPerson) in  person.append(cdPerson.convertToPerson())
        })
        return person
    }
}
