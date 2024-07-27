//
//  File.swift
//  dvc-calc-data-generator
//
//  Created by tucker bichsel on 01/06/2024.
//

import Foundation
import SwiftUI
import CoreData
//import UIKit

extension ContentView {
    
    @Observable
    class ViewModel {
        var resort: Resort?
        var pointValues: [[[(weekdayRate: String, weekendRate: String)]]] = []
        
//        var context: NSManagedObjectContext
        let container = NSPersistentContainer(name: "DVCCalcModel")
        let storeURL = URL.documentsDirectory.appending(path: "dvcTest.store")
        
        func saveResort() {
            
            guard resort != nil else { return }
            
            if let description = container.persistentStoreDescriptions.first {
                
                // Make Core Data write to our new store URL.
                description.url = storeURL
                
                // Force WAL mode off.
                description.setValue("DELETE" as NSObject, forPragmaNamed: "journal_mode")
            }
            
            container.loadPersistentStores { description, error in
                for pointBlockIndex in 0..<self.resort!.pointBlocks!.count {
                    let currentPointValueArray = self.pointValues[pointBlockIndex]
                    for i in 0..<self.resort!.roomTypes!.count {
                        let currentPointValues = currentPointValueArray[i]
                        
                        for j in 0..<self.resort!.roomTypeArray[i].viewTypes!.count {
                            
                            let currentViewPoints = currentPointValues[j]
                            for dateRange in self.resort!.pointBlockArray[pointBlockIndex].dateRangeArray {
                                
                                let newPointValue = PointValue(context: self.container.viewContext)
                                newPointValue.id = UUID()
                                newPointValue.startDate = dateRange.wrappedStartDate
                                newPointValue.endDate = dateRange.wrappedEndDate
                                newPointValue.viewType = self.resort!.roomTypeArray[i].viewTypeArray[j]
                                
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
                print("Export")
//                try container.viewContext.save()
                
                let destination = URL(filePath: "/Users/tuckerbichsel/Desktop/dvc6a.store")
                try FileManager.default.copyItem(at: storeURL, to: destination)
            } catch {
                print("Failed to create data: \(error.localizedDescription)")
            }
        }
        
        func exportToJsonStore() {
//            func exportToJsonStore(for resorts: [Resort]) {
            do {
                print("Export to Json")
                try container.viewContext.save()
                
                let destination = URL(filePath: "/Users/tuckerbichsel/Desktop/dvc.json")
                let encoder = JSONEncoder()
                
                var resorts  = [Resort]() // Where Locations = your NSManaged Class
//
////                var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Resort")
//                let context = (UIApplication.shared.delegate as! AppDelegate).context
                resorts = try container.viewContext.fetch(Resort.fetchRequest())
                
                do {
                    let data = try encoder.encode(resorts)
                    try data.write(to: destination)
                } catch {
                    print(error)
                }
                
//                try FileManager.default.copyItem(at: storeURL, to: destination)
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
        
        func createViewType(context: NSManagedObjectContext, order: Int16, viewName: String, capacity: Int16) -> ViewType {
            let viewType = ViewType(context: self.container.viewContext)
            viewType.id = UUID()
            viewType.order = order
            viewType.viewName = viewName
            viewType.roomCapacity = capacity
            
            return viewType
        }
        
        func createRoomType(context: NSManagedObjectContext, order: Int16, roomName: String, viewTypes: NSSet, roomCategory: String) -> RoomType {
            let roomType = RoomType(context: self.container.viewContext)
            roomType.id = UUID()
            roomType.order = order
            roomType.roomName = roomName
            roomType.viewTypes = viewTypes
            roomType.roomCategory = roomCategory
            
            return roomType
        }
        
        func createResort(context: NSManagedObjectContext, resortName: String, shortName: String, expireYear: Int16, roomTypes: NSSet, pointBlocks: NSSet) -> Resort {
            let newResort = Resort(context: self.container.viewContext)
            newResort.id = UUID()
            newResort.resortName = resortName
            newResort.shortName = shortName
            newResort.roomTypes = roomTypes
            newResort.expireYear = expireYear
            newResort.pointBlocks = pointBlocks
            
            return newResort
        }
        
        func createPointValueInputs(pointBlocks: [PointBlock], roomTypes: [RoomType]) -> [[[(weekdayRate: String, weekendRate: String)]]] {
            var buildPointValues: [[[(weekdayRate: String, weekendRate: String)]]] = []
            
            for _ in 0..<pointBlocks.count {
                var pointValuesForBlock: [[(weekdayRate: String, weekendRate: String)]] = []
                for roomIndex in 0..<roomTypes.count {
                    let curRoom = roomTypes[roomIndex]
                    var pointValuesForRoom: [(weekdayRate: String, weekendRate: String)] = []
                    for _ in 0..<curRoom.viewTypeArray.count {
                        pointValuesForRoom.append((weekdayRate: "", weekendRate: ""))
                    }
                    pointValuesForBlock.append(pointValuesForRoom)
                }
                buildPointValues.append(pointValuesForBlock)
            }
            
            return buildPointValues
        }
        
        func createRivieraResort() {
            
            if let description = container.persistentStoreDescriptions.first {
                
                // Make Core Data write to our new store URL.
                description.url = storeURL
                
                // Force WAL mode off.
                description.setValue("DELETE" as NSObject, forPragmaNamed: "journal_mode")
            }
            
            container.loadPersistentStores { description, error in
                
                let standardTower = self.createViewType(context: self.container.viewContext, order: 1, viewName: "", capacity: 2)
                let towerStudio = self.createRoomType(context: self.container.viewContext, order: 1, roomName: "Tower Studio", viewTypes: [standardTower], roomCategory: "Studio")
                
                let standardStudio = self.createViewType(context: self.container.viewContext, order: 1, viewName: "Standard", capacity: 5)
                let prefStudio = self.createViewType(context: self.container.viewContext, order: 2, viewName: "Preferred", capacity: 5)
                let deluxeStudio = self.createRoomType(context: self.container.viewContext, order: 2, roomName: "Deluxe Studio", viewTypes: [standardStudio, prefStudio], roomCategory: "Studio")
                
                let standardOne = self.createViewType(context: self.container.viewContext, order: 1, viewName: "Standard", capacity: 5)
                let prefOne = self.createViewType(context: self.container.viewContext, order: 2, viewName: "Preferred", capacity: 5)
                let oneBed = self.createRoomType(context: self.container.viewContext, order: 3, roomName: "One-Bedroom Villa", viewTypes: [standardOne, prefOne], roomCategory: "One-Bedroom")
                
                let standardTwo = self.createViewType(context: self.container.viewContext, order: 1, viewName: "Standard", capacity: 9)
                let prefTwo = self.createViewType(context: self.container.viewContext, order: 2, viewName: "Preferred", capacity: 9)
                let twoBed = self.createRoomType(context: self.container.viewContext, order: 4, roomName: "Two-Bedroom Villa", viewTypes: [standardTwo, prefTwo], roomCategory: "Two-Bedroom")
                
                let standardThree = self.createViewType(context: self.container.viewContext, order: 1, viewName: "", capacity: 12)
                let threeBed = self.createRoomType(context: self.container.viewContext, order: 5, roomName: "Three-Bedroom Grand Villa", viewTypes: [standardThree], roomCategory: "Three-Bedroom")
                
                let rivieraRoomTypes = [towerStudio, deluxeStudio, oneBed, twoBed, threeBed]
                
                let pointBlocks = self.buildDisney2025PointBlocks()
                
                self.pointValues = self.createPointValueInputs(pointBlocks: pointBlocks, roomTypes: rivieraRoomTypes)
                
                self.resort = self.createResort(context: self.container.viewContext, resortName: "Disney's Riviera Resort", shortName: "Riviera", expireYear: 2070, roomTypes: NSSet(array: rivieraRoomTypes), pointBlocks: NSSet(array: pointBlocks))
            }
        }
        
        func createKidaniResort() {
            
            if let description = container.persistentStoreDescriptions.first {
                
                // Make Core Data write to our new store URL.
                description.url = storeURL
                
                // Force WAL mode off.
                description.setValue("DELETE" as NSObject, forPragmaNamed: "journal_mode")
            }
            
            container.loadPersistentStores { description, error in
                
                let valueStudio = self.createViewType(context: self.container.viewContext, order: 1, viewName: "Value", capacity: 4)
                let standardStudio = self.createViewType(context: self.container.viewContext, order: 2, viewName: "Standard", capacity: 4)
                let savannaStudio = self.createViewType(context: self.container.viewContext, order: 3, viewName: "Savanna", capacity: 4)
                let clubStudio = self.createViewType(context: self.container.viewContext, order: 4, viewName: "Kilimanjaro Club Concierge", capacity: 4)
                let deluxeStudio = self.createRoomType(context: self.container.viewContext, order: 1, roomName: "Deluxe Studio", viewTypes: [valueStudio, standardStudio, savannaStudio, clubStudio], roomCategory: "Studio")
                
                let valueOne = self.createViewType(context: self.container.viewContext, order: 1, viewName: "Value", capacity: 5)
                let standardOne = self.createViewType(context: self.container.viewContext, order: 2, viewName: "Standard", capacity: 5)
                let savannaOne = self.createViewType(context: self.container.viewContext, order: 3, viewName: "Savanna", capacity: 5)
                let clubOne = self.createViewType(context: self.container.viewContext, order: 4, viewName: "Kilimanjaro Club Concierge", capacity: 5)
                let oneBed = self.createRoomType(context: self.container.viewContext, order: 2, roomName: "One-Bedroom Villa", viewTypes: [valueOne, standardOne, savannaOne, clubOne], roomCategory: "One-Bedroom")
                
                let valueTwo = self.createViewType(context: self.container.viewContext, order: 1, viewName: "Value", capacity: 9)
                let standardTwo = self.createViewType(context: self.container.viewContext, order: 2, viewName: "Standard", capacity: 9)
                let savannaTwo = self.createViewType(context: self.container.viewContext, order: 3, viewName: "Savanna", capacity: 9)
                let clubTwo = self.createViewType(context: self.container.viewContext, order: 4, viewName: "Kilimanjaro Club Concierge", capacity: 9)
                let twoBed = self.createRoomType(context: self.container.viewContext, order: 4, roomName: "Two-Bedroom Villa", viewTypes: [valueTwo, standardTwo, savannaTwo, clubTwo], roomCategory: "Two-Bedroom")
                
                let standardThree = self.createViewType(context: self.container.viewContext, order: 1, viewName: "Standard", capacity: 12)
                let savannaThree = self.createViewType(context: self.container.viewContext, order: 2, viewName: "Savanna", capacity: 12)
                let threeBed = self.createRoomType(context: self.container.viewContext, order: 5, roomName: "Three-Bedroom Grand Villa", viewTypes: [standardThree, savannaThree], roomCategory: "Three-Bedroom")
                
                let kidaniRoomTypes = [deluxeStudio, oneBed, twoBed, threeBed]
                
                let pointBlocks = self.buildDisney2025PointBlocks()
                
                self.pointValues = self.createPointValueInputs(pointBlocks: pointBlocks, roomTypes: kidaniRoomTypes)
                
                self.resort = self.createResort(context: self.container.viewContext, resortName: "Disney's Animal Kingdome Villas - Kidani Village", shortName: "Kidani Village", expireYear: 2057, roomTypes: NSSet(array: kidaniRoomTypes), pointBlocks: NSSet(array: pointBlocks))
            }
        }
        
        func createJamboResort() {
            
            if let description = container.persistentStoreDescriptions.first {
                
                // Make Core Data write to our new store URL.
                description.url = storeURL
                
                // Force WAL mode off.
                description.setValue("DELETE" as NSObject, forPragmaNamed: "journal_mode")
            }
            
            container.loadPersistentStores { description, error in
                
                let valueStudio = self.createViewType(context: self.container.viewContext, order: 1, viewName: "Value", capacity: 4)
                let standardStudio = self.createViewType(context: self.container.viewContext, order: 2, viewName: "Standard", capacity: 4)
                let savannaStudio = self.createViewType(context: self.container.viewContext, order: 3, viewName: "Savanna", capacity: 4)
                let clubStudio = self.createViewType(context: self.container.viewContext, order: 4, viewName: "Kilimanjaro Club Concierge", capacity: 4)
                let deluxeStudio = self.createRoomType(context: self.container.viewContext, order: 1, roomName: "Deluxe Studio", viewTypes: [valueStudio, standardStudio, savannaStudio, clubStudio], roomCategory: "Studio")
                
                let valueOne = self.createViewType(context: self.container.viewContext, order: 1, viewName: "Value", capacity: 5)
                let standardOne = self.createViewType(context: self.container.viewContext, order: 2, viewName: "Standard", capacity: 5)
                let savannaOne = self.createViewType(context: self.container.viewContext, order: 3, viewName: "Savanna", capacity: 5)
                let clubOne = self.createViewType(context: self.container.viewContext, order: 4, viewName: "Kilimanjaro Club Concierge", capacity: 5)
                let oneBed = self.createRoomType(context: self.container.viewContext, order: 2, roomName: "One-Bedroom Villa", viewTypes: [valueOne, standardOne, savannaOne, clubOne], roomCategory: "One-Bedroom")
                
                let valueTwo = self.createViewType(context: self.container.viewContext, order: 1, viewName: "Value", capacity: 9)
                let standardTwo = self.createViewType(context: self.container.viewContext, order: 2, viewName: "Standard", capacity: 9)
                let savannaTwo = self.createViewType(context: self.container.viewContext, order: 3, viewName: "Savanna", capacity: 9)
                let clubTwo = self.createViewType(context: self.container.viewContext, order: 4, viewName: "Kilimanjaro Club Concierge", capacity: 9)
                let twoBed = self.createRoomType(context: self.container.viewContext, order: 4, roomName: "Two-Bedroom Villa", viewTypes: [valueTwo, standardTwo, savannaTwo, clubTwo], roomCategory: "Two-Bedroom")
                
                let standardThree = self.createViewType(context: self.container.viewContext, order: 1, viewName: "Standard", capacity: 12)
                let savannaThree = self.createViewType(context: self.container.viewContext, order: 2, viewName: "Savanna", capacity: 12)
                let threeBed = self.createRoomType(context: self.container.viewContext, order: 5, roomName: "Three-Bedroom Grand Villa", viewTypes: [standardThree, savannaThree], roomCategory: "Three-Bedroom")
                
                let jamboRoomTypes = [deluxeStudio, oneBed, twoBed, threeBed]
                
                let pointBlocks = self.buildDisney2025PointBlocks()
                
                self.pointValues = self.createPointValueInputs(pointBlocks: pointBlocks, roomTypes: jamboRoomTypes)
                
                self.resort = self.createResort(context: self.container.viewContext, resortName: "Disney's Animal Kingdome Villas - Jambo House", shortName: "Jambo House", expireYear: 2057, roomTypes: NSSet(array: jamboRoomTypes), pointBlocks: NSSet(array: pointBlocks))
            }
        }
        
        func createPolyResort() {
            
            if let description = container.persistentStoreDescriptions.first {
                
                // Make Core Data write to our new store URL.
                description.url = storeURL
                
                // Force WAL mode off.
                description.setValue("DELETE" as NSObject, forPragmaNamed: "journal_mode")
            }
            
            container.loadPersistentStores { description, error in
                
                let standardStudio = self.createViewType(context: self.container.viewContext, order: 1, viewName: "Standard", capacity: 5)
                let prefStudio = self.createViewType(context: self.container.viewContext, order: 2, viewName: "Lake", capacity: 5)
                let deluxeStudio = self.createRoomType(context: self.container.viewContext, order: 2, roomName: "Deluxe Studio", viewTypes: [standardStudio, prefStudio], roomCategory: "Studio")
                
                let LakeBungalow = self.createViewType(context: self.container.viewContext, order: 1, viewName: "Lake", capacity: 8)
                let bungalow = self.createRoomType(context: self.container.viewContext, order: 5, roomName: "Two-Bedroom Bungalow", viewTypes: [LakeBungalow], roomCategory: "Two-Bedroom")
                
                let polyRoomTypes = [deluxeStudio, bungalow]
                
                let pointBlocks = self.buildDisney2025PointBlocks()
                
                self.pointValues = self.createPointValueInputs(pointBlocks: pointBlocks, roomTypes: polyRoomTypes)
                
                self.resort = self.createResort(context: self.container.viewContext, resortName: "Disney's Polynesian Villas & Bungalows", shortName: "Polynesian", expireYear: 2066, roomTypes: NSSet(array: polyRoomTypes), pointBlocks: NSSet(array: pointBlocks))
            }
        }
        
        func calcNumberColumns() -> Int {
            guard self.resort != nil else { return 0 }
            
            var count = 0;
            for roomType in self.resort!.roomTypeArray {
                for _ in roomType.viewTypeArray {
                    count += 1
                }
            }
            return count
        }
    }
}
