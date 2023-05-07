/*
See LICENSE folder for this sample’s licensing information.

Abstract:
An extension that adds detail string support to a heartbeat series sample.
*/
import Foundation
import HealthKit

extension HKHeartbeatSeriesSample: Detailable {
    
    var summaryString: String {
        return "Beat-to-Beat Reading"
    }
    
    // For the overview, we'll display the start date of the sample as well as the number of heartbeats
    var overviewStrings: [String] {
        var overviewItems: [String] = []

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = Locale(identifier: "en_US")
        overviewItems.append("Start: \(dateFormatter.string(from: self.startDate))")
        overviewItems.append("Number of heartbeats: \(self.count)")
        
        return overviewItems
    }
    
    // The detail strings for the HKHeartbeatSeriesSample are the individual time stamps of heart beats
    // since the start of data collection. You can use an HKHeartbeatSeriesQuery to get these individual time stamps.
    func getDetailStrings(_ healthStore: HKHealthStore, with completion: @escaping ([String]) -> Void) {
        var details: [String] = []
        
        let query = HKHeartbeatSeriesQuery(heartbeatSeries: self) {
            (query, timeSinceSeriesStart, precededByGap, done, error) in
            if error != nil {
                fatalError("Error during query: \(String(describing: error))")
            }
            details.append("\(round(1000 * timeSinceSeriesStart) / 1000) s")
            if done == true {
                completion(details)
            }
        }
        
        healthStore.execute(query)
    }
}

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
        
        
    }
}
