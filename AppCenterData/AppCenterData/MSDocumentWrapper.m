// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

#import "MSDataError.h"
#import "MSData.h"
#import "MSDataErrors.h"
#import "MSDataInternal.h"
#import "MSDocumentWrapperInternal.h"
#import "MSLoggerInternal.h"
#import "MSSerializableObject.h"

@implementation MSDocumentWrapper

- (instancetype)initWithDeserializedValue:(id<MSSerializableDocument>)deserializedValue
                                jsonValue:(NSString *)jsonValue
                                partition:(NSString *)partition
                               documentId:(NSString *)documentId
                                     eTag:(NSString *)eTag
                          lastUpdatedDate:(NSDate *)lastUpdatedDate
                         pendingOperation:(nullable NSString *)pendingOperation
                                    error:(MSDataError *)error
                          fromDeviceCache:(BOOL)fromDeviceCache {
  if ((self = [super init])) {
    _deserializedValue = deserializedValue;
    _jsonValue = jsonValue;
    _partition = partition;
    _documentId = documentId;
    _eTag = eTag;
    _lastUpdatedDate = lastUpdatedDate;
    _error = error;
    _pendingOperation = pendingOperation;
    _fromDeviceCache = fromDeviceCache;
  }
  return self;
}

- (instancetype)initWithError:(NSError *)error documentId:(NSString *)documentId {
  if ((self = [super init])) {
    _documentId = documentId;
    _error = [[MSDataError alloc] initWithError:error];
  }
  return self;
}

- (instancetype)initWithErrorCode:(NSInteger)errorCode errorMessage:(NSString *)errorMessage documentId:(NSString *)documentId {
  return [self initWithError:[[NSError alloc] initWithDomain:kMSACDataErrorDomain
                                                        code:errorCode
                                                    userInfo:@{NSLocalizedDescriptionKey : errorMessage}]
                  documentId:documentId];
}

@end
