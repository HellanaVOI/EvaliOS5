//
//  HomeView.swift
//  Eval
//
//  Created by Tony Izzi on 25/10/2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var columns: [GridItem] = [
        GridItem(.adaptive(minimum: 100)),
        GridItem(.adaptive(minimum: 100))
    ]
    
    
    var body: some View {
        NavigationStack{
        ScrollView{
            
                LazyVGrid(columns: columns,
                          alignment: .leading){
                    ForEach(viewModel.listGame){ game in
                        NavigationLink(destination: DetailView(viewModel: GameViewModel(game: game))){
                            HomeViewCell(viewModel: GameViewModel(game: game))
                        }
                    }
                }
            }.background(Color.black)
        }
    }
}

#Preview {
    HomeView()
}
