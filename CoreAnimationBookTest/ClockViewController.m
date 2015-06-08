//
//  ClockViewController.m
//  CoreAnimationBookTest
//
//  Created by Mendy Krinsky on 3/11/15.
//  Copyright (c) 2015 Mendy Krinsky. All rights reserved.
//

#import "ClockViewController.h"

@interface ClockViewController ()
@property (weak, nonatomic) IBOutlet UIView *hourHand;
@property (weak, nonatomic) IBOutlet UIView *secondsHand;
@property (weak, nonatomic) IBOutlet UIView *minutesHand;
@property (weak, nonatomic) NSTimer *timer;
@end

@implementation ClockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //adjust anchor points
    self.secondsHand.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.minutesHand.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.hourHand.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:self
                                                selector:@selector(tick)
                                                userInfo:nil
                                                 repeats:YES];
    //set initial hand positions
    [self tick];
}
- (void)tick
{
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    
    //calculate hour angle
    CGFloat hoursAngle = (components.hour / 12.0) * M_PI * 2.0;
    
    //calculate minute hand angle
    CGFloat minsAngle = (components.minute / 60.0) * M_PI * 2.0;
    
    //calculate second hand angle
    CGFloat secsAngle = (components.second / 60.0) * M_PI * 2.0;
    
    
    self.hourHand.transform = CGAffineTransformMakeRotation(hoursAngle);
    self.minutesHand.transform = CGAffineTransformMakeRotation(minsAngle);
    self.secondsHand.transform = CGAffineTransformMakeRotation(secsAngle);
}

@end
