//
//  TaskSearchView.swift
//  TaskManagerCloneSwiftUI
//
//  Created by Rey Cerio on 2021-10-05.
//

import SwiftUI

struct TaskSearchView: View {
    @ObservedObject var taskVM: TaskViewModel
    @State var isSearching = false
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .foregroundColor(Color(#colorLiteral(red: 0.3156549894, green: 0.3207270241, blue: 0.327221803, alpha: 1)))
                    .cornerRadius(9)
                 HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    TextField("Search ...", text: $taskVM.searched, onEditingChanged: { isBegin in
                        isSearching = isBegin
                    }).keyboardType(.webSearch)
                    .foregroundColor(.black)
                    
                    if !taskVM.searched.isEmpty {
                        Button(action: {
                            taskVM.searched = ""
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(Color(#colorLiteral(red: 0.5446127653, green: 0.5465545654, blue: 0.5666400194, alpha: 1)))
                        })
                    }
                 }
                 .padding(.trailing, 8)
                 .padding(.leading, 12)
            }
            .frame(width: 310, height: 38)
            .padding(.leading, 7)
            .padding(.top, 5)
            .animation(.easeInOut(duration: 0.3))
            
            if isSearching {
                Button(action: {
                    hideKeyboard()
                }, label: {
                    Text("Cancel")
                })
            }
        }
    }
}

struct TaskSearchView_Previews: PreviewProvider {
    static var previews: some View {
        TaskSearchView(taskVM: TaskViewModel())
    }
}