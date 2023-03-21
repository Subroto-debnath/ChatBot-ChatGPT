//
//  ChatView.swift
//  ChatBot
//
//  Created by Subroto Debnath on 2023-03-20.
//

import Foundation
import SwiftUI

struct ChatView: View {
    @State var messages: [String] = []
    @State var newMessage: String = ""
    @FocusState private var keyboardFocused: Bool
    let chatgpt = OpenAIConnector()
    var body: some View {
        VStack {
            ScrollView {
                ForEach(0..<messages.count/2, id: \.self) { index in
                    BeautifulTextView(text: messages[index*2]).frame(maxWidth:.infinity, alignment: .trailing)
                    BeautifulTextView(text: messages[index*2+1],backgroundColor: .gray).frame(maxWidth:.infinity, alignment: .leading)
                }
            }.padding(.top,20)
            HStack {
                BeautifulTextField(text: $newMessage, placeholder: "    Type your message...")
                    .focused($keyboardFocused)
                    .onAppear {
                        keyboardFocused = true
                        }
                Button(action: {
                    sendMessage()
                }){
                    Image("send")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                }.buttonStyle(BorderlessButtonStyle())
            }
        }.padding(10)
    }
    
    func sendMessage() {
        if !newMessage.isEmpty {
            messages.append(newMessage)
            var botResponse = getBotResponse(for: newMessage)
            for str in botResponse{
                if(str == "\n"){
                    botResponse.removeFirst()
                } else{
                    break
                }
            }
            messages.append(botResponse)
            newMessage = ""
        }
    }
    
    func getBotResponse(for message: String) -> String {
        
        if let response = chatgpt.processPrompt(prompt: message){
            return response
        } else {
            return "Error...Try Again !!!"
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}


