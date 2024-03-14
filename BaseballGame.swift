//
//  BaseballGame.swift
//  BaseballNumberGame
//
//  Created by 김광민 on 2024/03/13.
//

import Foundation

class BaseballGame {
   
   var GameAnswer: String = ""
   var UserAnswer: String = ""
   let randomNumberList = ["1","2","3","4","5","6","7","8","9"]
   
   func makeAnswer() {
      while true {
         
         if GameAnswer.count == 3 {
            break
         }
         
         var n : String
         
         repeat {
            n = randomNumberList.randomElement()!
            // print(n, GameAnswer)
         } while GameAnswer.contains(n)
         
         GameAnswer.append(n)
      }
   }
   
   func inputNumber() {
      
      while true {
         print("3자리 숫자를 입력하세요.")
         let input = readLine()! //옵셔널 바인딩 필수
         
         if input.count != 3 {
            print("error! 3자리 숫자를 입력하세요!!")
         }
         if UserAnswer.contains("0"){
            print("error! 0이 사용되어 올바르지 않은 입력값!!")
         }
         
         let n1 = input[input.startIndex]
         let n2 = input[input.index(after: input.startIndex)]
         let n3 = input[input.index(before: input.endIndex)]
         // n1, n2, n3 가 character형인데 Int나 String으로 변환할 수 없는가?
         
         if (n1 == n2 || n1 == n3) {
            print("\(n1) 가 두번 사용되어 올바르지 않은 입력값!!")
         }
         if n2 == n3 {
            print("\(n2) 가 두번 사용되어 올바르지 않은 입력값!!")
         }
            
         if let n = Int(input) { //입력 받은 값이 int형으로 변환 가능 시에만 진입가능
            
         }
         else{
            print("error! 3자리 자연수를 입력하세요!!")
         }
         print("")
      }
   }
   
   func start() {
      makeAnswer()
      print("숫자 야구 게임을 시작합니다.")
      //inputNumber()
   }
}


