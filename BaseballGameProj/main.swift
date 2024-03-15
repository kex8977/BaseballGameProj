//
//  main.swift
//  BaseballGameProj
//
//  Created by 김광민 on 2024/03/13.
//

import Foundation

while true {
   
   print("\n환영합니다! 원하시는 번호를 입력하세요.")
   print("1. 게임 시작하기   2. 게임 기록 보기   3. 종료하기")
   let input = readLine()!
   
   if input == "3" {
      print("게임 종료")
      break
   }
   
   let game1 = BaseballGame()
   game1.start(userChoice: Int(input)!)
}
