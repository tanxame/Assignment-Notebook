//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Franklin Tan on 7/28/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var assignmentList = AssignmentList()
    @State private var showingAddAssignmentView = false
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentList.assignments) { assignment in
                    HStack {
                        VStack (alignment: .leading){
                            Text(assignment.course)
                                .font(.headline)
                            Text(assignment.description)
                        }
                        Spacer()
                        Text(assignment.date, style: .date)
                    }
                }
                .onMove(perform: { indices, newOffset in
                    assignmentList.assignments.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    assignmentList.assignments.remove(atOffsets: indexSet)
                })
            }
            .sheet(isPresented: $showingAddAssignmentView, content: {
                AddAssignmentView(assignmentList: assignmentList)
            })
            .navigationBarTitle("Assignment Notebook", displayMode: .inline)
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {
                                                    showingAddAssignmentView = true }) {
                                    Image(systemName: "plus")
                                })
        }
    }
}

struct AssignmentItem: Identifiable, Codable {
    var id = UUID()
    var description = String()
    var course = String()
    var date = Date()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

