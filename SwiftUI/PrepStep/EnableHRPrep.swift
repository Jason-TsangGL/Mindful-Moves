//
//  StepViews.swift
//  MindfulMoves
//
//  Created by Jason Tsang on 2022-12-05.
//

import SwiftUI
import Foundation

let VitalItems : [StepItems] = [
StepItems(image: "AppleWatch", text: "1. By default, your Apple Watch monitors your heart rate for the Heart Rate app. If you’ve turned off heart rate data, your can turn it back on on the Watch app."),
StepItems(image: "vital0", text: "2. Go to Privacy"),
StepItems(image: "vital1", text: "3. Enable all of the following options. (Heart Rate/Respiratory Rate/Fitness Tracking)"),
StepItems(image: "vital2", text: "4. Now, Tap on Reset Fitness Calibration Data")
]


struct EnableHRPrep: View {
    var body: some View {
        TabView {
                ForEach(VitalItems) { step in
                    TutorialTemplate(pic: step.image, cap: step.text)
            }
        }//MARK: END OF NAVVIEW
        .tabViewStyle(.page(indexDisplayMode: .always))
    }//MARK: END OF VAR BODY
}

struct EnableHRPrep_Previews: PreviewProvider {
    static var previews: some View {
        EnableHRPrep()
    }
}
