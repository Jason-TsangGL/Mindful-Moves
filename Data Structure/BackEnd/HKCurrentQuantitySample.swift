
import Foundation
import HealthKit

extension HKHealthStore {
    /// Asynchronously fetches the most recent quantity sample of a specified type.
    func mostRecentQauntitySampleOfType(_ quantityType: HKQuantityType, predicate: NSPredicate? = nil, completion: @escaping (HKQuantity?, NSError?) -> Void) {
        let timeSortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        
        let query = HKSampleQuery(sampleType: quantityType, predicate: predicate, limit: 1, sortDescriptors: [timeSortDescriptor]) { _, samples, error in
            if let firstSample = samples?.first as? HKQuantitySample {
                completion(firstSample.quantity, nil)
            } else {
                completion(nil, error as NSError?)
            }
        }
        
        execute(query)
        
        
    } //MARK: func mostRecentQuantitySampleOfType
    //    func dailysleepanalysiscollection() {
    //            let healthStore = HKHealthStore()
    //        let allAsleepPredicate: [ HKCategoryValueSleepAnalysis] = [HKCategoryValueSleepAnalysis.asleepUnspecified, HKCategoryValueSleepAnalysis.asleepCore, HKCategoryValueSleepAnalysis.asleepDeep, HKCategoryValueSleepAnalysis.asleepREM]
    //
    //            let dateRangePredicate = HKQuery.predicateForSamples(withStart: getLastWeekStartDate() , end: Date(), options: .strictStartDate)
    //        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates:  allAsleepPredicate.)
    //
    //            let query = HKSampleQuery(sampleType: sleepType, predicate: predicate) { (query, result, error) in
    //                // handle results
    //            }
    //    public typealias CompletionHandler = ((HKQuantity?, Error?) -> Void)
    //
    //    }
    
}
