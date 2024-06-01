//
//  ContentView.swift
//  dvc-calc-data-generator
//
//  Created by tucker bichsel on 16/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var resort: Resort?
    @State private var pointValues: [[[(weekdayRate: String, weekendRate: String)]]] = []
    
    let container = NSPersistentContainer(name: "DVCCalcModel")
    let storeURL = URL.documentsDirectory.appending(path: "dvcTest.store")
    
    func createRevieraResort() {
        // move this to a state var?
        if let description = container.persistentStoreDescriptions.first {
            
            // Make Core Data write to our new store URL.
            description.url = storeURL
            
            // Force WAL mode off.
            description.setValue("DELETE" as NSObject, forPragmaNamed: "journal_mode")
        }
        
        container.loadPersistentStores { description, error in
            
            let towerStudio = RoomType(context: container.viewContext)
            let standardTower = ViewType(context: container.viewContext)
            standardTower.order = 1
            standardTower.viewName = ""
            standardTower.roomCapacity = 2
            towerStudio.id = UUID()
            towerStudio.order = 1
            towerStudio.roomName = "Tower Studio"
            towerStudio.viewTypes = [standardTower]
            
            let deluxeStudio = RoomType(context: container.viewContext)
            let standardStudio = ViewType(context: container.viewContext)
            let prefStudio = ViewType(context: container.viewContext)
            standardStudio.order = 1
            standardStudio.viewName = "Standard"
            standardStudio.roomCapacity = 5
            prefStudio.order = 2
            prefStudio.viewName = "Preferred"
            prefStudio.roomCapacity = 5
            deluxeStudio.id = UUID()
            deluxeStudio.order = 2
            deluxeStudio.roomName = "Deluxe Studio"
            deluxeStudio.viewTypes = [standardStudio, prefStudio]
            
            let oneBed = RoomType(context: container.viewContext)
            let standardOne = ViewType(context: container.viewContext)
            let prefOne = ViewType(context: container.viewContext)
            standardOne.order = 1
            standardOne.viewName = "Standard"
            standardOne.roomCapacity = 5
            prefOne.order = 2
            prefOne.viewName = "Preferred"
            prefOne.roomCapacity = 5
            oneBed.id = UUID()
            oneBed.order = 3
            oneBed.roomName = "One-Bedroom Villa"
            oneBed.viewTypes = [standardOne, prefOne]
            
            let twoBed = RoomType(context: container.viewContext)
            let standardTwo = ViewType(context: container.viewContext)
            let prefTwo = ViewType(context: container.viewContext)
            standardTwo.order = 1
            standardTwo.viewName = "Standard"
            standardTwo.roomCapacity = 9
            prefTwo.order = 2
            prefTwo.viewName = "Preferred3"
            prefTwo.roomCapacity = 9
            twoBed.id = UUID()
            twoBed.order = 4
            twoBed.roomName = "Two-Bedroom Villa"
            twoBed.viewTypes = [standardTwo, prefTwo]
            
            let threeBed = RoomType(context: container.viewContext)
            let standardThree = ViewType(context: container.viewContext)
            standardThree.order = 1
            standardThree.viewName = ""
            standardThree.roomCapacity = 12
            threeBed.id = UUID()
            threeBed.order = 5
            threeBed.roomName = "Three-Bedroom Grand Villa"
            threeBed.viewTypes = [standardThree]
            
            let rivieraRoomTypes = [towerStudio, deluxeStudio, oneBed, twoBed, threeBed]
            
            let pointBlocks = buildDisney2025PointBlocks()
            
            var buildPointValues: [[[(weekdayRate: String, weekendRate: String)]]] = []
            for _ in 0..<pointBlocks.count {
                buildPointValues.append([[(weekdayRate: "", weekendRate: "")], [(weekdayRate: "", weekendRate: ""), (weekdayRate: "", weekendRate: "")], [(weekdayRate: "", weekendRate: ""), (weekdayRate: "", weekendRate: "")], [(weekdayRate: "", weekendRate: ""), (weekdayRate: "", weekendRate: "")], [(weekdayRate: "", weekendRate: "")]])
            }
            pointValues = buildPointValues
            
            resort = Resort(context: container.viewContext)
            resort!.resortName = "Disney's Riviera Resort"
            resort!.roomTypes = NSSet(array: rivieraRoomTypes)
            resort!.pointBlocks = NSSet(array: pointBlocks)
            container.viewContext.insert(resort!)
        }
    }
    
    func saveResort() {
        
        guard resort != nil else { return }
        
        if let description = container.persistentStoreDescriptions.first {
            
            // Make Core Data write to our new store URL.
            description.url = storeURL
            
            // Force WAL mode off.
            description.setValue("DELETE" as NSObject, forPragmaNamed: "journal_mode")
        }
        
        container.loadPersistentStores { description, error in
            for pointBlockIndex in 0..<resort!.pointBlocks!.count {
                let currentPointValueArray = pointValues[pointBlockIndex]
                for i in 0..<resort!.roomTypes!.count {
                    let currentPointValues = currentPointValueArray[i]
                    
                    for j in 0..<resort!.roomTypeArray[i].viewTypes!.count {
                        
                        let currentViewPoints = currentPointValues[j]
                        for dateRange in resort!.pointBlockArray[pointBlockIndex].dateRangeArray {
                            
                            let newPointValue = PointValue(context: container.viewContext)
                            newPointValue.startDate = dateRange.wrappedStartDate
                            newPointValue.endDate = dateRange.wrappedEndDate
                            newPointValue.viewType = resort!.roomTypeArray[i].viewTypeArray[j]
                            
                            newPointValue.weekdayRate = Int16(currentViewPoints.weekdayRate) ?? 0
                            newPointValue.weekendRate = Int16(currentViewPoints.weekendRate) ?? 0
                        }
                    }
                }
            }
            
            print("Save Resort...")
        }
    }
    
    func deleteResort(_ resortToDelete: Resort) {
        do {
            container.viewContext.delete(resortToDelete)
            try container.viewContext.save()
        } catch {
            print("Failed to delete resort: \(error.localizedDescription)")
        }
    }
    
    func exportStore() {
        do {
            try container.viewContext.save()
            
            let destination = URL(filePath: "/Users/tuckerbichsel/Desktop/dvc.store")
            try FileManager.default.copyItem(at: storeURL, to: destination)
        } catch {
            print("Failed to create data: \(error.localizedDescription)")
        }
    }
    
    func clearStore() {
        do {
            try FileManager.default.removeItem(at: storeURL)
        } catch {
            print("Failed to delete data: \(error.localizedDescription)")
        }
    }
    
    func buildDisney2025PointBlocks() -> [PointBlock] {
        let pointBlock1 = PointBlock(context: container.viewContext)
        let septRange = DateRange(context: container.viewContext)
        septRange.startDate = Calendar.current.date(from: DateComponents(year: 2025, month: 9, day: 1))!
        septRange.endDate = Calendar.current.date(from: DateComponents(year: 2025, month: 9, day: 30))!
        pointBlock1.dateRanges = [septRange]
        pointBlock1.order = 1
        
        let pointBlock2 = PointBlock(context: container.viewContext)
        let janRange = DateRange(context: container.viewContext)
        let beginMayRange = DateRange(context: container.viewContext)
        janRange.startDate = Calendar.current.date(from: DateComponents(year: 2025, month: 1, day: 1))!
        janRange.endDate = Calendar.current.date(from: DateComponents(year: 2025, month: 1, day: 31))!
        beginMayRange.startDate = Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 1))!
        beginMayRange.endDate = Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 14))!
        pointBlock2.dateRanges = [janRange, beginMayRange]
        pointBlock2.order = 2
        
        let pointBlock3 = PointBlock(context: container.viewContext)
        let endMayRange = DateRange(context: container.viewContext)
        let beginDecRange = DateRange(context: container.viewContext)
        endMayRange.startDate = Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 15))!
        endMayRange.endDate = Calendar.current.date(from: DateComponents(year: 2025, month: 6, day: 10))!
        beginDecRange.startDate = Calendar.current.date(from: DateComponents(year: 2025, month: 12, day: 1))!
        beginDecRange.endDate = Calendar.current.date(from: DateComponents(year: 2025, month: 12, day: 23))!
        pointBlock3.dateRanges = [endMayRange, beginDecRange]
        pointBlock3.order = 3
        
        let pointBlock4 = PointBlock(context: container.viewContext)
        let beginFebRange = DateRange(context: container.viewContext)
        let summerRange = DateRange(context: container.viewContext)
        beginFebRange.startDate = Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 1))!
        beginFebRange.endDate = Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 15))!
        summerRange.startDate = Calendar.current.date(from: DateComponents(year: 2025, month: 6, day: 11))!
        summerRange.endDate = Calendar.current.date(from: DateComponents(year: 2025, month: 8, day: 31))!
        pointBlock4.dateRanges = [beginFebRange, summerRange]
        pointBlock4.order = 4
        
        let pointBlock5 = PointBlock(context: container.viewContext)
        let fallRange = DateRange(context: container.viewContext)
        let endNovRange = DateRange(context: container.viewContext)
        fallRange.startDate = Calendar.current.date(from: DateComponents(year: 2025, month: 10, day: 1))!
        fallRange.endDate = Calendar.current.date(from: DateComponents(year: 2025, month: 11, day: 25))!
        endNovRange.startDate = Calendar.current.date(from: DateComponents(year: 2025, month: 11, day: 29))!
        endNovRange.endDate = Calendar.current.date(from: DateComponents(year: 2025, month: 11, day: 30))!
        pointBlock5.dateRanges = [fallRange, endNovRange]
        pointBlock5.order = 5
        
        let pointBlock6 = PointBlock(context: container.viewContext)
        let springRange = DateRange(context: container.viewContext)
        let endAprilRange = DateRange(context: container.viewContext)
        let thanksgivingRange = DateRange(context: container.viewContext)
        springRange.startDate = Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 16))!
        springRange.endDate = Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 12))!
        endAprilRange.startDate = Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 21))!
        endAprilRange.endDate = Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 30))!
        thanksgivingRange.startDate = Calendar.current.date(from: DateComponents(year: 2025, month: 11, day: 26))!
        thanksgivingRange.endDate = Calendar.current.date(from: DateComponents(year: 2025, month: 11, day: 28))!
        pointBlock6.dateRanges = [springRange, endAprilRange, thanksgivingRange]
        pointBlock6.order = 6
        
        let pointBlock7 = PointBlock(context: container.viewContext)
        let springBreakRange = DateRange(context: container.viewContext)
        let holidayRange = DateRange(context: container.viewContext)
        springBreakRange.startDate = Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 13))!
        springBreakRange.endDate = Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 20))!
        holidayRange.startDate = Calendar.current.date(from: DateComponents(year: 2025, month: 12, day: 24))!
        holidayRange.endDate = Calendar.current.date(from: DateComponents(year: 2025, month: 12, day: 31))!
        pointBlock7.dateRanges = [springBreakRange, holidayRange]
        pointBlock7.order = 7
        
        return [pointBlock1, pointBlock2, pointBlock3, pointBlock4, pointBlock5, pointBlock6, pointBlock7]
    }
    
    func calcNumberColumns() -> Int {
        guard resort != nil else { return 0 }
        
        var count = 0;
        for roomType in resort!.roomTypeArray {
            for _ in roomType.viewTypeArray {
                count += 1
            }
        }
        return count
    }
    
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    createRevieraResort()
                } label: {
                    Text("Load Riviera Data")
                }
                
                Button("Export") {
                    exportStore()
                }
                
                Button("Clear Data") {
                    clearStore()
                }
            }
            
            if resort != nil {
                VStack {
                    Grid {
                        GridRow {
                            Text("")
                            Text("")
                            ForEach(resort!.roomTypeArray) { roomType in
                                ForEach(roomType.viewTypeArray, id: \.self) { viewType in
                                    Text("\(roomType.wrappedRoomName) - \(viewType.wrappedViewName)")
                                }
                            }
                        }
                        
                        ForEach(resort!.pointBlockArray.indices, id: \.self) { g in
                            GridRow {
                                VStack {
                                    ForEach(resort!.pointBlockArray[g].dateRangeArray, id: \.self) { dateRange in
                                        HStack {
                                            Text(dateRange.wrappedStartDate, format: .dateTime.month().day())
                                            Text("-")
                                            Text(dateRange.wrappedEndDate, format: .dateTime.month().day())
                                        }
                                    }
                                }
                                
                                VStack {
                                    Text("Weekday Rate")
                                        .padding(.vertical)
                                    Text("Weekend Rate")
                                }
                                
                                ForEach(resort!.roomTypeArray.indices, id: \.self) { i in
                                    PointValueView(pointValues: $pointValues[g][i], roomType: resort!.roomTypeArray[i])
                                }
                            }
                        }
                    }
                    
                    HStack {
                        Button("Save") {
                            saveResort()
                        }
                        
                        Button("Delete") {
                            deleteResort(resort!)
                        }
                    }
                    .padding(.top)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

extension VerticalAlignment {
    struct WeekdayRate: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.center]
        }
    }
    
    struct WeekendRate: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.center]
        }
    }
    
    static let weekdayRateAlignment = VerticalAlignment(WeekdayRate.self)
    static let weekendRateAlignment = VerticalAlignment(WeekendRate.self)
}

#Preview {
    ContentView()
}
