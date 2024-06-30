//
//  ListView.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-30.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.items, id: \.id) { item in
                    RowView(viewModel: RowViewModel(modelType: item))
                }
            }
        }
    }
    
    // MARK: Private
    @StateObject private var viewModel = ListViewModel()
}
