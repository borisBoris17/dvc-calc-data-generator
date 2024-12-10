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
    let standardDuoStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "F637570F-D5E9-4C55-AA10-9B573A28172A")!, order: 1, viewName: "Standard", capacity: 2)
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

func loadKidaniVillageResortData(context: NSManagedObjectContext) {
    
    let valueStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "A376F451-D450-4BDA-8FFC-365564981815")!, order: 1, viewName: "Value", capacity: 4)
    let standardStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "52200CDC-25EB-422A-83D3-92C3C9CB404D")!, order: 2, viewName: "Standard", capacity: 4)
    let savannaStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "56F0A687-125F-4BFD-826A-37AE046566A8")!, order: 3, viewName: "Savanna", capacity: 4)
    let clubStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "04AD1D8D-098E-4E6D-99F1-567BFA84115F")!, order: 4, viewName: "Kilimanjaro Club Concierge", capacity: 4)
    let deluxeStudio = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "CEAA8DA7-8AF0-4D30-8AED-F63D330C98AD")!, order: 1, roomName: "Deluxe Studio", viewTypes: [valueStudio, standardStudio, savannaStudio, clubStudio], roomCategory: "Studio")
    
    let valueOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "1C305440-B9C9-4FEF-82F9-01E0B8E534AB")!, order: 1, viewName: "Value", capacity: 5)
    let standardOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "F21B74FC-A0C0-4DF7-921C-9661C240681C")!, order: 2, viewName: "Standard", capacity: 5)
    let savannaOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "AD8417D5-ABB8-4923-BF06-972C2A20794A")!, order: 3, viewName: "Savanna", capacity: 5)
    let clubOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "2575D766-393D-41CA-BEF8-712D6899CB6D")!, order: 4, viewName: "Kilimanjaro Club Concierge", capacity: 5)
    let oneBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "0E2F58F3-7E8B-4308-9008-F19672A27541")!, order: 2, roomName: "One-Bedroom Villa", viewTypes: [valueOne, standardOne, savannaOne, clubOne], roomCategory: "One-Bedroom")
    
    let valueTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "DA7AF8C5-D887-4BC5-A520-2C44164D82A0")!, order: 1, viewName: "Value", capacity: 9)
    let standardTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "258DFB79-9EB3-497B-8730-BD1CFFC2E66E")!, order: 2, viewName: "Standard", capacity: 9)
    let savannaTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "3957636F-7BE6-453C-B970-CA88D6404AC7")!, order: 3, viewName: "Savanna", capacity: 9)
    let clubTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "330C246B-A8E5-4B56-9D2B-65565CDB861D")!, order: 4, viewName: "Kilimanjaro Club Concierge", capacity: 9)
    let twoBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "3E176860-A6C8-477C-838D-85DA5E60B357")!, order: 3, roomName: "Two-Bedroom Villa", viewTypes: [valueTwo, standardTwo, savannaTwo, clubTwo], roomCategory: "Two-Bedroom")
    
    let standardThree = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "F2A7B484-8159-402A-86BF-FB35052C81DF")!, order: 1, viewName: "Standard", capacity: 12)
    let savannaThree = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "7C9D871B-E8DA-49EC-9F2B-645594DE1835")!, order: 2, viewName: "Savanna", capacity: 12)
    let threeBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "3A1905AA-907B-4C4E-B4CF-DDA1BA4580BF")!, order: 4, roomName: "Three-Bedroom Grand Villa", viewTypes: [standardThree, savannaThree], roomCategory: "Three-Bedroom")
    
    let kidaniRoomTypes = [deluxeStudio, oneBed, twoBed, threeBed]
    
    createResortWithId(context: context, resortId: UUID(uuidString: "079A5480-7E5D-4219-896C-4BC1F1A62F8E")!, resortName: "Disney's Animal Kingdome Villas - Kidani Village", shortName: "Kidani Village", expireYear: 2057, roomTypes: NSSet(array: kidaniRoomTypes), pointBlocks: NSSet(array: []))
}

