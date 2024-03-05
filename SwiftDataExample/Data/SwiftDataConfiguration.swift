//
//  SwiftDataConfiguration.swift
//  SwiftDataExample
//
//  Created by Celestial on 21/02/24.
//

import SwiftUI
import SwiftData

struct SwiftDataConfiguration {
    static let instance: SwiftDataConfiguration = SwiftDataConfiguration()
    
    private init() { }
    
    func getContainer() -> ModelContainer {
        let schema = Schema([Expense.self])
        let container = try! ModelContainer(for: schema, configurations: [])
        return container
    }
}
