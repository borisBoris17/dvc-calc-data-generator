//
//  Resort+CoreDataProperties.swift
//  dvc-calc-data-generator
//
//  Created by tucker bichsel on 26/05/2024.
//
//

import Foundation
import CoreData


extension Resort {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Resort> {
        return NSFetchRequest<Resort>(entityName: "Resort")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var resortName: String?
    @NSManaged public var roomTypes: NSSet?
    @NSManaged public var pointBlocks: NSSet?
    
    public var wrappedId: UUID {
        return id ?? UUID()
    }
    
    public var wrappedResortName: String {
        return resortName ?? "Unknown Resort Name"
    }
    
    public var roomTypeArray: [RoomType] {
        let set = roomTypes as? Set<RoomType> ?? []
        
        return set.sorted {
            $0.order < $1.order
        }
    }
    
    public var pointBlockArray: [PointBlock] {
        let set = pointBlocks as? Set<PointBlock> ?? []
        
        return set.sorted {
            $0.order < $1.order
        }
    }

}

// MARK: Generated accessors for roomTypes
extension Resort {

    @objc(addRoomTypesObject:)
    @NSManaged public func addToRoomTypes(_ value: RoomType)

    @objc(removeRoomTypesObject:)
    @NSManaged public func removeFromRoomTypes(_ value: RoomType)

    @objc(addRoomTypes:)
    @NSManaged public func addToRoomTypes(_ values: NSSet)

    @objc(removeRoomTypes:)
    @NSManaged public func removeFromRoomTypes(_ values: NSSet)

}

// MARK: Generated accessors for pointBlocks
extension Resort {

    @objc(addPointBlocksObject:)
    @NSManaged public func addToPointBlocks(_ value: PointBlock)

    @objc(removePointBlocksObject:)
    @NSManaged public func removeFromPointBlocks(_ value: PointBlock)

    @objc(addPointBlocks:)
    @NSManaged public func addToPointBlocks(_ values: NSSet)

    @objc(removePointBlocks:)
    @NSManaged public func removeFromPointBlocks(_ values: NSSet)

}

extension Resort : Identifiable {

}
