//
//  LoadData.swift
//  dvc-calc-data-generator
//
//  Created by tucker bichsel on 03/12/2024.
//

import Foundation
import CoreData

func loadRivieraResortData(context: NSManagedObjectContext) {
    let standardTower = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "3DE13688-07E3-49F4-9170-0C0C38CB2640")!, order: 1, viewName: "Standard", capacity: 2)
    let towerStudio = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "4CD654BB-4D90-402D-9543-A60F6F198930")!, order: 1, roomName: "Tower Studio", viewTypes: [standardTower], roomCategory: "Studio")
    
    let standardStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "E9C8FBC5-D804-4FFF-9A99-DE0C8903DD05")!, order: 1, viewName: "Standard", capacity: 5)
    let prefStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "433D537A-3AD9-42E7-A13C-E8753CE93655")!, order: 2, viewName: "Preferred", capacity: 5)
    let deluxeStudio = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "57F2022F-0760-479B-BE56-DC5633A6B57F")!, order: 2, roomName: "Deluxe Studio", viewTypes: [standardStudio, prefStudio], roomCategory: "Studio")
    
    let standardOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "CE0C5C2F-8EFC-453C-A49B-223BF584289F")!, order: 1, viewName: "Standard", capacity: 5)
    let prefOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "C261961B-A926-484A-82F3-59542E18FEEA")!, order: 2, viewName: "Preferred", capacity: 5)
    let oneBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "D40B7A74-B7EA-472C-B324-2F320CD408F4")!, order: 3, roomName: "One-Bedroom Villa", viewTypes: [standardOne, prefOne], roomCategory: "One-Bedroom")
    
    let standardTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "11E9C1A1-9DB6-4D5F-8179-49BF002D817C")!, order: 1, viewName: "Standard", capacity: 9)
    let prefTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "CD6403EA-551C-4EAE-A7F4-C9942B800E1A")!, order: 2, viewName: "Preferred", capacity: 9)
    let twoBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "2B923BAB-3565-4C2A-B85A-6D007C9B10FC")!, order: 4, roomName: "Two-Bedroom Villa", viewTypes: [standardTwo, prefTwo], roomCategory: "Two-Bedroom")
    
    let standardThree = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "383911E7-4E09-4B24-8D4E-9704790C00AE")!, order: 1, viewName: "Standard", capacity: 12)
    let threeBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "27B94ED1-56AD-4D15-AFCF-23C04D3E27B9")!, order: 5, roomName: "Three-Bedroom Grand Villa", viewTypes: [standardThree], roomCategory: "Three-Bedroom")
    
    let rivieraRoomTypes = [towerStudio, deluxeStudio, oneBed, twoBed, threeBed]
    
    createResortWithId(context: context, resortId: UUID(uuidString: "E227F61E-33C9-49D0-8F1D-39388C891CF0")!, resortName: "Disney's Riviera Resort", shortName: "Riviera", expireYear: 2070, roomTypes: NSSet(array: rivieraRoomTypes), pointBlocks: NSSet(array: []))
}

