//
//  SMActivityListViewController.swift
//  smzdw
//
//  Created by Nic on 14-8-23.
//  Copyright (c) 2014年 smzdw. All rights reserved.
//

import UIKit

class SMActivityListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SideMenuDelegate {

    var data = NSMutableArray()
    var sideMenu: SideMenu?
    var selectedActivity: NSDictionary?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // setup side menu
        sideMenu = SideMenu(sourceView: self.view, menuData: ["首页", "我的收藏", "消息", "设置", "反馈"])
        sideMenu!.delegate = self
        
        // set backBarButton title
        let backBarButtonItem = UIBarButtonItem()
        backBarButtonItem.title = ""
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        loadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() {
        NSLog("begin loadData")
        
        let manager: AFHTTPRequestOperationManager = AFHTTPRequestOperationManager()
        
        let url: String = "http://115.28.129.120/services/activities?start=1&number=10"
        
        let requestSuccess = {
            (operation :AFHTTPRequestOperation!, responseObject :AnyObject!) -> Void in
            
            self.data = responseObject as NSMutableArray
            
//            self.refreshControl!.endRefreshing()
//            self.refreshControl!.attributedTitle = NSAttributedString(string: "松手更新数据")
            
            self.tableView!.reloadData()
            NSLog("requestSuccess \(responseObject)")
        }
        let requestFailure = {
            (operation :AFHTTPRequestOperation!, error :NSError!) -> Void in
            
//            self.refreshControl!.endRefreshing()
//            self.refreshControl!.attributedTitle = NSAttributedString(string: "松手更新数据")
            
            NSLog("requestFailure: \(error)")
        }
        
        manager.GET(url, parameters: nil, success: requestSuccess, failure: requestFailure)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("activityCell") as SMActivityCell
        var index = indexPath.row
        var activity = self.data[index] as NSDictionary
        
        cell.titleLabel!.text = activity["title"] as? String
        cell.destinationLabel!.text = activity["destination"] as? String
        
        var image = activity["image"] as String
        var activityImageUrl = "http://115.28.129.120\(image)"
        cell.activityImage!.setImage(activityImageUrl, placeHolder: UIImage(named: ""))
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var index = indexPath.row
        selectedActivity = self.data[index] as? NSDictionary
        NSLog("selectedActivity \(selectedActivity)")
    }
    
    func sideMenuDidSelectItemAtIndex(index: Int) {
        sideMenu?.toggleMenu()
    }
    
    @IBAction func toggleSideMenu(sender: AnyObject) {
        sideMenu?.toggleMenu()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
