//
//  ZSeat.h
//  
//
//  Created by Ricardo Zertuche on 7/30/15.
//
//

#import <UIKit/UIKit.h>

@interface ZSeat : UIButton

@property (nonatomic) int row;
@property (nonatomic) int column;
@property (nonatomic) BOOL available;
@property (nonatomic) BOOL disabled;
@property (nonatomic) BOOL selected_seat;
@property (nonatomic) float price;

@end
