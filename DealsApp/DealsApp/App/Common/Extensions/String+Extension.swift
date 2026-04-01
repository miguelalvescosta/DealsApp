//
//  String+Extension.swift
//  DealsApp
//
//  Created by Miguel Costa on 31/03/2026.
//
import UIKit

extension String {
    var htmlToString: String {
        guard let data = self.data(using: .utf16) else { return self }
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf16.rawValue
        ]
        if let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) {
            return attributedString.string
        }
        return self
    }
    
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
