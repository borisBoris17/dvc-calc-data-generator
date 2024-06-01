//
//  PointBlock+CoreDataProperties.swift
//  dvc-calc-data-generator
//
//  Created by tucker bichsel on 26/05/2024.
//
//

import Foundation
import CoreData


extension PointBlock {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PointBlock> {
        return NSFetchRequest<PointBlock>(entityName: "PointBlock")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var dateRanges: NSSet?
    @NSManaged public var order: Int16
    
    public var wrappedId: UUID {
        return id ?? UUID()
    }
    
    public var dateRangeArray: [DateRange] {
        let set = dateRanges as? Set<DateRange> ?? []
        
        return set.sorted {
            $0.wrappedStartDate < $1.wrappedStartDate
        }
    }
}

// MARK: Generated accessors for dateRanges
extension PointBlock {

    @objc(addDateRangesObject:)
    @NSManaged public func addToDateRanges(_ value: DateRange)

    @objc(removeDateRangesObject:)
    @NSManaged public func removeFromDateRanges(_ value: DateRange)

    @objc(addDateRanges:)
    @NSManaged public func addToDateRanges(_ values: NSSet)

    @objc(removeDateRanges:)
    @NSManaged public func removeFromDateRanges(_ values: NSSet)

}

extension PointBlock : Identifiable {

}
