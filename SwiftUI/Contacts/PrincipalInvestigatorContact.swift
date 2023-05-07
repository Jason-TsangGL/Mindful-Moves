
import SwiftUI

struct PrincipalInvestigatorView: View {
  // MARK: - PROPERTIES
  
  @State private var enableNotification: Bool = true
  @State private var backgroundRefresh: Bool = false
  
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
                    Text("Dr Harry Prapavessis, PhD")
                }
                HStack {
                    Text("Title").foregroundColor(Color.gray)
                    Spacer()
                    Text("Professor & Faculty Scholar")
                }
                HStack {
                    Text("Role").foregroundColor(Color.gray)
                    Spacer()
                    Text("Principal Investigator")
                }
                HStack {
                    Text("Appointments").foregroundColor(Color.gray)
                    Spacer()
                    Text("School of Kinesiology & Department of Oncology")
                }
                HStack {
                    Text("Faculty").foregroundColor(Color.gray)
                    Spacer()
                    Text("Health Sciences")
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
                    Text("Email").foregroundColor(Color.gray)
                    Spacer()
                    Text("hprapave@uwo.ca")
                }
                HStack {
                    Text("Link").foregroundColor(Color.gray)
                    Spacer()
                    Text("www.ehpl.ca")
                }

        }//MARK: Section I END
      }
    }
    .frame(maxWidth: 640)
  }
}

struct PrincipalInvestigatorView_Previews: PreviewProvider {
  static var previews: some View {
    PrincipalInvestigatorView()
  }
}
