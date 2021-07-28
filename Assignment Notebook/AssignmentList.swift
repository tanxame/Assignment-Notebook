//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Franklin Tan on 7/28/21.
//

import Foundation

class AssignmentList: ObservableObject {
    @Published var assignments = [AssignmentItem(description: "First Assignment", course: "Math", date: Date())]
}
