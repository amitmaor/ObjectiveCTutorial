//
//  AMViewController.m
//  BullsEye
//
//  Created by Amit Maor on 9/5/14.
//  Copyright (c) 2014 Amit Maor. All rights reserved.
//

#import "AMViewController.h"

@interface AMViewController ()

@end

@implementation AMViewController
{
    int _currentValue;
    int _targetValue;
    int _score;
    int _round;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startNewGame];
    [self updateLabels];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)startNewRound
{
    _round += 1;
    _targetValue = 1 + arc4random_uniform(100);
    _currentValue = 50;
    self.slider.value = _currentValue;
}

- (void)startNewGame {
    _score = 0;
    _round = 0;
    [self startNewRound];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateLabels
{
    self.targetLabel.text = [NSString stringWithFormat:@"%d",
                             _targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d",
                            _score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d",
                            _round];
}

- (IBAction)showAlert
{
    int difference = abs(_targetValue - _currentValue);
    int points = 100 - difference;
    _score += points;
    
    NSString *title;
    if (difference == 0) {
        title = @"Perfect!";
    } else if (difference < 5) {
        title = @"You almost had it!";
    } else if (difference < 10) {
        title = @"Pretty good!";
    } else {
        title = @"Not even close...";
    }
    
    NSString *message = [NSString stringWithFormat:@"You scored %d points", points];
    
    UIAlertView *alertView = [[UIAlertView alloc]
      initWithTitle: title
      message:message
      delegate:self
      cancelButtonTitle:@"OK"
      otherButtonTitles:nil];
    
    [alertView show];
    
}

- (IBAction)startOver
{
    [self startNewGame];
    [self updateLabels];
}

- (IBAction)sliderMoved:(UISlider *)slider
{
    _currentValue = lroundf(slider.value);
}

- (void)alertView:(UIAlertView *)alertView
                                    didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self startNewRound];
    [self updateLabels];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
