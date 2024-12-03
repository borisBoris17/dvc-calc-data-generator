//
//  ContentView.swift
//  dvc-calc-data-generator
//
//  Created by tucker bichsel on 16/05/2024.
//

import SwiftUI

struct ContentView: View {
    
//    @Environment(\.managedObjectContext) var moc
    @State var viewModel = ViewModel()
    
//    @FetchRequest(
//        entity: Resort.entity(),
//        sortDescriptors: []
//    ) var resorts: FetchedResults<Resort>
    
//    @FetchRequest(sortDescriptors: []) var resorts: FetchedResults<Resort>
    
    var body: some View {
        VStack {
            HStack {
//                Button {
//                    viewModel.pointValues = []
//                    viewModel.createRivieraResort()
//                } label: {
//                    Text("Load Riviera Data")
//                }

                Button {
                    viewModel.pointValues = []
                    viewModel.createTowerPolyResort()
                } label: {
                    Text("Load Tower Poly Data")
                }
                
//                Button {
//                    viewModel.pointValues = []
//                    viewModel.createPolyResort()
//                } label: {
//                    Text("Load Poly Data")
//                }
//
                
//                Button {
//                    viewModel.pointValues = []
//                    viewModel.createKidaniResort()
//                } label: {
//                    Text("Load Kidani Data")
//                }
//
//                Button {
//                    viewModel.pointValues = []
//                    viewModel.createJamboResort()
//                } label: {
//                    Text("Load Jambo Data")
//                }
                
//                Button {
//                    viewModel.pointValues = []
//                    viewModel.createBayLakeResort()
//                } label: {
//                    Text("Load Bay Lake Data")
//                }
//
//                Button {
//                    viewModel.pointValues = []
//                    viewModel.createBoulderRidgeResort()
//                } label: {
//                    Text("Load Boulder Ridge Data")
//                }
//
//                Button {
//                    viewModel.pointValues = []
//                    viewModel.createCabinResort()
//                } label: {
//                    Text("Load Cabin Data")
//                }
                
//                Button {
//                    viewModel.pointValues = []
//                    viewModel.createCopperCreekResort()
//                } label: {
//                    Text("Load copper creek Data")
//                }
//
//                Button {
//                    viewModel.pointValues = []
//                    viewModel.createBeachClubResort()
//                } label: {
//                    Text("Load Beach Club Data")
//                }
                
//                Button {
//                    viewModel.pointValues = []
//                    viewModel.createBoardwalkResort()
//                } label: {
//                    Text("Load BoardWalk Data")
//                }
//
//                Button {
//                    viewModel.pointValues = []
//                    viewModel.createOldKeyWestResort()
//                } label: {
//                    Text("Load Old Key West Data")
//                }
//
//                Button {
//                    viewModel.pointValues = []
//                    viewModel.createSaratogaSpringsResort()
//                } label: {
//                    Text("Load Saratoga Springs Data")
//                }
                
//                Button {
//                    viewModel.pointValues = []
//                    viewModel.createGrandCalifornianResort()
//                } label: {
//                    Text("Load Grand Californian Data")
//                }
//
//                Button {
//                    viewModel.pointValues = []
//                    viewModel.createDisneylandVillasResort()
//                } label: {
//                    Text("Load Disneyland Villas Data")
//                }
                
//                Button {
//                    viewModel.pointValues = []
//                    viewModel.createAulaniResortData()
//                } label: {
//                    Text("Load Aulaani Data")
//                }
//
//                Button {
//                    viewModel.pointValues = []
//                    viewModel.createHiltonHeadResort()
//                } label: {
//                    Text("Load Hilton Head Data")
//                }
//
//                Button {
//                    viewModel.pointValues = []
//                    viewModel.createdVeroBeachResort()
//                } label: {
//                    Text("Load Vero Beach Data")
//                }
                
                Button {
                    viewModel.loadData()
                } label: {
                    Text("Load Data")
                }
                
//                Button("Export") {
//                    viewModel.exportStore()
//                }
                
                Button("Export to Json") {
//                    print(Array(resorts))
                    viewModel.exportToJsonStore()
                }
                
                Button("Clear Data") {
                    viewModel.clearStore()
                }
            }
            
            if viewModel.allResorts.count > 0 {
                ForEach(viewModel.allResorts) { resort in
                    VStack {
                        ForEach(resort.roomTypeArray) { roomType in
                            VStack {
                                Text(roomType.wrappedRoomName)
                                
                                ForEach(roomType.viewTypeArray) { viewType in
                                    Text(viewType.wrappedViewName)
                                }
                            }
                        }
                    }
                }
                
                Picker("Resort", selection: $viewModel.selectedResort) {
                    Text("Select a Resort")
                        .tag(nil as Resort?)
                    
                    ForEach(viewModel.allResorts) { resort in
                        Text(resort.wrappedResortName)
                            .tag(resort as Resort?)
                    }
                }
                .onChange(of: viewModel.selectedResort) { _, selectedResort in
                    viewModel.prepareSelectedResort()
                }
            }
            
            if viewModel.selectedResort != nil && viewModel.selectedPointBlocks.count > 0 {
                VStack {
                    Grid {
                        GridRow {
                            Text("")
                            Text("")
                            ForEach(viewModel.selectedResort!.roomTypeArray) { roomType in
                                ForEach(roomType.viewTypeArray, id: \.self) { viewType in
                                    Text("\(roomType.wrappedRoomName) - \(viewType.wrappedViewName)")
                                }
                            }
                        }
                        
                        ForEach(viewModel.selectedPointBlocks.indices, id: \.self) { g in
                            GridRow {
                                VStack {
                                    ForEach(viewModel.selectedPointBlocks[g].dateRangeArray, id: \.self) { dateRange in
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
                                
                                ForEach(viewModel.selectedResort!.roomTypeArray.indices, id: \.self) { i in
                                    PointValueView(pointValues: $viewModel.pointValues[g][i], roomType: viewModel.selectedResort!.roomTypeArray[i])
                                }
                            }
                        }
                    }
                    
                    HStack {
                        Button("Save") {
                            print("Save the data...")
                            viewModel.saveSelectedResort()
                        }
                    }
                    .padding(.top)
                }
            }
            
            if viewModel.resort != nil {
                VStack {
                    Grid {
                        GridRow {
                            Text("")
                            Text("")
                            ForEach(viewModel.resort!.roomTypeArray) { roomType in
                                ForEach(roomType.viewTypeArray, id: \.self) { viewType in
                                    Text("\(roomType.wrappedRoomName) - \(viewType.wrappedViewName)")
                                }
                            }
                        }
                        
                        ForEach(viewModel.resort!.pointBlockArray.indices, id: \.self) { g in
                            GridRow {
                                VStack {
                                    ForEach(viewModel.resort!.pointBlockArray[g].dateRangeArray, id: \.self) { dateRange in
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
                                
                                ForEach(viewModel.resort!.roomTypeArray.indices, id: \.self) { i in
                                    PointValueView(pointValues: $viewModel.pointValues[g][i], roomType: viewModel.resort!.roomTypeArray[i])
                                }
                            }
                        }
                    }
                    
                    HStack {
                        Button("Save") {
                            viewModel.saveResort()
                        }
                        
                        Button("Delete") {
                            viewModel.deleteResort(viewModel.resort!)
                        }
                    }
                    .padding(.top)
                }
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            viewModel.loadExistingData()
        }
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