func loadJamboHouseResortData(context: NSManagedObjectContext) {
    
    let valueStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "E2DCE630-9E4C-434C-BD98-CF6F333C1965")!, order: 1, viewName: "Value", capacity: 4)
    let standardStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "B34C20EC-5148-4DD5-BABB-21E2FC1F07ED")!, order: 2, viewName: "Standard", capacity: 4)
    let savannaStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "77311A48-0798-4B6A-A469-0D5F8C338126")!, order: 3, viewName: "Savanna", capacity: 4)
    let clubStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "889201BF-B7A0-42A6-9A7C-29D9622F9893")!, order: 4, viewName: "Kilimanjaro Club Concierge", capacity: 4)
    let deluxeStudio = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "90763A37-CEF3-4554-8FBE-9D6F5623D418")!, order: 1, roomName: "Deluxe Studio", viewTypes: [valueStudio, standardStudio, savannaStudio, clubStudio], roomCategory: "Studio")
    
    let valueOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "F3EAAA18-C9A4-4908-999E-B668A617CA97")!, order: 1, viewName: "Value", capacity: 5)
    let standardOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "00FFE6AC-E975-44CC-AFD6-713C4E512764")!, order: 2, viewName: "Standard", capacity: 5)
    let savannaOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "A543BB63-EC8D-4F0C-9804-0E1DCF5C7CC9")!, order: 3, viewName: "Savanna", capacity: 5)
    let clubOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "FCE7A806-C805-4454-85F6-C465A8F589CC")!, order: 4, viewName: "Kilimanjaro Club Concierge", capacity: 5)
    let oneBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "3DBAE1AD-B91D-443B-B987-142DE61AC58C")!, order: 2, roomName: "One-Bedroom Villa", viewTypes: [valueOne, standardOne, savannaOne, clubOne], roomCategory: "One-Bedroom")
    
    let valueTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "2808C11C-3AB0-46C4-BB9C-9C4B15CBD16D")!, order: 1, viewName: "Value", capacity: 9)
    let standardTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "CC404B69-FAFD-4219-ACDA-4107E98B784B")!, order: 2, viewName: "Standard", capacity: 9)
    let savannaTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "F03A4C54-E3E8-4DB5-8743-9A915A033DA5")!, order: 3, viewName: "Savanna", capacity: 9)
    let clubTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "2A43FA83-259B-4068-869B-E86C0331FC02")!, order: 4, viewName: "Kilimanjaro Club Concierge", capacity: 9)
    let twoBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "0417D23F-2612-4D3F-A6FE-33CEE2CBE87E")!, order: 3, roomName: "Two-Bedroom Villa", viewTypes: [valueTwo, standardTwo, savannaTwo, clubTwo], roomCategory: "Two-Bedroom")
    
    let standardThree = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "22F404FA-95ED-43E0-BFD9-9EAB46C07C57")!, order: 1, viewName: "Standard", capacity: 12)
    let savannaThree = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "1788E610-22A7-4B95-A63C-E01195E7F67D")!, order: 2, viewName: "Savanna", capacity: 12)
    let threeBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "B1A76C5C-2760-460B-9596-A4892D60A2AE")!, order: 4, roomName: "Three-Bedroom Grand Villa", viewTypes: [standardThree, savannaThree], roomCategory: "Three-Bedroom")
    
    let jamboRoomTypes = [deluxeStudio, oneBed, twoBed, threeBed]
    
    createResortWithId(context: context, resortId: UUID(uuidString: "F0A10E95-5502-4C3A-AFE2-C7A0EF82D501")!, resortName: "Disney's Animal Kingdome Villas - Jambo House", shortName: "Jambo House", expireYear: 2057, roomTypes: NSSet(array: jamboRoomTypes), pointBlocks: NSSet(array: []))
}

func loadBayLakeResortData(context: NSManagedObjectContext) {
    
    let standardStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "12E28E53-9EB1-4A6A-A496-05E47559DCA6")!, order: 1, viewName: "Standard", capacity: 4)
    let lakeStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "D8D52922-D48E-4CD1-ABE4-E710B3A1A4FE")!, order: 2, viewName: "Lake", capacity: 4)
    let themeParkStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "4B0686B5-5C17-4A2A-A688-CC86C3A1AD16")!, order: 3, viewName: "Theme Park", capacity: 4)
    let deluxeStudio = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "7DEC41ED-163D-42EA-8ED8-C21980351512")!, order: 1, roomName: "Deluxe Studio", viewTypes: [standardStudio, lakeStudio, themeParkStudio], roomCategory: "Studio")
    
    let standardOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "4A85ABFE-80A1-483F-ACFE-B57B6B7A9126")!, order: 1, viewName: "Standard", capacity: 5)
    let lakeOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "4731F280-F28A-4DB8-BDA6-6B9C993BC1F2")!, order: 2, viewName: "Lake", capacity: 5)
    let themeParkOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "0E0E8684-6249-4ECE-917F-E4AC81AD3728")!, order: 3, viewName: "Theme Park", capacity: 5)
    let oneBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "711EAC8F-7012-4D00-8DAC-0A18540C2319")!, order: 2, roomName: "One-Bedroom Villa", viewTypes: [standardOne, lakeOne, themeParkOne], roomCategory: "One-Bedroom")
    
    let standardTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "CE9A895F-9C7F-4AF8-916C-CD799CAFDE67")!, order: 1, viewName: "Standard", capacity: 9)
    let lakeTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "FEE936D6-AA44-456B-AC0E-F6CFE67D4B66")!, order: 2, viewName: "Lake", capacity: 9)
    let themeParkTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "BCB62E41-8A38-4EE9-994B-D94C612E4D73")!, order: 3, viewName: "Theme Park", capacity: 9)
    let twoBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "C3EFBEF5-5D86-420F-93B8-8AD2994DA711")!, order: 3, roomName: "Two-Bedroom Villa", viewTypes: [standardTwo, lakeTwo, themeParkTwo], roomCategory: "Two-Bedroom")
    
    let lakeThree = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "F2A25BC5-AE2C-4110-B7A3-35DF2BD3EA60")!, order: 1, viewName: "Lake", capacity: 12)
    let themeParkThree = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "81351E80-68CB-44C5-A3A3-B5A18459A49F")!, order: 2, viewName: "Theme Park", capacity: 12)
    let threeBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "F543C7E9-A5CD-48CB-92B4-25A62CC3CD92")!, order: 4, roomName: "Three-Bedroom Grand Villa", viewTypes: [lakeThree, themeParkThree], roomCategory: "Three-Bedroom")
    
    let bayLakeRoomTypes = [deluxeStudio, oneBed, twoBed, threeBed]
    
    createResortWithId(context: context, resortId: UUID(uuidString: "BB287C7D-CE7A-4B89-9B57-828E0D4E2ED4")!, resortName: "Bay Lake Tower at Disney's Contemporary Resort", shortName: "Bay Lake Tower", expireYear: 2060, roomTypes: NSSet(array: bayLakeRoomTypes), pointBlocks: NSSet(array: []))
}

