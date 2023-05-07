import SwiftUI

struct WatchConnectivityView: View {
    
    
    var body: some View {
        VStack {
            Text("Please pair your Apple Watch")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .bold(true)
            Text("Oh No!.. No Apple Watch is connected to this iPhone.")
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding()
            Image(systemName: "applewatch.slash")
                .resizable()
                .scaledToFit()
                .frame(width: 300, alignment: .center)
                .foregroundColor(.accentColor)
                .padding()
            Text("Unfortunately this app requires an active connection with an Apple Watch")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()


            Text("Which Watch models are Compitable?")
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .bold(true)
            Menu("Compatiable Models") {
                Button("SE (1st Gen.)", action:pc)
                Button("SE (2st Gen.)", action:pc)
                Button("Series 4", action:pc)
                Button("Series 5", action:pc)
                Button("Series 6", action:pc)
                Button("Series 7", action:pc)
                Button("Series 8", action:pc)
            }
            .font(.title2)
            .padding(.bottom)

            Text("Ensure that your Apple Watch is updated to the latest WatchOS version.")
                .font(.title3)
                .italic(true)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            .padding(.bottom)
        }
        .padding()
    }
}
struct WatchConnectivityViews: PreviewProvider {
    static var previews: some View {
        WatchConnectivityView()
    }
}

func pc() {}
