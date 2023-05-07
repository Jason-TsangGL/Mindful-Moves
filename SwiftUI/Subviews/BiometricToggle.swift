//
//  BiometricToggle.swift
//  MindfulMoves
//
//  Created by Jason Tsang on 2022-12-17.
//

import SwiftUI

struct BiometricToggleView: View {
    var body: some View {
        ScrollView {
            StudySettingsView()
                
        }
        .ignoresSafeArea()
    }
}

struct BiometricToggle_Previews: PreviewProvider {
    static var previews: some View {
        BiometricToggleView()
    }
}
