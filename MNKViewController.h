//
//  MNKViewController.h
//  FollowMe
//
//  Created by Jake Jermanok on 6/13/14.
//  Copyright (c) 2014 Manok Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MNKViewController : UIViewController {
    BOOL button1off;
    BOOL button2off;
    BOOL button3off;
    BOOL button4off;
    BOOL button5off;
    BOOL button6off;
    BOOL button7off;
    BOOL button8off;
    BOOL button9off;
}

@property int seconds;
@property (strong, nonatomic) IBOutlet UILabel *timerLabel;
- (IBAction)textExited:(id)sender;
- (IBAction)button1Pushed:(id)sender;
- (IBAction)button2Pushed:(id)sender;
- (IBAction)button3Pushed:(id)sender;
- (IBAction)button4Pushed:(id)sender;
- (IBAction)button5Pushed:(id)sender;
- (IBAction)button6Pushed:(id)sender;
- (IBAction)button7Pushed:(id)sender;
- (IBAction)button8Pushed:(id)sender;
- (IBAction)button9Pushed:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIButton *button2;
@property (strong, nonatomic) IBOutlet UIButton *button3;
@property (strong, nonatomic) IBOutlet UIButton *button4;
@property (strong, nonatomic) IBOutlet UIButton *button5;
@property (strong, nonatomic) IBOutlet UIButton *button6;
@property (strong, nonatomic) IBOutlet UIButton *button7;
@property (strong, nonatomic) IBOutlet UIButton *button8;
@property (strong, nonatomic) IBOutlet UIButton *button9;

@end
