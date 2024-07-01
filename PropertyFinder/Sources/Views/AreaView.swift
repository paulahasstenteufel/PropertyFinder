//
//  AreaView.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-29.
//

import SwiftUI

struct AreaView: View {
    @State var model: Area
    
    var body: some View {
        ZStack {
            Color.brandLight
            
            BaseImageView(imageURL: model.image, largeImage: true)
                .padding(.vertical, .ginormous)
                .overlay {
                    VStack(alignment: .center) {
                        Text("\(model.area) Area")
                            .font(.h1)
                            .fontWeight(.bold)
                            .foregroundColor(.strong)
                            .padding(.vertical, .large)
                        
                        Spacer()
                        
                        detailsView
                            .frame(height: .lineHeight)
                            .padding(.bottom, .large)
                    }
                }
            
        }
    }
    
    var detailsView: some View {
        HStack {
            Text(model.displayRating)
            Text(model.displayAveragePrice)
        }
        .font(.summary)
        .foregroundColor(.medium)
    }
}

private extension Area {
    var displayRating: String {
        guard let ratingFormatted else { return "" }
        return "Rating: \(ratingFormatted)"
    }
    var displayAveragePrice: String {
        guard let averagePrice else { return "" }
        return "Average price: \(averagePrice)"
    }
}
