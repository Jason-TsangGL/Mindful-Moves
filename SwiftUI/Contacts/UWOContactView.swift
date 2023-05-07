//
//  REBContact.swift
//  MindfulMoves
//
//  Created by Jason Tsang on 2023-01-05.
//

import SwiftUI

struct UWOContactView: View {
    var body: some View {
        
        // MARK: - HEADER
              VStack(alignment: .center) {
                  Image("UWO-PNG")
                      .resizable()
                      .scaledToFit()
                      .scaleEffect(3/4)
                      .padding(.horizontal)
          
        Form {
          // MARK: - SECTION #2
            Section(header: Text("Information"),footer: Text("The University of Western Ontario, also known as Western University or Western, is a public research university in London, Ontario, Canada.")) {
                HStack {
                    Text("Institution").foregroundColor(Color.gray)
                    Spacer()
                    Text("Western University")
                }
                HStack {
                    Text("Address").foregroundColor(Color.gray)
                    Spacer()
                    Text("1151 Richmond St")
                }
                HStack {
                    Text("Phone").foregroundColor(Color.gray)
                    Spacer()
                    Text("519-661-2111")
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
                    Text("welcome@uwo.ca")
                }
                HStack {
                    Text("Link").foregroundColor(Color.gray)
                    Spacer()
                    Text("http://www.uwo.ca/")
                }
            }
                
          }//MARK: Section I END
        }
        .frame(maxWidth: 640)
    }
}

struct REBContact_Previews: PreviewProvider {
    static var previews: some View {
        UWOContactView()
    }
}