func loadBeachClubResortData(context: NSManagedObjectContext) {
    
    let standardStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "A82978AC-0B54-4B69-B8D9-499E379EE8DD")!, order: 1, viewName: "Standard", capacity: 5)
    let deluxeStudio = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "09601C79-CE7B-477B-901F-05DB5607D5A0")!, order: 1, roomName: "Deluxe Studio", viewTypes: [standardStudio], roomCategory: "Studio")
    
    let standardOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "B60CB949-C118-4B8E-9B71-F5A50F5D8492")!, order: 1, viewName: "Standard", capacity: 4)
    let oneBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "8DABA97A-8BB2-4971-BB15-CFC461C64DDF")!, order: 2, roomName: "One-Bedroom Villa", viewTypes: [standardOne], roomCategory: "One-Bedroom")
    
    let standardTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "F87EE8BE-09D0-45AC-A5E8-16521A9EFEF7")!, order: 1, viewName: "Standard", capacity: 8)
    let twoBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "E3575115-503F-48DD-97A6-07655776829B")!, order: 2, roomName: "One-Bedroom Villa", viewTypes: [standardTwo], roomCategory: "One-Bedroom")
    
    let beachClubRoomTypes = [deluxeStudio, oneBed, twoBed]
    
    createResortWithId(context: context, resortId: UUID(uuidString: "89456459-5084-49E1-B745-44766DF3F271")!, resortName: "Disney's Beach Club Villas", shortName: "Beach Club", expireYear: 2042, roomTypes: NSSet(array: beachClubRoomTypes), pointBlocks: NSSet(array: []))
}

func loadOldKeyWestResortData(context: NSManagedObjectContext) {
    
    let standardStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "47920030-8A5E-4F82-A331-64F170E02C7E")!, order: 1, viewName: "Standard", capacity: 4)
    let deluxeStudio = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "A856F5AA-EAE2-46DE-9BB0-237126C9B554")!, order: 1, roomName: "Deluxe Studio", viewTypes: [standardStudio], roomCategory: "Studio")
    
    let standardOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "8229F74F-7766-47DD-954A-033FB5D0BE4F")!, order: 1, viewName: "Standard", capacity: 5)
    let oneBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "E2C09727-B77A-42C1-B192-6C22E18837D8")!, order: 2, roomName: "One-Bedroom Villa", viewTypes: [standardOne], roomCategory: "One-Bedroom")
    
    let standardTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "18252344-5D1C-46A9-BFA1-BC77A78BA328")!, order: 1, viewName: "Standard", capacity: 9)
    let twoBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "FFD2893E-D968-4429-906F-E009E46502A6")!, order: 3, roomName: "Two-Bedroom Villa", viewTypes: [standardTwo], roomCategory: "Two-Bedroom")
    
    let standardThree = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "8E2FFBB4-D95C-419D-888D-E4F4BCBECFAA")!, order: 1, viewName: "Standard", capacity: 12)
    let threeBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "D1B5116D-D38F-45FC-80E9-1A3912E05F76")!, order: 4, roomName: "Three-Bedroom Grand Villa", viewTypes: [standardThree], roomCategory: "Three-Bedroom")
    
    let oldKeyWestRoomTypes = [deluxeStudio, oneBed, twoBed, threeBed]
    
    createResortWithId(context: context, resortId: UUID(uuidString: "43DCB453-CB5B-4706-9165-7224079640AC")!, resortName: "Disney's Old Key West Resort", shortName: "Old Key West", expireYear: 2057, roomTypes: NSSet(array: oldKeyWestRoomTypes), pointBlocks: NSSet(array: []))
}

func loadCopperCreekResortData(context: NSManagedObjectContext) {
    
    let standardStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "11577CA9-EACB-4A5E-8433-738147E9E401")!, order: 1, viewName: "Standard", capacity: 4)
    let deluxeStudio = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "9153D7E6-7D44-491B-B618-22BED6EDBBEC")!, order: 1, roomName: "Deluxe Studio", viewTypes: [standardStudio], roomCategory: "Studio")
    
    let standardOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "869D9AA7-36E4-4571-B18A-077DAC447449")!, order: 1, viewName: "Standard", capacity: 4)
    let oneBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "66C27A57-6673-4A07-8E96-42B41A2DF921")!, order: 2, roomName: "One-Bedroom Villa", viewTypes: [standardOne], roomCategory: "One-Bedroom")
    
    let standardTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "A4FD5554-CDBE-41E3-A183-6B0A8D9ADDD5")!, order: 1, viewName: "Standard", capacity: 8)
    let twoBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "127CAF36-2070-4652-A742-744E10F8758C")!, order: 3, roomName: "Two-Bedroom Villa", viewTypes: [standardTwo], roomCategory: "Two-Bedroom")
    
    let standardThree = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "329A0E56-1C5A-4B23-9B4B-588E4F72A80D")!, order: 1, viewName: "Standard", capacity: 12)
    let threeBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "517CAFBF-93F0-43FA-9989-12EC5E421D5A")!, order: 4, roomName: "Three-Bedroom Villa", viewTypes: [standardThree], roomCategory: "Three-Bedroom")
    
    let standardCabin = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "8331F653-8357-4B90-9557-CFFA600A03CE")!, order: 1, viewName: "Standard", capacity: 8)
    let cabin = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "A6D9D88F-A0A5-4ADC-9606-82CE842DC7DD")!, order: 5, roomName: "Two-Bedroom Cabin", viewTypes: [standardCabin], roomCategory: "Two-Bedroom")
    
    let copperCreekRoomTypes = [deluxeStudio, oneBed, twoBed, threeBed, cabin]
    
    createResortWithId(context: context, resortId: UUID(uuidString: "27C98504-4316-4413-A59A-0C6E6486DD5F")!, resortName: "Copper Creek Villas & Cabins at Disney's Wilderness Lodge", shortName: "Copper Creek", expireYear: 2068, roomTypes: NSSet(array: copperCreekRoomTypes), pointBlocks: NSSet(array: []))
}

