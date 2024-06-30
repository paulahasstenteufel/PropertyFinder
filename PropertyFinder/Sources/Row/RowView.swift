//
//  RowView.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-29.
//

import SwiftUI

struct RowView: View {
    @StateObject var viewModel: RowViewModel
    
    var body: some View {
        VStack {
            if let area = viewModel.area {
                AreaView(area: area)
            }
            
            if let property = viewModel.property {
                PropertyView(property: property)
            }
        }
    }
}

//#Preview {
//    RowView()
//}
