//
//  extensions.swift
//  Boilerplate
//
//  Created by Noureddine Louafi on 12/5/2024.
//

import Foundation

extension Encodable {
  var dictionary: [String: Any] {
    let format = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    let formatter = DateFormatter()
    formatter.dateFormat = format
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .formatted(formatter)
    return (try? JSONSerialization.jsonObject(with: encoder.encode(self))) as? [String: Any] ?? [:]
  }
}