func loadBoardwalkResortData(context: NSManagedObjectContext) {
    
    let standardStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "B7537A1E-A09F-47C1-9C5C-1E564C98CF04")!, order: 1, viewName: "Standard", capacity: 5)
    let boardwalkStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "571A3889-27AA-4A80-9F98-387C2932F9FE")!, order: 2, viewName: "Boardwalk/Preferred", capacity: 5)
    let deluxeStudio = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "E44F76B9-7AFB-493C-B3FD-8E4BB47367A0")!, order: 1, roomName: "Deluxe Studio", viewTypes: [standardStudio, boardwalkStudio], roomCategory: "Studio")
    
    let standardOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "006F08CF-23E1-432B-9AF8-CA42614700B2")!, order: 1, viewName: "Standard", capacity: 4)
    let boardwalkOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "87FF2F9F-182E-4ABD-BCCD-F6CD1BA251A1")!, order: 2, viewName: "Boardwalk/Preferred", capacity: 4)
    let oneBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "D3E1CF3B-62D1-42B5-A623-FACEA591F75F")!, order: 2, roomName: "One-Bedroom Villa", viewTypes: [standardOne, boardwalkOne], roomCategory: "One-Bedroom")
    
    let standardTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "6C220553-FB54-481D-843B-8B5A9249AC1A")!, order: 1, viewName: "Standard", capacity: 9)
    let boardwalkTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "02C3C086-9124-49F5-8D0E-CFD050E3974A")!, order: 2, viewName: "Boardwalk/Preferred", capacity: 9)
    let twoBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "605B5781-F3FA-46A8-BC52-470C12B8A649")!, order: 3, roomName: "Two-Bedroom Villa", viewTypes: [standardTwo, boardwalkTwo], roomCategory: "Two-Bedroom")
    
    let boardwalkThree = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "B75E7B98-B567-4E4D-B650-4E738A745DF7")!, order: 1, viewName: "Boardwalk/Preferred", capacity: 12)
    let threeBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "D022B291-9072-4E16-823F-8407F1AA965E")!, order: 4, roomName: "Three-Bedroom Grand Villa", viewTypes: [boardwalkThree], roomCategory: "Three-Bedroom")
    
    let boardwalkRoomTypes = [deluxeStudio, oneBed, twoBed, threeBed]
    
    createResortWithId(context: context, resortId: UUID(uuidString: "56730537-5480-4089-B03A-FF7983D8E469")!, resortName: "Disney's BoardWalk Villas", shortName: "BoardWalk", expireYear: 2042, roomTypes: NSSet(array: boardwalkRoomTypes), pointBlocks: NSSet(array: []))
}

func loadSaratogaSpringsResortData(context: NSManagedObjectContext) {
    
    let standardStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "5B587211-7A52-45DF-873B-AAF88FC5F16C")!, order: 1, viewName: "Standard", capacity: 4)
    let preferredStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "A3C0A496-67FA-401D-BF60-4CCB53BAD030")!, order: 2, viewName: "Preferred", capacity: 4)
    let deluxeStudio = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "266A4A76-B36C-4E63-814E-4058A9B5DFF7")!, order: 1, roomName: "Deluxe Studio", viewTypes: [standardStudio, preferredStudio], roomCategory: "Studio")
    
    let standardOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "44C64F3E-6E16-439A-9888-8F803A990567")!, order: 1, viewName: "Standard", capacity: 5)
    let preferredOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "E6DB9729-2E90-4512-BBED-15B493E132D6")!, order: 2, viewName: "Preferred", capacity: 5)
    let oneBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "C0D1797C-8FB0-44A7-A575-1349FFDEEAD0")!, order: 2, roomName: "One-Bedroom Villa", viewTypes: [standardOne, preferredOne], roomCategory: "One-Bedroom")
    
    let standardTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "28D8A157-2912-4D7E-9DD0-A18AE6FABCCE")!, order: 1, viewName: "Standard", capacity: 9)
    let preferredTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "07924950-9848-44F6-AF6C-A594A077CAF1")!, order: 2, viewName: "Preferred", capacity: 9)
    let twoBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "04C38467-C0CD-46A4-BAA9-89F77BF6AF1C")!, order: 3, roomName: "Two-Bedroom Villa", viewTypes: [standardTwo, preferredTwo], roomCategory: "Two-Bedroom")
    
    let standardThree = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "A7AFF982-543F-4340-A0AB-6D7D29A84EF4")!, order: 1, viewName: "Standard", capacity: 12)
    let preferredThree = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "BC9B9743-A32B-429E-8FFC-38CD87B251BB")!, order: 2, viewName: "Preferred", capacity: 12)
    let threeBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "E31221D7-F28D-474D-878B-474D5B5790E4")!, order: 4, roomName: "Three-Bedroom Grand Villa", viewTypes: [standardThree, preferredThree], roomCategory: "Three-Bedroom")
    
    let standardTreehouse = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "3859040A-7881-48B9-B9BC-6529DFCF6407")!, order: 1, viewName: "Standard", capacity: 9)
    let treehouse = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "5C8E403D-D7BE-4CE2-85DD-AE1B98806499")!, order: 5, roomName: "Three-Bedroom Treehouse Villa", viewTypes: [standardTreehouse], roomCategory: "Three-Bedroom")
    
    let saratogaRoomTypes = [deluxeStudio, oneBed, twoBed, threeBed, treehouse]
    
    createResortWithId(context: context, resortId: UUID(uuidString: "1209A651-F0B7-44CE-8CC9-4E47BDC6F118")!, resortName: "Disney's Saratoga Springs Resort & Spa", shortName: "Saratoga Springs", expireYear: 2054, roomTypes: NSSet(array: saratogaRoomTypes), pointBlocks: NSSet(array: []))
}

