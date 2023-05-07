//
//  MHContactView.swift
//  24Syn
//
//  Created by Jason Tsang on 2022-11-29.
//

import SwiftUI

struct MHContactView: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 10) {
            Text("Contact Information:")
                .font(.title)
                .foregroundColor(.purple)
                .bold(true)
            Text(verbatim: """
Health & Wellness
Thames Hall
Tel: (519) 661-3030
health@uwo.ca

*Given the non-secure nature of email, Health & Wellness cannot ensure the confidentiality of this communication. Please use discretion when sending sensitive information.
"""
)
        }
    }
}

struct MHContactView_Previews: PreviewProvider {
    static var previews: some View {
        MHContactView()
    }
}
