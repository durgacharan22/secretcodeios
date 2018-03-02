//
//  CodeWord.swift
//  Potukuru_SecretCode
//
//  Created by Student on 3/1/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation


class CodeWord{
    
    var Symbols:[String]
    var Count:Int
    var Code:[String]
    var Guess:[String] = []
    var OnSymbol:Int
    var Attempts:Int
    var Status:String
    
    init(Count:Int){
        self.Symbols = ["d","c","a","a"]
        self.Attempts = 0
        self.Code = ["d","c","a","a"]
        self.Count = 4
        self.OnSymbol = 0
        self.Status = "play"
    }
    
    func addSymbolToGuess(Symbol:String){
        Guess.append(Symbol)
        OnSymbol = OnSymbol + 1
        self.Status = "Attempt" + String(self.Attempts) + " : " + String(SymbolsGuessed()) + " symbols guessed"
        if Guess.count == 4 {
            OnSymbol = 0
            self.Status = "Guess Completed : " + String(SymbolsGuessed()) + " Correct"
            
        }
    }
    func SymbolsGuessed() -> Int{
        var res = 0
        for i in 0 ..< Guess.count {
            if Code[i] == Guess[i] {
                res += 1
            }
            
        }
        return res
    }
    func StatusForAGuess() -> String {
        return "Guess: " + Guess.joined(separator: " ")
    }
    
    func CurrentGuess() -> String {
        return Guess[Guess.count - 1]
    }
    func GuessMatchCode() -> Bool{
        return Code.joined(separator: "") == Guess.joined(separator: "")
    }
    
    func reset(){
        self.Code = []
        for _ in 0 ..< 4{
            Code.append(self.Symbols[Int(arc4random_uniform(4))])
        }
        OnSymbol = 0
    }
    
}
