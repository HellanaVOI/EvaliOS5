//
//  UIAddToFavorite.swift
//  Eval
//
//  Created by Tony Izzi on 25/10/2023.
//

import SwiftUI

struct UIAddToFavorite: View {
    
    @StateObject var viewModel: UIAddToFavoriteViewModel
    
    var body: some View {
        Button(action: {viewModel.switchFav()}){
            Image(systemName: viewModel.isFav ? "heart.fill" : "heart")
                .tint(Color.white)
                .padding(5)
                .background(Color.gray)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    UIAddToFavorite(viewModel: UIAddToFavoriteViewModel(
        idGame: 1558830 ,
        nameGame: "RIPOUT")
    )
}
