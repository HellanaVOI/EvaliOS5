//
//  HomeViewCellModel.swift
//  Eval
//
//  Created by Tony Izzi on 25/10/2023.
//

import Foundation

enum AvailableOn{
    case windows
    case mac
    case linux
}

class GameViewModel: ObservableObject{
    
    let game: GameModel?
    
    init(game: GameModel?){
        self.game = game
    }
    
    
    func getDiscount() -> String{
        return " - \(game?.discountPercent ?? 0) %"
    }
    
    func getPrice(isOriginal: Bool) -> String{
        guard let price = isOriginal ? game?.originalPrice : game?.finalPrice else { return "FREE" }
        
        let affichePrice: Double = Double(price) / 100
        
        
        return String(format: "%.2f", affichePrice) + "EUR"
    }
    
    func getIsDiscounted() -> Bool{
        return game?.discounted ?? false
    }
    
    func getName() -> String{
        return game?.name ?? ""
    }
    
    func getUrlImage(isSmall: Bool) -> String{
        return isSmall ? ( game?.smallImage ?? "" ) : ( game?.largeImage ?? "" )
    }
    
    func isAvailableOn(type: AvailableOn) -> Bool{
        switch type {
        case .windows:
            return game?.windowsAvailable ?? false
        case .mac:
            return game?.macAvailable ?? false
        case .linux:
            return game?.linuxAvailable ?? false
        }
    }
    
    func isControllerCompatible() -> Bool{
        return game?.controllerSupport != nil
    }
    
    func getUrlToSteam() -> String{
        return "https://store.steampowered.com/app/\(game?.id ?? 404)"
        
    }
    
    func getIdGame() -> Int{
        return game?.id ?? 404
        
    }
}
