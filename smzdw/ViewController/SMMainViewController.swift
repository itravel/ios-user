
import UIKit

class SMMainViewController: UITabBarController {
    
    var myTabbar: UIView?
    var slider: UIView?
    let btnBGColor: UIColor =  UIColor(red:125/255.0, green:236/255.0, blue:198/255.0, alpha: 1)
    let tabBarBGColor: UIColor =  UIColor(red:51/255.0, green:153/255.0, blue:153/255.0, alpha: 1)
    let titleColor: UIColor =  UIColor(red:52/255.0, green:156/255.0, blue:150/255.0, alpha: 1)
    
    
    let itemArray = ["离我最近", "人气最高", "对我胃口"]
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
        self.title = "离我最近"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        initViewControllers()
        // loadData()
    }
    
    func setupViews() {
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.backgroundColor = UIColor.whiteColor()
        self.tabBar.hidden = true
        var width = self.view.frame.size.width
        var height = self.view.frame.size.height
        self.myTabbar = UIView(frame: CGRectMake(0, height - 49, width, 49))
        self.myTabbar!.backgroundColor = tabBarBGColor
        self.slider = UIView(frame:CGRectMake(0,0,107,49))
        self.slider!.backgroundColor = UIColor.whiteColor() // btnBGColor
        self.myTabbar!.addSubview(self.slider!)
        
        self.view.addSubview(self.myTabbar!)
        
        var count = self.itemArray.count
        
        for var index = 0; index < count; index++ {
            var btnWidth = (CGFloat)(index * 107)
            var button  = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
            button.frame = CGRectMake(btnWidth, 0, 107, 49)
            button.tag = index + 100
            var title = self.itemArray[index]
            button.setTitle(title, forState: UIControlState.Normal)
            button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            button.setTitleColor(tabBarBGColor, forState: UIControlState.Selected)
            
            button.addTarget(self, action: "tabBarButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            self.myTabbar?.addSubview(button)
            if index == 0 {
                button.selected = true
            }
        }
    }
    
    func initViewControllers() {
        var vc1 = SMHomeTableViewController()
        vc1.activityType = .Nearest
        var vc2 = SMHomeTableViewController()
        vc2.activityType = .Hotest
        var vc3 = SMHomeTableViewController()
        vc3.activityType = .Interest
     
        self.viewControllers = [vc1, vc2, vc3]
    }
    
    
    func tabBarButtonClicked(sender: UIButton) {
        var index = sender.tag
        
        for var i = 0; i < 3; i++ {
            var button = self.view.viewWithTag(i+100) as UIButton
            if button.tag == index {
                button.selected = true
            } else {
                button.selected = false
            }
        }
        
        UIView.animateWithDuration( 0.3,
            {
                
                self.slider!.frame = CGRectMake(CGFloat(index-100)*107,0,107,49)
                
            })
        self.title = itemArray[index-100] as String
        self.selectedIndex = index-100
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    

    
}
