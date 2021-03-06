//
//  Exhibition.h
//  ExhibitionMagazineShelf
//
//  Created by 秦鑫 on 13-3-29.
//  Copyright (c) 2013年 TodaySybor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SqliteService.h"

@interface Exhibition : NSObject<NSURLConnectionDataDelegate>

//exhibition id(file name)
@property (nonatomic, copy)NSString *exhibitionID;
//exhibition title
@property (nonatomic, copy)NSString *title;
//exhibition sub title
@property (nonatomic, copy)NSString *subTitle;
//exhibition date 
@property (nonatomic, copy)NSString *date;
//exhibition cover net path 
@property (nonatomic, copy)NSString *coverURL;
//exhibition download net path
@property (nonatomic, copy)NSString *downloadURL;
//exhibition description
@property (nonatomic, copy)NSString *description;
//exhibition progress
@property (nonatomic, readonly) float downloadProgress;
//exhibition receive downloadData
@property (nonatomic, copy)NSMutableData *downloadData;
//progress expected length
@property (nonatomic, assign)NSInteger expectedLength;
//progress receive total number
@property (nonatomic, retain)NSNumber *expectedLengthNumber;
@property (nonatomic, retain)NSNumber *downloadDataLengthNumber;

//exhibition file local path
-(NSURL *)contentURL;
//exhibition downloaded return boolean read or open
-(BOOL)isExhibitionAvailibleForPlay;
-(NSString *)exhibitionImagePath;
-(NSString *)exhibitionFilePath;

-(void)sendEndOfDownloadNotification;
-(void)sendFailedDownloadNotification;

@end
