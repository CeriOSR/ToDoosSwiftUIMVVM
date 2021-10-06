//
//  TaskViewModel.swift
//  TaskManagerCloneSwiftUI
//
//  Created by Rey Cerio on 2021-10-05.
//

import Foundation

class TaskViewModel: Identifiable, ObservableObject {
    
    @Published var tasks: [Task] = [
        Task(name: "Wash the car", taskName: "Wah Shing Kah", date: Date(), priority: .normal),
        Task(name: "Buy birthday gift for wife", taskName: "Red Alert", date: Date(), priority: .high),
        Task(name: "Make dinner", taskName: "Hungry Wife", date: Date(), priority: .medium),
        Task(name: "Exercise", taskName: "Health Stuff", date: Date(), priority: .normal)
    
    ]
    
    @Published var sortType: SortType = .alphabetical
    @Published var isPresented = false
    @Published var searched = ""
    
    func addTask(task: Task) {
        tasks.append(task)
    }
    
    func removeTask(atIndex: IndexSet) {
        tasks.remove(atOffsets: atIndex)
    }
    
    func sort() {
        switch sortType {
        case .alphabetical:
            tasks.sort(by: {$0.name < $1.name})
        case .date:
            tasks.sort(by: {$0.date < $1.date})
        case .priority:
            tasks.sort(by: {$0.priority.rawValue > $1.priority.rawValue})
        }
    }
}
