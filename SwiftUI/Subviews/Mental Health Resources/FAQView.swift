//
//  FAQView.swift
//  24Syn
//
//  Created by Jason Tsang on 2022-12-02.
//
import PDFKit
import SwiftUI

struct FAQView: View {
    @AppStorage("FAQisPresented") var FAQisPresented : Bool = true
    var body: some View {
        ScrollView {
            VStack{
                ZStack {
                    Image(systemName: "chevron.down.circle")
                        .scaleEffect(1.5)
                    Button(" "){
                        FAQisPresented.toggle()
                    }
                }
                HStack {
                    Text("Frequently Asked Questions (FAQs)")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                    .bold(true)
                    Image("UWOCREST")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100,height: 100)
                }
                QAView(Q: "How do I book a Crisis appointment?", A: "A: Visit UCC 11 (Lower Level, University Community Centre), during office hours, or call (519) 661-3030.")
                QAView(Q: "Who is eligible to access Mental Health Support?", A: "A: Current students (undergraduate and graduate)")
                QAView(Q: "Q: Who will know I’m accessing Mental Health Support?", A: "Your information is kept confidential and only shared with your consent.")
                QAView(Q: "Q: What is the difference between a psychologist and a psychiatrist?", A: "A: All psychologists at Mental Health Support have a doctorate degree in Psychology and are registered with the College of Psychologists of Ontario as a Clinical Psychologist and/or a Counselling Psychologist. A psychiatrist holds a degree in medicine, specializing in mental health and mental disorders. Because a psychiatrist is a medical doctor, he/she is able to prescribe psychotropic medications and support patients with the medication. Mental Health Support is home to highly-trained professional staff who employ targeted change-oriented mental health strategies to support student success. Counselling at Mental Health Support is offered by psychologists, registered psychotherapists, counsellors, psychology residents, and masters-level counselling students. Student Health Support (located in UCC 11) offers counselling and medical support. With general practitioners, psychiatrists, and social workers on staff, they support students with general medical concerns in addition to more complex mental health issues that may require medication. To contact Student Health Support, please call (519) 661-3030, or (519) 661-3771 (for counselling).")
            }
        }
        }
    }


struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}
struct QAView: View {
    var Q : String
    var A : String
    var body: some View {
        VStack(alignment: .leading){
            Text(Q)
                .font(.title2)
                .bold(true)
            Text(A)
        }
        .padding()
    }
}
