//
//  UWOContact.swift
//  MindfulMoves
//
//  Created by Jason Tsang on 2023-01-05.
//

import SwiftUI

struct REBContactView: View {
    var body: some View {
        
        // MARK: - HEADER
              VStack(alignment: .center, spacing: 5) {
                  Image("WesternResearch")
                      .resizable()
                      .scaledToFit()
                      .padding()
                      .scaleEffect(75/100)
              
          
        Form {
          // MARK: - SECTION #2
            Section(header: Text("Oversight & Compliance"),footer: Text("The human research ethics team, on behalf of Western University's Research Ethics Boards (REB), manages the approval and monitoring process for the use of humans in research at Western and its affiliated hospitals and research institutes.")) {
                HStack {
                    Text("Department").foregroundColor(Color.gray)
                    Spacer()
                    Text("Western Research")
                }
                HStack {
                    Text("Board").foregroundColor(Color.gray)
                    Spacer()
                    Text("Research Ethics Boards (REB)")
                }
                HStack {
                    Text("Team").foregroundColor(Color.gray)
                    Spacer()
                    Text("Human Research Ethics")
                }
                HStack {
                    Text("Location").foregroundColor(Color.gray)
                    Spacer()
                    Text("Rm 5150, Support Service Building")
                }
                HStack {
                    Text("Phone").foregroundColor(Color.gray)
                    Spacer()
                    Text("519-661-3036")
                }
                HStack {
                    Text("Email").foregroundColor(Color.gray)
                    Spacer()
                    Text("ethics@uwo.ca")
                }
                HStack {
                    Text("Link").foregroundColor(Color.gray)
                    Spacer()
                    Text("www.ehpl.ca")
                }
            }
          }//MARK: Section I END
        }
        .frame(maxWidth: 640)
        }
    }


struct UWOContact_Previews: PreviewProvider {
    static var previews: some View {
        REBContactView()
    }
}
