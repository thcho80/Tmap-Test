//
//  FirstViewController.h
//  TMap-Test
//
//  Created by human on 2019. 1. 23..
//  Copyright © 2019년 com.humantrion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMapView.h"

@interface CurrentLocationViewController : UIViewController <TMapViewDelegate, TMapGpsManagerDelegate, TMapPathDelegate>

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UIButton *tagButton;
@property (weak, nonatomic) IBOutlet UIButton *getButton;

-(IBAction)getLocation;

@end

