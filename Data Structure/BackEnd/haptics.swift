//
//  haptics.swift
//  MindfulMoves
//
//  Created by Jason Tsang on 2023-01-27.
//

import Foundation
import UIKit
import SwiftUI

struct haptics {
    init() {}

    func ErrorHaptic() {
        let Type : UINotificationFeedbackGenerator.FeedbackType = .error
        let G = UINotificationFeedbackGenerator()
        G.notificationOccurred(Type)
    }
    func WarningHaptic() {
        let Type : UINotificationFeedbackGenerator.FeedbackType = .warning
        let G = UINotificationFeedbackGenerator()
        G.notificationOccurred(Type)
    }
    func SuccessHaptic() {
        let Type : UINotificationFeedbackGenerator.FeedbackType = .success
        let G = UINotificationFeedbackGenerator()
        G.notificationOccurred(Type)
    }
    func SelectionHaptic() {
        let Gen = UISelectionFeedbackGenerator()
        Gen.selectionChanged()
    }

    
}
