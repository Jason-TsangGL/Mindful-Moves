import CareKitStore
import ResearchKit
import UIKit
import HealthKit
import SwiftUI
import Foundation

struct Surveys {
    
    private init() {}
    
    // MARK: Onboarding STEP ====================================================================================================================================================================================
    static let ConsentSignature = "Participant.Consent.Signature" // CHANGE CONSENT SIGNATURE IDENTIFIER
    static let OnboardStep = "Participant.OnboardStep" // CHANGE CONSENT SIGNATURE IDENTIFIER
    static let ConsentForm = "Participant.Consent.Form" // CHANGE CONSENT SIGNATURE IDENTIFIER
    
    static func onboardingSurvey() -> ORKTask {
        //MARK: The Welcome Instruction step.
        let welcomeInstructionStep = ORKInstructionStep(
            identifier: "onboarding.welcome"
        )
        welcomeInstructionStep.title = "Welcome to Mindful Moves!"
        welcomeInstructionStep.detailText = """

Thank you for your interest our study!

This is a current study being conducted by the Exercise & Health Psychology Laboratory

You are invited to participate in this study if you are a current student of Western University.

Tap Next to learn more before signing up.
"""
        welcomeInstructionStep.image = UIImage(named: "FeaturedIcon")
        welcomeInstructionStep.headerTextAlignment = .center
        welcomeInstructionStep.centerImageVertically = true
        //MARK: Letter of Information Overview / Summary.
        let studyOverviewInstructionStep = ORKInstructionStep(
            identifier: "onboarding.overview"
        )
        
        studyOverviewInstructionStep.title = "Before You Join"
        studyOverviewInstructionStep.iconImage = UIImage(systemName: "checkmark.seal.fill")
        //MARK: STEP I
        let heartBodyItem = ORKBodyItem(
            text: "Informed Consent",
            detailText: "Before joining, we will ask you to sign an informed consent document.",
            image: UIImage(systemName: "signature"),
            learnMoreItem: nil,
            bodyItemStyle: .image
        )
        //MARK: STEP II
        let completeTasksBodyItem = ORKBodyItem(
            text: "Complete various tasks during the study.",
            detailText: "Example of tasks are questionnaires, and watch wearing and charging requirements.",
            image: UIImage(systemName: "checkmark.circle.fill"),
            learnMoreItem: nil,
            bodyItemStyle: .image
        )
        //MARK: STEP III
        let signatureBodyItem = ORKBodyItem(
            text: "Health Data Collection",
            detailText: "The study will ask you to share some of your health & physical activity data.",
            image: UIImage(systemName: "heart.fill"),
            learnMoreItem: nil,
            bodyItemStyle: .image
        )
        //MARK: STEP IV
        let secureDataBodyItem = ORKBodyItem(
            text: "Your data is kept private and secure.",
            detailText: "How is it stored? Encryption? Anonymous Data.",
            image: UIImage(systemName: "lock.fill"),
            learnMoreItem: nil,
            bodyItemStyle: .image
        )
        //MARK: STEP V
        let datadeletionItem = ORKBodyItem(
            text: "Voluntary Withdrawal",
            detailText: "Voluntary Withdrawal will lead to all data collected by this device will be permanently deleted",
            image: UIImage(systemName: "trash.fill"),
            learnMoreItem: nil,
            bodyItemStyle: .image)
        
        
        studyOverviewInstructionStep.bodyItems = [
            heartBodyItem,
            completeTasksBodyItem,
            signatureBodyItem,
            secureDataBodyItem,
            datadeletionItem
        ]
        studyOverviewInstructionStep.headerTextAlignment = .center
        //MARK: COMPILING ALL STEPS INTO ORDERED TASK
        //Why is the study being done?
        let RationaleStep = ORKInstructionStep(identifier: "steps")
        RationaleStep.title = "Study Purpose"
        RationaleStep.headerTextAlignment = .center
        RationaleStep.detailText = """
        We are looking to advance our understanding of the causes and trajectories of mental health symptoms.
        
        In particular depressive symptoms, and its potential relationship to physical activity, sedentary behaviour and sleep.
        """
        RationaleStep.image = UIImage(named: "Purpose")
        RationaleStep.centerImageVertically = true
        RationaleStep.imageContentMode = .scaleAspectFill
        
        //MARK: DATA COLLECTION NOTICE
        let ChargeLMIStep = ORKLearnMoreInstructionStep(identifier: "ChargeLMI")
        ChargeLMIStep.title = "Battery & Charging Adherence Requirements"
        ChargeLMIStep.detailText = "Over the two weeks, we will ask you to adhere to:"
        ChargeLMIStep.bodyItems = [
            ORKBodyItem(
                text: "Apple Watch Charging Requirements",
                detailText: "Charge for a minimum of two (2) consecutive hours each day while the devices are connected via bluetooth and Wi-Fi.",
                image: UIImage(systemName: "applewatch"),
                learnMoreItem: nil,
                bodyItemStyle: .image),
            ORKBodyItem(text: "iPhone Charging Requirements", detailText: "There are no specific duration of charging for the iPhone, but we ask that you keep your phone charged and to charge your phone whenever necessary. We do kindly ask that the phone do remain within physical access to you at all times.", image: UIImage(systemName: "iphone"), learnMoreItem: nil, bodyItemStyle: .image),
            ORKBodyItem(text: "Optional Requirements", detailText: "If you are one to use your devices often, then it might be the case in which you may need to charge your Apple Watch for an additional two (2) consecutive hours to adhere to study requirements", image: UIImage(systemName: "battery.50"), learnMoreItem: nil, bodyItemStyle: .image),
            ORKBodyItem(text: "Examples", detailText: "These are some scenarios in which charging your devices would help adhere to charging requirements.", image: UIImage(systemName: "cable.connector"), learnMoreItem: nil, bodyItemStyle: .text),
            ORKBodyItem(
                text: "During your Shower/Bath",
                detailText: "",
                image: UIImage(systemName: "shower.fill"),
                learnMoreItem: nil,
                bodyItemStyle: .image),
            ORKBodyItem(text: "During lectures", detailText: "", image: UIImage(systemName: "rectangle.and.pencil.and.ellipsis"), learnMoreItem: nil, bodyItemStyle: .image),
            ORKBodyItem(text: "Studying Sessions", detailText: "", image: UIImage(systemName: "pencil.and.ruler.fill"), learnMoreItem: nil, bodyItemStyle: .image),
            ORKBodyItem(text: "Eating Meals", detailText: "", image: UIImage(systemName: "fork.knife"), learnMoreItem: nil, bodyItemStyle: .image)
        ]
        ChargeLMIStep.headerTextAlignment = .center
        ChargeLMIStep.iconImage = UIImage(systemName: "battery.100.circle.fill")
        let ChargeLMI = ORKLearnMoreItem(text: "Learn more.", learnMoreInstructionStep: ChargeLMIStep)
        
        let dataStep = ORKInstructionStep(identifier: "data")
        dataStep.title = "How will participation data be used?"
        dataStep.headerTextAlignment = .center
        dataStep.detailText = """
        The data we collect through your participation will help answer this question by advancing our investigation into the potential relationship between physical activity, sedentary behaviour and sleep with mental health symptoms.
        """
        dataStep.iconImage = UIImage(named: "dataanalysis")
        dataStep.bodyItems = [
            ORKBodyItem(
                text: "Mobility Data",
                detailText: "Step Count, Walk + Run Distance, Cadence, Stand Time, Sit Time.",
                image: UIImage(systemName: "figure.run.circle"),
                learnMoreItem: nil,
                bodyItemStyle: .image),
            ORKBodyItem(text: "Motion Sensors", detailText: "Stationary, Walking, Running, Sedentary, Laying down.", image: UIImage(systemName: "sensor.fill"), learnMoreItem: nil, bodyItemStyle: .image),
            ORKBodyItem(text: "Heart Health Data", detailText: "Beat-to-Beat Readings, Heart Rate, Resting & Walking Heart Rate, Motion Context", image: UIImage(systemName: "bolt.heart"), learnMoreItem: nil, bodyItemStyle: .image),
            ORKBodyItem(text: "Sleeping Habits", detailText: "Time spent in bed, time spent asleep, time enter/exit bed measured by devices.", image: UIImage(systemName: "bed.double.fill"), learnMoreItem: nil, bodyItemStyle: .image),
            ORKBodyItem(text: "Battery & Charging Status", detailText: "iPhone & Watch battery percentage, battery status, duration of status.", image: UIImage(systemName: "battery.100.bolt"), learnMoreItem: ChargeLMI, bodyItemStyle: .image)
        ]
        //MARK: STUDY DURATION
        let durationstep = ORKInstructionStep(identifier: "studyduration")
        durationstep.title = "How long will you be in this study?"
        durationstep.detailText = "Study participation is expected to require at most 60 minutes of dedicated time over two weeks."
        durationstep.image = UIImage(named: "Duration")
        durationstep.headerTextAlignment = .center
        durationstep.centerImageVertically = true
        
        //MARK: // PROCEDURE BODY ITEMS -
        //MARK: Watch Body Item
        let WatchLMIStep = ORKLearnMoreInstructionStep(identifier: "WearLMI")
        WatchLMIStep.title = "Device Wearing Requirements"
        
        WatchLMIStep.bodyItems = [
            ORKBodyItem(
                text: "Apple Watch Wearing Requirements",
                detailText: "Use these devices daily, which includes wearing the Apple Watch that is provided by the study for at least 20 hours each day (including sleeping with the Apple Watch on)",
                image: UIImage(systemName: "applewatch"),
                learnMoreItem: nil,
                bodyItemStyle: .image),
            ORKBodyItem(text: "Bluetooth Connection", detailText: "A connection via Bluetooth is required at all times or you may be locked from the application.", image: UIImage(systemName: "antenna.radiowaves.left.and.right"), learnMoreItem: nil, bodyItemStyle: .image),
            ORKBodyItem(text: "Wi-Fi Connection", detailText: "Internet connection is essential at all times. If there are short periods of time where an internet connection is unavailable, please find a network as soon as possible.", image: UIImage(systemName: "wifi.exclamationmark"), learnMoreItem: nil, bodyItemStyle: .image)
        ]
        WatchLMIStep.headerTextAlignment = .center
        WatchLMIStep.iconImage = UIImage(systemName: "applewatch")
        let WatchLMI = ORKLearnMoreItem(text: "Learn more.", learnMoreInstructionStep: WatchLMIStep)
        
        //MARK: Charging Body Item
        
        //MARK: Questionnaire Body Item
        let QTLMIStep = ORKLearnMoreInstructionStep(identifier: "QTLMI")
        QTLMIStep.title = "Questionnaires"
        QTLMIStep.detailText = "Over the two weeks, we will ask you to complete:"
        QTLMIStep.bodyItems = [
            ORKBodyItem(
                text: "Demographics Questionnaire",
                detailText: "This will be administered ONCE.",
                image: UIImage(systemName: "applewatch"),
                learnMoreItem: nil,
                bodyItemStyle: .image),
            ORKBodyItem(text: "Mental Health Questionnaire", detailText: "Charging your Apple Watch and iPhone for at least two (2) hours /day (twice if needed) while the devices are connected via Bluetooth and on the same Wi-Fi.", image: UIImage(systemName: "brain"), learnMoreItem: nil, bodyItemStyle: .image),
            ORKBodyItem(text: "Sleep Questionnaire", detailText: "You will be asked to complete, daily, weekly and bi-weekly Questionnaires", image: UIImage(systemName: "bed.double.fill"), learnMoreItem: nil, bodyItemStyle: .image),
            ORKBodyItem(text: "Screen-Time Usage Questionnaire", detailText: "You can only use your iPhone with your iCloud account to ensure data integrity and confidentiality.", image: UIImage(systemName: "hourglass"), learnMoreItem: nil, bodyItemStyle: .image),
            ORKBodyItem(text: "Physical Activity Questionnaire", detailText: "There are no restrictions, so long as it does not affect your participation in this study and you complete the required assessments as part of this study.", image: UIImage(systemName: "figure.martial.arts"), learnMoreItem: nil, bodyItemStyle: .image)
        ]
        QTLMIStep.headerTextAlignment = .center
        QTLMIStep.iconImage = UIImage(systemName: "list.bullet.clipboard.fill")
        let QTLMI = ORKLearnMoreItem(text: "Learn more.", learnMoreInstructionStep: QTLMIStep)
        //MARK: PROCEDURES OF STUDY
        let procedurestep = ORKInstructionStep(identifier: "procedure")
        procedurestep.title = "What to Expect"
        procedurestep.detailText = "Over the next two (2) weeks, We will ask you to:"
        procedurestep.bodyItems = [
            ORKBodyItem(
                text: "Apple Watch Wearing Requirements",
                detailText: "Use these devices daily, which includes wearing the Apple Watch that is provided by the study for at least 20 hours each day (including sleeping with the Apple Watch on)",
                image: UIImage(systemName: "applewatch"),
                learnMoreItem: WatchLMI,
                bodyItemStyle: .image),
            ORKBodyItem(text: "Daily Charging Requirements", detailText: "Charging your Apple Watch and iPhone for at least two (2) hours /day (twice if needed) while the devices are connected via Bluetooth and on the same Wi-Fi.", image: UIImage(systemName: "bolt.fill"), learnMoreItem: ChargeLMI, bodyItemStyle: .image),
            ORKBodyItem(text: "Questionnaires", detailText: "You will be asked to complete, daily, weekly and bi-weekly Questionnaires", image: UIImage(systemName: "list.bullet.clipboard"), learnMoreItem: QTLMI, bodyItemStyle: .image),
            ORKBodyItem(text: "Do not share your Apple Watch", detailText: "Only use your iPhone with your iCloud account to ensure data integrity and confidentiality.", image: UIImage(systemName: "applewatch"), learnMoreItem: nil, bodyItemStyle: .image),
            ORKBodyItem(text: "Continue your regular routine!", detailText: "There are no restrictions, so long as it does not affect your participation in this study.", image: UIImage(systemName: "forward.end.fill"), learnMoreItem: nil, bodyItemStyle: .image)
        ]
        procedurestep.headerTextAlignment = .center
        procedurestep.iconImage = UIImage(named:"expectations")
        
        let riskbenefitstep = ORKInstructionStep(identifier: "risk.benefit")
        riskbenefitstep.title = "Risks & Benefits"
        riskbenefitstep.detailText = """
This study does not provide any potentially beneficial treatment or expose one to harm.
This study will inconvenience participants for charging adherence (~4h/day) and completing assigned questionnaires (<1hr/day).

You may benefit from participation in this study. You do not have to participate in this study to receive any potential benefits. However, researchers hope this study will fulfill its purpose and help others in the future.
"""
        riskbenefitstep.headerTextAlignment = .center
        riskbenefitstep.iconImage = UIImage(named: "procon")
        //MARK: PARTICIPANT DATA SECURITY & PRIVACY
        let datasecuritystep = ORKInstructionStep(identifier: "datasecurity")
        datasecuritystep.iconImage = UIImage(named: "security")
        datasecuritystep.title = "Data Privacy & Security"
        datasecuritystep.detailText = """
​​The Principal Investigator and Co-Investigator will be the only individuals authorized to access the collected information.

A secure on-campus storage drive holds all information provided to the researcher in the strictest confidence. You will be assigned an identification number, and all data collected will be recorded and stored under this number.

Study researchers will not connect you to your data. The application will remove all personal identifiers and assign a random ID to the data.

All data will remain securely stored locally until the completion of the study. All relevant data will be aggregated and sent to the lab's secured storage server on campus with additional security measures to ensure data safety.

Delegated institutional representatives of Western University or its Research Ethics Boards (REBs) may require access to your study-related records to monitor the conduct of the research per regulatory requirements.

The laboratory will store your data for seven years per Western University policy or one year after the last use.

The laboratory will take all security and protection protocols to ensure the privacy of your research data.

All Coded Study Data will be treated per this consent form and its privacy policy
(https://www.apple.com/legal/privacy/apple-health-studies/en-ww/).

Once the study and analysis of the collected confidential information are completed, the researchers will erase all stored participant data per the DoD 5220.22-M standards.
"""
        datasecuritystep.headerTextAlignment = .center
        //MARK: PARTICIPANT'S RIGHTS & COMPENSATION
        
        let rightcompensationstep = ORKInstructionStep(identifier: "right.compensation")
        rightcompensationstep.title = "Participant's Rights & Compensation"
        rightcompensationstep.detailText = "Taking part in this research study is voluntary."
        rightcompensationstep.iconImage = UIImage(named: "UWOCREST")
        rightcompensationstep.bodyItems = [
            ORKBodyItem(text: "You DO NOT have to participate in this study.", detailText: nil, image: nil, learnMoreItem: nil, bodyItemStyle: .text),
            ORKBodyItem(text: "If you choose to participate in this study, you HAVE the right to STOP at any time.", detailText: nil, image: nil, learnMoreItem: nil, bodyItemStyle: .text),
            ORKBodyItem(text: "If you decide not to be in this research or if you decide to withdraw voluntarily, there will be no penalty of loss of benefits to which you are entitled.", detailText: nil, image: nil, learnMoreItem: nil, bodyItemStyle: .text),
            ORKBodyItem(text: "If you withdraw voluntarily and then choose to participate again, you may be allowed to enroll as long as the study is still active.", detailText: nil, image: nil, learnMoreItem: nil, bodyItemStyle: .text)]
        rightcompensationstep.headerTextAlignment = .center
        //MARK: ABILITY TO WITHDRAW ANYTIME
        
        let voluntarywithdrawalstep = ORKInstructionStep(identifier: "withdrawals")
        voluntarywithdrawalstep.title = "Voluntary Withdrawal"
        voluntarywithdrawalstep.centerImageVertically = true
        voluntarywithdrawalstep.iconImage = UIImage(named: "withdrawal")
        voluntarywithdrawalstep.detailText = """
Yes. Participation in research is entirely voluntary.

You may withdraw without penalty, which can be done on the settings page in the application by pressing the “Withdraw from Study” button.

Withdrawal will prompt the application to overwrite all data collected and reset the application to factory settings. Another option is to delete the application and follow the instructions about deleting data stored from the “Mindful Moves” application.

Withdrawal will mean that study staff will not have access to your research data, and “Mindful Moves” will send no data before study completion.

If you have completed the study and wish to remove your data, that will not be possible, as all data is unidentifiable. However, Researchers will report all published participant data in an aggregate and anonymized way.

If you wish to leave the study part way through, you may do so, but any data collected up to that point will remain part of the study data as we cannot identify which data is specifically yours, but no more data about you will be collected.
"""
        voluntarywithdrawalstep.headerTextAlignment = .center
        
        //MARK: WHO TO CONTACT FOR QUESTIONS
        
        let questionsstep = ORKInstructionStep(identifier: "questions")
        questionsstep.title = "Who to Contact"
        questionsstep.detailText = """
A frequently asked questions (FAQ) document is provided, which answers most of the common questions.

If you still need to meet your satisfactory requirements, feel free to get in touch with the co-investigator/app developer, Jason Tsang (jtsang83@uwo.ca).

In addition, the principal investigator Dr. Harry Prapavessis Ph.D. (hprapave@uwo.ca), may also be contacted if the options mentioned above need to be revised.

You may also contact the Privacy Office at Western University at (519)-661-2111 extension 84543 or privacy.office@uwo.ca  if you have questions about protecting your data.

You may also contact the Office of Research Ethics at Western University at (519)-661-3036, ethics@uwo.ca if you:
"""
        questionsstep.bodyItems = [
            ORKBodyItem(text: "Have questions regarding your rights as a person in a research study.", detailText: nil, image: nil, learnMoreItem: nil, bodyItemStyle: .bulletPoint),
            ORKBodyItem(text: "Have concerns, complaints, or general questions about the research.", detailText: nil, image: nil, learnMoreItem: nil, bodyItemStyle: .bulletPoint),
            ORKBodyItem(text: "You may also call this number if you are still trying to reach any research team. Or if you wish to offer input or talk to someone else about any concerns related to the research.", detailText: nil, image: nil, learnMoreItem: nil, bodyItemStyle: .bulletPoint)]
        questionsstep.headerTextAlignment = .center
        questionsstep.iconImage = UIImage(named: "contact")
        //MARK: INFORMED CONSENT MEANING
        
        let informconsentreview = ORKInstructionStep(identifier: "informed.consent.meaning")
        informconsentreview.title = "What does Providing Informed Consent mean?"
        informconsentreview.detailText = "If you believe that these statements are true to you, then please proceed to reviewing the Letter of Information"
        informconsentreview.bodyItems = [
            ORKBodyItem(text: "You understand the information given to you in this document", detailText: nil, image: nil, learnMoreItem: nil, bodyItemStyle: .text),
            ORKBodyItem(text: "You have been able to have any questions or concerns answered to your satisfaction.", detailText: nil, image: nil, learnMoreItem: nil, bodyItemStyle: .text),
            ORKBodyItem(text: "You believe you understand the research study and the potential benefits and risks.", detailText: nil, image: nil, learnMoreItem: nil, bodyItemStyle: .text)]
        informconsentreview.headerTextAlignment = .center
        informconsentreview.iconImage = UIImage(named: "Consent")
        //MARK: Collection of Informed Consent Signature via HTML format.

      

        //MARK: Request permission from user to read specified Health Data Types.
        let healthKitTypesToRead: Set<HKObjectType> = [
            HKObjectType.activitySummaryType(),
            HKObjectType.quantityType(forIdentifier: .appleStandTime)!,
            HKObjectType.quantityType(forIdentifier: .appleMoveTime)!,
            HKObjectType.quantityType(forIdentifier: .stepCount)!,
            HKObjectType.quantityType(forIdentifier: .appleExerciseTime)!,
            HKObjectType.quantityType(forIdentifier: .restingHeartRate)!,
            HKObjectType.quantityType(forIdentifier: .walkingHeartRateAverage)!,
            HKObjectType.seriesType(forIdentifier: HKDataTypeIdentifierHeartbeatSeries)!,
            HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!,
            HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
            HKObjectType.quantityType(forIdentifier: .basalEnergyBurned)!,
            HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis)!,
            HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!,
            HKObjectType.quantityType(forIdentifier: .heartRateVariabilitySDNN)!,
            HKObjectType.quantityType(forIdentifier: .heartRate)!,
            HKObjectType.workoutType(),
            HKSeriesType.heartbeat()
        ]
        
