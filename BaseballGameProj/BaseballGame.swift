//
//  BaseballGame.swift
//  BaseballNumberGame
//
//  Created by 김광민 on 2024/03/13.
//

import Foundation

class BaseballGame {
   
   var GameAnswer: [Int] = []
   
   func makeAnswer() {
      while true {
         
         if GameAnswer.count == 3 {
            break
         }
         
         var n = Int.random(in: 0...9)
         while GameAnswer.contains(n) {
            n = Int.random(in: 0...9)
         }
         GameAnswer.append(n)
      }
   }
   
   func start() {
      makeAnswer()
   }
}


