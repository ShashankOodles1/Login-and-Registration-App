//
//  CDPerson+CoreDataProperties.swift
//  Login and Registration App
//
//  Created by Shashank Mishra on 24/11/20.
//
//

import Foundation
import CoreData


extension CDPerson {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDPerson> {
        return NSFetchRequest<CDPerson>(entityName: "CDPerson")
    }

    @NSManaged public var password: String?
    @NSManaged public var confirmPassword: String?
    @NSManaged public var emailid: String?
    @NSManaged public var firstname: String?
    @NSManaged public var lastname: String?
    func convertToPerson() -> Person
    {
        return Person(firstname: self.firstname, lastname: self.lastname, emailid: self.emailid, password: self.password, confirmPassword: self.confirmPassword)
    }
}

extension CDPerson : Identifiable {
       
}
