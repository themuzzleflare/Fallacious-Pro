import Foundation
import CloudKit

class CKFallacy {
    static let database = CKContainer.default().publicCloudDatabase
    
    class func fetch(completion: @escaping (Result<[Fallacy], Error>) -> ()) {
        let predicate = NSPredicate(value: true)
        let name = NSSortDescriptor(key: "name", ascending: true)
        let query = CKQuery(recordType: "Fallacies", predicate: predicate)
        
        query.sortDescriptors = [name]
        
        let operation = CKQueryOperation(query: query)
        operation.zoneID = .default
        operation.desiredKeys = ["name", "latinName", "aliases", "logicalForms", "description", "examples", "exceptions", "tip", "references", "isFeatured", "newTerminology"]
        operation.resultsLimit = 200
        
        var newFallacies = [Fallacy]()
        
        operation.recordFetchedBlock = { record in
            var fallacy = Fallacy()
            
            fallacy.recordID = record.recordID
            fallacy.lastUpdated = record.modificationDate
            fallacy.name = record["name"] as! String
            fallacy.latinName = record["latinName"] as? String ?? ""
            fallacy.aliases = record["aliases"] as? [String] ?? [""]
            fallacy.logicalForms = record["logicalForms"] as? [String] ?? [""]
            fallacy.description = record["description"] as! String
            fallacy.examples = record["examples"] as? [String] ?? [""]
            fallacy.exceptions = record["exceptions"] as? [String] ?? [""]
            fallacy.tip = record["tip"] as? String ?? ""
            fallacy.references = record["references"] as? [String] ?? [""]
            fallacy.featured = record["isFeatured"] as? Int64 ?? 0
            fallacy.newTerminology = record["newTerminology"] as? [String] ?? [""]
            
            newFallacies.append(fallacy)
        }
        
        operation.queryCompletionBlock = { (cursor, operationError) in
            DispatchQueue.main.async {
                if let error = operationError {
                    completion(.failure(error))
                } else {
                    completion(.success(newFallacies))
                    print("Finished fetching fallacies.")
                }
            }
        }
        database.add(operation)
    }
}
