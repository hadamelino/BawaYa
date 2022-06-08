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
        return components.weekday!
    }
    
}
