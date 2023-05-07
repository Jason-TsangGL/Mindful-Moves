//
//  EnableSleepPrep.swift
//  MindfulMoves
//
//  Created by Jason Tsang on 2022-12-05.
//
import Foundation
import SwiftUI

struct EnableSleepPrepiPhone: View {
    var body: some View {
        TabView {
                ForEach(SleepStepsiPhone) { step in
                    TutorialTemplate(pic: step.image, cap: step.text)
            }
        }//MARK: END OF NAVVIEW
        .tabViewStyle(.page(indexDisplayMode: .always))
    }//MARK: END OF VAR BODY
}//MARK: END OF STRUCT

struct EnableSleepPrepWatch: View {
    var body: some View {
        TabView {
                ForEach(SleepStepsWatch) { step in
                    TutorialTemplate(pic: step.image, cap: step.text)
            }
        }//MARK: END OF NAVVIEW
        .tabViewStyle(.page(indexDisplayMode: .always))
    }//MARK: END OF VAR BODY
}//MARK: END OF STRUCT

let SleepStepsiPhone : [StepItems] = [
    StepItems(image: "sleep", text: "1. Go to the Health App  > Browse > Sleep"),
    StepItems(image: "sleep1", text: "2. Tap Get Started"),
    StepItems(image: "sleep2", text: "3. Follow the onscreen prompts to establish:"),
    StepItems(image: "sleepoptional", text: "4. You may or may not choose to enable Sleep Focus, if not then tap Skip."),
    StepItems(image: "sleepschedule", text: "5. Tap on the Full Schedule & Options category after setup."),
    StepItems(image: "sleep4", text: "6. Enable 'Sleep Schedule' & 'Track Time in Bed with iPhone' "),
    StepItems(image: "sleep5", text: "7. Scroll down and Tap on 'Manage Sleep on Watch App ."),
    StepItems(image: "watchsleep1", text: "8. Enable 'Track Sleep with Apple Watch', and enabling 'Charging Reminders' is optional. However you must still adhere to the study's requirements.")
    

]
let SleepStepsWatch : [StepItems] = [
    StepItems(image: "AppleWatch", text: "1. If you paired your Apple Watch after completing Sleep setup, you can still turn on Track Sleep with Apple Watch."),
    StepItems(image: "WatchSleep", text: "2. In the Watch app on your iPhone, tap the My Watch tab, then tap Sleep. Then tap Track Sleep with Apple Watch to turn on this setting."),
    StepItems(image: "watchsleep1", text: "3. Turning on Charging Reminders is optional, however you are still required to adhere to the charging requirements. If your watch battery dies, it won't track your sleep data.")
]

struct Previews: PreviewProvider {
    static var previews: some View {
        EnableSleepPrepiPhone()
    }
}
