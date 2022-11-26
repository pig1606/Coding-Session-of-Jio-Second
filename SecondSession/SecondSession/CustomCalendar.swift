//
//  CustomCalendar.swift
//  SecondSession
//
//  Created by Minyoung Kim on 2022/11/26.
//

import SwiftUI

struct WeekValue: Identifiable {
    var id: Int
    var date : [Date]
}

struct CustomCalendar: View {
    @StateObject var weekStore = WeekStore()
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    
    var body: some View {
        
        ZStack {
            Color.primaryPurple
                .ignoresSafeArea()
            
            ForEach(weekStore.allWeeks) { week in
                VStack{
                    HStack {
                        ForEach(0..<7) { index in
                            VStack(spacing: 8) {
                                Text(weekStore.dateToString(date: week.date[index], format: "EEE"))
                                    .font(.system(size: 16, weight: .ultraLight))
                                    .frame(maxWidth:.infinity)
                                
                                Text(weekStore.dateToString(date: week.date[index], format: "d"))
                                    .font(.system(size:16, weight: .light))
                                    .frame(maxWidth:.infinity)
                                
                                Text("😁")
                            }
                            .onTapGesture {
                                // Updating Current Day
                                weekStore.currentDate = week.date[index]
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                    )
                }
                .offset(x: myXOffset(week.id), y: 0)
                .zIndex(1.0 - abs(distance(week.id)) * 0.1)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    draggingItem = snappedItem + value.translation.width / 400
                }
                .onEnded { value in
                    withAnimation {
                        if value.predictedEndTranslation.width > 0 {
                            draggingItem = snappedItem + 1
                        } else {
                            draggingItem = snappedItem - 1
                        }
                        snappedItem = draggingItem
                        weekStore.update(index: Int(snappedItem))
                    }
                })
    }
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(weekStore.allWeeks.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(weekStore.allWeeks.count) * distance(item)
        return sin(angle) * 200
    }
}


struct CustomCalendar_Previews: PreviewProvider {
    static var previews: some View {
        CustomCalendar()
    }
}
