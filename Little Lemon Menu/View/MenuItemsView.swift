//
//  MenuItemsView.swift
//  Little Lemon Menu
//
//  Created by Andrew Betancourt on 6/2/24.
//

import SwiftUI

struct MenuItemsView: View 
{
    @StateObject private var viewModel = MenuViewViewModel()
    var body: some View
    {
        NavigationStack 
        {
            // Menu items will display according to user's filter choice
    
            // environmentObject allows you to immediately update this view after changing any used data
            ScrollView 
            {
                if viewModel.isShowFood
                {
                    MenuItemView(menuItems: viewModel.foods, menuCategory: .food).environmentObject(viewModel)
                }
                if viewModel.isShowDrinks 
                {
                    MenuItemView(menuItems: viewModel.drinks, menuCategory: .drink).environmentObject(viewModel)
                }
                if viewModel.isShowDesserts 
                {
                    MenuItemView(menuItems: viewModel.desserts, menuCategory: .dessert).environmentObject(viewModel)
                }
            }
            
            .onAppear() { viewModel.updateMenuItems()}
            .navigationTitle("Menu")
            .toolbar 
            {
                Button(action: {
                    viewModel.isOpenedOptionView.toggle()
                }, label: {
                    Image(systemName: "slider.vertical.3")
                })
            }
            // Opens an OptionView with the option to filter data
            .sheet(isPresented: $viewModel.isOpenedOptionView) 
            {
                NavigationStack 
                {
                    MenuItemsOptionView().environmentObject(viewModel).toolbar
                    {
                            // When the button is pressed, it sorts the data according to the user's choice
                            Button("Done") 
                            {
                                viewModel.updateMenuItems()
                                viewModel.isOpenedOptionView.toggle()
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    MenuItemsView()
}
