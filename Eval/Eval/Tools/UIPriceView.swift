//
//  UIPriceView.swift
//  Eval
//
//  Created by Tony Izzi on 25/10/2023.
//

import SwiftUI

struct UIPriceView: View {
    
    let viewModel: GameViewModel
    
    var body: some View {
        if(viewModel.getIsDiscounted()){
            HStack{
                Text(viewModel.getDiscount())
                    .foregroundColor(.green)
                    .bold()
                    
                Spacer()
                VStack{
                    Text(viewModel.getPrice(isOriginal: true))
                        .strikethrough()
                        .foregroundColor(.gray)
                    Text(viewModel.getPrice(isOriginal: false))
                        .foregroundColor(.green)
                }
            }
        }else{
            Text(viewModel.getPrice(isOriginal: true))
                .foregroundColor(.green)
            
        }
    }
}

#Preview {
    UIPriceView(viewModel: GameViewModel(game: Tools.staticGame))
}
