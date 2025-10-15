#import <ObjFW/ObjFW.h>
#import "Application.h"
#import "OJLogger.h"

@interface Application ()

@property (nonatomic, strong, readonly) OJLogger *logger;
@property (nonatomic, strong, readonly) OFTimer *timer;

@end

@implementation Application

//

@end

@implementation Application (OFApplicationDelegate)

- (void)applicationDidFinishLaunching:(OFNotification *)notification {
  _logger = [OJLogger loggerWithComponentName:self.className];

  _timer = [OFTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(OFTimer *timer) {
    [_logger log:@"Timer fired"];
  }];
}

@end
