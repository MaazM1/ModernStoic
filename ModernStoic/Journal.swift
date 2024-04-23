//
//  Journal.swift
//  ModernStoic
//
//  Created by Maaz M on 4/21/24.
//

import UIKit

struct Journal: Codable {
    var title: String
    
    var entry: String
    
    init(title: String, entry: String) {
        self.title = title
        self.entry = entry
    }
    
    var id: String = UUID().uuidString

}

extension Journal {
    
    static func save(_ journals: [Journal]) {
        let defaults = UserDefaults.standard
        let encodedData = try! JSONEncoder().encode(journals)
        defaults.set(encodedData, forKey: "key")
    }
    
    
    static func getJournals() -> [Journal] {
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: "key") {
            let decodedJournals = try! JSONDecoder().decode([Journal].self, from: data)
            return decodedJournals
        }
        return []
    }
    
    func save() {
        var savedJournal = Journal.getJournals()
        
        if let index = savedJournal.firstIndex(where: {$0.id == self.id}) {
            savedJournal.remove(at: index)
            savedJournal.insert(self, at: index)
        } else {
            savedJournal.append(self)
        }
        Journal.save(savedJournal)
    }
    
    
}

