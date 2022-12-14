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
    
        Journal(emoji: "π", journaltext: "λλ μ§μ½ μ΄μ¬ν ν΄μ λΉ¨λ¦¬ μ½λ© μνκ³  μΆλ€! μ§μ€ λ μλ§ μ΄μμ§λ§ κ·Έλλ λ§€μΌ 1 commitμ ν΄λ³Όκ²!", journalDate: .init(timeIntervalSince1970: 1669564576)),
        Journal(emoji: "π€¬", journaltext: "κ·Όλ° μμ§κΉμ§ μκ° λ΄ λ§μ λͺ» μμλ£λ κ±΄ μ§μ¦λ, μ»΄ν¨ν° μ¬μ€ λ°λ³΄ μμ μλ? λκ° μΈκ³΅μ§λ₯μ΄ μΈμμ μ§λ°°νλ?", journalDate: .init(timeIntervalSince1970: 1669650976)),
        Journal(emoji: "π’", journaltext: "μ²μλΆν° μ½λ©μ μΈκ° μΈμ΄λ‘ ν  μ μκ² λ§λ€μμΌλ©΄ μ΄λ° μΌμ μμ§ μμμκΉ? μμ¦ μ΄λ±νμλ λ€ μ½λ©νλ€λλ° λΏμ₯", journalDate: .init(timeIntervalSince1970: 1669823776)),
        Journal(emoji: "π€©", journaltext: "μ κ·Έλλ μ½λ©νλ κ±΄ μ¦κ±°μ~ μ€ν΄νμ§ λ§μμ€ μ§μ€, λ μμΉ΄λ°λ―Έ λλκ³ λ κ³μ μ§μ½ μ§μ²λνλκΉ κΈ°λν΄μ€", journalDate: .init(timeIntervalSince1970: 1669910176))
        
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
