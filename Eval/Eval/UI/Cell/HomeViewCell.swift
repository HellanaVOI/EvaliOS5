//
//  HomeViewCell.swift
//  Eval
//
//  Created by Tony Izzi on 25/10/2023.
//

import SwiftUI

struct HomeViewCell: View {
    
    let viewModel: GameViewModel
    //let game: GameModel
    
    var body: some View {
                VStack{
                    Text(viewModel.getName())
                        .lineLimit(1)
                        .font(.title)
                    AsyncImage(url: URL(string:viewModel.getUrlImage(isSmall: true)))
                    { img in
                        img
                            .resizable()
                            .frame(width: 184, height: 69)
                    } placeholder: {
                        UIPlaceholder()
                    }
                    UIPriceView(viewModel: GameViewModel(game: viewModel.game))
                }
                .background(Color.black)
                .foregroundColor(.white)

    }
}

#Preview {
    HomeViewCell(viewModel: GameViewModel(game: Tools.staticGame))
}
