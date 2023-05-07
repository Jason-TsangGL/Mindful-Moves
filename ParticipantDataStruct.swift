import Foundation
import SwiftUI
import CareKitStore
import HealthKit
import CloudKit
import ResearchKit

struct HRbpmDataSet : Identifiable, Codable {
    var id = UUID()
    var Value : Double
    var Date : String
    var MotionContext : String
    var Duration : Double
}

struct RHRDataSet : Identifiable, Codable {
    var id = UUID()
    var Value : Double
    var StartTime : String
    var EndTime : String
    var Duration : Double
}

struct CadenceDataSet : Identifiable, Codable {
    var id = UUID()
    var Value : Double
    var Date : String
    var TimeInterval : Double
    var Device : String
}

struct StepCountDataSet : Identifiable, Codable {
    var id = UUID()
    var Value : Double
    var StartTime : String
    var EndTime : String
    var Device : String
}

struct StepDistanceDataSet : Identifiable, Codable {
    var id = UUID()
    var Value : Double
    var StartTime : String
    var EndTime : String
    var Device : String
}

struct StepSpeedDataSet : Identifiable, Codable {
    var id = UUID()
    var Value : Double
    var StartTime : String
    var EndTime : String
    var Device : String
}

struct SleepAnalysis : Identifiable, Codable {
    var id = UUID()
    var Duration : Double
    var SleepType : String
    var SleepTime : String
    var WakeTime: String
    var Device : String
}

struct Demographics : Identifiable, Codable {
     var id = UUID()
     var Age : Int
    
}

struct OnboardingConsent : Identifiable {
    var id = UUID()
    var ConsentSignature : UIImage
    var ConsentComplete : Bool
    var DateCompleted : String
}

struct DailyStandTime : Identifiable, Codable {
    var id = UUID()
    var Duration : Double
    var StartTime : String
    var EndTime : String
}
struct DailyMoveTime : Identifiable, Codable {
    var id = UUID()
    var Duration : Double
    var StartTime : String
    var EndTime : String
}

struct BeattoBeat : Identifiable, Codable {
    var id = UUID()
    var Value : Double
    var CollectionTime : String
    var MotionContext : String
}


struct publicDS {
    static let id = UUID()
    
    static let careplan = OCKCarePlan(id: id.description, title: "Careplan", patientUUID: id)
    
    static var Age : Double = 0
    
    static var Withdrawal : Bool = false
    
    static var Completion : Bool = false
    
    static var SystemUpTime : Double = 0
    
//    static var OnboardingConsent : [OnboardingConsent] = []
    
    static var HRDataSet : [HRbpmDataSet] = []
    
    static var HeartBeattoBeat : [BeattoBeat] = []
    
    static var DailySteps : [StepCountDataSet] = []
    
    static var StepDistance : [StepDistanceDataSet] = []
    
    static var StepSpeed : [StepSpeedDataSet] = []
    
    static var CadenceDataSet : [CadenceDataSet] = []
    
    static var saDS : [SleepAnalysis] = []
    
    static var DailyStandTime : [DailyStandTime] = []
    
    static var DailyMoveTime : [DailyMoveTime] = []
    
    static var RestingHeartRate : [RHRDataSet] = []
    
    private init() {}
}

