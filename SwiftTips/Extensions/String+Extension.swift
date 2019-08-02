//
//  String+Extension.swift
//  SwiftTips
//
//  Created by 築山朋紀 on 2019/08/02.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import Foundation

extension String {
    var date: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale.system
        dateFormatter.calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        guard let date = dateFormatter.date(from: self) else {
            fatalError("Invalid string")
        }
        return date
    }
}
