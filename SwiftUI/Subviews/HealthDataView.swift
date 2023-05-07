//
//  Created by Robert Petras
//  SwiftUI Masterclass ♥ Better Apps. Less Code.
//  https://swiftuimasterclass.com
//

import SwiftUI
import HealthKit
import CareKit
import ResearchKit

struct HealthDataView: View {
    private var healthStore = HKHealthStore()
   let heartRateQuantity = HKUnit(from: "count/min")
    @AppStorage("ParticipantAge") var Age : Int = 22
    @AppStorage("ParticipantWeight.Metric") var wtkg : Double = 52
    @AppStorage("ParticipantWeight.Imperial") var wtpd : Double = 155
    @AppStorage("ParticipantHeight.Imperial") var HeightImperial : Double = 155
    @AppStorage("ParticipantHeight.Metric") var HeightMetric : Double = 172
    @AppStorage("ParticipantBasalMetabolicRate") var BMR : Double = 1783

    var body: some View {
        ZStack {
            Color(.systemGray6)
            VStack {
                HStack(alignment: .center, spacing: 4) {
                    // 1st Column
                    VStack(alignment: .leading, spacing: 4) {

                        HStack() {
                            Image(systemName: "figure.walk")
                                .resizable()
                                .modifier(IconModifier())
                            Spacer()
                            Text("\(formulations().BMICalaulation().rounded(.toNearestOrAwayFromZero).description) ")
                            Text("BMI")
                        }
                        Divider()
                        HStack() {
                            Image(systemName: "flame.circle")
                                .resizable()
                                .modifier(IconModifier())
                            Spacer()
                            Text(BMR.formatted() + " kCal")
                            Text("BMR")
                        }
                        Divider()
                        HRViewer()
                        Divider()
                        HStack() {
                            Image(systemName: "arrow.clockwise.heart")
                                .resizable()
                                .modifier(IconModifier())
                            Spacer()
                            Text("Resting HR")
                        }
                    }
                    
                    // 2nd Column
                    VStack(alignment: .center, spacing: 16) {
                        HStack {
                            Divider()
                        }
                        
                        
                        HStack {
                            Divider()
                        }
                    }
                    
                    // 3rd Column
                    VStack(alignment: .trailing, spacing: 4) {
                        HStack() {
                            Text("Age ")
                            Text(Age.formatted() + " years")
                            Spacer()
                            Image(systemName: "person.crop.circle.badge.clock")
                                .resizable()
                                .modifier(IconModifier())
                        }
                        Divider()
                        HStack() {
                            Text("Weight")
                            Text(wtkg.formatted() + " kg")

                            Spacer()
                            Image(systemName: "camera.metering.matrix")
                                .resizable()
                                .modifier(IconModifier())
                        }
                        Divider()
                        HStack() {
                            Text("Height")
                            Text(HeightMetric.formatted() + " cm")

                            Spacer()
                            Image(systemName: "pencil.and.ruler.fill")
                                .resizable()
                                .modifier(IconModifier())
                        }
                        Divider()
                        HStack() {
                            Text("Max HR")
                            Spacer()
                            Image(systemName: "arrow.up.heart")
                                .resizable()
                                .modifier(IconModifier())
                        }
                    }
                }
                .font(.system(.callout, design: .serif))
                .foregroundColor(Color.gray)
                .padding(.horizontal)
                .frame(maxHeight: 220)
                Rectangle()
                    .frame(width: 300,height: 1,alignment: .center)
                    .padding()
            }
        }
    }
}





struct IconModifier: ViewModifier {
  func body(content: Content) -> some View {
      let dimensions : CGFloat = 20
    content
          .frame(width: dimensions,height: dimensions,alignment: .center)
          .foregroundColor(.accentColor)
          .scaledToFit()
          
  }
}

struct DishesView_Previews: PreviewProvider {

  static var previews: some View {

      HealthDataView()
  }
}

