//
//  AddMoodView.swift
//  SecondSession
//
//  Created by Minyoung Kim on 2022/11/26.
//

import SwiftUI

struct AddMoodView: View {
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
                                Text("Add new mood")
                                    .font(.system(size: 17, weight: .semibold))
                                    .foregroundColor(.white)
                            }
                        }
                    }
            }
        }
    }
}

struct AddMoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddMoodView()
    }
}
