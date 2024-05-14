//
//  Todo.swift
//  Boilerplate
//
//  Created by admin-nw on 22/4/2024.
//

import Foundation

struct TodoModel: Codable, Identifiable {
    let id: Int
    let title: String
    let completed: Bool
}
