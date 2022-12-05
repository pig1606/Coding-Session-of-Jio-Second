//
//  CustomCalendar.swift
//  SecondSession
//
//  Created by Minyoung Kim on 2022/11/26.
//

import SwiftUI

struct CustomCalendar: View {
    @StateObject var journalModel: JournalViewModel = JournalViewModel()
    @Namespace var animation
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.primaryPurple
                .ignoresSafeArea()
            
            // MARK: Lazy Stack With Pinned Header
            LazyVStack(spacing: 20, pinnedViews: [.sectionHeaders]) {
                Section {
                    
                    // MARK: Current Week View
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.tertiaryPurple)
                            .frame(width: 350, height: 108)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack (spacing: 7) {
                                ForEach(journalModel.currentWeek, id: \.self) { day in
                                    
                                    VStack (spacing: 10) {
                                        Text(journalModel.extractDate(date: day, format: "EEE"))
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .ultraLight))
                                        
                                        Text(journalModel.extractDate(date: day, format: "d"))
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .light))
                                        
                                        Text ("🐷")
                                    }
                                    .frame(width: 39, height: 88)
                                    .background(
                                        ZStack{
                                            // MARK: Matched Geometry Effect
                                            if journalModel.isToday(date: day) {
                                                RoundedRectangle(cornerRadius: 5)
                                                    .fill(Color.secondaryPurple)
                                                    .opacity(journalModel.isToday(date: day) ? 1 : 0 )
                                                    .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                                            }
                                        })
                                    .contentShape(Capsule())
                                    .onTapGesture {
                                        // Updating Current Day
                                        withAnimation {
                                            journalModel.currentDay = day
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    JournalsView()
                } header: {
                    HeaderView()
                }
            }
            .padding(20)
        }
    }
    
    // MARK: Journal View
    func JournalsView() -> some View {
        LazyVStack (spacing: 18){
            
            if let journals = journalModel.filteredJournals {

                if journals.isEmpty {
                    Text("Select today's Mood!")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .semibold))
                }
                else {
                    ForEach(journals) { journal in
                        JournalWritingView(journal: journal)
                    }
                }
            }
            else {
                // MARK: Progress View
                ProgressView()
                    .offset(y: 100)
            }
        }
        
        // MARK: Updating Journals
        .onChange(of: journalModel.currentDay) { newValue in
            journalModel.filterTodayJournals()
        }
    }
    
    // MARK: Journal Writing View
    func JournalWritingView(journal: Journal) -> some View {
        Text(journal.journaltext)
            .foregroundColor(.white)
            .font(.system(size: 20, weight: .semibold))
            .frame(width: 310)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.white, lineWidth: 2)
                    .foregroundColor(.clear)
            )
    }
}

// MARK: Header
func HeaderView() -> some View {
    
    HStack(spacing: 36.45) {
        Text(Date().formatted(date: .long, time: .omitted))
            .foregroundColor(.white)
            .font(.system(size: 20, weight: .bold))
        
        Spacer()
            .frame(width: 5)
        
        Button{
            
        } label: {
            Image(systemName: "chevron.backward")
                .foregroundColor(.white)
                .frame(width: 9.55, height: 16.96)
        }
        
        Button{
            
        } label: {
            Image(systemName: "chevron.forward")
                .foregroundColor(.white)
                .frame(width: 9.55, height: 16.96)
        }
    }
    .hLeading()
    .padding(.leading, 20)
}


// MARK: UI Design Helper functions
extension View {
    func hLeading() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func hTrailing() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    func hCenter() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .center)
    }
}


struct CustomCalendar_Previews: PreviewProvider {
    static var previews: some View {
        CustomCalendar()
    }
}
