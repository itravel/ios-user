
import UIKit

enum SMHomeTableViewControllerType : Int {
    case Nearest
    case Hotest
    case Interest
}

class SMHomeTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var refreshControl: UIRefreshControl?
    
    let identifier = "cell"
    var activityType: SMHomeTableViewControllerType = .Nearest
    var tableView: UITableView?
    var dataArray = NSMutableArray()
    var page: Int = 1
//    var refreshView:YRRefreshView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        loadData()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "imageViewTapped", object:nil)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "imageViewTapped:", name: "imageViewTapped", object: nil)
    }
    
    
    
    func setupViews() {
        setupTableView()
    }
    
    func setupTableView() {
        var width = self.view.frame.size.width
        var height = self.view.frame.size.height
        self.tableView = UITableView(frame: CGRectMake(0, 64, width, height-49-64))
        self.tableView!.delegate = self;
        self.tableView!.dataSource = self;
        self.tableView!.separatorStyle = UITableViewCellSeparatorStyle.None
        var nib = UINib(nibName:"SMHomeActivityCell", bundle: nil)
        
        self.tableView?.registerNib(nib, forCellReuseIdentifier: identifier)
        //        var arr =  NSBundle.mainBundle().loadNibNamed("YRRefreshView" ,owner: self, options: nil) as Array
        //        self.refreshView = arr[0] as? YRRefreshView
        //        self.refreshView!.delegate = self
        //
        //        self.tableView!.tableFooterView = self.refreshView
        self.view.addSubview(self.tableView!)
        
        setupRefreshControl()
    }
    
    func setupRefreshControl() {
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.addTarget(self, action: "loadData", forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl!.attributedTitle = NSAttributedString(string: "松手更新数据")
        
        self.tableView!.addSubview(self.refreshControl!)
    }
    
    func loadData() {
        self.refreshControl!.attributedTitle = NSAttributedString(string: "刷新中")
        
        let manager: AFHTTPRequestOperationManager = AFHTTPRequestOperationManager()
        
        let url: String = "http://115.28.129.120/services/activities"
        
        let requestSuccess = {
            (operation :AFHTTPRequestOperation!, responseObject :AnyObject!) -> Void in

            self.dataArray = responseObject as NSMutableArray
            
            self.refreshControl!.endRefreshing()
            self.refreshControl!.attributedTitle = NSAttributedString(string: "松手更新数据")
            
            self.tableView!.reloadData()
            NSLog("requestSuccess \(responseObject)")
        }
        let requestFailure = {
            (operation :AFHTTPRequestOperation!, error :NSError!) -> Void in
            
            self.refreshControl!.endRefreshing()
            self.refreshControl!.attributedTitle = NSAttributedString(string: "松手更新数据")
            
            NSLog("requestFailure: \(error)")
        }
        
         manager.GET(url, parameters: nil, success: requestSuccess, failure: requestFailure)

        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // #pragma mark - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        NSLog("\(self.dataArray.count)")
        return self.dataArray.count
    }
    
    
    func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
        
        var cell = tableView?.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as? SMHomeActivityCell
        var index = indexPath!.row
        var data = self.dataArray[index] as NSDictionary
        cell!.data = data
        return cell
       
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return 176;
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
//        var index = indexPath!.row
//        var data = self.dataArray[index] as NSDictionary
//        var commentsVC = YRCommentsViewController(nibName :nil, bundle: nil)
//        commentsVC.jokeId = data.stringAttributeForKey("id")
//        self.navigationController.pushViewController(commentsVC, animated: true)
    }
    
//    func refreshView(refreshView:YRRefreshView,didClickButton btn:UIButton)
//    {
//        //refreshView.startLoading()
//        loadData()
//    }
    
    func imageViewTapped(noti:NSNotification) {
        
//        var imageURL = noti.object as String
//        var imgVC = YRImageViewController(nibName: nil, bundle: nil)
//        imgVC.imageURL = imageURL
//        self.navigationController.pushViewController(imgVC, animated: true)
        

    }
    
}
