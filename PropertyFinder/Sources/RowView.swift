//
//  RowView.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-29.
//

import SwiftUI

struct RowView: View {
    var body: some View {
        VStack {
            PropertyView()
            
            SummaryView()
        }
    }
}

struct SummaryView: View {
    var body: some View {
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

#Preview {
    RowView()
}
