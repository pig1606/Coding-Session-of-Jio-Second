//
//  JournalViewModel.swift
//  SecondSession
//
//  Created by Minyoung Kim on 2022/11/27.
//

import Foundation
import SwiftUI

class JournalViewModel: ObservableObject {
    
    // Sample Tasks
    @Published var storedJournal: [Journal] = [
    
        Journal(emoji: "😁", journaltext: "나도 지코 열심히 해서 빨리 코딩 잘하고 싶다! 지오 나 입만 살았지만 그래도 매일 1 commit은 해볼게!", journalDate: .init(timeIntervalSince1970: 1669564576)),
        Journal(emoji: "🤬", journaltext: "근데 아직까지 얘가 내 말을 못 알아듣는 건 짜증나, 컴퓨터 사실 바보 상자 아님? 누가 인공지능이 세상을 지배한대?", journalDate: .init(timeIntervalSince1970: 1669650976)),
        Journal(emoji: "😢", journaltext: "처음부터 코딩을 인간 언어로 할 수 있게 만들었으면 이런 일은 없지 않았을까? 요즘 초등학생도 다 코딩한다던데 뿌엥", journalDate: .init(timeIntervalSince1970: 1669823776)),
        Journal(emoji: "🤩", journaltext: "아 그래도 코딩하는 건 즐거워~ 오해하지 말아줘 지오, 나 아카데미 끝나고도 계속 지코 질척댈테니까 기대해줘", journalDate: .init(timeIntervalSince1970: 1669910176))
        
    ]
    
    // MARK: Current Week Days
    @Published var currentWeek: [Date] = []

    // MARK: Current Day
    @Published var currentDay: Date = Date()
    
    // MARK: Filtering Today Journals
    @Published var filteredJournals: [Journal]?
    
    // MARK: Intializing
    init(){
        fetchCurrentWeek()
        filterTodayJournals()
    }
    
    // MARK: Filter Today Journals
    func filterTodayJournals() {
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            let calendar = Calendar.current
            let filtered = self.storedJournal.filter {
                return calendar.isDate($0.journalDate, inSameDayAs: self.currentDay)
                
            }
            
            DispatchQueue.main.async {
                withAnimation{
                    self.filteredJournals = filtered
                    
                }
            }
        }
    }
    
    func fetchCurrentWeek(){
        let today = Date()
        let calendar = Calendar.current
        
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else {
            return
        }
        
        (1...7).forEach { day in
            
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay){
                currentWeek.append(weekday)
            }
        }
    }
    
    // MARK: Extracting Date
    func extractDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
    
    // MARK: Checking if current Date is Today
    func isToday(date: Date) -> Bool {
    
        let calendar = Calendar.current
        return calendar.isDate(currentDay, inSameDayAs: date)
        
    }
}
