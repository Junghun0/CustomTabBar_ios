//
//  ViewController.swift
//  CustomTabBar_ios
//
//  Created by 박정훈 on 08/03/2019.
//  Copyright © 2019 swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    /*
     let width = self.view.frame.size.width
     let height = self.view.frame.size.height
     */
    
    //viewDidLoad 에서 커스텀탭바를 설정하면 해당 탭을 클릭해서 viewDidLoad 를 실행시키기전에 적용되어있지않다 -> AppDelegate 에서 application 에 코드 옮겨야함
    override func viewDidLoad() {
        super.viewDidLoad()
        //1
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30)) //인라인방식 코드
        //2
        title.text = "첫 번째 탭"
        title.textColor = UIColor.red //텍스트 색 변경
        title.textAlignment = .center//레이블 내에서 중앙으로
        title.font = UIFont.boldSystemFont(ofSize: 14)
        //3
        title.sizeToFit() //콘텐츠의 내용에 맞게 레이블 크기 변경
        //4
        title.center.x = self.view.frame.width / 2 //x 축의 중앙에 오도록
        //5
        self.view.addSubview(title)
        
        //탭 바 아이템에 커스텀 이미지를 등록하고 탭이름등록
        /*self.tabBarItem.image = UIImage(named: "calendar.png")
        self.tabBarItem.title = "Calendar"*/
    }


}

