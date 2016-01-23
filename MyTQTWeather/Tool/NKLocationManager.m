//
//  NKLocationManager.m
//  WeatherForecast
//
//  Created by 陆金龙 on 16/1/18.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import "NKLocationManager.h"
#import <MapKit/MapKit.h>

@interface NKLocationManager () <CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *manager;

@property (nonatomic, copy) void(^save)(double lat, double lon, NSString *locName);
@end


@implementation NKLocationManager
- (instancetype)init {
    if (self = [super init]) {
        self.manager = [CLLocationManager new];
        
        [self.manager requestWhenInUseAuthorization];
        self.manager.delegate = self;
    }
    return  self;
}

+ (instancetype)sharedLocationManager {
    static NKLocationManager *locationManager = nil;
    if (!locationManager) {
        locationManager = [NKLocationManager new];

    }
    return locationManager;
}

+ (void)getUserLocation:(void (^)(double, double, NSString *))location {
    [[self sharedLocationManager] getUserLocation:location];
}

- (void)getUserLocation:(void (^)(double, double, NSString *))location {
    if (![CLLocationManager locationServicesEnabled]) {
        //告诉用户无法定位
        return;
    }
    self.save = [location copy];
    [self.manager startUpdatingLocation];

}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    [self.manager stopUpdatingLocation];

    CLLocation *location = locations.lastObject;

    CLGeocoder *coder = [[CLGeocoder alloc] init];
    [coder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        CLPlacemark *placemark = placemarks.lastObject;
//        NSLog(@"%@",placemark.addressDictionary);
        NSString *oriCityName = placemark.addressDictionary[@"City"];
        NSString *cityName = [oriCityName substringToIndex:oriCityName.length - 1];
        self.save(location.coordinate.latitude, location.coordinate.longitude, cityName);
    }];




}

@end
