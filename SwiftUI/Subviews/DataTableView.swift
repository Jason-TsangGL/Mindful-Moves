import SwiftUI

struct DataTableView: View {

    var body: some View {
        VStack{
            Text("[PRE-PRODUCTION BUILD]")
                .foregroundColor(.gray)
            TabView{
                VStack{
                    Text("Sleep Analysis")
                    List(publicDS.saDS) { analysis in
                    VStack {
                        Text("\(Int(analysis.Duration)) Mins | \(analysis.SleepType)")
                            .bold(true)
                        Text(analysis.SleepTime+"//"+analysis.WakeTime)
                            .font(.subheadline)
                        Text("Source: \(analysis.Device)")
                            .font(.subheadline)
                        Text("6: Asleep Unspecified 5: Asleep REM 4: Asleep Deep")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("3: Asleep Core 2: Active 1: Awake 0: In Bed")
                            .font(.caption)
                            .foregroundColor(.gray)
                        }
                    }
                }
                VStack{
                    Text("Stand Time")
                    List(publicDS.DailyStandTime) { analysis in
                    VStack {
                        Text("\(Int(analysis.Duration)) Mins")
                            .bold(true)
                        Text(analysis.StartTime+"//"+analysis.EndTime)
                            .font(.subheadline)
                        }
                    }
                }
                    VStack{
                        Text("Daily Steps")
                        List(publicDS.DailySteps) { analysis in
                            HStack(alignment:.center) {

                            VStack {
                                Text("\(Int(analysis.Value)) Steps")
                                    .bold(true)
                                Text(analysis.StartTime+"//"+analysis.EndTime)
                                    .font(.subheadline)
                                Text("Source: \(analysis.Device)")
                                    .font(.subheadline)
                            }
                        }
                    }
                }
                VStack{
                    Text("Step Distance")
                    List(publicDS.StepDistance) { analysis in
                        HStack(alignment:.center) {

                        VStack {
                            Text("\(Int(analysis.Value)) m")
                                .bold(true)
                            Text(analysis.StartTime+"//"+analysis.EndTime)
                                .font(.subheadline)
                            Text("Source: \(analysis.Device)")
                                .font(.subheadline)
                        }
                    }
                }
            }
                VStack{
                    Text("Cadence Data")
                    List(publicDS.CadenceDataSet) { analysis in
                        HStack(alignment:.center) {
                        VStack {
                            Text("\(Int(analysis.Value)) Step/min")
                                .bold(true)
                            Text("\(analysis.Date) | \(Int(analysis.TimeInterval)) Seconds")
                                .font(.subheadline)
                        }
                    }
                }
            }
                VStack{
                    Text("Heart Rate")
                    List(publicDS.HRDataSet) { analysis in

                        HStack(alignment:.center) {
                            VStack(alignment: .center) {
                                Text("\(Int(analysis.Value)) Bpm ")
                                    .bold(true)
                                Text(analysis.Date)
                                    .font(.subheadline)
                                Text("Motion Context: \(analysis.MotionContext)")
                                    .font(.subheadline)
                                Text("2: Active 1: Sedentary 0: Unknown")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                VStack{
                    Text("Resting Heart Rate")
                    List(publicDS.RestingHeartRate) { analysis in
                    VStack {
                        Text("\(Int(analysis.Value)) bpm")
                            .bold(true)
                        Text(analysis.StartTime+"//"+analysis.EndTime)
                            .font(.subheadline)
                        Text("Duration: \(analysis.Duration/3600) hrs")
                            .font(.subheadline)
                        }
                    }
                }

            }
            .tabViewStyle(.page)
        }
    }
}

struct DataTableView_Previews: PreviewProvider {
    static var previews: some View {
        DataTableView()
    }
}
