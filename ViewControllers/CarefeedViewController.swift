import CareKit
import CareKitStore
import CareKitUI
import ResearchKit
import UIKit
import os.log
import MapKit
import SwiftUI
import Foundation
import HealthKit
import UserNotifications
import WatchConnectivity

final class CareFeedViewController: OCKDailyPageViewController,
                                    OCKSurveyTaskViewControllerDelegate {
    @AppStorage("DurationTracking") var DurationTracking : Bool = false
    @AppStorage("onboarding") var onboarding : Bool = false

    @AppStorage("ElapsedTime") var ElapsedTime : Double = 0
    let heartRateQuantity = HKUnit(from: "count/min")
    let healthStore = HKHealthStore()
    let calculate = formulations()
    var contentHidden = false {
        didSet {
            guard contentHidden != oldValue && isViewLoaded else { return }
            children.first?.view.isHidden = contentHidden
        }
    }
    func watchdata() {

    }
    func data() {
        let calculate = formulations()
        calculate.CollectBPM()
        calculate.CollectStepCount()
        calculate.CollectCadence()
        calculate.getrestingHR()
        calculate.getStandTime()
        calculate.CollectMovementDistance()
        calculate.getSleepAnalysis()

    }
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
 
 
    }
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        if reason == .completed {
            // Cancel the scheduled local notification

//            let sig = ConsentDocController.taskViewController?.result.result(forIdentifier: Surveys.ConsentSignature)

           
        }
        // dismiss the task view controller
        dismiss(animated: true, completion: nil)
    }
