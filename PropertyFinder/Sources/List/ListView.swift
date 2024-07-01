//
//  ListView.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-30.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        Group {
            if viewModel.isLoading {
                VStack(spacing: .large) {
                    LoadingView().frame(height: .imageHeight)
                    LoadingView().frame(height: .lineHeight)
                    Spacer()
                }
                .padding(.horizontal, .large)
                
            } else {
                NavigationView {
                    ZStack {
                        Color.brandMedium
                            .ignoresSafeArea()
                        
                        ScrollView {
                            ForEach(viewModel.items, id: \.id) { item in
                                RowView(viewModel: viewModel.row(for: item))
                            }
                        }
                        .padding(.vertical, .large)
                        .background(Color.background)
                    }
                }
                .navigationBarTitle("Items", displayMode: .inline)
            }
        }
    }
    
    // MARK: Private
    @StateObject private var viewModel = ListViewModel(service: PropertyService())
}
