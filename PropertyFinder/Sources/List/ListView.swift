//
//  ListView.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-30.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        if viewModel.isLoading {
            VStack(spacing: .large) {
                LoadingView()
                LoadingView()
            }
            
        } else {
            NavigationView {
                List {
                    ForEach(viewModel.items, id: \.id) { item in
                        RowView(viewModel: viewModel.row(for: item))
                    }
                }
            }
        }
    }
    
    // MARK: Private
    @StateObject private var viewModel = ListViewModel()
}

#Preview {
    ListView()
}
