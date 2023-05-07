//
//  eligibility5.swift
//  24Syn
//
//  Created by Jason Tsang on 2022-11-30.
//

import SwiftUI

struct eligibility5: View {
    @State var no : Bool = false
@State var eligibility5 : Bool = false

var body: some View {
NavigationView {
VStack(alignment: .center) {
Text("English Fluency")
.font(.largeTitle)
.bold(true)
.padding()

    HStack(spacing: 75) {
        Image(systemName: "pencil.and.outline")
            .resizable()
            .scaledToFit()
            .foregroundColor(.accentColor)
            .padding(.leading)
    
    Image(systemName: "heart.text.square.fill")
        .resizable()
        .foregroundColor(.accentColor)
        .scaledToFit()
        .padding(.trailing)
        
    }
    .padding()

Text("English Fluency?")
        .font(.title2)
Text("Ability to read/write/communicate/follow instructions in english")
.font(.title3)
.padding()
.multilineTextAlignment(.center)
.italic(true)

    HStack(alignment: .center,spacing: 50){
        NavigationLink("No", destination: IneligibilityStep())
            .buttonStyle(.borderedProminent)
            .onTapGesture {
                haptics().ErrorHaptic()
            }
        NavigationLink("Yes", destination: eligibility6())
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

struct eligibility5_Previews: PreviewProvider {
    static var previews: some View {
        eligibility5()
    }
}
