//
//  Favorite+CoreDataProperties.swift
//  Eval
//
//  Created by Tony Izzi on 25/10/2023.
//
//

import Foundation
import CoreData


extension Favorite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorite> {
        return NSFetchRequest<Favorite>(entityName: "Favorite")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var insertDate: Date?

}

extension Favorite : Identifiable {

}
