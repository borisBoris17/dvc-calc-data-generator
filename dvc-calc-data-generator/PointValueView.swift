//
//  pointValueView.swift
//  dvc-calc-data-generator
//
//  Created by tucker bichsel on 19/05/2024.
//

import SwiftUI

struct PointValueView: View {
    @Binding var pointValues: [(weekdayRate: String, weekendRate: String)]
    var roomType: RoomType
    @State private var weekdayRate = ""
    @State private var weekendRate = ""
    
    
    
    var body: some View {
        ForEach(roomType.viewTypeArray.indices, id: \.self) { i in
            VStack {
                TextField("Weekday Rate", text: $pointValues[i].weekdayRate)
                    .padding(.vertical)
                TextField("Weekend Rate", text: $pointValues[i].weekendRate)
            }
            .labelsHidden()
        }
    }
}

//#Preview {
//    PointValueView()
//}
