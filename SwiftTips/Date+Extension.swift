//
//  Date+Extension.swift
//  SwiftTips
//
//  Created by 築山朋紀 on 2019/08/02.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import Foundation

extension Date {
    /// 2019-07-10
    var string: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.locale = NSLocale.system
        return formatter.string(from: self)
    }
    
    func timeShaping(now: NSDate = NSDate()) -> String {
        let calendar = NSCalendar.current
        let unitFlags: Set<Calendar.Component> = [.minute, .hour, .day, .second, .year]
        let earliest = now.earlierDate(self)
        let latest = (earliest == now as Date) ? self : now as Date
        let components = calendar.dateComponents(unitFlags, from: earliest as Date, to: latest as Date)
        
        guard let year = components.year,
            let day = components.day,
            let hour = components.hour,
            let minute = components.minute,
            let second = components.second else {
                fatalError("Invalid components")
        }
        
        let diffSec = second + minute * 60 + hour * 3_600 + day * 86_400 + year * 31_536_000
        let result: String
        
        if diffSec < 60 {
            result = "\(diffSec)秒前"
        } else if diffSec < 3_600 {
            result = "\(diffSec)分前"
        } else if diffSec < 86_400 {
            result = "\(diffSec)時間前"
        } else if diffSec < 2_764_800 {
            result = "\(diffSec)日前"
        } else {
            result = self.string
        }
        return result
    }
}
