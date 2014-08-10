//
//  SMHomeActivityCell.swift
//  smzdw
//
//  Created by Nic on 14-8-3.
//  Copyright (c) 2014年 smzdw. All rights reserved.
//

import UIKit

class SMHomeActivityCell: UITableViewCell {

    @IBOutlet var activityView: UIImageView?
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var partBtn: FUIButton?
    
    var data: NSDictionary!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        myButton.shadowColor = [UIColor greenSeaColor];
//        myButton.shadowHeight = 3.0f;
//        myButton.cornerRadius = 6.0f;
//        myButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
//        [myButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
//        [myButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    
        self.partBtn!.buttonColor = UIColor.whiteColor()
//        self.partBtn!.shadowColor = UIColor.greenSeaColor()
//        self.partBtn!.shadowHeight = 3.0
        self.partBtn!.cornerRadius = 3.0
        self.partBtn!.titleLabel.font = UIFont.flatFontOfSize(16)
        self.partBtn!.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.partBtn!.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)

        
        if self.data["title"] as NSObject != NSNull() {
            self.titleLabel!.text = self.data["title"] as String
        }
        
        
        if self.data["images"] as NSObject != NSNull() {
            var image = self.data["images"] as String
            var userImageURL = "http://115.28.129.120\(image)"
//            self.activityView!
            self.activityView!.setImage(userImageURL, placeHolder: UIImage(named: ""))
            
        }
    }

}
