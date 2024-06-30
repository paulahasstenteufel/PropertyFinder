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
        Group {
            if let area = viewModel.area {
                AreaView(model: area)
                    .padding(.vertical, .large)
            }
            
            if let property = viewModel.property {
                NavigationLink(destination: PropertyDetailsView(model: property)) {
                    VStack {
                        PropertyHeaderView(model: property)
                        
                        HStack {
                            Text(property.displayAskingPrice)
                            Spacer()
                            
                            Text(property.displayLivingArea)
                            Spacer()
                            
                            Text(property.displayNumberOfRooms)
                            Spacer()
                        }
                        .font(.detail)
                        .foregroundColor(.strong)
                    }
                    .padding(.all, .large)
                    .buttonStyle(.plain)
                }
            }
        }
    }
}
