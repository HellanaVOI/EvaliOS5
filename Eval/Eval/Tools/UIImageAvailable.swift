//
//  UIImageAvailable.swift
//  Eval
//
//  Created by Tony Izzi on 25/10/2023.
//

import SwiftUI

struct UIImageAvailable: View {
    let image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .padding(3)
            .background(.gray)
            .scaledToFit()
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .frame(width: 50, height: 50)
        
        
    }
}

#Preview {
    UIImageAvailable(image: "linux")
}
