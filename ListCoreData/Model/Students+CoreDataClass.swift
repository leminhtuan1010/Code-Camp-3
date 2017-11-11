//
//  Students+CoreDataClass.swift
//  ListCoreData
//
//  Created by Minh Tuan on 11/11/17.
//  Copyright © 2017 Minh Tuan. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Students)
public class Students: NSManagedObject {
    convenience init(_ entity: NSEntityDescription, nameStudent: String, address:String) {
        self.init(entity: entity, insertInto: appDelegate.managedObjectContext)
        self.nameStudent = nameStudent
        self.address = address
    }
}
