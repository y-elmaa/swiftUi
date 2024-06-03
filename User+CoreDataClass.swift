//
//  User+CoreDataClass.swift
//  CC3final
//
//  Created by user on 9/5/2024.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {
    @NSManaged public var uname: String?
    @NSManaged public var password: String?

}
