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
        
        let map:String =    "AAAAA_DAAAA/" +
                            "UAAAA_DAAAA/" +
                            "UUUUU_DAAAA/" +
                            "UAAAA_AAAAA/" +
                            "AAAAA_AAAAA/";
        
        let seats = ZSeatSelector()
        seats.frame = CGRectMake(0, 250, self.view.frame.size.width, 150)
        seats.setSeatSize(CGSize(width: 30, height: 30))
        seats.setAvailableImage(UIImage(named: "A")!,
            andUnavailableImage:UIImage(named: "U")!,
            andDisabledImage:   UIImage(named: "D")!,
            andSelectedImage:   UIImage(named: "S")!)
        seats.setMap(map)
        seats.selected_seat_limit = 3
        self.view.addSubview(seats)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

