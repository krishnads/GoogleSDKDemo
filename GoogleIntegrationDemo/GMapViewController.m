//
//  GMapViewController.m
//  GoogleIntegrationDemo
//
//  Created by Krishana on 12/29/15.
//  Copyright © 2015 Konstant Info Solutions Pvt. Ltd. All rights reserved.
//

#import "GMapViewController.h"
@import GoogleMaps;

@interface GMapViewController ()

@end

@implementation GMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self showBasicMapView];
//    [self showCameraViewMap];
//    [self showStreetView];
//    [self showPolylineonMapView];
    //[self showIndoorViewMap];
}

#pragma mark - show basic map
-(void) showBasicMapView
{
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:26.912434
                                                            longitude:75.787271
                                                                 zoom:9];
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = camera.target;
    marker.title = @"My Location";
    marker.snippet = @"Current Location";
    marker.appearAnimation = kGMSMarkerAnimationPop;
    //marker.icon = [UIImage imageNamed:@"kipl.png"];
    marker.map = mapView;
    mapView.mapType = kGMSTypeTerrain;
    self.view = mapView;

}

#pragma mark - FOR STREET VIEW

-(void) showStreetView
{
    //FOR STREET VIEW
    CLLocationCoordinate2D panoramaNear = {
        26.912434,
        75.787271
    };
    
    GMSPanoramaView *panoView = [GMSPanoramaView panoramaWithFrame:CGRectZero nearCoordinate:panoramaNear];
    self.view = panoView;
}


#pragma mark -  FOR POLYLINE

-(void) showPolylineonMapView
{
    //FOR POLYLINE
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:0
                                                                longitude:-165
                                                                     zoom:2];
        GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    
        GMSMutablePath *path = [GMSMutablePath path];
        [path addLatitude:-33.866 longitude:151.195]; // Sydney
        [path addLatitude:-18.142 longitude:178.431]; // Fiji
        [path addLatitude:21.291 longitude:-157.821]; // Hawaii
        [path addLatitude:37.423 longitude:-122.091]; // Mountain View
    
        GMSPolyline *polyline = [GMSPolyline polylineWithPath:path];
        polyline.strokeColor = [UIColor blueColor];
        polyline.strokeWidth = 5.f;
        polyline.map = mapView;
        self.view = mapView;
}

#pragma mark -  FOR CAMERA VIEW

-(void) showCameraViewMap
{
    //FOR CAMERA VIEW
    GMSCameraPosition *camera =
    [GMSCameraPosition cameraWithLatitude:26.912434
                                longitude:75.787271
                                     zoom:17.5
                                  bearing:30
                             viewingAngle:40];
    
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    self.view = mapView;
}

#pragma mark -  FOR Indoor VIEW

-(void) showIndoorViewMap
{
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:26.912434
                                                            longitude:75.787271
                                                                 zoom:18];
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    self.view = mapView;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
