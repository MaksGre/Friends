//
//  String+Extension.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 02/10/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import Foundation

extension String {
    
    func discardUnwantedPart() -> String {
        guard let index = self.firstIndex(of: ".") else { return self }
        return self[index..<self.endIndex] == ".0" ? String(self[self.startIndex..<index]) : self
    }
    
    func dateInDesiredFormat() -> String {
        guard let date = ISO8601DateFormatter().date(from: self) else { return self }
        
        let dateFormatterDesired = DateFormatter()
        dateFormatterDesired.dateFormat = "HH:mm dd.MM.yy"
        
        return String(dateFormatterDesired.string(from: date))
    }
}