//    This is just a basic example, you should also consider handling other cases such as when the user dismisses the task view controller without completing the survey task and also you can customize the notification message and fire date to fit your needs.

    override func dailyPageViewController(
        _ dailyPageViewController: OCKDailyPageViewController,
        prepare listViewController: OCKListViewController,
        for date: Date){

            
            self.checkIfOnboardingIsComplete {isOnboarded in
                guard isOnboarded else {
                    
                    let isToday = Calendar.current.compare(
                        date,
                        to: Date(),
                        toGranularity: .day) == .orderedSame
                    
                    let onboardCard = OCKSurveyTaskViewController(
                        taskID: TaskIDs.onboarding,
                        eventQuery: OCKEventQuery(for: date),
                        storeManager: self.storeManager,
                        survey: Surveys.onboardingSurvey(),
                        extractOutcome: { _ in [OCKOutcomeValue(Date())] })
                    onboardCard.surveyDelegate = self
                    listViewController.appendViewController(onboardCard,animated: false)
                    listViewController.view.isUserInteractionEnabled = isToday
                    listViewController.view.alpha = !isToday ? 0.4 : 1.0
                    return
                }

                self.data()
                
                let isToday = Calendar.current.compare(
                    date,
                    to: Date(),
                    toGranularity: .day) == .orderedSame
                //                self.fetchTasks(on: date, completion: {
                //                    tasks in tasks
                //                    if tasks.isEmpty {
                //
                //                    }
                //                    else {
                //                        let TaskCount = tasks.count
                //                        self.addNotification(time: 5, title: "Mindful Moves!", subtitle: "Todays Task Count: \(TaskCount) ", body: "Hello, Don't forget to complete the assigned tasks by the end of the day!")
                //                    }
                //                })
                self.fetchTasks(on: date) { tasks in
                    tasks.compactMap {
                        let card = self.taskViewController(for: $0, on: date)
                        card?.view.isUserInteractionEnabled = isToday
                        card?.view.alpha = !isToday ? 0.4 : 1.0
                        card?.view.isHidden = !isToday
                        return card
                    }.forEach {
                        listViewController.appendViewController($0, animated: false)
                    }
                }
//                let signaturecard = OCKSimpleTaskView()
//                signaturecard.completionButton.isHidden = true
//                signaturecard.addSubview(UIImageView(image: image))
//                listViewController.appendView(signaturecard, animated: false)
                
            }
        }
    
    private func checkIfOnboardingIsComplete(_ completion: @escaping (Bool) -> Void) {
        var query = OCKOutcomeQuery()
        query.taskIDs = [TaskIDs.onboarding]
        storeManager.store.fetchAnyOutcomes(query: query,callbackQueue: .main) { result in switch result {
        case .failure:
                Logger.feed.error("Failed to fetch onboarding outcomes!")
                completion(false)
            case let .success(outcomes):


                completion(!outcomes.isEmpty)
            }
        }
    }
    
    private func checkifdemo(_ completion: @escaping (Bool) -> Void) {
        var query = OCKOutcomeQuery()
        query.taskIDs = [TaskIDs.demographics]
        storeManager.store.fetchAnyOutcomes(
            query: query,
            callbackQueue: .main) { result in switch result {
                
            case .failure:
                Logger.feed.error("Failed to fetch Demo outcomes!")
                completion(false)
            case let .success(outcomes):
                completion(!outcomes.isEmpty)
            }
        }
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

    func enableBackgroundDelivery(for type: HKObjectType, frequency: HKUpdateFrequency) async throws {}
   
    private func fetchTasks(
        on date: Date,
        completion: @escaping([OCKAnyTask]) -> Void) {
        var query = OCKTaskQuery(for: date)
        query.excludesTasksWithNoEvents = true
        storeManager.store.fetchAnyTasks(
            query: query,
            callbackQueue: .main) { result in
            switch result {
            case .failure:
                Logger.feed.error("Failed to fetch tasks for date \(date)")
                completion([])
            case let .success(tasks):
                completion(tasks)
            }
        }
    }

    private func taskViewController(
        for task: OCKAnyTask,
        on date: Date) -> UIViewController? {
        switch task.id {
        case TaskIDs.PSQI:
            let survey = OCKSurveyTaskViewController(
            task: task,
            eventQuery: OCKEventQuery(for: date),
            storeManager: storeManager,
            survey: Surveys.SleepQualityQuestionnaire(),
            viewSynchronizer: SurveyViewSynchronizer(),
            extractOutcome: Surveys.extractAnswersPSQI
            )
            survey.surveyDelegate = self
            return survey
        case TaskIDs.demographics:
            let survey = OCKSurveyTaskViewController(
            task: task,
            eventQuery: OCKEventQuery(for: date),
            storeManager: storeManager,
            survey: Surveys.DemographicsSurvey,
            viewSynchronizer: SurveyViewSynchronizer(),
            extractOutcome: Surveys.extractAnswersDemographics
            )
            survey.surveyDelegate = self
            return survey
        case TaskIDs.HAMD6:
            let survey = OCKSurveyTaskViewController(
            task: task,
            eventQuery: OCKEventQuery(for: date),
            storeManager: storeManager,
            survey: Surveys.HamiltonDepression6Item(),
            viewSynchronizer: SurveyViewSynchronizer(),
            extractOutcome: Surveys.extractAnswersFromHAMD
            )
            survey.surveyDelegate = self
            return survey
        case TaskIDs.GLPAQ:
            let survey = OCKSurveyTaskViewController(
                task: task,
                eventQuery: OCKEventQuery(for: date),
                storeManager: storeManager,
                survey: Surveys.GODIN(),
                extractOutcome: Surveys.ExtractGodinOutcomes
            )
            survey.surveyDelegate = self
            return survey
        case TaskIDs.RecreationalScreenTime:
            let survey = OCKSurveyTaskViewController(
                task: task,
                eventQuery: OCKEventQuery(for: date),
                storeManager: storeManager,
                survey: Surveys.RecST(),
                extractOutcome: Surveys.extractRecSTOutcome
            )
            survey.surveyDelegate = self
            return survey
        case TaskIDs.onboarding:
            let survey = OCKSurveyTaskViewController(
                task: task,
                eventQuery: OCKEventQuery(for: date),
                storeManager: storeManager,
                survey: Surveys.onboardingSurvey(),
                extractOutcome:   { _ in [OCKOutcomeValue(Date())] }
            )
            survey.surveyDelegate = self
            return survey
        default:
            return nil
        }
    }
      // MARK: SurveyTaskViewControllerDelegate
    func surveyTask(
        viewController: OCKSurveyTaskViewController,
        for task: OCKAnyTask,
        didFinish result: Result<ORKTaskViewControllerFinishReason, Error>) {
        if case let .success(reason) = result, reason == .completed {
            reload()
        }
    }

    func surveyTask(
        viewController: OCKSurveyTaskViewController,
        shouldAllowDeletingOutcomeForEvent event: OCKAnyEvent) -> Bool {

        event.scheduleEvent.start != Calendar.current.startOfDay(for: Date())
    }
    }
final class SurveyViewSynchronizer: OCKSurveyTaskViewSynchronizer {
    override func updateView(
        _ view: OCKInstructionsTaskView,
        context: OCKSynchronizationContext<OCKTaskEvents>) {
        super.updateView(view, context: context)
            
        if let event = context.viewModel.first?.first, event.outcome != nil {
            let Age = event.answer(kind: Surveys.ConsentSignature)
            view.instructionsLabel.text = """
            Age: \(Age)
"""
            view.instructionsLabel.isHidden = false
 
        } else {
            view.instructionsLabel.isHidden = true
        }
    }
}

