//
//  RoomType+CoreDataProperties.swift
//  dvc-calc-data-generator
//
//  Created by tucker bichsel on 26/05/2024.
//
//

import Foundation
import CoreData


extension RoomType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RoomType> {
        return NSFetchRequest<RoomType>(entityName: "RoomType")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var roomName: String?
    @NSManaged public var resort: Resort?
    @NSManaged public var viewTypes: NSSet?
    @NSManaged public var order: Int16
    
    public var wrappedId: UUID {
        return id ?? UUID()
    }
    
    public var wrappedRoomName: String {
        roomName ?? "Unknown Name"
    }
    
    public var viewTypeArray: [ViewType] {
        let set = viewTypes as? Set<ViewType> ?? []
        
        return set.sorted {
            $0.order < $1.order
        }
    }
    
}

// MARK: Generated accessors for viewTypes
extension RoomType {

    @objc(addViewTypesObject:)
    @NSManaged public func addToViewTypes(_ value: ViewType)

    @objc(removeViewTypesObject:)
    @NSManaged public func removeFromViewTypes(_ value: ViewType)

    @objc(addViewTypes:)
    @NSManaged public func addToViewTypes(_ values: NSSet)

    @objc(removeViewTypes:)
    @NSManaged public func removeFromViewTypes(_ values: NSSet)

}

extension RoomType : Identifiable {

}
