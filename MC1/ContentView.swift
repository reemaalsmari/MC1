//
//  ContentView.swift
//  MC1
//
//  Created by Reema Alsmari on 12/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var guess = ""
    @State var AnswerStatus = 0
    @State var selectedWord = ""
    @State var rightWords = ["Rabeh", "Sager"]
    
    var body: some View {
      
        ZStack {
            Color.purple.opacity(0.8).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Text("Team1")
                    .bold()
                    .font(.largeTitle)
                    Spacer()
                
                
                if AnswerStatus == 0 {
                    
                 Text("Guess the Word")   }
                
                
                if AnswerStatus == 1 {
                    
                    Text("Correct")
                    Button(action: { 
                        guess = ""
                        AnswerStatus = 0
                        selectedWord = rightWords.randomElement()!
                    }) {
                        Text("Play again")
                    }
                  }
                
                if AnswerStatus == 2 {
                    
                 Text("Wrong")   }
                
                TextField("\tEnter your guess", text: $guess)
                Spacer()
                
                Button(action: { submitAnswer()}) {
                    Text("Got it!")
                    
                    
                }
            } .padding().onAppear(perform: {
                selectedWord = rightWords.randomElement()!
            })
        }
    }
    
    func submitAnswer(){
        
        if guess.lowercased() == selectedWord {
            
            AnswerStatus = 1
          
           
        } else {
            AnswerStatus = 2
            guess = ""
        }
    }
}

#Preview {
    ContentView()
}
