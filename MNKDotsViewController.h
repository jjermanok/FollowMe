//
//  MNKDotsViewController.h
//  followme
//
//  Created by Jake Jermanok on 6/16/14.
//  Copyright (c) 2014 Manok Inc. All rights reserved.
//

#import "MNKViewController.h"

@interface MNKDotsViewController : MNKViewController {
    CGPoint lastPoint;
    CGPoint moveBackTo;
    CGPoint currentPoint;
    CGPoint location;
    UIImageView *drawImage;
    UITouch *touch;
    BOOL touchedInDot1;
    BOOL touchedInDot2;
    BOOL releasedInDot1;
    BOOL releasedInDot2;
}

@property IBOutlet UIImageView *dot1;
@property IBOutlet UIImageView *dot2;

@end
