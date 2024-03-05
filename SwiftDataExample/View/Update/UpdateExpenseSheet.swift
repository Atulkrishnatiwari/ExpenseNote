//
//  UpdateExpenseSheet.swift
//  SwiftDataExample
//
//  Created by Celestial on 21/02/24.
//

import SwiftUI

struct UpdateExpenseSheet: View
{
    @Environment(\.dismiss) private var dismiss
    @Bindable var expense: Expense
    
    var body: some View
    {
        NavigationView
        {
            Form(content: {
                
                TextField("Expense Name", text: $expense.name)
                DatePicker("Date", selection: $expense.date, displayedComponents: .date)
                TextField("Value", value: $expense.value, format: .currency(code: "INR"))
                    .keyboardType(.decimalPad)
            })
            .navigationTitle("Update Expense")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing)
                {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}
