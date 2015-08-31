//
//  MNKDotsViewController.m
//  followme
//
//  Created by Jake Jermanok on 6/16/14.
//  Copyright (c) 2014 Manok Inc. All rights reserved.
//

#import "MNKDotsViewController.h"

@interface MNKDotsViewController ()

@end

@implementation MNKDotsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    drawImage = [[UIImageView alloc] initWithImage:nil];
    drawImage.frame = self.view.frame;
    [self.view addSubview:drawImage];
    touchedInDot1 = NO;
    releasedInDot1 = NO;
    touchedInDot2 = NO;
    releasedInDot2 = NO;
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    #define DotRadius 20
    touch = [[event allTouches] anyObject];
    location = [touch locationInView:touch.view];
    if (location.x < _dot1.center.x + DotRadius && location.x > _dot1.center.x - DotRadius &&
         location.y < _dot1.center.y + DotRadius && location.y > _dot1.center.y - DotRadius)
        touchedInDot1 = YES;
    if ((location.x < _dot2.center.x + DotRadius && location.x > _dot2.center.x - DotRadius &&
         location.y < _dot2.center.y + DotRadius && location.y > _dot2.center.y - DotRadius))
        touchedInDot2 = YES;
    lastPoint = [touch locationInView:self.view];
    lastPoint.y -= 0;
    [super touchesBegan: touches withEvent: event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    location = [touch locationInView:touch.view];
    if (location.x < _dot1.center.x + DotRadius && location.x > _dot1.center.x - DotRadius &&
        location.y < _dot1.center.y + DotRadius && location.y > _dot1.center.y - DotRadius)
        releasedInDot1 = YES;
    else
        releasedInDot1 = NO;
    if ((location.x < _dot2.center.x + DotRadius && location.x > _dot2.center.x - DotRadius &&
         location.y < _dot2.center.y + DotRadius && location.y > _dot2.center.y - DotRadius))
        releasedInDot2 = YES;
    else
        releasedInDot2 = NO;
    if ((touchedInDot2 && releasedInDot1 && drawImage.image != nil) || (touchedInDot1 && releasedInDot2 &&drawImage.image != nil))
        [self performSegueWithIdentifier:@"outOfDots" sender:self];
    drawImage.image = nil;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    touch = [touches anyObject];
    currentPoint = [touch locationInView:self.view];
    UIGraphicsBeginImageContext(CGSizeMake(320, 568));
    [drawImage.image drawInRect:CGRectMake(0, 0, 320, 568)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 3.0);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0, 0, 0, 1);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    [drawImage setFrame:CGRectMake(0, 0, 320, 568)];
    drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    lastPoint = currentPoint;
    [self.view addSubview:drawImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
