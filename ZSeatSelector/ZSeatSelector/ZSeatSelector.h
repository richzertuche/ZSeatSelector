//
//  ZSeatSelector.h
//  
//
//  Created by Ricardo Zertuche on 7/30/15.
//
//

#import <UIKit/UIKit.h>
#import "ZSeat.h"

@class ZSeatSelector;
@protocol ZSeatSelectorDelegate <NSObject>
- (void)seatSelected:(ZSeat *)seat;
@optional
- (void)getSelectedSeats:(NSMutableArray *)seats;
@end

@interface ZSeatSelector : UIScrollView{
    float seat_width;
    float seat_height;
    NSMutableArray *selected_seats;
}

@property (nonatomic, retain) UIImage *available_image;
@property (nonatomic, retain) UIImage *unavailable_image;
@property (nonatomic, retain) UIImage *disabled_image;
@property (nonatomic, retain) UIImage *selected_image;

@property (nonatomic) float seat_price;
@property (retain) id delegate;

-(void)setSeatSize:(CGSize)size;
-(void)setMap:(NSString*)map;

-(void)setAvailableImage:(UIImage*)available_image andUnavailableImage:(UIImage*)unavailable_image andDisabledImage:(UIImage*)disabled_image andSelectedImage:(UIImage*)selected_image;

@end
