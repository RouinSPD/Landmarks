//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by iOS Development Lab FI UNAM on 27/01/23.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle : Angle
    var body: some View {
        BagdeSymbol()
        .padding(-60)
        .rotationEffect(angle, anchor:  .bottom)
        
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: -5))
    }
}
