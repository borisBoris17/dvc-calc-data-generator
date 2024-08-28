//
//  ContentView.swift
//  dvc-calc-data-generator
//
//  Created by tucker bichsel on 16/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
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
//                
//                Button {
//                    viewModel.pointValues = []
//                    viewModel.createPolyResort()
//                } label: {
//                    Text("Load Poly Data")
//                }
                
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
                
                Button {
                    viewModel.pointValues = []
                    viewModel.createGrandCalifornianResort()
                } label: {
                    Text("Load Grand Californian Data")
                }
                
                Button {
                    viewModel.pointValues = []
                    viewModel.createDisneylandVillasResort()
                } label: {
                    Text("Load Disneyland Villas Data")
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
