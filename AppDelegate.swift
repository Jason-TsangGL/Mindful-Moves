import CareKit
import CareKitStore
import UIKit
import os.log
import ResearchKit
import SwiftUI
import Foundation
import WatchConnectivity
import ActivityKit
import AVFoundation
import AVKit
import CoreMotion

@main
class AppDelegate: UIResponder, UIApplicationDelegate, WCSessionDelegate {
    let storeManager = OCKSynchronizedStoreManager(
        wrapping: OCKStore(
            name: "com.apple.wwdc.carekitstore",
            type: .inMemory))
    @AppStorage("WatchConnectivity") var WatchConnectivity : Bool = true
    @AppStorage("AppleWatch.BatteryStatus") var WatchBatteryStatus : Double = 0
    var Message : String = ""

    func sessionDidBecomeInactive(_ session: WCSession) {
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        WatchConnectivity = false
    }
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error = error {
            print("WC Session activation failed with error: \(error.localizedDescription)")
            return
        }
        if WCSession.default.isReachable {
            print("Watch Connection Reachable")
        } else {
            print("Watch Connection Unreachable")
        }
    }
//    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
//        print("received message from Watch: \(message)")
//        DispatchQueue.main.async {
//            if let value = message["watch"] as? String {
//                self.Message = String(stringLiteral: value)
//            }
//        }
//    }
//    func sessionReachabilityDidChange(_ session: WCSession) {
//        print(session.isReachable)
//
//    }

    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            UNUserNotificationCenter.current().delegate = self
            //MARK: START UP FUNCTIONS
            seedTasks()
            if WCSession.isSupported() {
                print("Watch Connection Supported")
                WatchConnectivity = false
                let session = WCSession.default
                session.delegate = self
                session.activate()
                print("WCSession Activated: \(session.activationState.rawValue)")
                print(session.receivedApplicationContext)
            } else
            {
                print("Watch Connection Not Supported")
            }
            print("didFinishLaunchingWithOptions = Start Up Functions")

            return true
            //MARK: START UP FUNCTIONS

        }
    // MARK: UISceneSession Life Cycle
  
    func seedTasks() {
    print("View Controller loading finished.")
    let thisMorning = Calendar.current.startOfDay(for: Date())
    let nextMonth = Calendar.current.date(
    byAdding: .month,
    value: 1,
    to: thisMorning
    )
    let dailyElement = OCKScheduleElement(
    start: thisMorning,
    end: nextMonth,
    interval: DateComponents(day: 1),
    text: "Please complete the questionnaire by the end of the day!",
    targetValues: [],
    duration: .allDay
    )
    let weeklyElement = OCKScheduleElement(
    start: thisMorning,
    end: nextMonth,
    interval: DateComponents(weekOfYear: 2),
    text: "Its time to complete the required questionnaire!",
    targetValues: [],
    duration: .allDay
    )
    let onboardSchedule = OCKSchedule.dailyAtTime(
    hour: 0, minutes: 0,
    start: Date(), end: Date(),
    text: "Letter of Information / Consent Form",
    duration: .allDay
    )
    var onboardTask = OCKTask(
    id: TaskIDs.onboarding,
    title: "Onboarding Phase",
    carePlanUUID: publicDS.careplan.uuid,
    schedule: onboardSchedule
    )

    onboardTask.instructions = "You'll need to review to some terms and conditions before proceeding with the study."
    onboardTask.impactsAdherence = true
    let demoschedule = OCKSchedule.dailyAtTime(hour: 0, minutes: 0, start: Date(), end: Date(), text: "Please complete the demographics questionnaire before proceeding with the study!",duration: .allDay)
        var demotask = OCKTask(id: TaskIDs.demographics, title: "Please complete the Demographics Quetionnaire", carePlanUUID: publicDS.careplan.uuid, schedule: demoschedule)
    demotask.impactsAdherence = true
    let PSQISchedule = OCKSchedule(composing: [weeklyElement])
        var PSQITask = OCKTask(id: TaskIDs.PSQI, title: "Sleep Quality Questionnaire", carePlanUUID: publicDS.careplan.uuid, schedule: PSQISchedule)
        PSQITask.impactsAdherence = true

    let GodinSchedule = OCKSchedule(composing: [weeklyElement])
        var GodinTask = OCKTask(id: TaskIDs.GLPAQ, title: "Physical Activity Questionnaire!", carePlanUUID: publicDS.careplan.uuid, schedule: GodinSchedule)
    GodinTask.impactsAdherence = true
    let RecSchedule = OCKSchedule(composing: [dailyElement])
    var RecTask = OCKTask(id: TaskIDs.RecreationalScreenTime, title: "Recreational Screen Time Report", carePlanUUID: publicDS.careplan.uuid, schedule: RecSchedule)
    RecTask.impactsAdherence = true
    let HAMDSchedule = OCKSchedule(composing: [weeklyElement])
    var HAMDTask = OCKTask(
    id: TaskIDs.HAMD6,
    title: "Mental Health Questionnaire",
    carePlanUUID: publicDS.careplan.uuid,
    schedule: HAMDSchedule
    )
    HAMDTask.impactsAdherence = true
    storeManager.store.addAnyTasks(
       [onboardTask, demotask, HAMDTask, GodinTask, RecTask,PSQITask],
       callbackQueue: .main) { result in
       switch result {
       case let .success(tasks):
           Logger.store.info("Seeded \(tasks.count) tasks")
       case let .failure(error):
           Logger.store.warning("Failed to seed tasks: \(error as NSError)")
       }
   }
    }
    
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions) -> UISceneConfiguration {
            UISceneConfiguration(
                name: "Default Configuration",
                sessionRole: connectingSceneSession.role)
        }
    }


extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
           willPresent notification: UNNotification,
           withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        completionHandler([.banner, .badge, .sound])
    }
}

func addNotification(time: Double, title: String, subtitle: String, body: String) {
    let center = UNUserNotificationCenter.current()
    center.getDeliveredNotifications {
        UNNotification in
        center.setBadgeCount(UNNotification.count)
    }
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

extension String {
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }

    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
}
