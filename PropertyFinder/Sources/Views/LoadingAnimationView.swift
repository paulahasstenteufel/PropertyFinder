//
//  LoadingAnimationView.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-30.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(Color.gray.opacity(0.5))
            .redacted(reason: .placeholder)
            .move()
    }
}

struct MovementEffect: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(
                LinearGradient(
                    gradient: gradient,
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .blur(radius: 10)
                .rotationEffect(.degrees(10))
                .offset(x: interpolation * 300, y: 0)
                
            )
            .mask(content)
            .onAppear(perform: onAppear)
    }
    
    // MARK: Private
    @State private var interpolation: CGFloat = -1
    private let gradient = Gradient(colors: [.clear, .background.opacity(0.25), .clear])
    
    private func onAppear() {
        let animation = Animation.linear(duration: 1).repeatForever(autoreverses: false)
        withAnimation(animation) {
            interpolation.negate()
        }
    }
}

extension View {
    func move() -> some View {
        self.modifier(MovementEffect())
    }
}
