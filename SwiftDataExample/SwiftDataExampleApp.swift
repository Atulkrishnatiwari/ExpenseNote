//
//  SwiftDataExampleApp.swift
//  SwiftDataExample
//
//  Created by Celestial on 20/02/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataExampleApp: App 
{
    
    var body: some Scene 
    {
        WindowGroup
        {
            HomeView()
        }
        .modelContainer(SwiftDataConfiguration.instance.getContainer())
//        we can also set in only one line code like
//        .modelContainer(for: [Expense.self])
    }
}
