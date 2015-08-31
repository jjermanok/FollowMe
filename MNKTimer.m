//
//  MNKTimer.m
//  FollowMe
//
//  Created by Jake Jermanok on 6/14/14.
//  Copyright (c) 2014 Manok Inc. All rights reserved.
//

#import "MNKTimer.h"

@implementation MNKTimer

-(void)prepareForSegue:(UIStoryboardSegue *)segueToTimer sender:(id)sender
{
    secs = 5;
    timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(countdown) userInfo:nil repeats:YES];
}

- (void)countdown {
    secs--;
    _timerLabel.text = [NSString stringWithFormat:@"%i", secs];
}

@end
