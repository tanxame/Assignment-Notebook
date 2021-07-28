//
//  AddAssignmentView.swift
//  Assignment Notebook
//
//  Created by Franklin Tan on 7/28/21.
//

import SwiftUI

struct AddAssignmentView: View {
    @ObservedObject var assignmentList: AssignmentList
    @State private var course = ""
    @State private var description = ""
    @State private var date = Date()
    @Environment(\.presentationMode) var presentationMode
    static let course = ["Math", "Science", "English", "History"]
    var body: some View {
        NavigationView {
            Form {
                Picker("Course", selection: $course) {
                    ForEach(Self.course, id: \.self) { course in
                        Text(course)
                    }
                }
            }
        }
    }
}

struct AddAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentView(assignmentList: AssignmentList())
    }
}