func loadGrandFloridianResortData(context: NSManagedObjectContext) {
    
    let standardResortStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "C254F168-20A1-40BE-994E-831805A47250")!, order: 1, viewName: "Standard", capacity: 5)
    let lakeResortStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "5513B410-15C6-4F6A-92BB-625D711D33D5")!, order: 2, viewName: "Lake", capacity: 5)
    let themeParkResortStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "40A16DAA-7A58-43ED-AA60-98623DC04375")!, order: 3, viewName: "Theme Park", capacity: 5)
    let resortStudio = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "68166D30-7CC0-45B4-9B9B-9657C63D52D5")!, order: 1, roomName: "Resort Studio", viewTypes: [standardResortStudio, lakeResortStudio, themeParkResortStudio], roomCategory: "Studio")
    
    let standardStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "A6D6A6D8-02B3-47B0-B569-CC2CCBAA5CDD")!, order: 1, viewName: "Standard", capacity: 5)
    let lakeStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "07F83C85-4528-4EEB-BEE3-03F9577535A7")!, order: 2, viewName: "Lake", capacity: 5)
    let deluxeStudio = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "66BA1911-3430-4FF6-9161-1CC18EDECCA2")!, order: 2, roomName: "Deluxe Studio", viewTypes: [standardStudio, lakeStudio], roomCategory: "Studio")
    
    let standardOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "729685F1-41F2-4EB4-B4F5-0ECD7FC1184F")!, order: 1, viewName: "Standard", capacity: 5)
    let lakeOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "97606F05-8D8C-4BDA-8602-BD99A2402060")!, order: 2, viewName: "Lake", capacity: 5)
    let oneBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "A2655BC3-E69B-4C6A-941D-03FCCBCFE9A2")!, order: 3, roomName: "One-Bedroom Villa", viewTypes: [standardOne, lakeOne], roomCategory: "One-Bedroom")
    
    let standardTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "9F508EE6-D295-4697-87A8-40272EC830B2")!, order: 1, viewName: "Standard", capacity: 9)
    let lakeTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "8B74CEC4-2F9E-4191-BDEA-E025C30A58D7")!, order: 2, viewName: "Lake", capacity: 9)
    let twoBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "88454754-1327-48DF-8F6B-C240F9F7AF2A")!, order: 4, roomName: "Two-Bedroom Villa", viewTypes: [standardTwo, lakeTwo], roomCategory: "Two-Bedroom")
    
    let lakeThree = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "660AE6C5-5216-41C5-9DD7-B2164AD7F828")!, order: 1, viewName: "Lake", capacity: 12)
    let threeBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "DAFD7B7B-F8E5-4ADC-9767-C5A40C6E36D5")!, order: 5, roomName: "Three-Bedroom Grand Villa", viewTypes: [lakeThree], roomCategory: "Three-Bedroom")
    
    let grandFloridianRoomTypes = [resortStudio, deluxeStudio, oneBed, twoBed, threeBed]
    
    createResortWithId(context: context, resortId: UUID(uuidString: "55C707E1-A5CE-44A9-9341-AA0FB8F14F60")!, resortName: "The Villas at Disney's Grand Floridian Resort & Spa", shortName: "Grand Floridian", expireYear: 2064, roomTypes: NSSet(array: grandFloridianRoomTypes), pointBlocks: NSSet(array: []))
}

func loadGrandCalifornianResortData(context: NSManagedObjectContext) {
    
    let standardStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "ACDC939D-8A4C-4FFB-A0CD-2309F724F320")!, order: 1, viewName: "Standard", capacity: 4)
    let deluxeStudio = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "40A12C67-EB49-440A-90B9-41ABE9D9E047")!, order: 1, roomName: "Deluxe Studio", viewTypes: [standardStudio], roomCategory: "Studio")
    
    let standardOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "781862A5-35C8-4D41-B48F-7E533F7AA667")!, order: 1, viewName: "Standard", capacity: 5)
    let oneBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "0CBF1937-1EFD-4D44-8B53-F282218D1612")!, order: 2, roomName: "One-Bedroom Villa", viewTypes: [standardOne], roomCategory: "One-Bedroom")
    
    let standardTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "00001EC3-EE5A-4615-9E84-365A1267DD63")!, order: 1, viewName: "Standard", capacity: 9)
    let twoBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "5CD9398D-67E4-4DDE-A430-2815FA7EDA6A")!, order: 3, roomName: "Two-Bedroom Villa", viewTypes: [standardTwo], roomCategory: "Two-Bedroom")
    
    let standardThree = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "554DFC69-0C18-452F-A92D-204036F44641")!, order: 1, viewName: "Standard", capacity: 12)
    let threeBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "F7D1ABF2-21AB-49DB-B7A8-83ED64F90D59")!, order: 4, roomName: "Three-Bedroom Grand Villa", viewTypes: [standardThree], roomCategory: "Three-Bedroom")
    
    let grandCalRoomTypes = [deluxeStudio, oneBed, twoBed, threeBed]
    
    createResortWithId(context: context, resortId: UUID(uuidString: "656BA1E0-EB76-46D7-AEC4-EE6C3C41C64E")!, resortName: "The Villas at Disney's Grand Californian Hotel & Spa", shortName: "Grand Californian", expireYear: 2060, roomTypes: NSSet(array: grandCalRoomTypes), pointBlocks: NSSet(array: []))
}

