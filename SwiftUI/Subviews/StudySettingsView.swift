//
//  StudySettingsView.swift
//  MindfulMoves
//
//  Created by Jason Tsang on 2022-12-29.
//
import UIKit
import SwiftUI
import Foundation
import PDFKit


struct StudySettingsView: View {
    @AppStorage("BiometricToggle") var BiometricToggle : Bool = false
    func SelectionHaptic() {
        let Gen = UISelectionFeedbackGenerator()
        Gen.selectionChanged()
    }
    var body: some View {
        NavigationView {
                ZStack {
                    Color(uiColor: .systemGray6)
                        .ignoresSafeArea()
                    VStack(spacing:2) {
                        HStack {
                            Image("FeaturedIcon")
                                .resizable()
                                .frame(width: 256/3,height: 256/3)
                            .scaledToFit()
                            VStack {
                                Text("Mindful Moves")
                                    .foregroundColor(.purple)
                                .font(.largeTitle)
                                Text("By Exercise & Health Psychology Laboratory")
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                            }
                        }
                            Form {
                                Section("Privacy & Legal") {
                                    Button("Notification Test") {
                                        addNotification(time: 1, title: "Mindful Moves", subtitle: "", body: "Hello, Don't forget to complete todays assigned questionnaires!")
                                    }
                                    Toggle("Face ID / Touch ID:", isOn: $BiometricToggle)
                                        .onTapGesture {
                                            SelectionHaptic()
                                        }
                                    NavigationLink("Letter of Information"){
                                        LOIViewer()
                                            .toolbar {
                                                ShareLink(item: Bundle.main.url(forResource: "Information&ConsentForm", withExtension: "pdf")!)
                                            }
                                    }
                                    .onTapGesture {
                                        SelectionHaptic()
                                    }
                                    NavigationLink("Mental Health Resources"){
                                        MentalHealthResourceType()
                                    }                                    .onTapGesture {
                                        SelectionHaptic()
                                    }
                                    NavigationLink("Data Usage & Privacy"){
                                        DataPrivacyView()
                                    }                                    .onTapGesture {
                                        SelectionHaptic()
                                    }
                                    NavigationLink("Contact Us"){
                                        ContactListView()
                                    }
                                    .onTapGesture {
                                        SelectionHaptic()
                                    }
                                }
                                HStack {
                                    Text("Version")
                                    Spacer()
                                    Text("1.7.4 (15) [Beta]")
                                        .foregroundColor(.gray)
                                }
                                Section {
                                NavigationLink("Voluntary Study Withdrawal"){
                                    withdrawalwarning()
                                }
                                .foregroundColor(.red)
                                .onTapGesture {
                                    SelectionHaptic()
                                }
                            }
                        }
                        .ignoresSafeArea()
                        Spacer()
                    }
                }
            }
        .scrollDisabled(false)
        }

    func addNotification(time: Double, title: String, subtitle: String, body: String) {
        let center = UNUserNotificationCenter.current()

        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = title
            content.subtitle = subtitle
            content.body = body
            content.sound = UNNotificationSound.default

            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)

            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print("Authorization declined")
                    }
                }
            }
        }
    }
}

struct StudySettingsView_Previews: PreviewProvider {
    static var previews: some View {
        StudySettingsView()
    }
}


