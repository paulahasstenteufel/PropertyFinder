//
//  AreaView.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-29.
//

import SwiftUI

struct AreaView: View {
    var body: some View {
        ZStack {
            Color.soft
            
            areaView
                .padding(.vertical, .large)
        }
    }
    
    private var areaView: some View {
        VStack {
            Text("Placeholder Area Name")
                .font(.h1)
                .foregroundColor(.strong)
            
            BaseImageView(imageURL: "")
            
            HStack {
                Text("Rating Placeholder")
                Spacer()
                Text("Avg. Price Placeholder")
            }
            .font(.summary)
        }
    }
}

#Preview {
    AreaView()
}
