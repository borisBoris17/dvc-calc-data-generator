//
//  DateRange+CoreDataProperties.swift
//  dvc-calc-data-generator
//
//  Created by tucker bichsel on 26/05/2024.
//
//

import Foundation
import CoreData


extension DateRange {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DateRange> {
        return NSFetchRequest<DateRange>(entityName: "DateRange")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var startDate: Date?
    @NSManaged public var endDate: Date?
    
    public var wrappedId: UUID {
        return id ?? UUID()
    }

    public var wrappedStartDate: Date {
        return startDate ?? Date()
    }
    
    public var wrappedEndDate: Date {
        return endDate ?? Date()
    }
}

extension DateRange : Identifiable {

}
