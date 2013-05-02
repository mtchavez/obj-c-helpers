//
//  NSDate+Extensions.h
//  scoreboard
//
//  Created by Chavez on 8/10/10.
//  Copyright 2010 Chavez All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (extensions)
+(NSDate *)dateFromUTCString:(NSString *)utcString;
-(NSDate *)beginningOfWeek;
-(NSDate *)endOfWeek;
-(NSDate *)weeksFromDate:(NSInteger)weeks;
-(NSDate *)daysFromDate:(NSInteger)days;
-(NSString *)etDateStringFromUTCDate;
-(BOOL)inDateRangeStart:(NSDate *)startDate rangeEnd:(NSDate *)endDate;
@end
