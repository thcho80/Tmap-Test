//
//  FirstViewController.m
//  TMap-Test
//
//  Created by human on 2019. 1. 23..
//  Copyright © 2019년 com.humantrion. All rights reserved.
//

#import "CurrentLocationViewController.h"

// TMAP_APPKEY
#define TMAP_APPKEY @"3cc870be-6ac7-40d5-9ccd-167433cb53d1"

@interface CurrentLocationViewController ()

@property (weak, nonatomic) IBOutlet UIView *mapContainerView;

@end

@implementation CurrentLocationViewController {
    TMapGpsManager* _gps;
    TMapPathData* _path;
    TMapPoint* _location;
    NSString* _address;
    BOOL _lastGeocodingError;
}

- (IBAction)getLocation {
    //사용자가 위치서비스 활성화했는지 확인 후 팝업창 출력
    
    TMapPoint *currPosition = [_gps getLocation];
    
    _location = currPosition;
    NSLog(@"location: %@", _location);
    
    _address = [_path convertGpsToAddressAt:_location];
    _lastGeocodingError = [self isNilOrEmptyString:_address];
    
    [self updateLabel];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configureTMap];
    [self startGpsManager];
    [self startPathManager];
    [self updateLabel];
    
}

- (void)configureTMap {
    [TMapTapi setSKTMapAuthenticationWithDelegate:self apiKey:TMAP_APPKEY];
}

- (void)startGpsManager {
    if(_gps == nil){
        _gps = [[TMapGpsManager alloc] init];
    }
    [_gps setDelegate:self];
    [_gps openGps];
    
    _lastGeocodingError = false;
    _address = @"";
}

- (void)startPathManager {
    if(_path == nil){
        _path = [[TMapPathData alloc] init];
    }
    [_path setDelegate:self];
}

- (void)stopGpsManager {
    [_gps closeGps];
    _gps = nil;
}

- (void)updateLabel {    
    if(_location != nil){
        _latitudeLabel.text = [NSString stringWithFormat:@"%f", _location.getLatitude];
        _longitudeLabel.text = [NSString stringWithFormat:@"%f", _location.getLongitude];
        _tagButton.hidden = false;
        _messageLabel.text = @"";
    }else {
        _latitudeLabel.text = @"";
        _longitudeLabel.text = @"";
        _tagButton.hidden = true;
        _messageLabel.text = @"Tap 'Get My Location' to start";
    }
    
    if(_lastGeocodingError){
        _addressLabel.text = @"Error finding Location";
    }else {
        _addressLabel.text = _address;
    }
}

#pragma mark - TMapViewDelegate (TMapApiKey)
// setSKTMapApiKey: 성공시 발생하는 callback
- (void)SKTMapApikeySucceed
{
    NSLog(@"SKTMapApikeySucceed");
}

// setSKTMapApiKey: 실패시 발생하는 callback
- (void)SKTMapApikeyFailed:(NSError*)error
{
    NSLog(@"SKTMapApikeyFailed : %@", [error localizedDescription]);
}

#pragma mark - TMapViewDelegate
- (void)onClick:(TMapPoint *)TMP
{
    NSLog(@"onClick: %@", TMP);
}

#pragma mark - TMapGpsManagerDelegate
- (void)headingChanged:(double)heading {
    
}

- (void)locationChanged:(TMapPoint *)newTmp {
    
}

- (BOOL)isNilOrEmptyString:(NSString *)str{
    return !(str && str.length);
}

@end
