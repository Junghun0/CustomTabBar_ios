//
//  AppDelegate.swift
//  CustomTabBar_ios
//
//  Created by 박정훈 on 08/03/2019.
//  Copyright © 2019 swift. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //1.루트 뷰 컨트롤러를 UITabBarController 로 캐스팅한다.
        if let tbC = self.window?.rootViewController as? UITabBarController{
            //2. 탭 바로부터 탭 바 아이템 배열을 가져온다.
            if let tbItems = tbC.tabBar.items{
                //이미지 원본으로 등록 색상 변경
                tbItems[0].image = UIImage(named: "designbump")?.withRenderingMode(.alwaysOriginal)
                tbItems[1].image = UIImage(named: "rss")?.withRenderingMode(.alwaysOriginal)
                tbItems[2].image = UIImage(named: "facebook")?.withRenderingMode(.alwaysOriginal)
                
                //탭 바 아이템 전체를 순회하면서 selectedImage 속성에 이미지를 추가한다. 선택되는 탭 이미지변경
                for tbItem in tbItems {
                    let image = UIImage(named: "checkmark")?.withRenderingMode(.alwaysOriginal)
                    tbItem.selectedImage = image
                    
                    //탭 바 아이템별 텍스트 색상 속성 설정하기
                    
                    //선택안되었을때
                    tbItem.setTitleTextAttributes([NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue) : UIColor.gray], for: .disabled)
                    //선택되었을때
                    tbItem.setTitleTextAttributes([NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue) : UIColor.red], for: .selected)
                    
                    //전체 아이템의 폰트 크기 설정
                    tbItem.setTitleTextAttributes([NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue) : UIFont.systemFont(ofSize: 15)], for: .normal)
                    
                }
                
                

                
                
                
                
                //3. 탭 바 아이템에 커스텀 이미지를 등록한다.
//                tbItems[0].image = UIImage(named: "calendar")
//                tbItems[1].image = UIImage(named: "file-tree")
//                tbItems[2].image = UIImage(named: "photo")
                
                //4. 탭 바 아이템에 타이틀을 설정한다.
                tbItems[0].title = "Calendar"
                tbItems[1].title = "File"
                tbItems[2].title = "Photo"
            }
            //5. 활성화된 탭 바 아이템의 이미지 색상을 변경한다.
            tbC.tabBar.tintColor = UIColor.white
            //6. 탭 바에 배경 이미지를 설정한다.
            tbC.tabBar.backgroundImage = UIImage(named: "menubar-bg-mini")?.stretchableImage(withLeftCapWidth: 5, topCapHeight: 16)
            /*
             let image = UIImage(named: "menubar-bg-mini")!
             tbC.tabBar.barTintColor = UIColor(patternImage: image)
             */
            
            //탭바 보다 큰 이미지를 자르는 코드
            //tbC.tabBar.clipsToBounds = true
            
            //탭바에 이미지를 적용하면 원본색으로 적용이 안될때 원본으로 적용시키는 코드
            
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

