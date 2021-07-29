//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Franklin Tan on 7/28/21.
//

import Foundation

class AssignmentList: ObservableObject {
    @Published var assignments : [AssignmentItem] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(assignments) {
                UserDefaults.standard.set(encoded, forKey: "data")
            }
        }
    }
    init() {
        if let assignments = UserDefaults.standard.data(forKey: "data") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([AssignmentItem].self, from: assignments) {
                self.assignments = decoded
                return
            }
        }
        assignments = []
    }
}
