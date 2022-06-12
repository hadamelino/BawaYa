//
//  DateHelper.swift
//  BawaYa_DesignRevised
//
//  Created by Hada Melino Muhammad on 08/06/22.
//

import Foundation

struct CalendarHelper {
    let calendar = Calendar.current
    let dateFormatter = DateFormatter()
    
    func getMonthString(date: Date) -> String {
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: date)
    }
    
    func getYearString(date: Date) -> String {
        dateFormatter.dateFormat = "YYYY"
        return dateFormatter.string(from: date)
    }
    
    func daysInMonth(date: Date) -> Int {
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    func daysOfMonth(date: Date) -> Int {
        let components = calendar.dateComponents([.day], from: date)
        return components.day!
    }
    
    func firstOfMonth(date: Date) -> Date {
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: components)!
    }
    
    func weekDaysOfMonth(date: Date) -> Int {
        let components = calendar.dateComponents([.weekday], from: date)
        return components.weekday! - 1
    }
    
    func getWeekDayString() -> [String] {
        return ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    }
    
    func addDays(date: Date, days: Int) -> Date {
        return calendar.date(byAdding: .day, value: days, to: date)!
    }
    
    func sundayForDate(date: Date) -> Date {
        var current = date
        let aWeekAgo = addDays(date: current, days: -7)
        let dayAWeekAgo = calendar.dateComponents([.weekday], from: aWeekAgo).weekday! - 1
        
        if dayAWeekAgo == 1 {
            //Sunday
            return aWeekAgo
        } else {
            current = addDays(date: aWeekAgo, days: dayAWeekAgo)
            return current
        }
    
    }
    
    
}