func loadPolyResortData(context: NSManagedObjectContext) {
    let standardDuoStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "4DE0702F-3C5E-40C4-8FEE-BD9AE2C15C8D")!, order: 1, viewName: "Standard", capacity: 2)
    let prefDuoStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "BA980A90-4686-4570-B4F9-A9772AE36001")!, order: 2, viewName: "Preferred", capacity: 2)
    let premiumDuoStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "8CFB7066-C093-4EE3-8141-605AEB7543A8")!, order: 3, viewName: "Premium", capacity: 2)
    let towerDuoStudio = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "4DE0702F-3C5E-40C4-8FEE-BD9AE2C15C8D")!, order: 1, roomName: "Tower Duo Studio", viewTypes: [standardDuoStudio, prefDuoStudio, premiumDuoStudio], roomCategory: "Studio")
    
    let standardStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "0657CFCC-2712-4F5A-8E9C-5573F9A12DAC")!, order: 1, viewName: "Standard", capacity: 5)
    let prefStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "D56203D4-27A5-410D-BEA4-CB2A578E90E7")!, order: 2, viewName: "Lake", capacity: 5)
    let deluxeStudio = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "C830AA26-31CF-41CF-BBA8-BFD08192C73E")!, order: 2, roomName: "Deluxe Studio", viewTypes: [standardStudio, prefStudio], roomCategory: "Studio")
    
    let standardTowerDeluxeStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "5BEBE797-9F8F-474E-B482-9D93B8E3D9D1")!, order: 1, viewName: "Standard", capacity: 5)
    let prefTowerDeluxeStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "A5843F88-550B-47BA-9D2A-6F0F30CD9774")!, order: 2, viewName: "Preferred", capacity: 5)
    let premiumTowerDeluxeStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "B8B7E81C-2DC8-4B9B-BD07-C7A166690365")!, order: 3, viewName: "Premium", capacity: 5)
    let towerDeluxeStudio = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "C23B8E2B-27A7-45D9-B4C1-16D93ADE25B5")!, order: 3, roomName: "Tower Deluxe Studio", viewTypes: [standardTowerDeluxeStudio, prefTowerDeluxeStudio, premiumTowerDeluxeStudio], roomCategory: "Studio")
    
    let standardOneBed = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "323A26A9-8F5C-4DB9-A6A9-22FC48B3A313")!, order: 1, viewName: "Standard", capacity: 5)
    let prefOneBed = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "92693857-EAC1-4051-8678-B54A130F20D1")!, order: 2, viewName: "Preferred", capacity: 5)
    let themeParkOneBed = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "933B10ED-B99D-4D5E-BEAC-9314F694F15A")!, order: 3, viewName: "Theme Park", capacity: 5)
    let oneBedTower = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "ADC92943-0FDA-4B74-AA3E-2BF3A4B23A6F")!, order: 4, roomName: "One-Bedroom Villa", viewTypes: [standardOneBed, prefOneBed, themeParkOneBed], roomCategory: "One-Bedroom")
    
    let standardTwoBed = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "8761BC21-8F21-4F0B-933D-A4FD46781E67")!, order: 1, viewName: "Standard", capacity: 9)
    let prefTwoBed = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "D6BABE23-C89F-49BE-B222-CD552D00226F")!, order: 2, viewName: "Preferred", capacity: 9)
    let themeParkTwoBed = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "5CB5ABCE-B6EE-494D-9CF2-7DA7F27D1729")!, order: 3, viewName: "Theme Park", capacity: 9)
    let twoBedTower = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "F1D4351D-B762-4F42-986C-747F7D5C8071")!, order: 5, roomName: "Two-Bedroom Villa", viewTypes: [standardTwoBed, prefTwoBed, themeParkTwoBed], roomCategory: "Two-Bedroom")
    
    let prefPent = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "3B59C013-1EB4-4CD3-AC0E-18C592744C35")!, order: 1, viewName: "Preferred", capacity: 8)
    let themeParkPent = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "B63D3A44-B6CF-4CE9-AFD6-07EBBBE22B89")!, order: 2, viewName: "Theme Park", capacity: 8)
    let towerPenthouse = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "4ECE7406-C1CB-4086-AAF3-19BC2C9FF509")!, order: 6, roomName: "Two-Bedroom Penthouse Villa", viewTypes: [prefPent, themeParkPent], roomCategory: "Two-Bedroom")
    
    let lakeBungalow = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "8CE38B63-28F2-4E1F-9E99-A9F26E61F5D4")!, order: 1, viewName: "Lake", capacity: 8)
    let bungalow = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "87B2450D-D3F7-4CB9-AFDF-6FF5DA61FECD")!, order: 7, roomName: "Two-Bedroom Bungalow", viewTypes: [lakeBungalow], roomCategory: "Two-Bedroom")
    
    let polyRoomTypes = [towerDuoStudio, deluxeStudio, towerDeluxeStudio, oneBedTower, twoBedTower, towerPenthouse, bungalow]
    
    createResortWithId(context: context, resortId: UUID(uuidString: "DB4178AC-BD6C-4FB6-8EEC-80FE8BCB17BD")!, resortName: "Disney's Polynesian Villas & Bungalows", shortName: "Polynesian", expireYear: 2066, roomTypes: NSSet(array: polyRoomTypes), pointBlocks: NSSet(array: []))
}

