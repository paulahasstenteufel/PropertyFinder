//
//  BaseImageView.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-29.
//

import CachedAsyncImage
import SwiftUI

struct BaseImageView: View {
    let imageURL: String?
    var largeImage = false
    
    var body: some View {
        CachedAsyncImage(url: URL(string: imageURL ?? "")) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(height: imageHeight)
                .clipped()
            
        } placeholder: {
            LoadingView().frame(height: .imageHeight)
        }
    }
    
    private var imageHeight: CGFloat {
        largeImage ? .imageHeight * 1.6 : .imageHeight
    }
}
