//
//  Message.swift
//  Demo1
//
//  Created by Praveen on 02/02/18.
//  Copyright © 2018 Praveen. All rights reserved.
//

import UIKit

class Message: NSObject {
    
    var name: String
    var id: String
    var text: String
    
    init(name: String, id: String, text: String) {
        self.name = name
        self.id = id
        self.text = text
    }
    
    static func getMessages() -> [Message]{
        var messages: [Message] = [Message]()
        let message1 = Message(name: "Praveen", id: "1", text: "Hi Shantanu")
        let message2 = Message(name: "Shantanu", id: "2", text: "Hi Praveen")
        let message3 = Message(name: "Praveen", id: "1", text: "How are you ? where have you upto, i haven't seen you from a long time ?")
        let message4 = Message(name: "Shantanu", id: "2", text: "I was on a office trip, i have been to goa, that was an amazing trip.")
        let message5 = Message(name: "Praveen", id: "1", text: "Ohh, Sounds Cool. ;) have you heared about crypto currency ?")
        let message6 = Message(name: "Shantanu", id: "2", text: "Yes, i heared. i am investing in Ripple coin and bitcoin too.")
        let message7 = Message(name: "Praveen", id: "1", text: "Cool, i also wanaa invest in bitcoin do you have any suggestion ? if have please share.")
        let message8 = Message(name: "Shantanu", id: "2", text: "Nice. But this is not a good time to invest in bitcoin, please wait for some time till the price of bitcoin will fall down.")
        messages.append(message1)
        messages.append(message2)
        messages.append(message3)
        messages.append(message4)
        messages.append(message5)
        messages.append(message6)
        messages.append(message7)
        messages.append(message8)
        return messages
    }
}
