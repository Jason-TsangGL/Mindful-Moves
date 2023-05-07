//
//  MHLinksView.swift
//  24Syn
//
//  Created by Jason Tsang on 2022-11-29.
//

import SwiftUI
import WebKit
struct NavLinkView: View {
    @AppStorage("isPresented") var isPresented: Bool = false

    var body: some View{
        Button("Self-Help Resources"){
            isPresented.toggle()
        }
        .foregroundColor(.purple)
        .font(.title)
        .fontWeight(.semibold)
        Rectangle()
            .frame(height: 1)
            .foregroundColor(.gray)
            .opacity(0.5)
            .padding(.horizontal)
    }
}

struct FAQLinkView: View {
    @AppStorage("FAQisPresented") var FAQisPresented: Bool = false

    var body: some View{
        Button("Frequently Asked Questions (FAQs)"){
            FAQisPresented.toggle()
        }
        .foregroundColor(.purple)
        .font(.title)
        .fontWeight(.semibold)
        Rectangle()
            .frame(height: 1)
            .foregroundColor(.gray)
            .opacity(0.5)
            .padding(.horizontal)
    }
}

struct MHLinksView: View {
    var body: some View {
        VStack{
            NavLinkView()
            Link("Mental Health Support", destination: URL(string: "https://www.uwo.ca/health/psych/index.html")!)
            .foregroundColor(.purple)
            .font(.title)
            .fontWeight(.semibold)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
                .opacity(0.5)
                .padding(.horizontal)
            Link("Book an Appointment", destination: URL(string: "https://www.uwo.ca/health/appointments.html")!)
            .foregroundColor(.purple)
            .font(.title)
            .fontWeight(.semibold)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
                .opacity(0.5)
                .padding(.horizontal)
            Link("Sexual Violence Support", destination: URL(string: "https://www.uwo.ca/health/student_support/survivor_support/index.html")!)
            .foregroundColor(.purple)
            .font(.title)
            .fontWeight(.semibold)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
                .opacity(0.5)
                .padding(.horizontal)
            Link("Enhance your Wellness", destination: URL(string: "https://www.uwo.ca/health/enhance_wellness/index.html")!)
            .foregroundColor(.purple)
            .font(.title)
            .fontWeight(.semibold)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
                .opacity(0.5)
                .padding(.horizontal)
            FAQLinkView()
        }
        .padding(.horizontal)
    }
}

struct MHLinksView_Previews: PreviewProvider {
    static var previews: some View {
        MHLinksView()
    }
}

