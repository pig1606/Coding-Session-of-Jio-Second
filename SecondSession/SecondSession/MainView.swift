//
//  ContentView.swift
//  SecondSession
//
//  Created by Minyoung Kim on 2022/11/24.
//

import SwiftUI

struct MainView: View {
    
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
                                Text("MyMoo")
                                    .font(.system(size: 17, weight: .semibold))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .navigationBarItems(trailing: NavigationLink(destination: AddJournalView()) {
                        Image(systemName: "pencil")
                    })
                    .accentColor(.white)
            }
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
