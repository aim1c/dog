//
//  Dog+CoreDataProperties.swift
//  Dog Asistant
//
//  Created by Alexander Volkov on 30/06/2019.
//  Copyright © 2019 Alexander Volkov. All rights reserved.
//
//

import Foundation
import CoreData


extension Dog {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dog> {
        return NSFetchRequest<Dog>(entityName: "Dog")
    }

    @NSManaged public var age: Int32
    @NSManaged public var breed: String?
    @NSManaged public var dogOrPuppy: Bool
    @NSManaged public var gender: String?
    @NSManaged public var growth: Int32
    @NSManaged public var kilo: Int32
    @NSManaged public var name: String?
    @NSManaged public var weight: Int32

}
