//
//  ZSeatSelector.swift
//  ZSeatSelector_Swift
//
//  Created by Ricardo Zertuche on 8/24/15.
//  Copyright © 2015 Ricardo Zertuche. All rights reserved.
//

import UIKit

class ZSeatSelector: UIScrollView {
    
    var seat_width:     CGFloat = 20.0
    var seat_height:    CGFloat = 20.0
    var selected_seats          = NSMutableArray()
    var seat_price:     Float   = 10.0
    
    var available_image     = UIImage()
    var unavailable_image   = UIImage()
    var disabled_image      = UIImage()
    var selected_image      = UIImage()
    
    
    func setSeatSize(size: CGSize){
        seat_width  = size.width
        seat_height = size.height
    }
    
    
    func createSeatButtonWithPosition(initial_seat_x: Int, and initial_seat_y: Int, isAvailable available: Bool, isDisabled disabled: Bool) {
        
        let seatButton = ZSeat(frame: CGRectMake(
                CGFloat(initial_seat_x) * seat_width,
                CGFloat(initial_seat_y) * seat_height,
                CGFloat(seat_width),
                CGFloat(seat_height)))
        if available && disabled {
            self.setSeatAsDisabled(seatButton)
        }
        else {
            if available && !disabled {
                self.setSeatAsAvaiable(seatButton)
            }
            else {
                self.setSeatAsUnavaiable(seatButton)
            }
        }
        seatButton.available = available
        seatButton.disabled = disabled
        seatButton.row = initial_seat_y + 1
        seatButton.column = initial_seat_x + 1
        seatButton.price = seat_price
        seatButton.addTarget(self, action: "seatSelected:", forControlEvents: .TouchDown)
        self.addSubview(seatButton)
    }
    
    func setAvailableImage(available_image: UIImage, andUnavailableImage unavailable_image: UIImage, andDisabledImage disabled_image: UIImage, andSelectedImage selected_image: UIImage) {
        self.available_image = available_image
        self.unavailable_image = unavailable_image
        self.disabled_image = disabled_image
        self.selected_image = selected_image
    }
    
    func setSeatAsUnavaiable(sender: ZSeat) {
        sender.setImage(available_image, forState: .Normal)
        sender.selected_seat = true
    }
    
    func setSeatAsAvaiable(sender: ZSeat) {
        sender.setImage(available_image, forState: .Normal)
        sender.selected_seat = false
    }
    
    func setSeatAsDisabled(sender: ZSeat) {
        sender.setImage(disabled_image, forState: .Normal)
        sender.selected_seat = false
    }
    
    func setSeatAsSelected(sender: ZSeat) {
        sender.setImage(selected_image, forState: .Normal)
        sender.selected_seat = true
    }
}


class ZSeat: UIButton {
    var row:            Int     = 0
    var column:         Int     = 0
    var available:      Bool    = true;
    var disabled:       Bool    = true;
    var selected_seat:  Bool    = true;
    var price:          Float   = 0.0
}