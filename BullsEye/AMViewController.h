//
//  AMViewController.h
//  BullsEye
//
//  Created by Amit Maor on 9/5/14.
//  Copyright (c) 2014 Amit Maor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMViewController : UIViewController <UIAlertViewDelegate>

- (IBAction)showAlert;

- (IBAction)sliderMoved:(UISlider *)slider;

- (IBAction)startOver;

@property (nonatomic, weak) IBOutlet UISlider *slider;
@property (nonatomic, weak) IBOutlet UILabel *targetLabel;
@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;
@property (nonatomic, weak) IBOutlet UILabel *roundLabel;

@end
