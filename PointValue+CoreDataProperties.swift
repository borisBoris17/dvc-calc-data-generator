//
//  PointValue+CoreDataProperties.swift
//  dvc-calc-data-generator
//
//  Created by tucker bichsel on 26/05/2024.
//
//

import Foundation
import CoreData


extension PointValue {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PointValue> {
        return NSFetchRequest<PointValue>(entityName: "PointValue")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var startDate: Date?
    @NSManaged public var endDate: Date?
    @NSManaged public var weekdayRate: Int16
    @NSManaged public var weekendRate: Int16
    @NSManaged public var viewType: ViewType?

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

extension PointValue : Identifiable {

}
