//
//  UIAddToFavoriteViewModel.swift
//  Eval
//
//  Created by Tony Izzi on 25/10/2023.
//

import Foundation

class UIAddToFavoriteViewModel: ObservableObject{
    
    var id: Int
    var name: String
    @Published var isFav: Bool
    
    init(idGame: Int, nameGame: String){
        isFav = DataManager.shared.isFav(idGame: idGame)
        id = idGame
        name = nameGame
    }
    
    func switchFav(){
        if(isFav){
            DataManager.shared.delFav(idGame: id)
        }else{
            DataManager.shared.addFav(idGame: id, nameGame: name)
        }
        
        isFav.toggle()
    }
    
}
