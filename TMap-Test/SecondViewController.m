//
//  SecondViewController.m
//  TMap-Test
//
//  Created by human on 2019. 1. 23..
//  Copyright © 2019년 com.humantrion. All rights reserved.
//

#import "SecondViewController.h"

// TMAP_APPKEY
#define TMAP_APPKEY @"3cc870be-6ac7-40d5-9ccd-167433cb53d1"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UIView *mapContainerView;

@end

@implementation SecondViewController
    TMapView*       _mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)createMapView {
    _mapView = [[TMapView alloc] initWithFrame:self.mapContainerView.bounds];
    [_mapView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [_mapView setDelegate:self];
//    [_mapView setGpsManagersDelegate:self];
    [_mapView setSKTMapApiKey:TMAP_APPKEY];     // 발급 받은 apiKey 설정
    [self.mapContainerView addSubview:_mapView];
    
}

@end
