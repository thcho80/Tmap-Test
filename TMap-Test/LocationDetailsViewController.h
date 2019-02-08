//
//  LocationDetailsViewController.h
//  TMap-Test
//
//  Created by human on 2019. 2. 8..
//  Copyright © 2019년 com.humantrion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LocationDetailsViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

-(IBAction)done;
-(IBAction)cancel;

@end

NS_ASSUME_NONNULL_END
