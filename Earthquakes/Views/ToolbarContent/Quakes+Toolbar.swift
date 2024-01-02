//
//  Quakes+Toolbar.swift
//  Earthquakes
//
//  Created by Bugra Aslan on 1.01.2024.
//

import SwiftUI

extension Quakes {
    
    @ToolbarContentBuilder
    func toolbarContent() -> some ToolbarContent {
        // .navigationBarLeading is going to be deprecated hence I used .topBarLeading
        ToolbarItem(placement: .topBarLeading) {
            if editMode == .active {
                SelectButton(mode: $selectMode) {
                    if selectMode.isActive {
                        selection = Set(quakes.map { $0.code })
                    } else {
                        selection = []
                    }
                }
            }
        }
        ToolbarItem(placement: .topBarTrailing) {
            EditButton(editMode: $editMode) {
                selection.removeAll()
                editMode = .inactive
                selectMode = .inactive
            }
        }
        ToolbarItemGroup(placement: .bottomBar) {
            RefreshButton {
                Task {
                    fetchQuakes()
                }
            }
            Spacer()
            ToolbarStatus(
                isLoading: isLoading,
                lastUpdated: lastUpdated,
                quakesCount = quakes.count
            )
            Spacer()
            if editMode == .active {
                DeleteButton {
                    deleteQuakes(for: selection)
                }
                .disabled(isLoading || selection.isEmpty)
            }
        }
    }
}
