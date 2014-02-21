//
//  DateHelpers.m
//  
//
//  Created by Jared Sinclair 9/2/11.
//  Copyright (c) 2014 Jared Sinclair. All rights reserved.
//


#include "DateHelpers.h"

static inline NSCalendar * cachedCalendar() {
    static dispatch_once_t once;
    static NSCalendar * cachedCalendar;
    dispatch_once(&once, ^ {
        cachedCalendar = [NSCalendar currentCalendar];
    });
    return cachedCalendar;
};

NSInteger daysBetween(NSDate *fromDate, NSDate *toDate) {
    
    fromDate = setDateToMidnite(fromDate);
    toDate = setDateToMidnite(toDate);
    
    NSCalendar *calendar = cachedCalendar();

    NSInteger startDay = [calendar ordinalityOfUnit:NSDayCalendarUnit
                                       inUnit: NSEraCalendarUnit forDate:fromDate];
    NSInteger endDay = [calendar ordinalityOfUnit:NSDayCalendarUnit
                                     inUnit: NSEraCalendarUnit forDate:toDate];
    return endDay - startDay;
}


NSDate *setDateToMidnite(NSDate *aDate) {
    
    NSCalendar *calendar = cachedCalendar();
    
    NSDateComponents *dateComps = [calendar components:(NSYearCalendarUnit |
                                                        NSMonthCalendarUnit |
                                                        NSDayCalendarUnit |
                                                        NSHourCalendarUnit | 
                                                        NSSecondCalendarUnit |
                                                        NSMinuteCalendarUnit) fromDate:aDate];
    
    [dateComps setHour:0];
    [dateComps setMinute:0];
    [dateComps setSecond:0];
    
    NSDate *midniteDate = [calendar dateFromComponents:dateComps];
    
    return midniteDate;
}


NSDate *setDatetoHourAndMinute(NSDate *theDate, NSInteger hour, NSInteger minute) {
    
    NSCalendar *calendar = cachedCalendar();
    
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


NSInteger dayOfTheWeekFromDate(NSDate *aDate) {
    
    NSCalendar *calendar = cachedCalendar();
    
    NSDateComponents *dateComps = [calendar components:(NSWeekdayCalendarUnit) fromDate:aDate];
    
    return [dateComps weekday];
}


NSInteger dayOfTheMonthFromDate(NSDate *aDate) {
    
    NSCalendar *calendar = cachedCalendar();
    
    NSDateComponents *dateComps = [calendar components:(NSDayCalendarUnit) fromDate:aDate];
    
    return [dateComps day];
}

NSInteger currentMonth(void) {
    
    NSCalendar *calendar = cachedCalendar();
    
    NSDateComponents *dateComps = [calendar components:(NSMonthCalendarUnit) fromDate:[NSDate date]];
    
    return [dateComps month];
}

NSDate *shiftDateByXmonths(NSDate *aDate, NSInteger shift) {
    
    NSCalendar *calendar = cachedCalendar();
    NSDateComponents *dateComps = [[NSDateComponents alloc] init];
    [dateComps setMonth:shift];
    NSDate *processedDate = [calendar dateByAddingComponents:dateComps toDate:aDate options:0];
    return processedDate;
}

NSDate *shiftDateByXweeks(NSDate *aDate, NSInteger shift) {
    
    NSCalendar *calendar = cachedCalendar();
    NSDateComponents *dateComps = [[NSDateComponents alloc] init];
    [dateComps setWeek:shift];
    NSDate *processedDate = [calendar dateByAddingComponents:dateComps toDate:aDate options:0];
    return processedDate;
}

NSDate *shiftDateByXdays(NSDate *aDate, NSInteger shift) {
    
    NSCalendar *calendar = cachedCalendar();
    NSDateComponents *dateComps = [[NSDateComponents alloc] init];
    [dateComps setDay:shift];
    NSDate *processedDate = [calendar dateByAddingComponents:dateComps toDate:aDate options:0];
    return processedDate;
}

NSDate *setDateToDayOfMonth(NSDate *theDate, NSInteger dayOfMonth) {
    
    NSCalendar *calendar = cachedCalendar();

    NSDateComponents *dateComps = [calendar components:(NSYearCalendarUnit |
                                                        NSMonthCalendarUnit |
                                                        NSDayCalendarUnit |
                                                        NSHourCalendarUnit | 
                                                        NSSecondCalendarUnit |
                                                        NSMinuteCalendarUnit) fromDate:theDate];
    
    NSRange days = [calendar rangeOfUnit:NSDayCalendarUnit 
                                   inUnit:NSMonthCalendarUnit 
                                  forDate:[calendar dateFromComponents:dateComps]];
    NSInteger lastDay = days.length;
    
    if (dayOfMonth > lastDay)
        dayOfMonth = lastDay;
    
    [dateComps setDay:dayOfMonth];
    [dateComps setSecond:0];
    
    NSDate *processedDate = [calendar dateFromComponents:dateComps];
    
    return processedDate;
    
}





