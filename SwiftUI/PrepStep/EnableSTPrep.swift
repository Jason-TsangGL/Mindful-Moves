//
//  EnableSTPrep.swift
//  MindfulMoves
//
//  Created by Jason Tsang on 2022-12-05.
//
import Foundation
import SwiftUI

struct EnableSTPrep: View {
    var body: some View {
        TabView {
                ForEach(STItems) { step in
                    TutorialTemplate(pic: step.image, cap: step.text)
            }
        }//MARK: END OF NAVVIEW
        .tabViewStyle(.page(indexDisplayMode: .always))
    }//MARK: END OF VAR BODY
}

struct EnableSTPrep_Previews: PreviewProvider {
    static var previews: some View {
        EnableSTPrep()
    }
}

let STItems : [StepItems] = [
StepItems(image: "ST1", text: "1. Go to Settings  > Screen Time."),
StepItems(image: "ST2", text: "2. Tap Turn On Screen Time, then tap Continue."),
StepItems(image: "ST3", text: "3. Tap This is My iPhone when you’re setting up Screen Time."),
StepItems(image: "ST.schedule", text: "4. When entering sleep schedule, please input the closest sleep and wake times. (If you do not have a set schedule, Set the schedule to 10pm - 8am)."),
StepItems(image: "ST4", text: "5. To use Screen Time on all your Apple devices, scroll down, then turn on Share Across Devices.")
]
