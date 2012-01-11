//
//  DateHelpers.m
//  pillboxie
//
//  Created by Jared on 9/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//


#include "DateHelpers.h"


NSUInteger daysBetween(NSDate *fromDate, NSDate *toDate) {
    
    NSCalendar *calendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];

    NSInteger startDay = [calendar ordinalityOfUnit:NSDayCalendarUnit
                                       inUnit: NSEraCalendarUnit forDate:fromDate];
    NSInteger endDay = [calendar ordinalityOfUnit:NSDayCalendarUnit
                                     inUnit: NSEraCalendarUnit forDate:toDate];
    return endDay - startDay;
}


NSDate *setDateToMidnite(NSDate *aDate) {
    
    NSCalendar *calendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    
    NSDateComponents *dateComps = [calendar components:(NSYearCalendarUnit |
                                                        NSMonthCalendarUnit |
                                                        NSDayCalendarUnit |
                                                        NSHourCalendarUnit | 
                                                        NSSecondCalendarUnit |
                                                        NSMinuteCalendarUnit) fromDate:aDate];
    
    [dateComps setHour:1];
    [dateComps setMinute:1];
    [dateComps setSecond:0];
    
    NSDate *midniteDate = [calendar dateFromComponents:dateComps];
    
    return midniteDate;
}


NSDate *setDatetoHourAndMinute(NSDate *theDate, int hour, int minute) {
    
    NSCalendar *calendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    
    NSDateComponents *dateComps = [calendar components:(NSYearCalendarUnit |
                                                        NSMonthCalendarUnit |
                                                        NSDayCalendarUnit |
                                                        NSHourCalendarUnit | 
                                                        NSSecondCalendarUnit |
                                                        NSMinuteCalendarUnit) fromDate:theDate];
    
    [dateComps setHour:hour];
    [dateComps setMinute:minute];
    [dateComps setSecond:0];
    
    NSDate *processedDate = [calendar dateFromComponents:dateComps];
    
    return processedDate;
}


int dayOfTheWeekFromDate(NSDate *aDate) {
    
    NSCalendar *calendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    
    NSDateComponents *dateComps = [calendar components:(NSWeekdayCalendarUnit) fromDate:aDate];
    
    return [dateComps weekday];
}


int dayOfTheMonthFromDate(NSDate *aDate) {
    
    NSCalendar *calendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    
    NSDateComponents *dateComps = [calendar components:(NSDayCalendarUnit) fromDate:aDate];
    
    return [dateComps day];
}

int currentMonth(void) {
    
    NSCalendar *calendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    
    NSDateComponents *dateComps = [calendar components:(NSMonthCalendarUnit) fromDate:[NSDate date]];
    
    return [dateComps month];
}

NSDate *shiftDateByXmonths(NSDate *aDate, int shift) {
    
    NSCalendar *calendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    NSDateComponents *dateComps = [[[NSDateComponents alloc] init] autorelease];
    [dateComps setMonth:shift];
    NSDate *processedDate = [calendar dateByAddingComponents:dateComps toDate:aDate options:0];
    return processedDate;
}

NSDate *shiftDateByXweeks(NSDate *aDate, int shift) {
    
    NSCalendar *calendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    NSDateComponents *dateComps = [[[NSDateComponents alloc] init] autorelease];
    [dateComps setWeek:shift];
    NSDate *processedDate = [calendar dateByAddingComponents:dateComps toDate:aDate options:0];
    return processedDate;
}

NSDate *shiftDateByXdays(NSDate *aDate, int shift) {
    
    NSCalendar *calendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    NSDateComponents *dateComps = [[[NSDateComponents alloc] init] autorelease];
    [dateComps setDay:shift];
    NSDate *processedDate = [calendar dateByAddingComponents:dateComps toDate:aDate options:0];
    return processedDate;
}

NSDate *setDateToDayOfMonth(NSDate *theDate, int dayOfMonth) {
    
    NSCalendar *calendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    
    NSDateComponents *dateComps = [calendar components:(NSYearCalendarUnit |
                                                        NSMonthCalendarUnit |
                                                        NSDayCalendarUnit |
                                                        NSHourCalendarUnit | 
                                                        NSSecondCalendarUnit |
                                                        NSMinuteCalendarUnit) fromDate:theDate];
    [dateComps setDay:dayOfMonth];
    [dateComps setSecond:0];
    
    NSDate *processedDate = [calendar dateFromComponents:dateComps];
    
    return processedDate;
    
}





