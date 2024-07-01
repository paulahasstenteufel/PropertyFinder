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
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    PropertyHeaderView(model: model, largeImage: true)
                    
                    Text(model.displayAskingPrice)
                        .font(.price)
                        .foregroundColor(.strong)
                    
                    if let description = model.description {
                        Text(description)
                            .font(.description)
                            .foregroundColor(.strong)
                            .padding(.vertical, .large)
                    }
                    
                    Text("Living area: " + model.displayLivingArea)
                    Text(model.displayNumberOfRooms)
                    Text(model.displayPatio)
                    Text(model.displayDaysSincePublish)
                }
            }
        }
        .padding(.horizontal, .large)
        .navigationTitle("Property Details")
    }
}
