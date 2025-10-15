#import <ObjFW/ObjFW.h>

OF_ASSUME_NONNULL_BEGIN
OF_DIRECT_MEMBERS
OF_SUBCLASSING_RESTRICTED

@interface OJLogger : OFObject

+ (instancetype)loggerWithComponentName:(OFString *)componentName;

- (instancetype)init OF_UNAVAILABLE;
- (instancetype)initWithComponentName:(OFString *)componentName OF_DESIGNATED_INITIALIZER;

- (void)log:(id<OFJSONRepresentation>)message;

@end

OF_ASSUME_NONNULL_END
