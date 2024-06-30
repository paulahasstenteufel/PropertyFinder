//
//  PropertyHeaderView.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-28.
//

import SwiftUI

struct PropertyHeaderView: View {
    @State var model: Property
    var largeImage = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            BaseImageView(imageURL: model.image, largeImage: largeImage)
                .overlay {
                    if model.highlighted == "true" {
                        Color.clear
                            .border(Color.golden, width: .border)
                    }
                }
            
            Text(model.displayAddress)
                .padding(.top, .small)
                .font(.h1)
                .foregroundColor(.strong)
            
            Text(model.displayArea)
                .font(.h2)
                .foregroundColor(.soft)
        }
    }
}
