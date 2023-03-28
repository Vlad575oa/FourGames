//
//  AnswerButton.swift
//  MathGame
//
//  Created by Federico on 04/11/2021.
//

import SwiftUI

struct AnswerButton: View {
    var number : Int
    
    var body: some View {
        
            Text("\(number)")
            .frame(width: 100, height: 100)
                .font(.system(size: 40, weight: .bold))
                .padding(20)
                .background(LinearGradient(colors: [.blue, .green], startPoint: .top, endPoint: .bottom)).cornerRadius(50)
                .foregroundColor(.white)
              
              
        
    }
}

struct AnswerButton_Previews: PreviewProvider {
    static var previews: some View {
        AnswerButton(number: 100)
    }
}
