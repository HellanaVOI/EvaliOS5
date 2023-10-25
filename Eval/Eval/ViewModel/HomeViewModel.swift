//
//  HomeViewModel.swift
//  Eval
//
//  Created by Tony Izzi on 25/10/2023.
//

import Foundation

class HomeViewModel: ObservableObject{
    
    @Published var listGame = [GameModel]()
    
    init(){
        var listOfGame = Set<GameModel>()
        
        NetworkService.shared.getTopTenWin(){ result in
            result?.featured_win.forEach(){ game in
                listOfGame.insert(game)
            }
            result?.featured_mac.forEach(){ game in
                listOfGame.insert(game)
            }
            result?.featured_linux.forEach(){ game in
                listOfGame.insert(game)
            }
            
            self.listGame.append(contentsOf: listOfGame)
        }
    }
}
