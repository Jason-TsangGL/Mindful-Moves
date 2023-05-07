import Foundation
import SwiftUI
import CareKitStore
import HealthKit
import CloudKit
import ResearchKit

struct HRbpmDataSet : Identifiable {
    var id = UUID()
    var Value : Double
    var Date : String
    var MotionContext : String
    var Duration : Double
}

struct RHRDataSet : Identifiable {
    var id = UUID()
    var Value : Double
    var StartTime : String
    var EndTime : String
    var Duration : Double
}

struct CadenceDataSet : Identifiable {
    var id = UUID()
    var Value : Double
    var Date : String
    var TimeInterval : Double
    var Device : String
}

struct StepCountDataSet : Identifiable {
    var id = UUID()
    var Value : Double
    var StartTime : String
    var EndTime : String
    var Device : String
}

struct StepDistanceDataSet : Identifiable {
    var id = UUID()
    var Value : Double
    var StartTime : String
    var EndTime : String
    var Device : String
}

struct SleepAnalysis : Identifiable {
    var id = UUID()
    var Duration : Double
    var SleepType : String
    var SleepTime : String
    var WakeTime: String
    var Device : String
}

struct Demographics : Identifiable {
     var id = UUID()
     var Age : Int
    
}
struct OnboardingConsent : Identifiable {
     var id = UUID()
    var ConsentSignature : UIImage
    var ConsentComplete : Bool
    var DateCompleted : String
}
struct DailyStandTime : Identifiable {
    var id = UUID()
    var Duration : Double
    var StartTime : String
    var EndTime : String
}

struct BeattoBeat : Identifiable {
    var id = UUID()
    var Value : Double
    var CollectionTime : String
    var MotionContext : String
}

struct ParticipantDataStructure: Identifiable {
    var id = UUID()
    var EligibilityStatus : Bool
    var ConsentSignature : ORKHTMLPDFPageRenderer
    var ConsentCollectionDate : Date
    var DaysCompleting : [Date]
    var DaysCompleted : Int
    var VoluntaryWithdrawal : Bool
    var CompletionStatus : Bool
    
    var SleepAnalysisDataSet : [SleepAnalysis]
    

}

struct publicDS {
    static let id = UUID()
    
    static let careplan = OCKCarePlan(id: id.description, title: "Careplan", patientUUID: id)
    
    static var Age : Double = 0
    
    static var SystemUpTime : Double = 0
    
    static var OnboardingConsent : [OnboardingConsent] = []
    
    static var HRDataSet : [HRbpmDataSet] = []
    
    static var HeartBeattoBeat : [BeattoBeat] = []
    
    static var DailySteps : [StepCountDataSet] = []
    
    static var StepDistance : [StepDistanceDataSet] = []
    
    static var CadenceDataSet : [CadenceDataSet] = []
    
    static var saDS : [SleepAnalysis] = []
    
    static var DailyStandTime : [DailyStandTime] = []
    
    static var RestingHeartRate : [RHRDataSet] = []
    
    private init() {}
}

