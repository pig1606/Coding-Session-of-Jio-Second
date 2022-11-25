//
//  EditJournalView.swift
//  SecondSession
//
//  Created by Minyoung Kim on 2022/11/26.
//

import SwiftUI

struct AddJournalView: View {
    var body: some View {
        
        NavigationView {
            ZStack{
                Color.primaryPurple
                    .ignoresSafeArea()
                
                Text("")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            VStack {
                                Text("Add new journal")
                                    .font(.system(size: 17, weight: .semibold))
                                    .foregroundColor(.white)
                            }
                        }
                    }
            }
        }
    }
}

struct AddJournalView_Previews: PreviewProvider {
    static var previews: some View {
        AddJournalView()
    }
}
