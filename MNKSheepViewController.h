//
//  MNKSheepViewController.h
//  Follow Me
//
//  Created by Jake Jermanok on 6/18/14.
//  Copyright (c) 2014 Manok Inc. All rights reserved.
//

#import "MNKViewController.h"

@interface MNKSheepViewController : MNKViewController {
    UITouch *touch;
    BOOL touchMoved;
}

@property IBOutlet UIImageView *sheep;
@property int petCount;

@end
