//
//  CCUser+CoreDataProperties.swift
//  CC3final
//
//  Created by user on 9/5/2024.
//
//

import Foundation
import CoreData


extension CCUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CCUser> {
        return NSFetchRequest<CCUser>(entityName: "CCUser")
    }

    @NSManaged public var username: String?
    @NSManaged public var password: String?

}

extension CCUser : Identifiable {

}
