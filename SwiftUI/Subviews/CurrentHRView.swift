//
//  CurrentHRView.swift
//  MindfulMoves
//
//  Created by Jason Tsang on 2022-12-22.
import SwiftUI
import HealthKit

struct HRViewer: View {
    private var healthStore = HKHealthStore()
    let heartRateQuantity = HKUnit(from: "count/min")
    @State private var value : Double = 0
    var body: some View {
        ZStack{
            Color(.systemGray6)
            HStack{
                Image(systemName: "heart")
                    .resizable()
                    .modifier(IconModifier())
                Spacer()
                Text("\(value.description) bpm")
                Text("HR")
            }
        }
        .onAppear(perform: autorizeHealthKit)
        .onAppear(perform: latestHarteRate)
    }
    func latestHarteRate(){
        guard let sampleType = HKObjectType.quantityType(forIdentifier: .heartRate) else {
            return
        }
        let startDate = Calendar.current.date(byAdding: .month, value: -1, to: Date())
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictEndDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: [sortDescriptor]) {(sample,result,error) in guard error == nil else{
            return
        }
            let data = result![0] as! HKQuantitySample
            let unit = HKUnit(from: "count/min")
            let latestHr = data.quantity.doubleValue(for: unit)
            print("Latest Hr\(latestHr) BPM")
            self.value = (latestHr)
        }
        self.healthStore.execute(query)
    }
        func autorizeHealthKit() {
            let healthKitTypes: Set = [
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!]
            healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes) { _, _ in }
        }
}
