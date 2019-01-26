#import "MSIdentityAuthority.h"

@implementation MSIdentityAuthority

static NSString *const kMSType = @"type";

static NSString *const kMSDefault = @"default";

static NSString *const kMSAuthorityUrl = @"authority_url";

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
  if (!dictionary) {
    return nil;
  }
  if ((self = [super init])) {
    if (dictionary[kMSType]) {
      self.type = (NSString * _Nonnull) dictionary[kMSType];
    }
    if (dictionary[kMSDefault]) {

      // TODO: Revisit here and find simpler way to parse BOOL value.
      self.defaultAuthority = [(NSObject *)dictionary[kMSDefault] isEqual:@YES] ? YES : NO;
    }
    if (dictionary[kMSAuthorityUrl]) {
      if (![(NSObject *)dictionary[kMSAuthorityUrl] isKindOfClass:[NSNull class]]) {
        NSString *_Nonnull authorityUrl = (NSString * _Nonnull) dictionary[kMSAuthorityUrl];
        self.authorityUrl = (NSURL * _Nonnull)[NSURL URLWithString:authorityUrl];
      }
    }
  }
  return self;
}

- (BOOL)isValid {
  return self.type && self.defaultAuthority && self.authorityUrl;
}

@end
