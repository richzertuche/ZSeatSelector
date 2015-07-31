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
** Create a ZSeatSelector Object as a UIScrollView ** <br>
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
**Add the delegate functions **
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
