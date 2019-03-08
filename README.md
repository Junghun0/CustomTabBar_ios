## CustomTabBar_ios

### 소스코드
- - -
```swift
override func viewDidLoad(){
        self.tabBarItem.image = UIImage(named: "calendar.png")
        self.tabBarItem.title = "Calendar"
    }
```

**viewDidLoad() 함수안에서 tabBarItem 만들게 되면 , 각 탭이 처음 활성화되는 순간에 작성한 코드가 적용되기 때문에 옳지않다 !**
_AppDelegate 의 application(_:didFinishLaunchingWithOptions:) 메소드에 적합하다.(앱의 초기화가 완료되었을때 시스템에 의해 자동으로 호출됨)_

- - -
* AppDelegate.swift
```swift
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
                    /*let image = UIImage(named: "checkmark")?.withRenderingMode(.alwaysOriginal)
                    tbItem.selectedImage = image
                    
                    //탭 바 아이템별 텍스트 색상 속성 설정하기
                    
                    //선택안되었을때
                    tbItem.setTitleTextAttributes([NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue) : UIColor.gray], for: .disabled)
                    //선택되었을때
                    tbItem.setTitleTextAttributes([NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue) : UIColor.red], for: .selected)
                    
                    //전체 아이템의 폰트 크기 설정
                    tbItem.setTitleTextAttributes([NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue) : UIFont.systemFont(ofSize: 15)], for: .normal)*/
                    
                    //탭 바 아이템 전체를 순회하면서 selectedImage 속성에 이미지를 설정한다.
                    let image = UIImage(named: "checkmark")?.withRenderingMode(.alwaysOriginal)
                    tbItem.selectedImage = image
                    
                }
                
                //외형 프록시 객체를 이용하여 아이템의 타이틀 색상과 폰트 크기를 설정한다.
                let tbItemProxy = UITabBarItem.appearance()
                tbItemProxy.setTitleTextAttributes([NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue) : UIColor.red], for: .selected)
                tbItemProxy.setTitleTextAttributes([NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue) : UIColor.gray], for: .disabled)
                tbItemProxy.setTitleTextAttributes([NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue) : UIFont.systemFont(ofSize: 15)], for: .normal)
                
                
                //3. 탭 바 아이템에 커스텀 이미지를 등록한다.
                //tbItems[0].image = UIImage(named: "calendar")
                //tbItems[1].image = UIImage(named: "file-tree")
                //tbItems[2].image = UIImage(named: "photo")
                
                //4. 탭 바 아이템에 타이틀을 설정한다.
                tbItems[0].title = "Calendar"
                tbItems[1].title = "File"
                tbItems[2].title = "Photo"
                
                let tbProxy = UITabBar.appearance()
                //5.활성화된 탭 바 아이템의 이미지 색상을 변경한다.
                tbProxy.tintColor = UIColor.white
                //6.탭 바에 배경 이미지를 설정한다.
                tbProxy.backgroundImage = UIImage(named: "menubar-bg-mini")
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
```