        let healthKitPermissionType = ORKHealthKitPermissionType(
            sampleTypesToWrite: nil,
            objectTypesToRead: healthKitTypesToRead
        )
        //MARK: Request Permission from user to send Push Notifications to device
        let notificationsPermissionType = ORKNotificationPermissionType(
            authorizationOptions: [.alert, .badge, .sound]
        )
        let motionPermissionType = ORKMotionActivityPermissionType()
        let requestPermissionsStep = ORKRequestPermissionsStep(
            identifier: "onboarding.requestPermissionsStep",
            permissionTypes: [
                healthKitPermissionType,
                notificationsPermissionType,
                motionPermissionType
            ]
        )
        
        requestPermissionsStep.title = "Health Data Request"
        requestPermissionsStep.text = "Please review the health data types below and enable sharing to contribute to the study."
        
        //MARK: COMPLETION OF ELIGIBILITY, ONBOARDING & INFORMED CONSENT SIGNATURE COLLECTED
        let completionStep = ORKCompletionStep(
            identifier: "onboarding.completionStep")
        completionStep.title = "Enrollment Complete"
        completionStep.text = "Thank you for enrolling in this study. Your participation will contribute to meaningful research!"
        
        let surveyTask = ORKOrderedTask(
            identifier: OnboardStep,
            steps: [
                welcomeInstructionStep,
                studyOverviewInstructionStep,
                RationaleStep,
                dataStep,
                durationstep,
                procedurestep,
                riskbenefitstep,
                datasecuritystep,
                rightcompensationstep,
                voluntarywithdrawalstep,
                questionsstep,
                informconsentreview,
                ConsentDocController.step!,
                requestPermissionsStep,
                completionStep
            ]
        )
        return surveyTask
    }
    
    // MARK: Demographics Questionnaire ==============================================================================================================================================================================================================
    static let demographics = "demographics"
    static let DemographicFormStep = "DemographicForm"
    static let DemoFormIdentifier = "demographics.Introduction"
    static let DemoFormComplete = "demographics.form.complete"
    static let DemoFormAgeIdentifier = "demographics.form.age"
    static let DemoFormBGIdentifier = "demographics.form.bg"
    static let DemoFormSexIdentifier = "demographics.form.sex"
    static let DemoFormUNIIdentifier = "demographics.form.uni"
    static let DemoformSESIdentifier = "demographics.form.ses"
    static let DemoFormGenderIdentifier = "demographics.form.gender"
    static let DemoFormUNIYEARSIdentifier = "demographics.form.uniyears"
    static let DemoFormDepartmentIdentifier = "demographics.form.department"
    static let DemoFormMartialIdentifier = "demographics.form.martial"
    static let DemoFormEmploymentIdentifier = "demographics.form.employment"
    
    static let DemographicsSurvey: ORKOrderedTask = {
        var steps = [ORKStep]()
        
        // Instruction step
        let instructionStep = ORKInstructionStep(identifier: DemoFormIdentifier)
        instructionStep.title = "Demographic Survey"
        instructionStep.text = "To further provide insight in our research, we kindly ask you to answer some basic demographic questions."
        
        steps += [instructionStep]
        // MARK: DEMOGRAPHIC - AGE
        let AgeAnswerFormat = ORKAnswerFormat.integerAnswerFormat(withUnit:"years")
        let AgeItem = ORKFormItem(identifier: DemoFormAgeIdentifier, text: "", answerFormat: AgeAnswerFormat, optional: false)
        // MARK: DEMOGRAPHIC - GENDER
        let GenderOptions = [
            ORKTextChoice(text: "Male", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Female", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Other", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Prefer to not say", value: 0 as NSCoding & NSCopying & NSObjectProtocol)
        ]
        let GenAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: GenderOptions)
        let GenItem = ORKFormItem(identifier: DemoFormGenderIdentifier, text: "What is your Gender?", answerFormat: GenAnswerFormat, optional: false)
        
        // MARK: DEMOGRAPHIC - SEX AT BIRTH
        let SexOptions = [
            ORKTextChoice(text: "Male", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Female", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Other", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Prefer not to say", value: 4 as NSCoding & NSCopying & NSObjectProtocol)
        ]
        let SexAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: SexOptions)
        let SexItem = ORKFormItem(identifier: DemoFormSexIdentifier, text: "What is your Sex at birth?", answerFormat: SexAnswerFormat, optional: false)
        
        
        // MARK: DEMOGRAPHIC - EDUCATION ATTAINMENT
        let EducationOptions = [
            
            ORKTextChoice(text: "Bachelor's Degree", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Master's Degree", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Professional Program", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Trade School", value: 4 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Prefer not to say", value: 0 as NSCoding & NSCopying & NSObjectProtocol)
        ]
        let EducationAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: EducationOptions)
        let EducationItem = ORKFormItem(identifier: DemoFormUNIIdentifier, text: "What is the highest degree or level of education you have completed?", answerFormat: EducationAnswerFormat, optional: false)
        // MARK: DEMOGRAPHIC - STUDENT TYPE
        
        let StudentTypeOptions = [
            ORKTextChoice(text: "New", value: 0 as NSCoding & NSCopying & NSNumber),
            ORKTextChoice(text: "Returning", value: 1 as NSCoding & NSCopying & NSNumber)
        ]
        let EducationYearsAnswerFormat = ORKTextChoiceAnswerFormat(style: .singleChoice, textChoices: StudentTypeOptions)
        let StudentTypeItem = ORKFormItem(identifier: DemoFormUNIYEARSIdentifier, text: "What type of student are you?", answerFormat: EducationYearsAnswerFormat, optional: false)
        
        // MARK: DEMOGRAPHIC - FIELD OF STUDY
        //
        let HousingOptions = [
            ORKTextChoice(text: "On Campus", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Off Campus",value: 2 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "No Stable Housing",value: 3 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Prefer to not say", value: 0 as NSCoding & NSCopying & NSObjectProtocol)
        ]
        let HousingAF : ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: HousingOptions)
        let HousingItem = ORKFormItem(identifier: DemoFormDepartmentIdentifier, text: "What is your living situation?", answerFormat: HousingAF, optional: false)
        
        // MARK: DEMOGRAPHIC - ETHNICITY BACKGROUND
        let BGAnswerOptions = [
            ORKTextChoice(text: "Caucasian", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "African-American", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Latino or Hispanic", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Asian", value: 4 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Indigenous", value: 5 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Pacific Islander", value: 6 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Two (2) or more", value: 7 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Other/Unknown", value: 8 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Prefer not to say", value: 0 as NSCoding & NSCopying & NSObjectProtocol)
        ]
        let BGAnswerFormat = ORKTextChoiceAnswerFormat(style: .singleChoice, textChoices: BGAnswerOptions)
        let BGItem = ORKFormItem(identifier: DemoFormBGIdentifier, text: "What is your ethnicity/background?", answerFormat: BGAnswerFormat, optional: false)
        // MARK: DEMOGRAPHIC - MARITAL STATUS
        let MaritalStatusOptions = [
            ORKTextChoice(text: "Single", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Dating", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Married", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Separated", value: 4 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Divorced", value: 5 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Prefer to not say", value: 0 as NSCoding & NSCopying & NSObjectProtocol)
        ]
        let MaritalStatusAnswerFormat : ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: MaritalStatusOptions)
        let MaritalStatusItem = ORKFormItem(identifier: DemoFormMartialIdentifier, text: "What is your Marital Status?", answerFormat: MaritalStatusAnswerFormat, optional: false)
        
        
        // MARK: DEMOGRAPHIC - EMPLOYMENT STATUS
        let EmploymentStatusTitle = "Employment Status"
        let EmploymentStatusOptions = [
            ORKTextChoice(text: "Unemployed", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Employed", value: 1 as NSCoding & NSCopying & NSObjectProtocol)
        ]
        let EmploymentStatusAnswerFormat : ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: EmploymentStatusOptions)
        let EmploymentStatusItem = ORKFormItem(identifier: DemoFormEmploymentIdentifier, text: "What is your Employment Status?", answerFormat: EmploymentStatusAnswerFormat, optional: false)
        let SESOptions = [
            ORKTextChoice(text: "Low", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "High", value: 1 as NSCoding & NSCopying & NSObjectProtocol)
        ]
        let SESAnswerFormat : ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: SESOptions)
