//
//  ViewController.swift
//  ZSeatSelector_Swift
//
//  Created by Ricardo Zertuche on 8/24/15.
//  Copyright © 2015 Ricardo Zertuche. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ZSeatSelectorDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let map:String =    "AAAAA_DAAAA/" +
                            "UAAAA_DAAAA/" +
                            "UUUUU_DAAAA/" +
                            "UAAAA_AAAAA/" +
                            "AAAAA_AAAAA/";
        
        let seats = ZSeatSelector()
        seats.frame = CGRectMake(0, 50, self.view.frame.size.width, 150)
        seats.setSeatSize(CGSize(width: 30, height: 30))
        seats.setAvailableImage(UIImage(named: "A")!,
            andUnavailableImage:UIImage(named: "U")!,
            andDisabledImage:   UIImage(named: "D")!,
            andSelectedImage:   UIImage(named: "S")!)
        seats.setMap(map)
        seats.seat_price = 10.0
        seats.selected_seat_limit = 3
        seats.seatSelectorDelegate = self
        self.view.addSubview(seats)
        
        let map2:String =   "_DDDDDD_DDDDDD_DDDDDDDD_/" +
                            "_AAAAAA_AAAAAA_DUUUAAAA_/" +
                            "________________________/" +
                            "_AAAAAUUAAAUAAAAUAAAAAAA/" +
                            "_UAAUUUUUUUUUUUUUUUAAAAA/" +
                            "_AAAAAAAAAAAUUUUUUUAAAAA/" +
                            "_AAAAAAAAUAAAAUUUUAAAAAA/" +
                            "_AAAAAUUUAUAUAUAUUUAAAAA/"
        
        let seats2 = ZSeatSelector()
        seats2.frame = CGRectMake(0, 250, self.view.frame.size.width, 200)
        seats2.setSeatSize(CGSize(width: 30, height: 30))
        seats2.setAvailableImage(   UIImage(named: "A")!,
            andUnavailableImage:    UIImage(named: "U")!,
            andDisabledImage:       UIImage(named: "D")!,
            andSelectedImage:       UIImage(named: "S")!)
        seats2.setMap(map2)
        seats2.seat_price = 5.0
        seats2.selected_seat_limit = 5
        seats2.seatSelectorDelegate = self
        self.view.addSubview(seats2)
        
    }
    
    func seatSelected(seat: ZSeat) {
        //print("Seat at row: \(seat.row) and column: \(seat.column)\n")
    }
    
    func getSelectedSeats(seats: NSMutableArray) {
        var total:Float = 0.0;
        for i in 0..<seats.count {
            let seat:ZSeat  = seats.objectAtIndex(i) as! ZSeat
            print("Seat at row: \(seat.row) and column: \(seat.column)\n")
            total += seat.price
        }
        print("----- Total -----\n")
        print("----- \(total) -----\n")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

