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
        //1.루트 뷰 컨트롤러를 UITabBarController 로 캐스팅한다.
        if let tbC = self.window?.rootViewController as? UITabBarController{
            //2. 탭 바로부터 탭 바 아이템 배열을 가져온다.
            if let tbItems = tbC.tabBar.items{
                //탭 바 아이템 전체를 순회하면서 selectedImage 속성에 이미지를 추가한다. 선택되는 탭 이미지변경
                for tbItem in tbItems {
                        //3. 탭 바 아이템에 커스텀 이미지를 등록한다.
                        tbItems[0].image = UIImage(named: "calendar")
                        tbItems[1].image = UIImage(named: "file-tree")
                        tbItems[2].image = UIImage(named: "photo")
                
                        //4. 탭 바 아이템에 타이틀을 설정한다.
                        tbItems[0].title = "Calendar"
                        tbItems[1].title = "File"
                        tbItems[2].title = "Photo"
                }
        }
        return true
    }
```

