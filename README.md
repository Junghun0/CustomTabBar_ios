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
_AppDelegate 의 application(_:didFinishLaunchingWithOptions:) 메소드에 적합하다.(앱의 초기화가 완료되었을때 시스템에 의해 자동으로 호출됨)

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
                        
                        //5. 활성화된 탭 바 아이템으 이미지 색상을 변경한다.
                        tbProxy.tintColor = UIColor.white
                        
                        //6.탭 바에 배경 이미지를 설정한다.
                        tbProxy.backgroundImage = UIImage(named: "menubar-bg-mini")
                }
        }
        return true
    }
```
* 크기가 맞지않는 이미지를 탭바 배경이미지로 설정할 때

1) 아무설정없음

```swift
   tbC.tabBar.backgroundImage = UIImage(named:"connectivity-bar")
```
   
   
2)  x 좌표의 이미지만 늘어나고, x좌표를 기준을 분할된 좌우측의 이미지는 나뉘어 양쪽끝에 밀착됨 
    y 좌표를 기준으로 분할된 위아래 이미지는 그대로 상하단에 붙고, y좌표의 이미지만 늘어나서 배경을 채움
  
  
```swift
  let bg = UIImage(named: "connectivity-bar")?.stretchableImage(withLeftCapWidth: 5, topCapHeight: 16)
  tbC.tabBar.backgroundImage = bg
  ```

  
3)  전체적인 이미지를 균일하게 늘림
```swift
  let bg = UIImage(named:"connectivity-bar")?.stretchableImage(withLeftCapWidth: 0, tapCapHeight: 0)
  tbC.tabBar.backgroundImage = bg
```

* 탭 바 아이템에 원본 이미지 적용하기

```swift
  //이미지 원본으로 등록 색상 변경
  tbItems[0].image = UIImage(named: "designbump")?.withRenderingMode(.alwaysOriginal)
  tbItems[1].image = UIImage(named: "rss")?.withRenderingMode(.alwaysOriginal)
  tbItems[2].image = UIImage(named: "facebook")?.withRenderingMode(.alwaysOriginal)
```


* 탭 바 선택될 때 이미지 변경

```swift
  //탭 바 아이템 전체를 순회하면서 selectedImage 속성에 이미지를 설정한다.
  let image = UIImage(named: "checkmark")?.withRenderingMode(.alwaysOriginal)
  tbItem.selectedImage = image
```

* 탭 바 아이템별 텍스트 색상 속성 변경


```swift
        for tbItem in tbItems {
                    //탭 바 아이템별 텍스트 색상 속성 설정하기
                    
                    //선택안되었을때
                    tbItem.setTitleTextAttributes([NSAttributedString.Key(rawValue:                                                                     NSAttributedString.Key.foregroundColor.rawValue) : UIColor.gray], for: .disabled)
                    
                    //선택되었을때
                    tbItem.setTitleTextAttributes([NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue) : UIColor.red], for: .selected)
                    
                    //전체 아이템의 폰트 크기 설정
                    tbItem.setTitleTextAttributes([NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue) : UIFont.systemFont(ofSize: 15)], for: .normal)*/
                }
```

#### AppDelegate 직접만들기 -> TabBarController 직접만들기

* 앱 델리게이트 클래스 구현 조건
   1. UIResponder 클래스를 상속받아야 한다.
   2. UIApplicationDelegate 프로토콜을 구현해야 한다.
   3. UIWindow 타입의 멤버 변수 window가 정의되어 있어야 한다.
   4. @UIApplicationMain 어트리뷰트가 프로젝트 내에서 유일하게 추가되어 있어야 한다.
   
* NewAppDelegate.swift

```swift
@UIApplicationMain //-> 시스템에 앱 델리게이트로 인식시키는 역할 (AppDelegate.swift 파일에서 NewAppDelegate.swift 파일로 delegate 설정변경)
class NewAppDelegate : UIResponder, UIApplicationDelegate{
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        //1.탭 바 컨트롤러를 생성하고, 배경을 흰색으로 채운다.
        let tbC = UITabBarController()
        tbC.view.backgroundColor = .white
        
        //2.생성된 tbC를 루트 뷰 컨트롤러로 등록
        self.window?.rootViewController = tbC
        
        //3.각 탭 바 아이템에 연결될 뷰 컨트롤러 객체를 생성
        let view01 = ViewController()
        let view02 = SecondViewController()
        let view03 = ThirdViewController()
        
        //4.생성된 뷰 컨트롤러 객체들을 탭 바 컨트롤러에 등록한다.
        tbC.setViewControllers([view01,view02,view03], animated: false)
        
        //5.개별 탭 바 아이템의 속성을 설정한다.
        view01.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(named: "calendar"), selectedImage: nil)
        view02.tabBarItem = UITabBarItem(title: "File", image: UIImage(named: "file-tree"), selectedImage: nil)
        view03.tabBarItem = UITabBarItem(title: "Photo", image: UIImage(named: "photo"), selectedImage: nil)
        
        return true
    }
}
```

* 탭 바에 애니메이션 효과 추가

```swift
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tabBar = self.tabBarController?.tabBar
        //tabBar?.isHidden = (tabBar?.isHidden == true) ? false : true
        
        UIView.animate(withDuration: TimeInterval(1)) {
            //alpha 값이 0이면 1로, 1이면 0으로 바꾸어준다.
            //호출될 때마다 점점 투명해졌다가 점점 진해질 것이다.
            tabBar?.alpha = (tabBar?.alpha == 0 ? 1 : 0)
        }
    }
```
