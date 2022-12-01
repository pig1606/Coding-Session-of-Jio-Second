//
//  AddMoodView.swift
//  SecondSession
//
//  Created by Minyoung Kim on 2022/11/26.
//

import SwiftUI

struct AddMoodView: View {
    let emoji = ["🤩", "😁", "🙂", "😐", "🙁", "😔", "😢", "🤒", "🤬"]
    let columns: [GridItem] = Array(repeating: .init(.fixed(64), spacing: 50), count: 3)
    
    var body: some View {
        NavigationView {
            ZStack {
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
                
                VStack (spacing: 100) {
                    LazyVGrid(columns: columns, spacing: 30) {
                        ForEach(emoji, id: \.self) { item in
                            Text(item)
                                .font(.system(size:64))
                        }
                    }
                    
                    Text("You're")
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .regular))
                    
                    NavigationLink(destination: AddJournalView()) {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 350, height: 64)
                            .foregroundColor(.tertiaryPurple)
                            .overlay(Text("Continue")
                                .foregroundColor(.white)
                                .font(.system(size:24, weight: .bold)))
                            .offset(y: 47)
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
