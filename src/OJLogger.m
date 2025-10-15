#import <ObjFW/ObjFW.h>
#import "OJLogger.h"

@implementation OJLogger {
  OFString *_componentName;
  OFString *_programName;
}

+ (instancetype)loggerWithComponentName:(OFString *)componentName {
  return [[self alloc] initWithComponentName:componentName];
}

- (instancetype)initWithComponentName:(OFString *)componentName {
  self = [super init];

  _componentName = [componentName copy];
#ifdef OF_HAVE_FILES
	_programName = [[OFApplication programName].lastPathComponent copy];
#else
	_programName = [[OFApplication programName] copy];
#endif

  return self;
}

- (void)log:(id<OFJSONRepresentation>)message {
  OFDate *date = [OFDate date];
  OFNumber *timestamp = @((size_t)round(date.timeIntervalSince1970 * 1000000));
	OFString *formattedDate =
    [date localDateStringWithFormat: @"%Y-%m-%d %H:%M:%S"];

  OFDictionary<OFString *, id<OFJSONRepresentation>> *logData = @{
    @"timestamp": timestamp,
    @"date": formattedDate,
    @"component": _componentName,
    @"message": message,
  };

  [OFStdOut writeLine:logData.JSONRepresentation];
}

@end
