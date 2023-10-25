//
//  FavoriteModel.swift
//  Eval
//
//  Created by Tony Izzi on 25/10/2023.
//

import Foundation

class FavoriteViewModel: ObservableObject{
    
    // Pas trouver de endpoint pour retrouver un Jeux par son ID
    
    @Published var listFav = [Favorite]()
    
    init(){
    }
    
    func initList(){
        listFav = DataManager.shared.getListFav()
    }
}
