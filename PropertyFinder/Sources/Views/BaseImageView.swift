//
//  BaseImageView.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-29.
//

import SwiftUI

struct BaseImageView: View {
    let imageURL: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { image in
            image
                .resizable()
                .scaledToFill()
                .clipped()
            
        } placeholder: {
            Color.black
        }
    }
}

#Preview {
    BaseImageView(imageURL: "")
}
