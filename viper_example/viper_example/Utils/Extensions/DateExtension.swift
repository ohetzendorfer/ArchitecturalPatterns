//
//  DateExtension.swift
//  viper_example
//
//  Created by Oliver Mastny on 05/01/2017.
//  Copyright © 2017 Oliver Mastny. All rights reserved.
//

import Foundation

public enum DateFormatType: String {
    case long = "dd.MM.yyyy HH:mm"
}

extension NSDate {
    func getString(withDateFormatType dateFormatType: DateFormatType) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormatType.rawValue
        return dateFormatter.string(from: self as Date)
    }
}
