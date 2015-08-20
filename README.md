# ZSeatSelector

<h6>Objective-C Create a Seat Map Layout</h6>

![alt tag](http://oi61.tinypic.com/2hg65vl.jpg)

**You need to import ZSeatSelector and ZSeat. Also add the ZSeatSelector Delegate to your Controller:**

```obj-c
#import "ZSeatSelector.h"
#import "ZSeat.h"

@interface ViewController : UIViewController <ZSeatSelectorDelegate>{
}
```

<br>
**Create your map using a NSString.**
<br>
Note:<br>
A = Available<br>
U = Unavailable<br>
D = Disabled<br>
_ = Space<br>
/ = Line Break (row)

```obj-c
NSString *map =     @"AAAAA_DAAAA/"
                    @"UAAAA_DAAAA/"
                    @"UUUUU_DAAAA/"
                    @"UAAAA_AAAAA/"
                    @"AAAAA_AAAAA/";
```
<br>
**Create a ZSeatSelector Object as a UIScrollView** <br>
Set Seat Size <br>
Set Images<br>
Set Seat Price<br>
Finally Set Map<br>

```obj-c
ZSeatSelector *seat = [[ZSeatSelector alloc]initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, 160)];
    
    [seat setSeatSize:CGSizeMake(32, 32)];
    [seat setAvailableImage:[UIImage imageNamed:@"A"]
        andUnavailableImage:[UIImage imageNamed:@"U"]
           andDisabledImage:[UIImage imageNamed:@"D"]
           andSelectedImage:[UIImage imageNamed:@"S"]];
    [seat setSeat_price:30];
    [seat setMap:map];
    [seat setDelegate:self];
```
<br>
**Seat Limit** <br>
You can now add Seat Limit so that if you only allow to select 3 seats, the last 3 seats the user select are the ones that will be shown, deselecting the previous ones

```obj-c
NSString *map2 =	@"_DDDDDD_DDDDDD_DDDDDDDD_/"
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
    [seat2 setDelegate:self];
	[seat2 setSelected_seat_limit:3];
```

**Add the delegate functions**
<br>

```obj-c
- (void)seatSelected:(ZSeat *)seat{
    NSLog(@"Seat at Row:%ld and Column:%ld", (long)seat.row,(long)seat.column);
}
```
```obj-c
-(void)getSelectedSeats:(NSMutableArray *)seats{
    float total=0;
    for (int i=0; i<[seats count]; i++) {
        ZSeat *seat = [seats objectAtIndex:i];
        printf("Seat[%ld,%ld]\n",(long)seat.row,(long)seat.column);
        total += seat.price;
    }
    printf("--------- Total: %f\n",total);
}
```

Hope you find it useful.
<br>
<p>Follow me on Twitter <a href="https://www.twitter.com/richzertuche" target="_blank"> @richzertuche</a></p>
