import Foundation
import CloudKit

struct Fallacy: Hashable, Identifiable {
    var id = UUID()
    var recordID: CKRecord.ID?
    
    var lastUpdated: Date?
    var updateDate: String {
        if lastUpdated != nil {
            if let date = lastUpdated {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd/MM/yyyy hh:mm:ss a"
                dateFormatter.amSymbol = "AM"
                dateFormatter.pmSymbol = "PM"
                return dateFormatter.string(from: date)
            } else {
                return lastUpdated?.description(with: Locale(identifier: "en_AU")) ?? "Unknown"
            }
        } else {
            return "Unknown"
        }
    }
    
    var name: String = ""
    var latinName: String = ""
    var aliases: [String] = [""]
    var logicalForms: [String] = [""]
    var description: String = ""
    var examples: [String] = [""]
    var exceptions: [String] = [""]
    var tip: String = ""
    var references: [String] = [""]
    
    var featured: Int64 = 0
    var isFeatured: Bool {
        let nsNumber = NSNumber(value: featured)
        return Bool(truncating: nsNumber)
    }
    
    var newTerminology: [String] = [""]
}
