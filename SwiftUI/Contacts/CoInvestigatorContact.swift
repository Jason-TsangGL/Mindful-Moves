
import SwiftUI

struct CoInvestigatorView: View {
  // MARK: - PROPERTIES
  
  
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            // MARK: - HEADER
            HStack {
                    Image("UWOCREST")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .frame(width: 150, height: 150, alignment: .center)
                    Image("EHPL")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .frame(width: 150, height: 150, alignment: .center)
            }
            Form {
                // MARK: - SECTION #2
                Section(header: Text("Information")) {
                        HStack {
                            Text("Name").foregroundColor(Color.gray)
                            Spacer()
                            Text("Jason Tsang")
                        }
                        HStack {
                            Text("Title").foregroundColor(Color.gray)
                            Spacer()
                            Text("Undergraduate Research Student")
                        }
                        HStack {
                            Text("Role").foregroundColor(Color.gray)
                            Spacer()
                            Text("Co-Investigator / App Developer")
                        }
                        HStack {
                            Text("Faculty").foregroundColor(Color.gray)
                            Spacer()
                            Text("School of Kinesiology, Health Sciences")
                        }
                        HStack {
                            Text("Institution").foregroundColor(Color.gray)
                            Spacer()
                            Text("University of Western Ontario")
                        }
                        HStack {
                            Text("Location").foregroundColor(Color.gray)
                            Spacer()
                            Text("London, Ontario, Canada")
                        }
                        HStack {
                            Text("Postal Code").foregroundColor(Color.gray)
                            Spacer()
                            Text("N6A 3K7")
                        }
                    HStack {
                        Text("Telephone").foregroundColor(Color.gray)
                        Spacer()
                        Text("416-520-6089")
                    }
                        HStack {
                            Text("Email").foregroundColor(Color.gray)
                            Spacer()
                            Text("jtsang83@uwo.ca")
                        }
                        HStack {
                            Text("Link").foregroundColor(Color.gray)
                            Spacer()
                            Text("www.ehpl.ca")
                        }
 
                }//MARK: Section I END
                // MARK: - SECTION II
                //          Section(header: Text("General Settings")) {
                //            Toggle(isOn: $enableNotification) {
                //              Text("Enable notifiacation")
                //            }
                //            Toggle(isOn: $backgroundRefresh) {
                //              Text("Background refresh")
                //            }
                //          }// MARK: - SECTION II END
            }
        }
        .frame(maxWidth: 640)
    }
}

struct CoInvestigatorView_Preview: PreviewProvider {
  static var previews: some View {
      CoInvestigatorView()
  }
}
