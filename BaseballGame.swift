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
   var randomNumberList = ["0","1","2","3","4","5","6","7","8","9"]
   var gameTryCount: [Int] = []
   var thisGameTryCount = 0
   
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
         
         if GameAnswer[GameAnswer.startIndex] == "0" { // level 3 구현 , 맨 앞자리에 0은 저장 불가
            continue
         }
      }
   }
   
   func inputNumber() -> Int {
      
      while true {
         print("3자리 숫자를 입력하세요.")
         let input = readLine()! //옵셔널 바인딩 필수
         
         let UA1 = input[input.startIndex]
         let UA2 = input[input.index(after: input.startIndex)]
         let UA3 = input[input.index(before: input.endIndex)]
         // UA UserAnswer 가 character형인데 Int나 String으로 변환할 수 없는가?
         
         thisGameTryCount += 1// 게임 시도 횟수 1증가
         
         if input.count != 3 {
            print("error! 3자리 숫자를 입력하세요!!")
            continue
         }
//         if UA1 == "0" || UA2 == "0" || UA3 == "0" {
//            print("error! 0이 사용되어 올바르지 않은 입력값!!")
//            continue
//         }
         
         if (UA1 == UA2 || UA1 == UA3) {
            print("\(UA1) 가 두번 사용되어 올바르지 않은 입력값!!")
            continue
         }
         if UA2 == UA3 {
            print("\(UA2) 가 두번 사용되어 올바르지 않은 입력값!!")
            continue
         }
            
         if let n = Int(input) { //입력 받은 값이 int형으로 변환 가능 시에만 진입가능
            var S, B : Int
            
            S = checkStrike(n1: UA1, n2: UA2, n3: UA3)
            B = checkBall(n1: UA1, n2: UA2, n3: UA3)
            
            printResult(S: S, B: B)
            if S == 3 {
               print("정답입니다.")
               randomNumberList.shuffle() // 정답을 맞춘 후 배열 목록 셔플 ... 이게 맞나?
               return thisGameTryCount
            }
         }
         else{
            print("error! 3자리 자연수를 입력하세요!!")
         }
         print("")
      }
   }
   
   func checkStrike(n1:Character, n2:Character, n3:Character) -> Int {
      
      var strike : Int = 0
      
      if n1 == GameAnswer[GameAnswer.startIndex] { strike += 1 }
      if n2 == GameAnswer[GameAnswer.index(after: GameAnswer.startIndex)] { strike += 1 }
      if n3 == GameAnswer[GameAnswer.index(before: GameAnswer.endIndex)] { strike += 1 }
      
      return strike
   }
   
   func checkBall(n1:Character, n2:Character, n3:Character) -> Int {
      
      var ball : Int = 0
      
      if n1 == GameAnswer[GameAnswer.index(after: GameAnswer.startIndex)] || n1 == GameAnswer[GameAnswer.index(before: GameAnswer.endIndex)] { ball += 1}
      if n2 == GameAnswer[GameAnswer.startIndex] || n2 == GameAnswer[GameAnswer.index(before: GameAnswer.endIndex)] { ball += 1}
      if n3 == GameAnswer[GameAnswer.startIndex] || n3 == GameAnswer[GameAnswer.index(after: GameAnswer.startIndex)] { ball += 1}
      
      // swift의 문자열 처리 방식 ㅠㅠ
      return ball
   }
   
   func printResult(S:Int, B:Int){
      
      if S == 0 && B == 0     { print("nothing") }
      else if B == 0          { print("\(S)스트라이크")}
      else if S == 0          { print("\(B)볼" )}
      else                    { print("\(S)스트라이크, \(B)볼") }
   }
   
   func start() {
     
      while true {
         print("\n환영합니다! 원하시는 번호를 입력하세요.")
         print("1. 게임 시작하기   2. 게임 기록 보기   3. 종료하기")
         let input = readLine()!
         
         if input == "1" {
            
            print("\n<숫자 야구 게임을 시작합니다.>")
            makeAnswer()

      //      let GA1 = GameAnswer[GameAnswer.startIndex]
      //      let GA2 = GameAnswer[GameAnswer.index(after: GameAnswer.startIndex)]
      //      let GA3 = GameAnswer[GameAnswer.index(before: GameAnswer.endIndex)]
            
            thisGameTryCount = 0
            gameTryCount.append(inputNumber())
         }
         else if input == "2" {
            
            var n = 1
            print("\n<게임 기록 보기>\n")
            
            if gameTryCount.isEmpty {
               print("게임 기록이 없습니다.\n")
            }
            else{
               for i in gameTryCount {
                  print("\(n)번 째 게임 : 시도 횟수 - \(i)")
                  n = n+1
               }
            }
         }
         else if input == "3" {
            print("게임 종료")
            break
         }
         else {
            print("잘못된 입력 입니다. 다시 입력하세요")
         }

      }
   }
}


