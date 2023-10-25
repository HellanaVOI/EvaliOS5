//
//  UIPLaceholder.swift
//  Eval
//
//  Created by Tony Izzi on 25/10/2023.
//

import SwiftUI

struct UIPlaceholder: View {
    var body: some View {
            Image(systemName: "network.slash")
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
        }
    }


#Preview {
    UIPlaceholder()
}
