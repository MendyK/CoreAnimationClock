//
//  ViewController.m
//  CoreAnimationBookTest
//
//  Created by Mendy Krinsky on 10/28/14.
//  Copyright (c) 2014 Mendy Krinsky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UIButton *button1;
@property (nonatomic, weak) IBOutlet UIButton *button2;


@end

@implementation ViewController
- (void) addStretchableImage: (UIImage *) image withContentCenter: (CGRect) rect toLayer:(CALayer *) layer
{
    layer.contents = (__bridge id)image.CGImage;
    //set contentsCenter
    layer.contentsCenter = rect;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    //add self as layer delegate
    blueLayer.delegate = self;
    
    //ensure that layer backing image uses correct scale
    blueLayer.contentsScale = [UIScreen mainScreen].scale;
    
    //add layer to our view
    [self.view.layer addSublayer:blueLayer];
    
    //force layer to redraw
    [blueLayer display];
}
- (void) drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGContextSetLineWidth(ctx, 10.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