func loadDisneyLandHotelResortData(context: NSManagedObjectContext) {
    
    let standardDuo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "26CC8F52-8EE4-41AA-9409-5D31D0A8E292")!, order: 1, viewName: "Standard", capacity: 2)
    let preferredDuo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "04DB3342-683A-47E7-99EE-74D5DC98BB94")!, order: 2, viewName: "Preferred", capacity: 2)
    let duoStudio = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "D380E132-8BC3-4027-9CAB-6E40F4928A21")!, order: 1, roomName: "Duo Studio", viewTypes: [standardDuo, preferredDuo], roomCategory: "Studio")
    
    let standardStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "6304F012-226B-421A-82CF-78D2D5B778B5")!, order: 1, viewName: "Standard", capacity: 4)
    let preferredStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "5DD23185-0841-400A-97F4-B00698E17121")!, order: 2, viewName: "Preferred", capacity: 4)
    let deluxeStudio = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "E20BE629-8FFC-4DBB-A7F1-8E0CB34935C0")!, order: 1, roomName: "Deluxe Studio", viewTypes: [standardStudio, preferredStudio], roomCategory: "Studio")
    
    let preferredOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "DC2BE9E5-EF72-447B-80E9-52104F5BBB60")!, order: 1, viewName: "Preferred", capacity: 5)
    let oneBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "9E310FEB-25B0-40DA-95C7-31A42F409231")!, order: 2, roomName: "One-Bedroom Villa", viewTypes: [preferredOne], roomCategory: "One-Bedroom")
    
    let preferredTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "678AFE87-3B4C-478E-A6DE-7C667F1B0CB7")!, order: 1, viewName: "Preferred", capacity: 9)
    let twoBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "9B2BE8AA-FCBD-473A-87D5-47C1F548AB14")!, order: 3, roomName: "Two-Bedroom Villa", viewTypes: [preferredTwo], roomCategory: "Two-Bedroom")
    
    let preferredThree = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "8CF19385-B63A-4B98-A785-5BBEB6CCB0F9")!, order: 1, viewName: "Preferred", capacity: 12)
    let threeBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "C9CACC5B-FA89-4F9B-87F7-A41683B6C43D")!, order: 4, roomName: "Three-Bedroom Grand Villa", viewTypes: [preferredThree], roomCategory: "Three-Bedroom")
    
    let standardGardenDuo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "6C9F812A-7FF8-49CA-89DC-98A0343E3613")!, order: 1, viewName: "Standard", capacity: 2)
    let gardenDuo = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "BB0A16B3-667C-4401-85AB-B28C73AB7114")!, order: 5, roomName: "Garden Room Duo Studio", viewTypes: [standardGardenDuo], roomCategory: "Studio")
    
    let standardGardenDeluxeStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "AF6B8AF7-3838-434A-895B-159217A1EA4D")!, order: 1, viewName: "Standard", capacity: 4)
    let gardenDeluxe = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "C9CE3EFF-7253-48B4-A23E-71EE887872B2")!, order: 5, roomName: "Garden Room Deluxe Studio", viewTypes: [standardGardenDeluxeStudio], roomCategory: "Studio")
    
    let disneylandVillaRoomTypes = [duoStudio, deluxeStudio, oneBed, twoBed, threeBed, gardenDuo, gardenDeluxe]
    
    createResortWithId(context: context, resortId: UUID(uuidString: "901A7332-3E7C-46DE-9093-297AAB74FE24")!, resortName: "The Villas at Disneyland Hotel", shortName: "Disneyland Hotel", expireYear: 2074, roomTypes: NSSet(array: disneylandVillaRoomTypes), pointBlocks: NSSet(array: []))
}

func loadVeroBeachResortData(context: NSManagedObjectContext) {
    
    let standardInnStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "68FBD397-8831-47F6-AB42-D29E50748EAD")!, order: 1, viewName: "Standard", capacity: 4)
    let oceanInnStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "394EA17F-0C3E-4F75-8E2C-0970F8E15D27")!, order: 2, viewName: "Ocean", capacity: 4)
    let deluxeInnStudio = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "1926E32A-41EB-4C40-A012-64F8DA32F138")!, order: 1, roomName: "Deluxe Inn Room", viewTypes: [standardInnStudio, oceanInnStudio], roomCategory: "Studio")
    
    let standardStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "3F163D6C-EB38-411A-8D0F-3B0E2D614DD6")!, order: 1, viewName: "Standard", capacity: 4)
    let deluxeStudio = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "BDC41B22-5BF7-4C99-940B-349C8F90521D")!, order: 2, roomName: "Deluxe Studio", viewTypes: [standardStudio], roomCategory: "Studio")
    
    let standardOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "C970BD89-164E-4C87-BB18-0CAA2BC41AB9")!, order: 1, viewName: "Standard", capacity: 5)
    let oneBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "D2E1AD60-E218-44B4-AE7B-7D41982AD430")!, order: 2, roomName: "One-Bedroom Villa", viewTypes: [standardOne], roomCategory: "One-Bedroom")
    
    let standardTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "73AC8E79-A3D9-445F-96D5-3F06BA94FDA0")!, order: 1, viewName: "Standard", capacity: 9)
    let twoBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "5088FA54-7BC5-4F41-B903-D56A3CC0A56C")!, order: 3, roomName: "Two-Bedroom Villa", viewTypes: [standardTwo], roomCategory: "Two-Bedroom")
    
    let standardThree = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "E3FE4DB5-4A01-4A3F-BDE1-D5542201496A")!, order: 1, viewName: "Standard", capacity: 12)
    let threeBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "7AB52339-37DB-4E66-9778-BA92C752DF4C")!, order: 4, roomName: "Three-Bedroom Beach Cottage", viewTypes: [standardThree], roomCategory: "Three-Bedroom")
    
    let veroBeachRoomTypes = [deluxeInnStudio, deluxeStudio, oneBed, twoBed, threeBed]
    
    createResortWithId(context: context, resortId: UUID(uuidString: "47AA59B8-2B89-45EE-A526-37040E556884")!, resortName: "Disney's Vero Beach Resort", shortName: "Vero Beach", expireYear: 2042, roomTypes: NSSet(array: veroBeachRoomTypes), pointBlocks: NSSet(array: []))
}