//        ORKAnswerFormat.scale(withMaximumValue: 1, minimumValue: 0, defaultValue: Int(), step: 1, vertical: false, maximumValueDescription: "Low", minimumValueDescription: "High")?
        let SESitem = ORKFormItem(identifier: DemoformSESIdentifier, text: "What are your Parent/Guardian education status?", answerFormat: SESAnswerFormat, optional: false)
        
        let formstep = ORKFormStep(identifier: DemographicFormStep, title: "Demographic Questionnaire", text: "")
        formstep.formItems = [ORKFormItem(sectionTitle: "What is your age?") ,AgeItem,GenItem,SexItem,BGItem,EmploymentStatusItem,SESitem,MaritalStatusItem,EducationItem,StudentTypeItem,HousingItem]
        formstep.isOptional = false
        // MARK: Summary step
        steps += [formstep]
        let summaryStep = ORKCompletionStep(identifier: DemoFormComplete)
        summaryStep.title = "Thank you."
        summaryStep.text = "We appreciate your time."
        summaryStep.iconImage = UIImage(named: "FeaturedIcon")
        
        steps += [summaryStep]
        
        return ORKOrderedTask(identifier: demographics, steps: steps)
    }()
    
    // MARK: RECREATIONAL SCREENTIME QUESTIONNAIRE ======================================================================================================================================
    
    static let RecreationalScreentime = "RecreationalScreenTime"
    static let RecreationalScreentimeform = "RecreationalScreenTime.form"
    static let EntSTHR = "RecreationalScreenTime.Entertainment.hour"
    static let SocSTHR = "RecreationalScreenTime.Social.hour"
    
    static func RecST() -> ORKTask {
        let HrDuration = ORKAnswerFormat.timeIntervalAnswerFormat()
        
        let SectionI = ORKFormItem(sectionTitle: "In the previous day, how long did you spend use your phone for entertainment purposes.", detailText: "Yesterday's Entertainment Screen Time", learnMoreItem: nil, showsProgress: true)
        let EntertainmentTimeHR = ORKFormItem(identifier: EntSTHR,text: nil, detailText: nil, learnMoreItem: nil, showsProgress: true, answerFormat: HrDuration, tagText: nil, optional: false)
        
        let SectionIII = ORKFormItem(sectionTitle: "In the previous day, how long did you spend use your phone for Social purposes.", detailText: "Yesterday's Social Screen Time", learnMoreItem: nil, showsProgress: true)
        let SocialTimeHR = ORKFormItem(identifier:SocSTHR, text: nil, detailText: nil, learnMoreItem: nil, showsProgress: true, answerFormat: HrDuration, tagText: nil, optional: false)
        
        let RecST = ORKFormStep(identifier: RecreationalScreentimeform, title: "Recreational Screen Time", text: "Lets take a look at your previous day's screen use!")
        RecST.formItems = [SectionI,EntertainmentTimeHR,SectionIII, SocialTimeHR]
        RecST.headerTextAlignment = .center
        
        let RecTask = ORKOrderedTask(identifier: RecreationalScreentime, steps: [RecST])
        RecST.isOptional = false
        return RecTask
    }
    
    //MARK: START OF MENTAL HEALTH QUESTIONNAIRE =================================
    static let HAMD6 = "HAMD6"
    static let HAMDForm = "HAMD.form"
    static let HAMDFormMood = "HAMD.form.mood" //Q1 Depressed Mood
    static let HAMDFormSEG = "HAMD.form.seg" //Q2 Self-Esteem & Guilt
    static let HAMDFormSII = "HAMD.form.sii" //Q3 Social Interaction & Interests
    static let HAMDFormPsychomotor = "HAMD.form.psychomotorinterference" //Q4 Psychomotor Interference
    static let HAMDFormAnxiety = "HAMD.form.anxiety" //Q5 Anxiety
    static let HAMDFormSomaticSymptoms = "HAMD.form.somaticsymptoms" //Q6 Somatic Symptoms
    static let HAMDFormCompletion = "HAMD.form.completion"
    
    static func HamiltonDepression6Item() -> ORKTask {
        //MARK: Answer Formats ================================================================
        let WeeklyChoices = [
            ORKTextChoice(text: "Not at all", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Only a little", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Moderately so", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "A lot", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Extremely so", value: 4 as NSCoding & NSCopying & NSObjectProtocol)
        ]
        let WeeklyPresense = ORKAnswerFormat.textScale(
            with: WeeklyChoices, defaultIndex: Int(), vertical: false)
        //MARK: Question Items ================================================================
        // Mood =================================
        let HAMDMoodItem = ORKFormItem(
            identifier: HAMDFormMood, text: "Mood", detailText: "In the past week, how often have you experienced a depressive episode? (e.g. feels sad, empty, hopeless) or observed by others (e.g. appears tearful), or increased irritability", learnMoreItem: nil, showsProgress: true, answerFormat: WeeklyPresense, tagText: nil, optional: false)
        // Interest =================================
        let HAMDSEGItem = ORKFormItem(
            identifier: HAMDFormSEG, text: "Self-Esteem & Guilt", detailText:  "In the past week, have you ever have you experienced low self-esteem or sense of worthless??", learnMoreItem: nil, showsProgress: true, answerFormat: WeeklyPresense, tagText: nil, optional: false)
        // Appetite =================================
        let HAMDSIIItem = ORKFormItem(
            identifier: HAMDFormSII, text: "Social Interactions & Interests", detailText: "In the past 2(two) weeks, how often as the previously mentioned symptoms impacted your daily way of life?", learnMoreItem: nil, showsProgress: true, answerFormat: WeeklyPresense, tagText: nil, optional: false)
        // Insomnia =================================
        let HAMDPsychomotorItem = ORKFormItem(identifier: HAMDFormPsychomotor, text: "Daily Impairment", detailText: "In the past 2(two) weeks, how often have you experienced decrease in physical capabilities? Or have anyone suggested as such", learnMoreItem: nil, showsProgress: true, answerFormat: WeeklyPresense, tagText: nil, optional: false)
        // Agitation =================================
        let HAMDAnxietyItem = ORKFormItem(identifier: HAMDFormAnxiety, text: "Anxiety", detailText:"In the past 2(two) weeks, how often have you experienced intense anxiety (NOT STRESS - SEE Learn More" , learnMoreItem: nil, showsProgress: true, answerFormat: WeeklyPresense, tagText: nil, optional: false)
        // Fatigue =================================
        let HAMDSomaticItem = ORKFormItem(identifier: HAMDFormSomaticSymptoms, text: "Physical Symptoms", detailText: "In the past 2(two) weeks, how often as the previously mentioned symptoms impacted your daily way of life?", learnMoreItem: nil, showsProgress: true, answerFormat: WeeklyPresense, tagText: nil, optional: false)
        
        
        
        let HAMDCompletion = ORKCompletionStep (identifier: HAMDFormCompletion)
        HAMDCompletion.title = "Thank you."
        HAMDCompletion.text = "We appreciate your time."
        HAMDCompletion.image = UIImage(systemName: "FeaturedIcon")
        
        let formStep = ORKFormStep(
            identifier: HAMDForm,
            title: "Weekly Mental Health Questionnaire",
            text: "Its time for the weekly questionnaire! We kindly ask that you complete it before it expires!"
        )
        formStep.formItems = [HAMDMoodItem,HAMDSEGItem,HAMDSIIItem,HAMDPsychomotorItem,HAMDAnxietyItem,HAMDSomaticItem]
        formStep.isOptional = false // MARK: Participant Not Able to Skip Questions
        formStep.cardViewStyle = .bordered
        formStep.useCardView = true
        
        
        let surveyTask = ORKOrderedTask(
            identifier: HAMD6,
            steps: [formStep,HAMDCompletion])
        surveyTask.progressLabelColor = .purple
        
        
        return surveyTask
    }
    
    //MARK: END OF MENTAL HEALTH QUESTIONNAIRE =================================
    //MARK: DEMOGRAPHICS OUTCOME EXTRACTION  =================================
    static func extractAnswersDemographics(
        _ result: ORKTaskResult) -> [OCKOutcomeValue]? {
            
            guard
                let response = result.results?
                    .compactMap({ $0 as? ORKStepResult })
                    .first(where: { $0.identifier == DemographicFormStep}),
                let ChoiceResults = response
                    .results?.compactMap({ $0 as? ORKChoiceQuestionResult }),
                let NumericResults = response
                    .results?.compactMap({ $0 as? ORKNumericQuestionResult }),
                let Age = NumericResults
                    .first(where: { $0.identifier == DemoFormAgeIdentifier })?
                    .numericAnswer,
                let SES = ChoiceResults
                    .first(where: { $0.identifier == DemoformSESIdentifier })?
                    .choiceAnswers,
                let BG = ChoiceResults
                    .first(where: { $0.identifier == DemoFormBGIdentifier })?
                    .choiceAnswers,
                let Sex = ChoiceResults
                    .first(where: { $0.identifier == DemoFormSexIdentifier })?
                    .choiceAnswers,
                let Gender = ChoiceResults
                    .first(where: { $0.identifier == DemoFormGenderIdentifier })?
                    .choiceAnswers,
                let Marriage = ChoiceResults
                    .first(where: { $0.identifier == DemoFormMartialIdentifier })?
                    .choiceAnswers,
                let Department = ChoiceResults
                    .first(where: { $0.identifier == DemoFormDepartmentIdentifier })?
                    .choiceAnswers,
                let EduYears = ChoiceResults
                    .first(where: { $0.identifier == DemoFormUNIYEARSIdentifier })?
                .choiceAnswers,
                let EduStatus = ChoiceResults
                    .first(where: { $0.identifier == DemoFormUNIIdentifier })?
                .choiceAnswers,
                let Employment = ChoiceResults
                    .first(where: { $0.identifier == DemoFormEmploymentIdentifier })?
                    .choiceAnswers
            else {
                
                assertionFailure("Failed to extract answers from Mental Health Questionnaire!")
                
                return nil
            }
            
            var AgeValue = OCKOutcomeValue(Double(truncating: Age))
            AgeValue.kind = DemoFormAgeIdentifier
            
            var SESValue = OCKOutcomeValue(SES.description)
            SESValue.kind = DemoformSESIdentifier
            
            var BGValue = OCKOutcomeValue(BG.description)
            BGValue.kind = DemoFormBGIdentifier
            
            var SexValue = OCKOutcomeValue(Sex.description)
            SexValue.kind = DemoFormSexIdentifier
            
            var GenderValue = OCKOutcomeValue(Gender.description)
            GenderValue.kind = DemoFormGenderIdentifier
            
            var MarriageValue = OCKOutcomeValue(Marriage.description)
            MarriageValue.kind = DemoFormMartialIdentifier
            
            var DepartmentValue = OCKOutcomeValue(Department.description)
            DepartmentValue.kind = DemoFormBGIdentifier
            
            var EduYearsValue = OCKOutcomeValue(EduYears.description)
            EduYearsValue.kind = DemoFormUNIYEARSIdentifier
            
            var EduStatusValue = OCKOutcomeValue(EduStatus.description)
            EduStatusValue.kind = DemoFormUNIIdentifier
            
            var EmploymentValue = OCKOutcomeValue(Employment.description)
            EmploymentValue.kind = DemoFormEmploymentIdentifier
            
            return [AgeValue, SESValue, BGValue, SexValue, GenderValue, MarriageValue, DepartmentValue, EduYearsValue,EduStatusValue,EmploymentValue]
        }

    //MARK: HAMD6 OUTCOME EXTRACTION  =================================
    static func extractAnswersFromHAMD(
        _ result: ORKTaskResult) -> [OCKOutcomeValue]? {
            
            guard
                let response = result.results?
                    .compactMap({ $0 as? ORKStepResult })
                    .first(where: { $0.identifier == HAMDForm }),
                
                    let ChoiceResults = response
                    .results?.compactMap({ $0 as? ORKChoiceQuestionResult }),
                let MoodAnswer = ChoiceResults
                    .first(where: { $0.identifier == HAMDFormMood }),
                let InterestAnswer = ChoiceResults
                    .first(where: { $0.identifier == HAMDFormSEG }),
                let AgitationAnswer = ChoiceResults
                    .first(where: { $0.identifier == HAMDFormSII }),
                let InsomniaAnswer = ChoiceResults
                    .first(where: { $0.identifier == HAMDFormPsychomotor }),
                let AppetiteAnswer = ChoiceResults
                    .first(where: { $0.identifier == HAMDFormAnxiety }),
                let FatigueAnswer = ChoiceResults
                    .first(where: { $0.identifier == HAMDFormSomaticSymptoms })
            else {
                
                assertionFailure("Failed to extract answers from Mental Health Questionnaire!")
                return nil
            }
            
            var MoodValue = OCKOutcomeValue(MoodAnswer.choiceAnswers as! OCKOutcomeValueUnderlyingType)
            MoodValue.kind = HAMDFormMood
            
            var InterestValue = OCKOutcomeValue(InterestAnswer.choiceAnswers as! OCKOutcomeValueUnderlyingType)
            InterestValue.kind = HAMDFormSEG
            
            var AgitationValue = OCKOutcomeValue(AgitationAnswer.choiceAnswers as! OCKOutcomeValueUnderlyingType)
            AgitationValue.kind = HAMDFormSII
            
            var InsomniaValue = OCKOutcomeValue(InsomniaAnswer.choiceAnswers as! OCKOutcomeValueUnderlyingType)
            InsomniaValue.kind = HAMDFormPsychomotor
            
            var AppetiteValue = OCKOutcomeValue(AppetiteAnswer.choiceAnswers as! OCKOutcomeValueUnderlyingType)
            AppetiteValue.kind = HAMDFormAnxiety
            
            var SuicidalValue = OCKOutcomeValue(FatigueAnswer.choiceAnswers as! OCKOutcomeValueUnderlyingType)
            SuicidalValue.kind = HAMDFormSomaticSymptoms
            
            
            return [MoodValue, InterestValue, AgitationValue, InterestValue, AppetiteValue, SuicidalValue]
        }
    

    
//    static func K10Test() -> ORKTask {
//        let TextChoices = [
//            ORKTextChoice(text: "None of the time.", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
//            ORKTextChoice(text: "A little of the time.", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
//            ORKTextChoice(text: "Some of the time.", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
//            ORKTextChoice(text: "Most of the time.", value: 4 as NSCoding & NSCopying & NSObjectProtocol),
//            ORKTextChoice(text: "All of the time.", value: 5 as NSCoding & NSCopying & NSObjectProtocol)
//        ]
//        let Options = ORKAnswerFormat.textScale(with: TextChoices, defaultIndex: 0, vertical: false)
//        let introductionstep = ORKInstructionStep(identifier: "K10InstructionStep")
//        let QuestionI = ORKFormItem(identifier: "K10Question1", text: "During the last 15 days, about how often did you feel tired out for no good reason?", answerFormat: Options, optional: false)
//        let QuestionII = ORKFormItem(identifier: "K10Question2", text: "During the last 15 days, about how often did you feel tired out for no good reason?", answerFormat: Options, optional: false)
//        let QuestionIII = ORKFormItem(identifier: "K10Question3", text: "During the last 15 days, about how often did you feel tired out for no good reason?", answerFormat: Options, optional: false)
//        let QuestionIV = ORKFormItem(identifier: "K10Question4", text: "During the last 15 days, about how often did you feel tired out for no good reason?", answerFormat: Options, optional: false)
//        let QuestionV = ORKFormItem(identifier: "K10Question5", text: "During the last 15 days, about how often did you feel tired out for no good reason?", answerFormat: Options, optional: false)
//        let QuestionVI = ORKFormItem(identifier: "K10Question6", text: "During the last 15 days, about how often did you feel tired out for no good reason?", answerFormat: Options, optional: false)
//        let QuestionVII = ORKFormItem(identifier: "K10Question7", text: "During the last 15 days, about how often did you feel tired out for no good reason?", answerFormat: Options, optional: false)
//        let QuestionVIII = ORKFormItem(identifier: "K10Question8", text: "During the last 15 days, about how often did you feel tired out for no good reason?", answerFormat: Options, optional: false)
//        let QuestionIX = ORKFormItem(identifier: "K10Question9", text: "During the last 15 days, about how often did you feel tired out for no good reason?", answerFormat: Options, optional: false)
//        let QuestionX = ORKFormItem(identifier: "K10Question10", text: "During the last 15 days, about how often did you feel tired out for no good reason?", answerFormat: Options, optional: false)
//
//        let surveytask = ORKFormStep(identifier: "K10TaskQuestions", title: "Psychological Distress Questionnaire", text: "Its time for the weekly questionnaire! We kindly ask that you complete it before it expires!")
//        surveytask.cardViewStyle = .bordered
//        surveytask.useCardView = true
//        surveytask.iconImage = UIImage(systemName: "brain.head.profile")
//        surveytask.formItems = [QuestionI,QuestionII,QuestionIII,QuestionIV,QuestionV,QuestionVI,QuestionVII,QuestionVIII,QuestionIX,QuestionX]
//        surveytask.isOptional = false // MARK: Participant Not Able to Skip Questions
//        //        return surveytask
//        let CompletionStep = ORKCompletionStep(identifier: "K10TaskCompletionStep")
//
//
//
//        let K10TestForm = ORKOrderedTask(identifier: K10, steps: [introductionstep,surveytask,CompletionStep])
//        K10TestForm.progressLabelColor = .purple
//
//
//        return K10TestForm
//    }
    // MARK: Pittsburgh Sleep Quality Index (PSQI)
    static let PSQI = "PittsburgSleepQualityIndex"
    static let PSQIIntroductionStep = "PittsburgSleepQualityIndex.Introduction"
    static let PSQIFormStep = "PittsburgSleepQualityIndex.Section1"
    static let PSQIQ1 = "PittsburgSleepQualityIndex.Q1"
    static let PSQIQ2 = "PittsburgSleepQualityIndex.Q2"
    static let PSQIQ3 = "PittsburgSleepQualityIndex.Q3"
    static let PSQIQ4 = "PittsburgSleepQualityIndex.Q4"
    static let PSQIQ5 = "PittsburgSleepQualityIndex.Q5"
    static let PSQIQ6 = "PittsburgSleepQualityIndex.Q6"
    static let PSQIQ7 = "PittsburgSleepQualityIndex.Q7"
    static let PSQIQ8 = "PittsburgSleepQualityIndex.Q8"
    static let PSQIQ9 = "PittsburgSleepQualityIndex.Q9"
    static let PSQIQ10 = "PittsburgSleepQualityIndex.Q10"
    static let PSQIQ11 = "PittsburgSleepQualityIndex.Q11"
    static let PSQIQ12 = "PittsburgSleepQualityIndex.Q12"
    static let PSQIQ13 = "PittsburgSleepQualityIndex.Q13"
    static let PSQIQ14 = "PittsburgSleepQualityIndex.Q14"
    static let PSQIQ15 = "PittsburgSleepQualityIndex.Q15"
    static let PSQIQ16 = "PittsburgSleepQualityIndex.Q16"
    static let PSQIQ17 = "PittsburgSleepQualityIndex.Q17"
    static let PSQIQ18 = "PittsburgSleepQualityIndex.Q18"
    static let PSQIQ19 = "PittsburgSleepQualityIndex.Q19"
    static let PSQIQ20 = "PittsburgSleepQualityIndex.Q20"
    static let PSQIQ21 = "PittsburgSleepQualityIndex.Q21"
    static let PSQIQ22 = "PittsburgSleepQualityIndex.Q22"
    static let PSQIQ23 = "PittsburgSleepQualityIndex.Q23"
    static func SleepQualityQuestionnaire() -> ORKTask {
        //Question 1
        let Q1Title = ORKFormItem(sectionTitle: "During the past month, what time have you usually gone to bed at night?")
        Q1Title.showsProgress = true
        let Q1Item = ORKFormItem(identifier: PSQIQ1, text: "", answerFormat: ORKAnswerFormat.timeOfDayAnswerFormat(), optional: false)
        //Question 2
        let Q2Title = ORKFormItem(sectionTitle: "During the past month, how long (in minutes) has it usually taken you to fall asleep each night?")
        Q2Title.showsProgress = true
        let Q2Item = ORKFormItem(identifier: PSQIQ2, text: "", answerFormat: ORKAnswerFormat.timeIntervalAnswerFormat(), optional: false)
        //Question 3
        let Q3Title = ORKFormItem(sectionTitle: "During the past month, what time have you usually gotten up in the morning?")
        Q3Title.showsProgress = true
        let Q3Item = ORKFormItem(identifier: PSQIQ3, text: "", answerFormat: ORKAnswerFormat.timeOfDayAnswerFormat(), optional: false)
        //Question 4
        let Q4Title = ORKFormItem(sectionTitle: "During the past month, how many hours of 'actual sleep' did you get at night? (This may be different than the number of hours you spent in bed.)")
        Q4Title.showsProgress = true
        let Q4Item = ORKFormItem(identifier: PSQIQ4, text: "", answerFormat: ORKAnswerFormat.timeIntervalAnswerFormat(withDefaultInterval: (60*60), step: 30),optional: false)
        //Section 1: // // //
        let Section1 = ORKFormStep(identifier: PSQIFormStep, title: "Sleep Questionnaire", text: "The following questions relate to your usual sleep habits during the past two (2) weeks only. Your answers should indicate the most accurate reply for the majority of days and nights in the past month. Please answer all questions.")
        let TextChoices = [
            ORKTextChoice(text: "None of the time.", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Less than once (1) a week", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Once (1) or twice (2) a week", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Three (3+) or more a week", value: 4 as NSCoding & NSCopying & NSObjectProtocol),
        ]
        let WeeklyPresense = ORKAnswerFormat.textScale(
            with: TextChoices, defaultIndex: Int(), vertical: false)
        //Question 5
        let Q5Item = ORKFormItem(identifier: PSQIQ5, text: "During the past two (2) weeks, how often have you had trouble sleeping because you... ", answerFormat: WeeklyPresense, optional: false)
        Q5Item.detailText = "Cannot get to sleep within 30 minutes"
        //Question 6
        let Q6Item = ORKFormItem(identifier: PSQIQ6, text: "During the past two (2) weeks, how often have you had trouble sleeping because you... ", answerFormat: WeeklyPresense, optional: false)
        Q6Item.detailText = "Wake up in the middle of the night or early morning"
        //Question 7
        let Q7Item = ORKFormItem(identifier: PSQIQ7, text: "During the past two (2) weeks, how often have you had trouble sleeping because you... ", answerFormat: WeeklyPresense, optional: false)
        Q7Item.detailText = "Cannot breathe comfortably"
        //Qusetion 8
        let Q8Item = ORKFormItem(identifier: PSQIQ8, text: "During the past two (2) weeks, how often have you had trouble sleeping because you... ", answerFormat: WeeklyPresense, optional: false)
        Q8Item.detailText = "Cough or snore loudly"
        //Question 9
        let Q9Item = ORKFormItem(identifier: PSQIQ9, text: "During the past two (2) weeks, how often have you had trouble sleeping because you... ", answerFormat: WeeklyPresense, optional: false)
        Q9Item.detailText = "Feel Too Cold"
        //Question 10
        let Q10Item = ORKFormItem(identifier: PSQIQ10, text: "During the past two (2) weeks, how often have you had trouble sleeping because you... ", answerFormat: WeeklyPresense, optional: false)
        Q10Item.detailText = "Feel Too Hot"
        //Question 11
        let Q11Item = ORKFormItem(identifier: PSQIQ11, text: "During the past two (2) weeks, how often have you had trouble sleeping because you... ", answerFormat: WeeklyPresense, optional: false)
        Q11Item.detailText = "Have bad Dreams"
        //Question 12
        let Q12Item = ORKFormItem(identifier: PSQIQ12, text: "During the past two (2) weeks, how often have you had trouble sleeping because you... ", answerFormat: WeeklyPresense, optional: false)
        Q12Item.detailText = "Have pain"
        //Question 13
        let Q13Item = ORKFormItem(identifier: PSQIQ13, text: "During the past two (2) weeks, how often have you had trouble sleeping because you... ", answerFormat: WeeklyPresense, optional: false)
        Q13Item.detailText = "Other reasons,"
        //Question 14
        let Q14Item = ORKFormItem(identifier: PSQIQ14, text: "During the past two (2) weeks, how often have you taken medicine to help you sleep (prescribed or “over the counter”)?", answerFormat: WeeklyPresense, optional: false)
        //Question 15
        let Q15Item = ORKFormItem(identifier: PSQIQ15, text: "During the past two (2) weeks, how often have you had trouble staying awake while driving, eating meals, or engaging in social activity? ", answerFormat: WeeklyPresense, optional: false)
        //Question 16
        let ProblemChoices = [
            ORKTextChoice(text: "None of the time.", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Less than once (1) a week", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Once (1) or twice (2) a week", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Three (3+) or more a week", value: 4 as NSCoding & NSCopying & NSObjectProtocol),
        ]
        let ProblemFormat =  ORKAnswerFormat.textScale(with: ProblemChoices, defaultIndex: Int(), vertical: false)
        let Q16Item = ORKFormItem(identifier: PSQIQ16, text: "During the past two (2) weeks, how much of a problem has it been for you to keep up enough enthusiasm to get things done? ", answerFormat: ProblemFormat, optional: false)
        //Question 17
        let RatingChoices = [
            ORKTextChoice(text: "Very Bad", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Fairly Bad", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Fairly Good", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Very Good", value: 4 as NSCoding & NSCopying & NSObjectProtocol),
        ]
        let RatingFormat = ORKAnswerFormat.textScale(
            with: RatingChoices, defaultIndex: Int(), vertical: false)
        let Q17Item = ORKFormItem(identifier: PSQIQ17, text: "During the past month, how would you rate your sleep quality overall?", answerFormat: RatingFormat, optional: false)
        //Question 18
        let SleepSituationOptions = [
            ORKTextChoice(text: "No bed partner or room mate", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Partner/roommate in other room", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Partner in same room but not same bed ", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Partner in same bed", value: 4 as NSCoding & NSCopying & NSObjectProtocol),
        ]
        let SituationFormat = ORKAnswerFormat.textScale(with: SleepSituationOptions, defaultIndex: Int(), vertical: false)
        let Q18Item = ORKFormItem(identifier: PSQIQ18, text: "Do you have a Bed Partner or Room Mate?", answerFormat: SituationFormat, optional: false)
        //Question 19
        let Q19Item = ORKFormItem(identifier: PSQIQ19, text: "If you have a room mate or bed partner, ask him/her how often in the past month you have had:", answerFormat: WeeklyPresense, optional: false)
        Q19Item.detailText = "Loud Snoring"
        //Question 20
        let Q20Item = ORKFormItem(identifier: PSQIQ20, text: "If you have a room mate or bed partner, ask him/her how often in the past month you have had:", answerFormat: WeeklyPresense, optional: false)
        Q20Item.detailText = "Long pauses between breaths while asleep "
        //Question 21
        let Q21Item = ORKFormItem(identifier: PSQIQ21, text: "If you have a room mate or bed partner, ask him/her how often in the past month you have had:", answerFormat: WeeklyPresense, optional: false)
        Q21Item.detailText = "Legs twitching or jerking while you sleep"
        //Qusetion 22
        let Q22Item = ORKFormItem(identifier: PSQIQ22, text: "If you have a room mate or bed partner, ask him/her how often in the past month you have had:", answerFormat: WeeklyPresense, optional: false)
        Q22Item.detailText = "Episodes of disorientation or confusion during sleep"
        //Qusetion 23
        let Q23Item = ORKFormItem(identifier: PSQIQ23, text: "If you have a room mate or bed partner, ask him/her how often in the past month you have had:", answerFormat: WeeklyPresense, optional: false)
        Q23Item.detailText = "Other restlessness while you sleep"
        Section1.formItems = [Q1Title, Q1Item,Q2Title,Q2Item,Q3Title,Q3Item,Q4Title,Q4Item,Q5Item,Q6Item,Q7Item,Q8Item,Q9Item,Q10Item,Q11Item,Q12Item,Q13Item,Q14Item,Q15Item,Q16Item,Q17Item,Q18Item,Q19Item,Q20Item,Q21Item,Q22Item,Q23Item]
        Section1.bodyItemTextAlignment = .center
        Section1.headerTextAlignment = .center
        let PSQICompletion = ORKCompletionStep(identifier: "PSQI.Completion")
        
        let PSQI = ORKOrderedTask(identifier: PSQI, steps: [Section1,PSQICompletion])
        
        return PSQI
    }
    
    // MARK: Extract PSQI
    static func extractAnswersPSQI(
        _ result: ORKTaskResult) -> [OCKOutcomeValue]? {
            
            guard
                let response = result.results?
                    .compactMap({ $0 as? ORKStepResult })
                    .first(where: { $0.identifier == PSQIFormStep}),
                let ChoiceResults = response
                    .results?.compactMap({ $0 as? ORKScaleQuestionResult }),
                let TimeofDayResults = response
                    .results?.compactMap({$0 as? ORKTimeOfDayQuestionResult}),
                let TimeIntervalResults = response
                    .results?.compactMap({$0 as? ORKTimeIntervalQuestionResult}),
                let Q1 = TimeofDayResults
                    .first(where: { $0.identifier == PSQIQ1 })?
                    .dateComponentsAnswer,
                let Q2 = TimeIntervalResults
                    .first(where: { $0.identifier == PSQIQ2 })?
                    .intervalAnswer,
                let Q3 = TimeofDayResults
                    .first(where: { $0.identifier == PSQIQ3 })?
                    .dateComponentsAnswer,
                let Q4 = TimeIntervalResults
                    .first(where: { $0.identifier == PSQIQ4 })?
                    .intervalAnswer,
                let Q5 = ChoiceResults
                    .first(where: { $0.identifier == PSQIQ5 })?
                    .scaleAnswer,
                let Q6 = ChoiceResults
                    .first(where: { $0.identifier == PSQIQ6 })?
                    .scaleAnswer,
                let Q7 = ChoiceResults
                    .first(where: { $0.identifier == PSQIQ7 })?
                    .scaleAnswer,
                let Q8 = ChoiceResults
                    .first(where: { $0.identifier == PSQIQ8 })?
                .scaleAnswer,
                let Q9 = ChoiceResults
                    .first(where: { $0.identifier == PSQIQ9 })?
                .scaleAnswer,
                let Q10 = ChoiceResults
                    .first(where: { $0.identifier == PSQIQ10 })?
                    .scaleAnswer,
                let Q11 = ChoiceResults
                    .first(where: { $0.identifier == PSQIQ11 })?
                    .scaleAnswer,
                let Q12 = ChoiceResults
                    .first(where: { $0.identifier == PSQIQ12 })?
                    .scaleAnswer,
                let Q13 = ChoiceResults
                    .first(where: { $0.identifier == PSQIQ13 })?
                .scaleAnswer,
                let Q14 = ChoiceResults
                    .first(where: { $0.identifier == PSQIQ14 })?
                .scaleAnswer,
                let Q15 = ChoiceResults
                    .first(where: { $0.identifier == PSQIQ15 })?
                    .scaleAnswer,
                let Q16 = ChoiceResults
                    .first(where: { $0.identifier == PSQIQ16 })?
                    .scaleAnswer,
                let Q17 = ChoiceResults
                    .first(where: { $0.identifier == PSQIQ17 })?
                    .scaleAnswer,
                let Q18 = ChoiceResults
                    .first(where: { $0.identifier == PSQIQ18 })?
                .scaleAnswer,
                let Q19 = ChoiceResults
                    .first(where: { $0.identifier == PSQIQ19 })?
                .scaleAnswer,
                let Q20 = ChoiceResults
                    .first(where: { $0.identifier == PSQIQ20 })?
                    .scaleAnswer,
                let Q21 = ChoiceResults
                    .first(where: { $0.identifier == PSQIQ21 })?
                    .scaleAnswer,
                let Q22 = ChoiceResults
                    .first(where: { $0.identifier == PSQIQ22 })?
                    .scaleAnswer,
                let Q23 = ChoiceResults
                    .first(where: { $0.identifier == PSQIQ23 })?
                .scaleAnswer
            else {
                
                assertionFailure("Failed to extract answers from Mental Health Questionnaire!")
                
                return nil
            }
            
            var Q1Result = OCKOutcomeValue(Q1.description)
                Q1Result.kind = PSQIQ1
            var Q2Result = OCKOutcomeValue(Q2.doubleValue)
            Q2Result.kind = PSQIQ2
            var Q3Result = OCKOutcomeValue(Q3.description)
            Q3Result.kind = PSQIQ3
            var Q4Result = OCKOutcomeValue(Q4.doubleValue)
            Q4Result.kind = PSQIQ4
            var Q5Result = OCKOutcomeValue(Q5.doubleValue)
            Q5Result.kind = PSQIQ5
            
            var Q6Result = OCKOutcomeValue(Q6.doubleValue)
            Q6Result.kind = PSQIQ6
            
            var Q7Result = OCKOutcomeValue(Q7.doubleValue)
            Q7Result.kind = PSQIQ7
            
            var Q8Result = OCKOutcomeValue(Q8.doubleValue)
            Q8Result.kind = PSQIQ8
            
            var Q9Result = OCKOutcomeValue(Q9.doubleValue)
            Q9Result.kind = PSQIQ9
            
            var Q10Result = OCKOutcomeValue(Q10.doubleValue)
            Q10Result.kind = PSQIQ10
            var Q11Result = OCKOutcomeValue(Q11.description)
                Q11Result.kind = PSQIQ11
            var Q12Result = OCKOutcomeValue(Q12.doubleValue)
            Q12Result.kind = PSQIQ12
            var Q13Result = OCKOutcomeValue(Q13.description)
            Q13Result.kind = PSQIQ13
            var Q14Result = OCKOutcomeValue(Q14.doubleValue)
            Q14Result.kind = PSQIQ14
            var Q15Result = OCKOutcomeValue(Q15.doubleValue)
            Q15Result.kind = PSQIQ15
            
            var Q16Result = OCKOutcomeValue(Q16.doubleValue)
            Q16Result.kind = PSQIQ16
            
            var Q17Result = OCKOutcomeValue(Q17.doubleValue)
            Q17Result.kind = PSQIQ17
            
            var Q18Result = OCKOutcomeValue(Q18.doubleValue)
            Q18Result.kind = PSQIQ18
            
            var Q19Result = OCKOutcomeValue(Q19.doubleValue)
            Q19Result.kind = PSQIQ19
            
            var Q20Result = OCKOutcomeValue(Q20.doubleValue)
            Q20Result.kind = PSQIQ20
            var Q21Result = OCKOutcomeValue(Q21.doubleValue)
            Q21Result.kind = PSQIQ21
            
            var Q22Result = OCKOutcomeValue(Q22.doubleValue)
            Q22Result.kind = PSQIQ22
            
            var Q23Result = OCKOutcomeValue(Q23.doubleValue)
            Q23Result.kind = PSQIQ23
            
            return [Q1Result,Q2Result,Q3Result,Q4Result,Q5Result,Q6Result,Q7Result,Q8Result,Q9Result,Q10Result, Q11Result,Q12Result,Q13Result,Q14Result,Q15Result,Q16Result,Q17Result,Q18Result,Q19Result,Q20Result,Q21Result,Q22Result,Q23Result]
        }
    
    // MARK: Godin Daily Leisure Exercise Questionnaire
    static let Godin = "GodinLeisure"
    static let Godinintroductionstep = "GodinLeisure.introduction"
    static let Godinformstep = "Godin.form"
    static let GodinformstepQ1 = "Godin.form.1"
    static let GodinformstepQ2 = "Godin.form.2"
    static let GodinformstepQ3 = "Godin.form.3"
    static let GodinformstepQ4 = "Godin.form.4"
    static func GODIN() -> ORKTask {
        let GodinOptionA = ORKAnswerFormat.scale(withMaximumValue: 9, minimumValue: 1, defaultValue: Int(), step: 1, vertical: false, maximumValueDescription: "Times per Week", minimumValueDescription: "Times per Week")
        
        let sleepitem = ORKFormItem(identifier: GodinformstepQ1, text: "Strenuous Exercise (Heart Beats Rapidly)", detailText: "(e.g., running, jogging, hockey, football, soccer, squash, basketball, cross country skiing, judo, roller skating, vigorous swimming, vigorous long distance bicycling)", learnMoreItem: nil, showsProgress: true, answerFormat: GodinOptionA, tagText: nil, optional: false)
        
        let GodinOptionB = ORKAnswerFormat.scale(withMaximumValue: 5, minimumValue: 1, defaultValue: Int(), step: 1, vertical: false, maximumValueDescription: "Times per Week", minimumValueDescription: "Times per Week")
        
        let sleepqualityitem = ORKFormItem(identifier: GodinformstepQ2, text: "Moderate Exercise (Not Exhausting)", detailText: "(e.g., fast walking, baseball, tennis, easy bicycling, volleyball, badminton, easy swimming, alpine skiing, popular and folk dancing)", learnMoreItem: nil, showsProgress: true, answerFormat: GodinOptionB, tagText: nil, optional: false)
        
        let GodinOptionC = ORKAnswerFormat.scale(withMaximumValue: 3, minimumValue: 1, defaultValue: Int(), step: 1, vertical: false, maximumValueDescription: "Times per Week", minimumValueDescription: "Times per Week")
        
        let morningfatigueitem = ORKFormItem(identifier: GodinformstepQ3, text: "Mild/Light Exercise (Minimal Effort)", detailText: "(e.g., yoga, archery, fishing from river bank, bowling, horseshoes, golf, snow-mobiling, easy walking)", learnMoreItem: nil, showsProgress: true, answerFormat: GodinOptionC, tagText: nil, optional: false)
        
        //        let recapstep = ORKInstructionStep(identifier: Godinintroductionstep)
        
        let SubjectiveSurvey = ORKFormStep(identifier: Godinformstep, title: "Physical Activity Questionnaire", text: "During a typical 7-Day period (a week), how many times on the average do you do the following kinds of exercise for more than 15 minutes during your free time.         ")
        SubjectiveSurvey.formItems = [sleepitem,sleepqualityitem, morningfatigueitem]
        SubjectiveSurvey.isOptional = false
        
        let SSCompletion = ORKCompletionStep (identifier: GodinformstepQ4)
        SSCompletion.title = "Thank you."
        SSCompletion.text = "We appreciate your time."
        
        
        let GODINTask = ORKOrderedTask(
            identifier: Godin,
            steps: [SubjectiveSurvey, SSCompletion]
        )
        
        return GODINTask
        
    }
    
    //MARK: GODIN Extraction ===============================================
    static func ExtractGodinOutcomes(
            _ result: ORKTaskResult) -> [OCKOutcomeValue]? {

            guard
                let response = result.results?
                    .compactMap({ $0 as? ORKStepResult })
                    .first(where: { $0.identifier == Godinformstep }),

                let scaleResults = response
                    .results?.compactMap({ $0 as? ORKScaleQuestionResult }),

                let Q1 = scaleResults
                    .first(where: { $0.identifier == GodinformstepQ1 })?
                    .scaleAnswer,
                let Q2 = scaleResults
                    .first(where: { $0.identifier == GodinformstepQ2 })?
                    .scaleAnswer,
                let Q3 = scaleResults
                    .first(where: { $0.identifier == GodinformstepQ3})?
                    .scaleAnswer,
                let Q4 = scaleResults
                    .first(where: {$0.identifier == GodinformstepQ4})?
                    .scaleAnswer
            else {
                assertionFailure("Failed to extract answers from check in survey!")
                return nil
            }

            var Q1Value = OCKOutcomeValue(Double(truncating: Q1))
                Q1Value.kind = GodinformstepQ1
            var Q2Value = OCKOutcomeValue(Double(truncating: Q2))
                Q2Value.kind = GodinformstepQ2
            var Q3Value = OCKOutcomeValue(Double(truncating: Q3))
                Q3Value.kind = GodinformstepQ3
            var Q4Value = OCKOutcomeValue(Double(truncating: Q4))
                Q4Value.kind = GodinformstepQ4
            return [Q1Value, Q2Value, Q3Value, Q4Value]
        }
    
    // MARK: Demographic Questionnaire Answer Extraction ===============================================
    static func extractRecSTOutcome(
        _ result: ORKTaskResult) -> [OCKOutcomeValue]? {
            
            guard
            let response = result.results?
                .compactMap({ $0 as? ORKStepResult })
                .first(where: { $0.identifier == RecreationalScreentimeform }),
            
            let ParticipantNumericResponse = response
                .results?.compactMap({ $0 as? ORKTimeIntervalQuestionResult}),
            
            let Q1 = ParticipantNumericResponse
                .first(where: {$0.identifier == EntSTHR})?
                .intervalAnswer,
            let Q2 = ParticipantNumericResponse
                .first(where: {$0.identifier == SocSTHR})?
                .intervalAnswer
                
            else {
                assertionFailure("Failed to extract answers from check in survey!")
                return nil
            }
            var Q1Value = OCKOutcomeValue(Double(truncating: Q1))
            Q1Value.kind = EntSTHR
            var Q2Value = OCKOutcomeValue(Double(truncating: Q2))
            Q2Value.kind = SocSTHR
            return [Q1Value,Q2Value]
        }
    static func ExtractConsent(
        _ result: ORKTaskResult) -> [OCKOutcomeValue]? {

            guard
            let response = result.results?
                .compactMap({ $0 as? ORKStepResult })
                .first(where: { $0.identifier == ConsentForm }),

            let ParticipantNumericResponse = response
                .results?.compactMap({ $0 as? ORKConsentSignatureResult}),

            let Q1 = ParticipantNumericResponse
                .first(where: {$0.identifier == ConsentSignature})?
                .signature


            else {
                assertionFailure("Failed to extract answers from check in survey!")
                return nil
            }
            var Q1Value = OCKOutcomeValue(Q1 as! OCKOutcomeValueUnderlyingType)
            Q1Value.kind = ConsentSignature

            return [Q1Value]
        }

    



}

