//
//  UIHelper.swift
//  VideoGamesTK
//
//  Created by Jose Miguel Serrato Moreno on 30/01/25.
//

import SwiftUI

extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}

extension View {
    
    func myBackgrounImageStyle() -> some View {
        self.background(Image("backgroundImage")
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0)
            .edgesIgnoringSafeArea(.all))
        
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(
                width: radius,
                height: radius
            )
        )
        return Path(path.cgPath)
    }
}
