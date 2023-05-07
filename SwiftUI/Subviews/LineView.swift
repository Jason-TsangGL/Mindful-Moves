//
//  LineView.swift
//  24Syn
//
//  Created by Jason Tsang on 2022-11-12.
//

import SwiftUI

struct LineView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 300,height: 1,alignment: .center)
        }    }
}

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView()
    }
}
