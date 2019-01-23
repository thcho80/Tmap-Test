//
//  FirstViewController.m
//  TMap-Test
//
//  Created by human on 2019. 1. 23..
//  Copyright © 2019년 com.humantrion. All rights reserved.
//

#import "FirstViewController.h"
#import "TMapView.h"

// TMAP_APPKEY
#define TMAP_APPKEY @"3cc870be-6ac7-40d5-9ccd-167433cb53d1"

@interface FirstViewController () <TMapViewDelegate, TMapGpsManagerDelegate>

@property (weak, nonatomic) IBOutlet UIView *mapContainerView;

@end

@implementation FirstViewController {
    TMapView* _mapView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createMapView];
    
    
}

- (void)createMapView {
    _mapView = [[TMapView alloc] initWithFrame:self.mapContainerView.bounds];
    [_mapView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [_mapView setDelegate:self];
    [_mapView setGpsManagersDelegate:self];
    [_mapView setSKTMapApiKey:TMAP_APPKEY];
    [self.mapContainerView addSubview:_mapView];
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

@end
