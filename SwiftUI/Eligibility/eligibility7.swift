//
//  eligibility7.swift
//  24Syn
//
//  Created by Jason Tsang on 2022-11-30.
//

import SwiftUI

struct eligibility7: View {


var body: some View {
NavigationView {
VStack(alignment: .center) {
Text("Age")
.font(.largeTitle)
.bold(true)
.padding()

        Image(systemName: "pencil.and.outline")
        .resizable()
        .foregroundColor(.accentColor)
        .scaledToFit()
        .frame(width: 200,height: 200,alignment: .center)


Text("Are you above the age of 18?")
        .font(.title2)
        .padding()

HStack(alignment: .center,spacing: 50){
    NavigationLink("No", destination: IneligibilityStep())
        .buttonStyle(.borderedProminent)
        .onTapGesture {
            haptics().ErrorHaptic()
        }
    NavigationLink("Yes", destination: eligibilitycompletion())
        .buttonStyle(.borderedProminent)
        .onTapGesture {
            haptics().SelectionHaptic()
        }
}
.padding()
}

}
.frame(maxWidth: 640)
.navigationBarBackButtonHidden(true)

}
}

struct eligibility7_Previews: PreviewProvider {
    static var previews: some View {
        eligibility7()
    }
}
