//
//  CustomText.swift
//  EDeveloper
//
//  Created by Nagaraju on 06/02/24.
//

import Foundation
import SwiftUI

struct CustomTextField :View {
    @State private var userName:String = ""
    var body: some View {
        TextField("username", text: $userName)
            .padding(.horizontal,10)
            .frame(height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
            .cornerRadius(10.0)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.green)
            )
        
    }
}


#Preview {
    CustomTextField()
}
