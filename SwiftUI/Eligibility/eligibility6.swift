//
//  eligibility6.swift
//  24Syn
//
//  Created by Jason Tsang on 2022-11-30.
//

import SwiftUI

struct eligibility6: View {


var body: some View {
NavigationView {
VStack(alignment: .center) {
Text("Academic Affilitation")
.font(.largeTitle)
.bold(true)
.padding()

Image("UWOCREST")
        .resizable()
        .foregroundColor(.accentColor)
        .scaledToFit()
        .frame(width: 200,height: 200,alignment: .center)
Text("Are you an active student of Western University or it's affiliate colleges?")
        .font(.title2)
        .padding(.top)
    HStack(alignment: .center,spacing: 50){
        NavigationLink("No", destination: IneligibilityStep())
            .buttonStyle(.borderedProminent)
            .onTapGesture {
                haptics().ErrorHaptic()
            }
        NavigationLink("Yes", destination: eligibility7())
            .buttonStyle(.borderedProminent)
            .onTapGesture {
                haptics().SelectionHaptic()
            }
    }
    .padding()
}
.padding(.horizontal)

}
.frame(maxWidth: 640)
.navigationBarBackButtonHidden(true)

}
}

struct eligibility6_Previews: PreviewProvider {
    static var previews: some View {
        eligibility6()
    }
}
