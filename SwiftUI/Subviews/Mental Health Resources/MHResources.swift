//
//  SwiftUIView.swift
//  24Syn
//
//  Created by Jason Tsang on 2022-11-29.
//

import SwiftUI



struct MHResources: View {
    @AppStorage("isPresented") var isPresented: Bool = false

    var body: some View {
        ZStack {
            ScrollView() {
                VStack(spacing: 10){
                    HStack {
                        ZStack {
                            Image(systemName: "chevron.down.circle")
                                .scaleEffect(1.5)
                            Button(" "){
                                isPresented.toggle()
                            }
                        }
                    }
                    Text("General Self-Help Resources")
                        .foregroundColor(.black)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .bold(true)
                    LinkViews(title: "Mental Health e-Learning Module", URL: URL(string: "https://owl.uwo.ca/portal/directtool/91d607ca-3f5d-4b17-9c83-f8ae54b2a529/")!, subtitle: "This 15-minute module provides participants with a basic understanding of Mental Health issues and of available campus and community resources.")
                    LinkViews(title: "Anxiety Canada", URL: URL(string: "https://owl.uwo.ca/portal/directtool/91d607ca-3f5d-4b17-9c83-f8ae54b2a529/")!, subtitle: "Free on-line, self-help, and evidence-based resources on anxiety.")
                    LinkViews(title: "Here to Help BC", URL: URL(string: "https://owl.uwo.ca/portal/directtool/91d607ca-3f5d-4b17-9c83-f8ae54b2a529/")!, subtitle: "Free information and self-help to help take care of your mental health and use substances in healthier ways.")
                    LinkViews(title: "Meditation Oasis", URL: URL(string: "https://owl.uwo.ca/portal/directtool/91d607ca-3f5d-4b17-9c83-f8ae54b2a529/")!, subtitle: "Free Guided Meditations")
                    LinkViews(title: "Centre for Clinical Interventions", URL: URL(string: "https://owl.uwo.ca/portal/directtool/91d607ca-3f5d-4b17-9c83-f8ae54b2a529/")!, subtitle: "Free self-help resources for conditions such as depression, panic, generalised anxiety, social anxiety, and disordered eating.")
                    LinkViews(title: "Psychological Tools Limited", URL: URL(string: "https://owl.uwo.ca/portal/directtool/91d607ca-3f5d-4b17-9c83-f8ae54b2a529/")!, subtitle: "Free guide to living with worry and anxiety amidst global uncertainty.")
                    LinkViews(title: "Togetherall", URL: URL(string: "https://owl.uwo.ca/portal/directtool/91d607ca-3f5d-4b17-9c83-f8ae54b2a529/")!, subtitle: "An on-line peer-to-peer support community for your mental health.")
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MHResources()
    }
}
