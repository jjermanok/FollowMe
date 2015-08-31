//
//  MNKTimed.h
//  Follow Me
//
//  Created by Jake Jermanok on 6/18/14.
//  Copyright (c) 2014 Manok Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MNKViewControllerUntimed.h"

@interface MNKTimedViewController : MNKViewControllerUntimed {
    int sheepTouchCount;
}

- (IBAction)sheepTouched:(id)sender;

@end
