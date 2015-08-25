//
//  ViewController.swift
//  ZSeatSelector_Swift
//
//  Created by Ricardo Zertuche on 8/24/15.
//  Copyright © 2015 Ricardo Zertuche. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let map:NSString =  "AAAAA_DAAAA/"
                            "UAAAA_DAAAA/"
                            "UUUUU_DAAAA/"
                            "UAAAA_AAAAA/"
                            "AAAAA_AAAAA/";
        
        let seats = ZSeatSelector()
        seats.frame = CGRectMake(0, 0, self.view.frame.size.width, 400)
        seats.backgroundColor = UIColor.redColor()
        seats.setSeatSize(CGSize(width: 30, height: 30))
        self.view.addSubview(seats)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

