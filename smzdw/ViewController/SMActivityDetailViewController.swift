//
//  SMActivityViewController.swift
//  smzdw
//
//  Created by Nic on 14-8-10.
//  Copyright (c) 2014年 smzdw. All rights reserved.
//

import UIKit


class SMActivityDetailViewController: UIViewController{
    
    @IBOutlet var activityImage: UIImageView?
    @IBOutlet var timeLabel: UILabel?
    @IBOutlet var statusLabel: UILabel?
    
    @IBOutlet var destinationLabel: UILabel?
    @IBOutlet var contentText: UITextView?
    
    var activity: NSDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get the data passed from list page
        let activityListViewController = (self.parentViewController as UINavigationController).viewControllers[0] as SMActivityListViewController
        activity = activityListViewController.selectedActivity

        self.title = activity!["title"] as? String
        
        let image = activity!["image"] as String
        let activityImageUrl = "http://115.28.129.120\(image)"
        activityImage!.setImage(activityImageUrl, placeHolder: UIImage(named: ""))
        
        destinationLabel!.text = activity!["destination"] as? String
        timeLabel!.text = activity!["start"] as? String
        
        // load acitivity data
        let activityId = activity!["id"] as Int
        loadData(activityId)
    }
    
    func loadData(activityId: Int) {
        NSLog("begin loadData")
        
        let manager: AFHTTPRequestOperationManager = AFHTTPRequestOperationManager()
        
        let url: String = "http://115.28.129.120/services/activities/\(activityId)"
        
        let requestSuccess = {
            (operation :AFHTTPRequestOperation!, responseObject :AnyObject!) -> Void in
            
            var data = responseObject as NSDictionary
            
            //            self.refreshControl!.endRefreshing()
            //            self.refreshControl!.attributedTitle = NSAttributedString(string: "松手更新数据")
            
            self.refreshView(data)
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

    func refreshView(data: NSDictionary) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
