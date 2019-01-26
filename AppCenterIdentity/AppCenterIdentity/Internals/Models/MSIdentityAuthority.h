#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MSIdentityAuthority : NSObject

@property(nonatomic, copy) NSString *type;

@property(nonatomic) BOOL defaultAuthority;

@property(nonatomic, copy) NSURL *authorityUrl;

/**
 * Initialize an object from dictionary.
 *
 * @param dictionary A dictionary that contains key/value pairs.
 *
 * @return  A new instance.
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

/**
 * Checks if the object's values are valid.
 *
 * @return YES, if the object is valid.
 */
- (BOOL)isValid;

@end

NS_ASSUME_NONNULL_END
