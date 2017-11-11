//
//  Class+CoreDataProperties.swift
//  ListCoreData
//
//  Created by Minh Tuan on 11/11/17.
//  Copyright © 2017 Minh Tuan. All rights reserved.
//
//

import Foundation
import CoreData


extension Class {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Class> {
        return NSFetchRequest<Class>(entityName: "Class")
    }

    @NSManaged public var image: String?
    @NSManaged public var nameClass: String?
    @NSManaged public var student: NSSet?

}

// MARK: Generated accessors for student
extension Class {

    @objc(addStudentObject:)
    @NSManaged public func addToStudent(_ value: Students)

    @objc(removeStudentObject:)
    @NSManaged public func removeFromStudent(_ value: Students)

    @objc(addStudent:)
    @NSManaged public func addToStudent(_ values: NSSet)

    @objc(removeStudent:)
    @NSManaged public func removeFromStudent(_ values: NSSet)

}
