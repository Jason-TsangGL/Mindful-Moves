//
//  ContactListView.swift
//  MindfulMoves
//
//  Created by Jason Tsang on 2023-01-06.
//

import SwiftUI

struct ContactListView: View {
    var body: some View {
            Form {
                Section(header:Text("research study Contact"),footer:Text("For all contact inquiries in regards to this study and/or application, please contact the Co-Investigator/App Developer for direct response.")) {
                    NavigationLink("Co-Investigator/App Developer"){
                        CoInvestigatorView()
                    }
                    NavigationLink("Principal Investigator"){
                        PrincipalInvestigatorView()
                        
                    }
                    NavigationLink("Research Ethics Board"){
                        REBContactView()
                    }
                    NavigationLink("Western University"){ UWOContactView()
                    }
                }
            }
        }
        
    }


struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactListView()
    }
}
