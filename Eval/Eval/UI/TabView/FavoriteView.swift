//
//  FavoriteView.swift
//  Eval
//
//  Created by Tony Izzi on 25/10/2023.
//

import SwiftUI

struct FavoriteView: View {
    
    @StateObject var viewModel = FavoriteViewModel()
    
    var body: some View {
        List{
            ForEach(viewModel.listFav){ favorite in
                HStack{
                    Text(favorite.name ?? "")
                    
                }
                
            }
            
        }
        .listStyle(.plain)
        .onAppear {
            viewModel.initList()
        }
    }
}

#Preview {
    FavoriteView()
}
