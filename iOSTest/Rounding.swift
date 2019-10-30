//
//  Rounding.swift
//  iOSTest
//
//  Created by C4Q on 10/29/19.
//  Copyright © 2019 D&ATechnologies. All rights reserved.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
