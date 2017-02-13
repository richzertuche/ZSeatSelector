//
//  ZSeatSelector.swift
//  ZSeatSelector_Swift
//
//  Created by Ricardo Zertuche on 8/24/15.
//  Copyright © 2015 Ricardo Zertuche. All rights reserved.
//

import UIKit

protocol ZSeatSelectorDelegate {
    func seatSelected(_ seat: ZSeat)
    func getSelectedSeats(_ seats: NSMutableArray)
}

class ZSeatSelector: UIScrollView, UIScrollViewDelegate {
    
    var seatSelectorDelegate: ZSeatSelectorDelegate?
    var seat_width:     CGFloat = 20.0
    var seat_height:    CGFloat = 20.0
    var selected_seats          = NSMutableArray()
    var seat_price:     Float   = 10.0
    var available_image     = UIImage()
    var unavailable_image   = UIImage()
    var disabled_image      = UIImage()
    var selected_image      = UIImage()
    let zoomable_view       = UIView()
    var selected_seat_limit:Int = 0
    var layout_type                = ""
    
    // MARK: - Init and Configuration
    
    func setSeatSize(_ size: CGSize){
        seat_width  = size.width
        seat_height = size.height
    }
    func setMap(_ map: String) {
        if (layout_type == "Normal"){
            var initial_seat_x: Int = 0
            var initial_seat_y: Int = 0
            var final_width: Int = 0
            
            for i in 0..<map.characters.count {
                let seat_at_position = map[i]
                
                if seat_at_position == "A" {
                    createSeatButtonWithPosition(initial_seat_x, and: initial_seat_y, isAvailable: true, isDisabled: false)
                    initial_seat_x += 1
                } else if seat_at_position == "D" {
                    createSeatButtonWithPosition(initial_seat_x, and: initial_seat_y, isAvailable: true, isDisabled: true)
                    initial_seat_x += 1
                } else if seat_at_position == "U" {
                    createSeatButtonWithPosition(initial_seat_x, and: initial_seat_y, isAvailable: false, isDisabled: false)
                    initial_seat_x += 1
                } else if seat_at_position == "_" {
                    initial_seat_x += 1
                } else {
                    if initial_seat_x > final_width {
                        final_width = initial_seat_x
                    }
                    initial_seat_x = 0
                    initial_seat_y += 1
                }
            }
            
            zoomable_view.frame = CGRect(x: 0, y: 0, width: CGFloat(final_width) * seat_width, height: CGFloat(initial_seat_y) * seat_height)
            self.contentSize = zoomable_view.frame.size
            let newContentOffsetX: CGFloat = (self.contentSize.width - self.frame.size.width) / 2
            self.contentOffset = CGPoint(x: newContentOffsetX, y: 0)
            selected_seats = NSMutableArray()
            
            self.delegate = self
            self.addSubview(zoomable_view)
        } else {
           
        }
        
    }
    func createSeatButtonWithPosition(_ initial_seat_x: Int, and initial_seat_y: Int, isAvailable available: Bool, isDisabled disabled: Bool) {
    
        let seatButton = ZSeat(frame: CGRect(
                x: CGFloat(initial_seat_x) * seat_width,
                y: CGFloat(initial_seat_y) * seat_height,
                width: CGFloat(seat_width),
                height: CGFloat(seat_height)))
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
        seatButton.addTarget(self, action: #selector(ZSeatSelector.seatSelected(_:)), for: .touchDown)
        zoomable_view.addSubview(seatButton)
    }
    
    // MARK: - Seat Selector Methods
    
    func seatSelected(_ sender: ZSeat) {
        if !sender.selected_seat && sender.available {
            if selected_seat_limit != 0 {
                checkSeatLimitWithSeat(sender)
            }
            else {
                self.setSeatAsSelected(sender)
                selected_seats.add(sender)
            }
        }
        else {
            selected_seats.remove(sender)
            if sender.available && sender.disabled {
                self.setSeatAsDisabled(sender)
            }
            else {
                if sender.available && !sender.disabled {
                    self.setSeatAsAvaiable(sender)
                }
            }
        }
        
        seatSelectorDelegate?.seatSelected(sender)
        seatSelectorDelegate?.getSelectedSeats(selected_seats)
    }
    func checkSeatLimitWithSeat(_ sender: ZSeat) {
        if selected_seats.count < selected_seat_limit {
            setSeatAsSelected(sender)
            selected_seats.add(sender)
        }
        else {
            let seat_to_make_avaiable: ZSeat = selected_seats[0] as! ZSeat
            if seat_to_make_avaiable.disabled {
                self.setSeatAsDisabled(seat_to_make_avaiable)
            }
            else {
                self.setSeatAsAvaiable(seat_to_make_avaiable)
            }
            selected_seats.removeObject(at: 0)
            self.setSeatAsSelected(sender)
            selected_seats.add(sender)
        }
    }
    
    // MARK: - Seat Images & Availability
    
    func setAvailableImage(_ available_image: UIImage, andUnavailableImage unavailable_image: UIImage, andDisabledImage disabled_image: UIImage, andSelectedImage selected_image: UIImage) {
        self.available_image = available_image
        self.unavailable_image = unavailable_image
        self.disabled_image = disabled_image
        self.selected_image = selected_image
    }
    func setSeatAsUnavaiable(_ sender: ZSeat) {
        sender.setImage(unavailable_image, for: UIControlState())
        sender.selected_seat = true
    }
    func setSeatAsAvaiable(_ sender: ZSeat) {
        sender.setImage(available_image, for: UIControlState())
        sender.selected_seat = false
    }
    func setSeatAsDisabled(_ sender: ZSeat) {
        sender.setImage(disabled_image, for: UIControlState())
        sender.selected_seat = false
    }
    func setSeatAsSelected(_ sender: ZSeat) {
        sender.setImage(selected_image, for: UIControlState())
        sender.selected_seat = true
    }
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        print("zoom")
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.subviews[0]
    }
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        print(scale)
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

extension String {
    subscript (i: Int) -> Character {
        return self[self.characters.index(self.startIndex, offsetBy: i)]
    }
}
