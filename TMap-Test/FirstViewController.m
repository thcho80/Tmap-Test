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

@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UIView *mapContainerView;

@end

@implementation FirstViewController {
    TMapView* _mapView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mapView = [[TMapView alloc] initWithFrame:self.mapContainerView.bounds];
    
    [_mapView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [_mapView setDelegate:self];
    [_mapView setGpsManagersDelegate:self];
    [_mapView setSKTMapApiKey:TMAP_APPKEY];
    [self.mapContainerView addSubview:_mapView];
}


@end
