//
//  RoomType+CoreDataProperties.swift
//  dvc-calc-data-generator
//
//  Created by tucker bichsel on 26/05/2024.
//
//

import Foundation
import CoreData


extension RoomType: Encodable  {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(roomName, forKey: .roomName)
        try container.encode(resort?.id, forKey: .resortId)
        if let array = viewTypes?.allObjects as? [ViewType] {
            try container.encode(array, forKey: .viewTypes)
        }
        try container.encode(order, forKey: .order)
        try container.encode(roomCategory, forKey: .roomCategory)
    }
    
    
    private enum CodingKeys: String, CodingKey { case id, roomName, resortId, viewTypes, order, roomCategory }
    
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<RoomType> {
        return NSFetchRequest<RoomType>(entityName: "RoomType")
    }
    
    @NSManaged public var id: UUID?
    @NSManaged public var roomName: String?
    @NSManaged public var resort: Resort?
    @NSManaged public var viewTypes: NSSet?
    @NSManaged public var order: Int16
    @NSManaged public var roomCategory: String?
    
    public var wrappedId: UUID {
        return id ?? UUID()
    }
    
    public var wrappedRoomName: String {
        roomName ?? "Unknown Name"
    }
    
    public var wrappedRoomCategory: String {
        roomCategory ?? "Unknown Category"
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
