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
            ZStack (alignment: .bottom){
                Color.primaryPurple
                    .ignoresSafeArea()
                
                VStack (spacing: 10){
                    Text("🤬")
                        .font(.system(size: 40))
                    
                    Text("You're")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .regular))
                    
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.tertiaryPurple)
                        .frame(width: 350, height: 395)
                        .padding(.top, 50)
                    
                    Button {
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 350, height: 64)
                            .foregroundColor(.tertiaryPurple)
                            .overlay(Text("Done")
                                .foregroundColor(.white)
                                .font(.system(size:24, weight: .bold)))
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Add new journal")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
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
