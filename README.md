# ZSeatSelector

<h6>Objective-C & Swift / Create a Seat Map Layout</h6>

![alt tag](http://i59.tinypic.com/2enawbc.png)

**You need to import ZSeatSelector and ZSeat. Also add the ZSeatSelector Delegate to your Controller:**


<h6>Obj-C</h6>

```obj-c
#import "ZSeatSelector.h"
#import "ZSeat.h"

@interface ViewController : UIViewController <ZSeatSelectorDelegate>{
}
```
<h6>Swift</h6>
```swift
class ViewController: UIViewController, ZSeatSelectorDelegate {
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

<h6>Obj-C</h6>
```obj-c
NSString *map =     @"AAAAA_DAAAA/"
                    @"UAAAA_DAAAA/"
                    @"UUUUU_DAAAA/"
                    @"UAAAA_AAAAA/"
                    @"AAAAA_AAAAA/";
```
<h6>Swift</h6>
```Swift
let map2:String =   "_DDDDDD_DDDDDD_DDDDDDDD_/" +
                    "_AAAAAA_AAAAAA_DUUUAAAA_/" +
                    "________________________/" +
                    "_AAAAAUUAAAUAAAAUAAAAAAA/" +
                    "_UAAUUUUUUUUUUUUUUUAAAAA/" +
                    "_AAAAAAAAAAAUUUUUUUAAAAA/" +
                    "_AAAAAAAAUAAAAUUUUAAAAAA/" +
                    "_AAAAAUUUAUAUAUAUUUAAAAA/"
```
<br>
**Create a ZSeatSelector Object as a UIScrollView** <br>
Set Seat Size <br>
Set Images<br>
Set Seat Price<br>
Finally Set Map<br>

<h6>Obj-C</h6>
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
<h6>Swift</h6>
```swift
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
```
<br>
**Seat Limit** <br>
You can now add Seat Limit so that if you only allow to select 3 seats, the last 3 seats the user select are the ones that will be shown, deselecting the previous ones

<h6>Obj-C</h6>
```obj-c
    [seat setSelected_seat_limit:3];
```

<h6>Swift</h6>
```swift
    seats2.selected_seat_limit = 5
```

**Add the delegate functions**
<br>

<h6>Obj-C</h6>
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

<h6>Swift</h6>
```swift
func seatSelected(seat: ZSeat) {
        print("Seat at row: \(seat.row) and column: \(seat.column)\n")
    }
```

```swift
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
```
**Zooming**
<br>
Set the zoom as you would with a UIScrollView properties:
minimumZoomScale<br>
maximimZoomScale<br>


Hope you find it useful.
<br>
<p>Follow me on Twitter <a href="https://www.twitter.com/richzertuche" target="_blank"> @richzertuche</a></p>