func loadBoulderRidgeResortData(context: NSManagedObjectContext) {
    
    let standardStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "D8552E12-0C59-420B-BF90-974740A22727")!, order: 1, viewName: "Standard", capacity: 5)
    let deluxeStudio = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "B4B8B2F8-AEB4-4EEA-9468-A19B65F3EF2F")!, order: 1, roomName: "Deluxe Studio", viewTypes: [standardStudio], roomCategory: "Studio")
    
    let standardOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "71AC6D36-3D15-4CED-95DF-EBFF90A209CA")!, order: 1, viewName: "Standard", capacity: 4)
    let oneBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "20C1A84A-2E4E-4FE0-972D-1D0981ED675F")!, order: 2, roomName: "One-Bedroom Villa", viewTypes: [standardOne], roomCategory: "One-Bedroom")
    
    let standardTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "B8AC4BF4-B0E4-462C-96D0-D1D0AE7DBBB6")!, order: 1, viewName: "Standard", capacity: 8)
    let twoBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "E0FC58DA-F7B9-49FC-A588-1A81D137FABF")!, order: 3, roomName: "Two-Bedroom Villa", viewTypes: [standardTwo], roomCategory: "Two-Bedroom")
    
    let boulderRidgeRoomTypes = [deluxeStudio, oneBed, twoBed]
    
    createResortWithId(context: context, resortId: UUID(uuidString: "FD0D6BD4-E6A0-4AFE-90B9-C71AE983EBE9")!, resortName: "Boulder Ridge Villas at Disney's Wilderness Lodge", shortName: "Boulder Ridge", expireYear: 2042, roomTypes: NSSet(array: boulderRidgeRoomTypes), pointBlocks: NSSet(array: []))
}

func loadCabinResortData(context: NSManagedObjectContext) {
    
    let standardCabin = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "677FB061-AFE6-499B-B1FF-2EBD871EE9DA")!, order: 1, viewName: "Standard", capacity: 6)
    let cabin = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "38B55B93-2D37-4C29-A62B-957EDD3B371D")!, order: 1, roomName: "Cabin", viewTypes: [standardCabin], roomCategory: "One-Bedroom")
    
    let cabinsRoomTypes = [cabin]
    
    createResortWithId(context: context, resortId: UUID(uuidString: "61D59FBE-437B-4DC1-810B-35E54E89CBA1")!, resortName: "The Cabins at Disney's Fort Wilderness Resort", shortName: "The Cabins", expireYear: 2075, roomTypes: NSSet(array: cabinsRoomTypes), pointBlocks: NSSet(array: []))
}

func createViewTypeWithId(context: NSManagedObjectContext, viewTypeId: UUID, order: Int16, viewName: String, capacity: Int16) -> ViewType {
    let viewType = ViewType(context: context)
    viewType.id = viewTypeId
    viewType.order = order
    viewType.viewName = viewName
    viewType.roomCapacity = capacity
    
    return viewType
}

func createRoomTypeWithId(context: NSManagedObjectContext, roomTypeId: UUID, order: Int16, roomName: String, viewTypes: NSSet, roomCategory: String) -> RoomType {
    let roomType = RoomType(context: context)
    roomType.id = roomTypeId
    roomType.order = order
    roomType.roomName = roomName
    roomType.viewTypes = viewTypes
    roomType.roomCategory = roomCategory
    
    return roomType
}

func createResortWithId(context: NSManagedObjectContext, resortId: UUID, resortName: String, shortName: String, expireYear: Int16, roomTypes: NSSet, pointBlocks: NSSet) {
    let newResort = Resort(context: context)
    newResort.id = resortId
    newResort.resortName = resortName
    newResort.shortName = shortName
    newResort.roomTypes = roomTypes
    newResort.expireYear = expireYear
    newResort.pointBlocks = pointBlocks
}