func loadHiltonHeadResortData(context: NSManagedObjectContext) {
    
    let standardStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "67BBAECC-5A36-43C7-9BFB-DE3A4DC06FCC")!, order: 1, viewName: "Standard", capacity: 4)
    let deluxeStudio = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "4138BF95-D728-43FD-BDBD-969EAED0FAF5")!, order: 1, roomName: "Deluxe Studio", viewTypes: [standardStudio], roomCategory: "Studio")
    
    let standardOne = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "22C20DB8-7449-4F3C-B60F-9FEAE2F6756B")!, order: 1, viewName: "Standard", capacity: 5)
    let oneBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "A25413FD-1BDD-48D3-BC68-51F55A88900E")!, order: 2, roomName: "One-Bedroom Villa", viewTypes: [standardOne], roomCategory: "One-Bedroom")
    
    let standardTwo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "72E7CE96-0E3D-4AD5-9DAD-76C39607A9D9")!, order: 1, viewName: "Standard", capacity: 9)
    let twoBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "C19B52A9-EF35-4859-B0CC-1FF2F96DB2DF")!, order: 3, roomName: "Two-Bedroom Villa", viewTypes: [standardTwo], roomCategory: "Two-Bedroom")
    
    let standardThree = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "EEE9F869-F255-4964-B4BB-64448A45502C")!, order: 1, viewName: "Standard", capacity: 12)
    let threeBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "70A7A0C4-7775-4C28-BC2E-6D279DDB1E69")!, order: 4, roomName: "Three-Bedroom Grand Villa", viewTypes: [standardThree], roomCategory: "Three-Bedroom")
    
    let hiltonHeadRoomTypes = [deluxeStudio, oneBed, twoBed, threeBed]
    
    createResortWithId(context: context, resortId: UUID(uuidString: "B4DC4133-7261-4C71-AB1F-FC2DB9465922")!, resortName: "Disney's Hilton Head Island Resort", shortName: "Hilton Head Island", expireYear: 2042, roomTypes: NSSet(array: hiltonHeadRoomTypes), pointBlocks: NSSet(array: []))
}

func loadAulaniResortData(context: NSManagedObjectContext) {
    
    let standardDuo = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "9D20AC08-14E0-4AB0-B562-7C956F3021D3")!, order: 1, viewName: "Standard", capacity: 2)
    let hotelStudio = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "4D6164C2-CF87-46B3-AC39-6AA726B0D45B")!, order: 1, roomName: "Hotel Room", viewTypes: [standardDuo], roomCategory: "Studio")
    
    let standardStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "D463E829-3F48-4B2E-8B7E-72DD41AAEE04")!, order: 1, viewName: "Standard", capacity: 4)
    let islandGardensStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "CF24E3E9-7BC0-419E-AECE-2373EC991231")!, order: 2, viewName: "Island Gardens", capacity: 4)
    let poolGardensStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "EA2621E6-D9F2-49CC-9169-E832BE9585A7")!, order: 3, viewName: "Poolside Gardens", capacity: 4)
    let oceanStudio = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "DAEBEB2D-0D71-4BDC-85CC-88816CC30C41")!, order: 4, viewName: "Ocean", capacity: 4)
    let deluxeStudio = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "E6371FD7-57B3-4621-BCB5-25FE22FB9764")!, order: 2, roomName: "Deluxe Studio", viewTypes: [standardStudio, islandGardensStudio, poolGardensStudio, oceanStudio], roomCategory: "Studio")
    
    let standardOneBed = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "86F95045-6491-4A74-9C9F-05FE99E30B4E")!, order: 1, viewName: "Standard", capacity: 5)
    let islandGardensOneBed = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "72251CD3-6F43-4573-8FE5-432A88A6A545")!, order: 2, viewName: "Island Gardens", capacity: 5)
    let poolGardensOneBed = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "82EC62BC-CC09-4FFA-903B-88FB8D7D2FAE")!, order: 3, viewName: "Poolside Gardens", capacity: 5)
    let oceanOneBed = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "E310E879-EE58-4CF0-84AF-D8231CA8DC08")!, order: 4, viewName: "Ocean", capacity: 5)
    let oneBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "7EC3B35A-0506-4A0C-B787-B4AB88391F2E")!, order: 3, roomName: "One-Bedroom Villa", viewTypes: [standardOneBed, islandGardensOneBed, poolGardensOneBed, oceanOneBed], roomCategory: "One-Bedroom")
    
    let standardTwoBed = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "066E4E65-8664-4E7E-86A3-BAD183807E6D")!, order: 1, viewName: "Standard", capacity: 9)
    let islandGardensTwoBed = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "7AE571B7-791F-44BE-BC1F-A9FFF8CBE0C0")!, order: 2, viewName: "Island Gardens", capacity: 9)
    let poolGardensTwoBed = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "2BF7CF73-421C-4F72-B84E-8B0867D2DB27")!, order: 3, viewName: "Poolside Gardens", capacity: 9)
    let oceanTwoBed = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "34D23BD5-8096-49AA-9E14-3218E64BE279")!, order: 4, viewName: "Ocean", capacity: 9)
    let twoBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "12447A8F-35BE-4BF3-8069-5383F934E893")!, order: 4, roomName: "Two-Bedroom Villa", viewTypes: [standardTwoBed, islandGardensTwoBed, poolGardensTwoBed, oceanTwoBed], roomCategory: "Two-Bedroom")
    
    let standardThree = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "9A96D585-01F9-4236-8246-81DB96622F20")!, order: 1, viewName: "Standard", capacity: 12)
    let oceanThree = createViewTypeWithId(context: context, viewTypeId: UUID(uuidString: "C14B6CD9-5768-4255-A03F-33726C68A979")!, order: 2, viewName: "Ocean", capacity: 12)
    let threeBed = createRoomTypeWithId(context: context, roomTypeId: UUID(uuidString: "4A3B9686-FD11-4027-AB04-51E7F66C8374")!, order: 5, roomName: "Three-Bedroom Grand Villa", viewTypes: [standardThree, oceanThree], roomCategory: "Three-Bedroom")
    
    let aulaniRoomTypes = [hotelStudio, deluxeStudio, oneBed, twoBed, threeBed]
    
    createResortWithId(context: context, resortId: UUID(uuidString: "CDCB61BF-4355-4BF4-AE47-A9F4D7B8AB1F")!, resortName: "Aulani Disney Vacation Club Villas", shortName: "Aulani", expireYear: 2062, roomTypes: NSSet(array: aulaniRoomTypes), pointBlocks: NSSet(array: []))
}

