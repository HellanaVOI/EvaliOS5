//
//  DetailView.swift
//  Eval
//
//  Created by Tony Izzi on 25/10/2023.
//

import SwiftUI

struct DetailView: View {
    
    let viewModel: GameViewModel
    
    var body: some View {
        VStack{
            Text(viewModel.getName())
            AsyncImage(url: URL(string:viewModel.getUrlImage(isSmall: false)))
            { img in
                img
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                UIPlaceholder()
            }
            UIPriceView(viewModel: GameViewModel(game: viewModel.game))
                .frame(width: 200)
            Text("Disponible sur")
            HStack{
                if(viewModel.isAvailableOn(type: .windows)){
                    UIImageAvailable(image: "windows")
                }
                if(viewModel.isAvailableOn(type: .mac)){
                    UIImageAvailable(image: "mac")
                }
                if(viewModel.isAvailableOn(type: .linux)){
                    UIImageAvailable(image: "linux")
                }
            }
            
            Text("Input")
            HStack{
                Image(systemName: "keyboard")
                Image(systemName: "computermouse")
                if(viewModel.isControllerCompatible()){
                    Image(systemName: "gamecontroller")
                }
            }
            Spacer()
            UIAddToFavorite(viewModel: UIAddToFavoriteViewModel(
                idGame: viewModel.getIdGame(),
                nameGame: viewModel.getName()
            ))
            
            Link(destination: URL(string: viewModel.getUrlToSteam())!){
                Text("Plus d'info sur Steam")
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color.gray)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color.black)
        .foregroundColor(.white)
    }
}

#Preview {
    DetailView(viewModel: GameViewModel(game: Tools.staticGame))
}
