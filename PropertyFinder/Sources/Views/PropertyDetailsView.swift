//
//  PropertyDetailsView.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-29.
//

import SwiftUI

struct PropertyDetailsView: View {
    @State var model: Property
    
    var body: some View {
        VStack(alignment: .leading) {
            PropertyHeaderView(model: model)
            
            Text("1 234 567 SEK")
                .font(.price)
                .foregroundColor(.strong)
            
            Text("Lorem Ipsum")
                .font(.description)
                .foregroundColor(.strong)
                .padding(.top, .large)
        }
    }
}

//extension PropertyDetailsView {
//    static let mock = Property(highlighted: false, id: "12345", askingPrice: 1.5, monthlyFee: 1234, municipality: "", area: "Stockholm", daysSincePublish: 3, livingArea: 123, numberOfRooms: 2, streetAddress: "Address 1", image: "")
//}
//
//#Preview {
//    PropertyDetailsView(model: PropertyDetailsView.mock)
//}
