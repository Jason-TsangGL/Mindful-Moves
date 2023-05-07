//
//  SleepTemplate.swift
//  MindfulMoves
//
//  Created by Jason Tsang on 2022-12-07.
//

import SwiftUI

struct TutorialTemplate: View {
    var pic : String
    var cap : String
    
    var body: some View {

            VStack(alignment: .center, spacing: 30) {
                Text(cap)
                    .font(.headline)
                Image("\(pic)")
                    .resizable()
                    .scaledToFit()
        }
    }
}
struct StepItems : Identifiable {
    var id = UUID()
    var image : String
    var text : String
}
