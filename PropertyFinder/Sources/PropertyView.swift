//
//  PropertyView.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-28.
//

import SwiftUI

struct PropertyView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: .small) {
            AsyncImage(url: URL(string: "")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .clipped()
                
            } placeholder: {
                Color.black
            }
            .padding(.bottom, .large)
            
            Text("Placeholder Streeetname 3")
                .font(.h1)
                .foregroundColor(.strong)
            
            Text("Placeholder Area Address")
                .font(.h2)
                .foregroundColor(.medium)
        }
    }
}

#Preview {
    PropertyView()
}
