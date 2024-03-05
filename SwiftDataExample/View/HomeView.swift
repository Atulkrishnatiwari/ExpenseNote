//
//  HomeView.swift
//  SwiftDataExample
//
//  Created by Celestial on 20/02/24.
//

import SwiftUI
import SwiftData
struct HomeView: View
{
    @Environment(\.modelContext) var context
    @State private var isShowingItemSheet = false
    @State private var expenseToEdit: Expense?
    //USING THIS FOR Filter
    @Query(filter: #Predicate<Expense>{$0.value > 100}, sort: \Expense.date) var expenses: [Expense]
//    IT CAN SIMPLY FETCH All Data
//    @Query(sort: \Expense.date) var expenses: [Expense]
    var body: some View
    {
        NavigationStack
        {
            List{
                ForEach(expenses){ expense in
                    ExpenseCell(expense: expense)
                        .onTapGesture {
                            expenseToEdit = expense
                        }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet
                    {
                        context.delete(expenses[index])
                    }
                })
            }
            .navigationTitle("Expenses")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowingItemSheet,content: {
                AddExpenseSheet()
            })
            .sheet(item: $expenseToEdit, content: { expense in
                
                UpdateExpenseSheet(expense: expense)
            })
            .toolbar{
                if(!expenses.isEmpty)
                {
                    Button(action: {
                        isShowingItemSheet.toggle()
                    }, label: {
                        Text("Add Expenses")
                        Image(systemName: "plus")
                    })
                }
            }
            .overlay{
                if(expenses.isEmpty)
                {
                    ContentUnavailableView {
                        Label("No Expenses",systemImage: "list.bullet.rectangle.portrait")
                    } description: {
                        Text("Start adding expenses to see your list.")
                    } actions: {
                        Button("Add Expense")
                        {
                            isShowingItemSheet = true
                        }
                    }

                }
            }
        }
    }
}
struct ExpenseCell: View
{
    let expense:Expense
    var body: some View
    {
        HStack {
            Text(expense.date,format: .dateTime.month(.abbreviated).day())
                .frame(width: 70,alignment: .leading)
            Text(expense.name)
            Spacer()
            Text(expense.value,format: .currency(code: "INR"))
        }
    }
}
#Preview {
    HomeView()
}