func createGrandFloridianResortData(context: NSManagedObjectContext) {
    
    let standardResortStudio = createViewType(context: context, order: 1, viewName: "Standard", capacity: 5)
    let lakeResortStudio = createViewType(context: context, order: 2, viewName: "Lake", capacity: 5)
    let themeParkResortStudio = createViewType(context: context, order: 3, viewName: "Theme Park", capacity: 5)
    let resortStudio = createRoomType(context: context, order: 1, roomName: "Resort Studio", viewTypes: [standardResortStudio, lakeResortStudio, themeParkResortStudio], roomCategory: "Studio")
    
    let standardStudio = createViewType(context: context, order: 1, viewName: "Standard", capacity: 5)
    let lakeStudio = createViewType(context: context, order: 2, viewName: "Lake", capacity: 5)
    let deluxeStudio = createRoomType(context: context, order: 2, roomName: "Deluxe Studio", viewTypes: [standardStudio, lakeStudio], roomCategory: "Studio")
    
    let standardOne = createViewType(context: context, order: 1, viewName: "Standard", capacity: 5)
    let lakeOne = createViewType(context: context, order: 2, viewName: "Lake", capacity: 5)
    let oneBed = createRoomType(context: context, order: 3, roomName: "One-Bedroom Villa", viewTypes: [standardOne, lakeOne], roomCategory: "One-Bedroom")
    
    let standardTwo = createViewType(context: context, order: 1, viewName: "Standard", capacity: 9)
    let lakeTwo = createViewType(context: context, order: 2, viewName: "Lake", capacity: 9)
    let twoBed = createRoomType(context: context, order: 4, roomName: "Two-Bedroom Villa", viewTypes: [standardTwo, lakeTwo], roomCategory: "Two-Bedroom")
    
    let lakeThree = createViewType(context: context, order: 1, viewName: "Lake", capacity: 12)
    let threeBed = createRoomType(context: context, order: 5, roomName: "Three-Bedroom Grand Villa", viewTypes: [lakeThree], roomCategory: "Three-Bedroom")
    
    let grandFloridianRoomTypes = [resortStudio, deluxeStudio, oneBed, twoBed, threeBed]
    
    createResort(context: context, resortName: "The Villas at Disney's Grand Floridian Resort & Spa", shortName: "Grand Floridian", expireYear: 2064, roomTypes: NSSet(array: grandFloridianRoomTypes), pointBlocks: NSSet(array: []))
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

func createViewType(context: NSManagedObjectContext, order: Int16, viewName: String, capacity: Int16) -> ViewType {
    let viewType = ViewType(context: context)
    viewType.id = UUID()
    viewType.order = order
    viewType.viewName = viewName
    viewType.roomCapacity = capacity
    
    return viewType
}

func createRoomType(context: NSManagedObjectContext, order: Int16, roomName: String, viewTypes: NSSet, roomCategory: String) -> RoomType {
    let roomType = RoomType(context: context)
    roomType.id = UUID()
    roomType.order = order
    roomType.roomName = roomName
    roomType.viewTypes = viewTypes
    roomType.roomCategory = roomCategory
    
    return roomType
}

func createResort(context: NSManagedObjectContext, resortName: String, shortName: String, expireYear: Int16, roomTypes: NSSet, pointBlocks: NSSet) {
    let newResort = Resort(context: context)
    newResort.id = UUID()
    newResort.resortName = resortName
    newResort.shortName = shortName
    newResort.roomTypes = roomTypes
    newResort.expireYear = expireYear
    newResort.pointBlocks = pointBlocks
}

