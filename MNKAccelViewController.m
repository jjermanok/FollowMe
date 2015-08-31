//
//  MNKAccelViewController.m
//  followme
//
//  Created by Jake Jermanok on 6/16/14.
//  Copyright (c) 2014 Manok Inc. All rights reserved.
//




//Not Currently Used

#import "MNKAccelViewController.h"

@interface MNKAccelViewController ()

@end

@implementation MNKAccelViewController

- (void)viewDidLoad
{
    [[UIAccelerometer sharedAccelerometer] setUpdateInterval:1.0/60];
    [[UIAccelerometer sharedAccelerometer] setDelegate:self];
    _ball.center = CGPointMake(110, 200);
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    NSLog(@"%@", acceleration);
    #define BallRadius 50
    valuex = acceleration.x * 25.0;
    valuey = -acceleration.y * 25.0;
    int newx = (int)(_ball.center.x + valuex);
    int newy = (int)(_ball.center.y + valuey);
    if (newx > self.view.frame.size.width - BallRadius)
        newx = self.view.frame.size.width - BallRadius;
    if (newx < BallRadius)
        newx = BallRadius;
    if (newy > self.view.frame.size.height - BallRadius)
        newy = self.view.frame.size.height - BallRadius;
    if (newy < BallRadius) {
        [self performSegueWithIdentifier:@"outOfAccelerometer" sender:self];
        [[UIAccelerometer sharedAccelerometer] setDelegate:nil];
    }
    CGPoint newCenter = CGPointMake(newx,newy);
    _ball.center = newCenter;
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
