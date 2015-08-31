//
//  MNKAccelViewController.h
//  followme
//
//  Created by Jake Jermanok on 6/16/14.
//  Copyright (c) 2014 Manok Inc. All rights reserved.
//



//Not Currently Used


#import "MNKViewController.h"

@interface MNKAccelViewController : MNKViewController <UIAccelerometerDelegate> {
    float valuex;
    float valuey;
}

@property (nonatomic) IBOutlet UIImageView *ball;

@end
