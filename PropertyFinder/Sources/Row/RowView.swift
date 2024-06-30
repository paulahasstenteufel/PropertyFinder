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
                PropertyHeaderView(model: property)
                
                propertySummaryView
            }
        }
    }
    
    var propertySummaryView: some View {
        HStack {
            Text("1 234 567 SEK")
            Spacer()
            
            Text("1 234 SQM")
            Spacer()
            
            Text("12 rooms")
        }
        .font(.detail)
        .foregroundColor(.strong)
    }
}

//#Preview {
//    RowView()
//}
