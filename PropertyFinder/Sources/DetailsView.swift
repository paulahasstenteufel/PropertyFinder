//
//  DetailsView.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-29.
//

import SwiftUI

struct DetailsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            PropertyView()
            
            PriceView()
            
            Text("Lorem Ipsum")
                .font(.description)
                .foregroundColor(.strong)
                .padding(.top, .large)
        }
    }
}

struct PriceView: View {
    var body: some View {
        Text("1 234 567 SEK")
            .font(.price)
            .foregroundColor(.strong)
    }
}

#Preview {
    DetailsView()
}
