//
//  MNKTimed.m
//  Follow Me
//
//  Created by Jake Jermanok on 6/18/14.
//  Copyright (c) 2014 Manok Inc. All rights reserved.
//

#import "MNKTimedViewController.h"

@implementation MNKTimedViewController

- (void)viewDidLoad
{
    sheepTouchCount = 0;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(leave) userInfo:nil repeats:NO];
}

- (IBAction)sheepTouched:(id)sender
{
    sheepTouchCount++;
    if (sheepTouchCount == 2)
        [self performSegueWithIdentifier:@"toWarning" sender:self];
}

- (void)leave
{
    [self performSegueWithIdentifier:@"outOfStare" sender:self];
}

@end
