//
//  ViewType+CoreDataProperties.swift
//  dvc-calc-data-generator
//
//  Created by tucker bichsel on 26/05/2024.
//
//

import Foundation
import CoreData


extension ViewType: Encodable  {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(viewName, forKey: .viewName)
        try container.encode(roomCapacity, forKey: .roomCapacity)
        try container.encode(roomType?.id, forKey: .roomTypeId)
        if let array = pointValues?.allObjects as? [PointValue] {
                try container.encode(array, forKey: .pointValues)
            }
//        try container.encode(pointValues, forKey: .pointValues)
        try container.encode(order, forKey: .order)
    }
    
    
    private enum CodingKeys: String, CodingKey { case id, viewName, roomCapacity, roomTypeId, pointValues, order }
    
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ViewType> {
        return NSFetchRequest<ViewType>(entityName: "ViewType")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var viewName: String?
    @NSManaged public var roomCapacity: Int16
    @NSManaged public var roomType: RoomType?
    @NSManaged public var pointValues: NSSet?
    @NSManaged public var order: Int16
    
    public var wrappedId: UUID {
        return id ?? UUID()
    }
    
    public var wrappedViewName: String {
        viewName ?? "Unknown Name"
    }

    public var pointValueArray: [PointValue] {
        let set = pointValues as? Set<PointValue> ?? []
        
        return set.sorted {
            $0.wrappedStartDate < $1.wrappedStartDate
        }
    }
}

// MARK: Generated accessors for pointValues
extension ViewType {

    @objc(addPointValuesObject:)
    @NSManaged public func addToPointValues(_ value: PointValue)

    @objc(removePointValuesObject:)
    @NSManaged public func removeFromPointValues(_ value: PointValue)

    @objc(addPointValues:)
    @NSManaged public func addToPointValues(_ values: NSSet)

    @objc(removePointValues:)
    @NSManaged public func removeFromPointValues(_ values: NSSet)

}

extension ViewType : Identifiable {

}
