//
//  MenuItemsOptionView.swift
//  Little Lemon Menu
//
//  Created by Andrew Betancourt on 6/3/24.
//

import SwiftUI

struct MenuItemsOptionView: View
{
    // Must be declared since it is a class from another file
    @EnvironmentObject var viewModel: MenuViewViewModel
    var body: some View
    {
        NavigationStack
        {
            List
            {
                //Multiple filters can be applied at once
                Section
                {
                    Toggle(MenuCategory.food.rawValue, isOn: $viewModel.isShowFood)
                    Toggle(MenuCategory.drink.rawValue, isOn: $viewModel.isShowDrinks)
                    Toggle(MenuCategory.dessert.rawValue, isOn: $viewModel.isShowDesserts)
                } header: { Text("Selected Catagories") }
                
                Section
                {
                    Button("Most Popular"){
                        viewModel.sortBy = SortBy.mostPopular
                    }
                    .foregroundStyle(.black)
                    Button("Price $-$$$"){
                        viewModel.sortBy = SortBy.fromLowPrice
                    }
                    .foregroundStyle(.black)
                    Button("A-Z"){
                        viewModel.sortBy = SortBy.fromAtoZ
                    }
                    .foregroundStyle(.black)
                } header: { Text("Sort By")}
            }
            .navigationTitle("Filter")
        }
    }
}

#Preview {
    MenuItemsOptionView().environmentObject(MenuViewViewModel())
}
