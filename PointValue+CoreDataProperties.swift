//
//  PointValue+CoreDataProperties.swift
//  dvc-calc-data-generator
//
//  Created by tucker bichsel on 26/05/2024.
//
//

import Foundation
import CoreData


extension PointValue: Encodable  {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(startDate, forKey: .startDate)
        try container.encode(endDate, forKey: .endDate)
        try container.encode(weekdayRate, forKey: .weekdayRate)
        try container.encode(weekendRate, forKey: .weekendRate)
        try container.encode(viewType?.id, forKey: .viewTypeId)
    }
    
    
    private enum CodingKeys: String, CodingKey { case id, startDate, endDate, weekdayRate, weekendRate, viewTypeId }
    
    
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
