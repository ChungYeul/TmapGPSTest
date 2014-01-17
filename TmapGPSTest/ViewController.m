//
//  ViewController.m
//  TmapGPSTest
//
//  Created by SDT-1 on 2014. 1. 17..
//  Copyright (c) 2014년 T. All rights reserved.
//

#import "ViewController.h"
#import "TMapView.h"
#define TOOLBAR_HEIGHT 64

@interface ViewController ()<TMapGpsManagerDelegate>
@property (strong, nonatomic) TMapView *mapView;
@property (strong, nonatomic) TMapGpsManager *gpsManager;
@end

@implementation ViewController
//
- (void)locationChanged:(TMapPoint *)newTmp {
    NSLog(@"Location Changed : %@", newTmp);
    [self.mapView setCenterPoint:newTmp];
}
//
- (void)headingChanged:(double)heading {
    
}
- (IBAction)switchGPS:(id)sender {
    UISwitch *_switch = (UISwitch *)sender;
    
    if (YES == _switch.on) {
        [self.gpsManager openGps];
    }
    else {
        [self.gpsManager closeGps];
    }
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //
    CGRect rect = CGRectMake(0, TOOLBAR_HEIGHT, self.view.frame.size.width, self.view.frame.size.height - TOOLBAR_HEIGHT);
    self.mapView = [[TMapView alloc] initWithFrame:rect];
    [self.mapView setSKPMapApiKey:@"82add192-7843-36bc-b1fd-175e2c70faad"];
    self.mapView.zoomLevel = 12.0f;
    [self.view addSubview:self.mapView];
    
    self.gpsManager = [[TMapGpsManager alloc] init];
    [self.gpsManager setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
