//
//  PropertyHeaderView.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-28.
//

import SwiftUI

struct PropertyHeaderView: View {
    @State var model: Property
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            BaseImageView(imageURL: "")
                .padding(.bottom, .small)
            
            Text("Placeholder Streeetname 3")
                .font(.h1)
                .foregroundColor(.strong)
            
            Text("Placeholder Area Address")
                .font(.h2)
                .foregroundColor(.medium)
        }
    }
}

//#Preview {
//    PropertyView()
//}
