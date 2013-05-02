//
//  NSDate+Extensions.m
//  scoreboard
//
//  Created by Chavez on 8/10/10.
//  Copyright 2010 Chavez. All rights reserved.
//

#import "NSDate+Extensions.h"


@implementation NSDate (extensions)

+(NSDate *)dateFromUTCString:(NSString *)utcString {
	NSString *dateFormat;
	NSRange textRange = [utcString rangeOfString:@"Z"];

	if(textRange.location != NSNotFound) {
		dateFormat = [NSString stringWithString:@"yyyy'-'MM'-'dd'T'HH:mm:ss'Z'"];
	}
	else {
		dateFormat = [NSString stringWithString:@"yyyy'-'MM'-'dd'T'HH:mm:ss'-'HH:mm"];
	}

    if(utcString != nil){
     	NSDateFormatter *dateFormatIn = [[[NSDateFormatter alloc] init] autorelease];
        [dateFormatIn setDateFormat:dateFormat];
        return [dateFormatIn dateFromString:utcString];
    }
    else {
        return self;
    }
}

- (NSString *)etDateStringFromUTCDate {
	NSTimeZone *usET = [NSTimeZone timeZoneWithName:@"America/New_York"];
	NSTimeInterval offset = [usET secondsFromGMTForDate:self];

	NSDate *offsetDate = [[[NSDate alloc] initWithTimeInterval:offset sinceDate:self] autorelease];

	NSDateFormatter *dateFormatOut = [[[NSDateFormatter alloc] init] autorelease];
	[dateFormatOut setDateStyle:NSDateFormatterMediumStyle];
	[dateFormatOut setTimeStyle:NSDateFormatterShortStyle];
	return [[dateFormatOut stringFromDate:offsetDate] stringByAppendingString:@" (ET)"];
}

-(NSDate *)beginningOfWeek {
	// largely borrowed from "Date and Time Programming Guide for Cocoa"
	// we'll use the default calendar and hope for the best
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDate *beginningOfWeek = nil;

	BOOL isBeginning = [calendar rangeOfUnit:NSWeekCalendarUnit startDate:&beginningOfWeek interval:NULL forDate:self];
	if (isBeginning)
		return beginningOfWeek;

	// couldn't calc via range, so try to grab Sunday, assuming gregorian style
	// Get the weekday component of the current date
	NSDateComponents *weekdayComponents = [calendar components:NSWeekdayCalendarUnit fromDate:self];

	/*
	 Create a date components to represent the number of days to subtract from the current date.
	 The weekday value for Sunday in the Gregorian calendar is 1, so subtract 1 from the number of days to subtract from the date in question.  (If today's Sunday, subtract 0 days.)
	 */
	NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
	[componentsToSubtract setDay: 0 - ([weekdayComponents weekday] - 1)];
	beginningOfWeek = nil;
	beginningOfWeek = [calendar dateByAddingComponents:componentsToSubtract toDate:self options:0];
	[componentsToSubtract release];

	//normalize to midnight, extract the year, month, and day components and create a new date from those components.
	NSDateComponents *components = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)
											   fromDate:beginningOfWeek];
	return [calendar dateFromComponents:components];
}

-(NSDate *)endOfWeek {
	NSCalendar *gregorianCal = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
	NSDateComponents *weekdayComponents = [gregorianCal components:NSWeekdayCalendarUnit fromDate:self];
	NSDateComponents *componentsToAdd = [[[NSDateComponents alloc] init] autorelease];
	[componentsToAdd setDay:(7 - [weekdayComponents weekday])];

	return [gregorianCal dateByAddingComponents:componentsToAdd toDate:self options:0];
}

-(NSDate *)weeksFromDate:(NSInteger)weeks {
	NSCalendar *gregorianCal = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
	NSDateComponents *componentsToSubtract = [[[NSDateComponents alloc] init] autorelease];
	[componentsToSubtract setDay: 0];
	[componentsToSubtract setWeek:weeks];

	return [gregorianCal dateByAddingComponents:componentsToSubtract toDate:self options:0];
}

-(NSDate *)daysFromDate:(NSInteger)days {
	NSCalendar *gregorianCal = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
	NSDateComponents *componentsToSubtract = [[[NSDateComponents alloc] init] autorelease];
	[componentsToSubtract setDay:days];

	return [gregorianCal dateByAddingComponents:componentsToSubtract toDate:self options:0];
}

-(BOOL)inDateRangeStart:(NSDate *)startDate rangeEnd:(NSDate *)endDate {
	if ([[self laterDate:startDate] isEqualToDate:self] &&
		[[self earlierDate:endDate] isEqualToDate:self])
	{
		return YES;
	}
	else
		return NO;
}

@end
