//
//  ViewController.m
//  ZSeatSelector
//
//  Created by Ricardo Zertuche on 7/30/15.
//  Copyright (c) 2015 Ricardo Zertuche. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *map = @"AAAAA_DAAAA/"
                    @"UAAAA_DAAAA/"
                    @"UUUUU_DAAAA/"
                    @"UAAAA_AAAAA/"
                    @"AAAAA_AAAAA/";
    
    ZSeatSelector *seat = [[ZSeatSelector alloc]initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, 160)];
    
    [seat setSeatSize:CGSizeMake(32, 32)];
    [seat setAvailableImage:[UIImage imageNamed:@"A"]
        andUnavailableImage:[UIImage imageNamed:@"U"]
           andDisabledImage:[UIImage imageNamed:@"D"]
           andSelectedImage:[UIImage imageNamed:@"S"]];
    [seat setSeat_price:30];
    [seat setMap:map];
    seat.seat_delegate = self;
    
    [self.view addSubview:seat];
    
    NSString *map2 =@"_DDDDDD_DDDDDD_DDDDDDDD_/"
                    @"_AAAAAA_AAAAAA_DUUUAAAA_/"
                    @"________________________/"
                    @"_AAAAAUUAAAUAAAAUAAAAAAA/"
                    @"_UAAUUUUUUUUUUUUUUUAAAAA/"
                    @"_AAAAAAAAAAAUUUUUUUAAAAA/"
                    @"_AAAAAAAAUAAAAUUUUAAAAAA/"
                    @"_AAAAAUUUAUAUAUAUUUAAAAA/";
    
    ZSeatSelector *seat2 = [[ZSeatSelector alloc]initWithFrame:CGRectMake(0, 220, self.view.frame.size.width, 260)];
    
    [seat2 setSeatSize:CGSizeMake(24, 24)];
    [seat2 setAvailableImage:[UIImage imageNamed:@"A"]
        andUnavailableImage:[UIImage imageNamed:@"U"]
           andDisabledImage:[UIImage imageNamed:@"D"]
           andSelectedImage:[UIImage imageNamed:@"S"]];
    [seat2 setSeat_price:5.50];
    [seat2 setMap:map2];
    [seat2 setSelected_seat_limit:3];
    seat2.minimumZoomScale = 0.5;
    seat2.maximumZoomScale = 10.0;
    seat2.seat_delegate = self;
    
    [self.view addSubview:seat2];
    
}

- (void)seatSelected:(ZSeat *)seat{
    NSLog(@"Seat at Row:%ld and Column:%ld", (long)seat.row,(long)seat.column);
}

-(void)getSelectedSeats:(NSMutableArray *)seats{
    float total=0;
    for (int i=0; i<[seats count]; i++) {
        ZSeat *seat = [seats objectAtIndex:i];
        printf("Seat[%ld,%ld]\n",(long)seat.row,(long)seat.column);
        total += seat.price;
    }
    printf("--------- Total: %f\n",total);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
