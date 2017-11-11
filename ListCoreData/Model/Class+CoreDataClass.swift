//
//  Class+CoreDataClass.swift
//  ListCoreData
//
//  Created by Minh Tuan on 11/11/17.
//  Copyright © 2017 Minh Tuan. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Class)
public class Class: NSManagedObject {
    convenience init(_ entity: NSEntityDescription, nameClass: String, ImageClass: String) {
        self.init(entity: entity, insertInto: appDelegate.managedObjectContext)
        self.nameClass = nameClass
        self.image = ImageClass
        
    }
}
