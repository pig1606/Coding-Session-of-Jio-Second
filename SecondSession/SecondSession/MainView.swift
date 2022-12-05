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
            ZStack(alignment: .top) {
                Color.primaryPurple
                    .ignoresSafeArea()
                VStack(spacing: 0) {
                    CustomCalendar()
                    
                    Spacer()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("MyMoo")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
                }
                ToolbarItem(placement: .principal) {
                    Image(systemName: "pencil")
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
