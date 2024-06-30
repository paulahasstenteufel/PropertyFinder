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
            Color.brandMedium
            
            BaseImageView(imageURL: model.image, largeImage: true)
                .padding(.vertical, .ginormous)
                .overlay {
                    VStack(alignment: .center) {
                        Text(model.area)
                            .font(.h1)
                            .fontWeight(.bold)
                            .foregroundColor(.strong)
                        
                        Spacer()

                        detailsView
                            .frame(height: .lineHeight)
                    }
                    .frame(maxHeight: .imageHeight * 1.4)
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
