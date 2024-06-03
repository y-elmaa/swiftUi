//
//  Userrr+CoreDataProperties.swift
//  CC3final
//
//  Created by user on 9/5/2024.
//
//

import Foundation
import CoreData


extension Userrr {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Userrr> {
        return NSFetchRequest<Userrr>(entityName: "Userrr")
    }

    @NSManaged public var username: String?

}

extension Userrr : Identifiable {

}
