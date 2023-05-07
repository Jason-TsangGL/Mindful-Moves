//
//  StudyProgressView.swift
//  24Syn
//
//  Created by Jason Tsang on 2022-11-06.
//

import CareKit
import CareKitStore
import UIKit
import os.log
import SwiftUI
import Foundation

import SwiftUI

struct WithdrawalConfirmationAlert: View {
    @AppStorage("withdrawalfinal") var withdrawalfinal : Bool = false
    @State private var showingConfirmationDialog: Bool = false
    private var confirmationDialogTitle: String = "Confirmation of Withdrawal"
    private var confirmationDialogMessage: String = ""

    var body: some View {
        Button(action: {
            showingConfirmationDialog = true
        })
        {
            Text("Show Confirmation Dialog")
        }        .buttonStyle(.bordered)
            .foregroundColor(.red)

        .alert(Text(confirmationDialogTitle),
            isPresented: $showingConfirmationDialog,
            actions: {
                Button("Withdrawal", role: .destructive) {
                    withdrawalfinal = true }

                Button("Cancel", role: .cancel) { }
            },
            message: {
                confirmationDialogMessage == "" ? nil : Text(confirmationDialogMessage)
            }
        )
    }
}
