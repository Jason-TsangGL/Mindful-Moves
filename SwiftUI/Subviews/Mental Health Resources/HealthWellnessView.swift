import SwiftUI
import WebKit
struct HWHeader: View {
    var body: some View {
        VStack{
            Image("wellness")
                .resizable()
                .scaledToFit()
            Text("Health and Wellness")
                .font(.largeTitle)
                .foregroundColor(.accentColor)
                .fontWeight(.semibold)
            Text("It's your health. It's your wellness. We'd like to help.")
                .font(.title2)
                .foregroundColor(.purple)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
    }
}

struct boldbar: View {
    var body: some View {
        Rectangle()
            .frame(height: 4)
            .foregroundColor(.gray)
            .opacity(0.5)
            .padding(.horizontal)
    }
}

struct HealthWellnessView: View {
    @AppStorage("isPresented") var isPresented: Bool = false
    @AppStorage("FAQisPresented") var FAQisPresented: Bool = false

    var body: some View {
        ScrollView(){
                VStack{
                    HWHeader()
                    boldbar()
                    MHLinksView()
                    EmergencyMHView()
                        .padding(.bottom)
                    MHContactView()
                        .padding(.horizontal)
                    }
                }
        .fullScreenCover(isPresented: $isPresented){
            MHResources()
        }
        .fullScreenCover(isPresented: $FAQisPresented) {
            FAQView()
        }
    }
}

struct HealthWellnessView_Previews: PreviewProvider {
    static var previews: some View {
        HealthWellnessView()
    }
}
