//
//  String+Ext.swift
//  Reminder
//
//  Created by Maycon Matias on 15/09/25.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
