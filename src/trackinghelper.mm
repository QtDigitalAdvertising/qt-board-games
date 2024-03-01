#include "trackinghelper.h"

#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import <UIKit/UIKit.h>

@interface _Track : NSObject
@end

@implementation _Track {}

- (id)init
{
    self = [super init];
    if (self) {
        self = [super init];
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                    selector:@selector(_request)
                                                    name:UIApplicationDidBecomeActiveNotification
                                                    object:nil];
    }
    return self;
}
- (void) _request {
    [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {}];
}

@end

void TrackingHelper::requestConsent()
{
    _Track* example = [[_Track alloc] init];
}
