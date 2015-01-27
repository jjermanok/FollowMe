//
//  MNKViewController.m
//  FollowMe
//
//  Created by Jake Jermanok on 6/13/14.
//  Copyright (c) 2014 Manok Inc. All rights reserved.
//

#import "MNKViewController.h"

@interface MNKViewController ()

@end

@implementation MNKViewController

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _seconds = 5;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countdown) userInfo:nil repeats:YES];
    _timerLabel.text = [NSString stringWithFormat:@"%i", _seconds];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)countdown
{
    _seconds--;
    _timerLabel.text = [NSString stringWithFormat:@"%i", _seconds];
    if (_seconds == 0) {
        [self performSegueWithIdentifier:@"timeUp" sender:self];
    }
}

- (IBAction)textExited:(id)sender
{
    UITextField *textField = (UITextField*)sender;
    if ([textField.text isEqual: @"YOLO"] || [textField.text isEqual: @"Yolo"] ||
        [textField.text isEqual: @"yolo"])
        [self performSegueWithIdentifier:@"segueAfterText" sender:self];
}

- (void)buttonsPushed
{
    if (button1off & button2off & button3off & button4off & button5off & button6off & button7off & button8off & button9off)
        [self performSegueWithIdentifier:@"segueAfterButtons" sender:self];
}

- (IBAction)button1Pushed:(id)sender
{
    _button1.hidden = TRUE;
    button1off = TRUE;
    [self buttonsPushed];
}

- (IBAction)button2Pushed:(id)sender
{
    _button2.hidden = TRUE;
    button2off = TRUE;
    [self buttonsPushed];
}

- (IBAction)button3Pushed:(id)sender
{
    _button3.hidden = TRUE;
    button3off = TRUE;
    [self buttonsPushed];
}

- (IBAction)button4Pushed:(id)sender
{
    _button4.hidden = TRUE;
    button4off = TRUE;
    [self buttonsPushed];
}

- (IBAction)button5Pushed:(id)sender
{
    _button5.hidden = TRUE;
    button5off = TRUE;
    [self buttonsPushed];
}

- (IBAction)button6Pushed:(id)sender
{
    _button6.hidden = TRUE;
    button6off = TRUE;
    [self buttonsPushed];
}

- (IBAction)button7Pushed:(id)sender
{
    _button7.hidden = TRUE;
    button7off = TRUE;
    [self buttonsPushed];
}

- (IBAction)button8Pushed:(id)sender
{
    _button8.hidden = TRUE;
    button8off = TRUE;
    [self buttonsPushed];
}

- (IBAction)button9Pushed:(id)sender
{
    _button9.hidden = TRUE;
    button9off = TRUE;
    [self buttonsPushed];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
