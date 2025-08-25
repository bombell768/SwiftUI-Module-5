//
//  ContentView.swift
//  Task Manager Example
//
//  Created by Bartosz Strzecha on 25/08/2025.
//

import SwiftUI

final class TaskManager: ObservableObject {
    @Published var tasks: [String] = []
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TaskListView()
                AddTaskView()
                RemoveTaskView()
            }
            .padding()
        }
    }
}

struct TaskListView: View {
    @EnvironmentObject var manager: TaskManager

    var body: some View {
        GroupBox("Task List") {
            if manager.tasks.isEmpty {
                Text("No tasks yet").foregroundStyle(.secondary)
            } else {
                List(manager.tasks.indices, id: \.self) { i in
                    HStack {
                        Text("#\(i)")
                            .monospacedDigit()
                            .foregroundStyle(.secondary)
                        Text(manager.tasks[i])
                    }
                }
                .listStyle(.plain)
                .frame(minHeight: 120, maxHeight: 220)
            }
        }
    }
}

struct AddTaskView: View {
    @EnvironmentObject var manager: TaskManager
    @State private var newTask: String = ""

    var body: some View {
        GroupBox("Add Task") {
            HStack(spacing: 12) {
                TextField("Enter task title", text: $newTask)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit(addTask)

                Button("Add", action: addTask)
                    .buttonStyle(.borderedProminent)
                    .disabled(newTask.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
    }

    private func addTask() {
        let trimmed = newTask.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        manager.tasks.append(trimmed)
        newTask = ""
    }
}

struct RemoveTaskView: View {
    @EnvironmentObject var manager: TaskManager
    @State private var indexText: String = ""
    @State private var error: String?

    var body: some View {
        GroupBox("Remove Task by Index") {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 12) {
                    TextField("Index (e.g., 0)", text: $indexText)
                        .keyboardType(.numberPad)
                        .textFieldStyle(.roundedBorder)

                    Button("Remove") {
                        remove()
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(manager.tasks.isEmpty || indexText.isEmpty)
                }

                if let error {
                    Text(error).foregroundStyle(.red).font(.caption)
                }
            }
        }
    }

    private func remove() {
        error = nil
        guard let idx = Int(indexText) else {
            error = "Please enter a valid integer."
            return
        }
        guard manager.tasks.indices.contains(idx) else {
            error = "Index out of range (0...\(max(manager.tasks.count - 1, 0)))."
            return
        }
        manager.tasks.remove(at: idx)
        indexText = ""
    }
}


#Preview {
    ContentView()
        .environmentObject(TaskManager())
}
