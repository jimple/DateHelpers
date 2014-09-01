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

#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_1
    NSInteger startDay = [calendar ordinalityOfUnit:NSCalendarUnitDay
                                       inUnit: NSCalendarUnitEra forDate:fromDate];
    NSInteger endDay = [calendar ordinalityOfUnit:NSCalendarUnitDay
                                     inUnit: NSCalendarUnitEra forDate:toDate];
#else
    NSInteger startDay = [calendar ordinalityOfUnit:NSDayCalendarUnit
                                             inUnit: NSEraCalendarUnit forDate:fromDate];
    NSInteger endDay = [calendar ordinalityOfUnit:NSDayCalendarUnit
                                           inUnit: NSEraCalendarUnit forDate:toDate];
#endif
    return endDay - startDay;
}


NSDate *setDateToMidnite(NSDate *aDate) {
    
    NSCalendar *calendar = cachedCalendar();
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_1
    NSDateComponents *dateComps = [calendar components:(NSCalendarUnitYear |
                                                        NSCalendarUnitMonth |
                                                        NSCalendarUnitDay |
                                                        NSCalendarUnitHour |
                                                        NSCalendarUnitMinute |
                                                        NSCalendarUnitSecond) fromDate:aDate];
#else
    NSDateComponents *dateComps = [calendar components:(NSYearCalendarUnit |
                                                        NSMonthCalendarUnit |
                                                        NSDayCalendarUnit |
                                                        NSHourCalendarUnit |
                                                        NSSecondCalendarUnit |
                                                        NSMinuteCalendarUnit) fromDate:aDate];
#endif
    
    [dateComps setHour:0];
    [dateComps setMinute:0];
    [dateComps setSecond:0];
    
    NSDate *midniteDate = [calendar dateFromComponents:dateComps];
    
    return midniteDate;
}


NSDate *setDatetoHourAndMinute(NSDate *theDate, NSInteger hour, NSInteger minute) {
    
    NSCalendar *calendar = cachedCalendar();
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_1
    NSDateComponents *dateComps = [calendar components:(NSCalendarUnitYear |
                                                        NSCalendarUnitMonth |
                                                        NSCalendarUnitDay |
                                                        NSCalendarUnitHour |
                                                        NSCalendarUnitMinute |
                                                        NSCalendarUnitSecond) fromDate:theDate];
#else
    NSDateComponents *dateComps = [calendar components:(NSYearCalendarUnit |
                                                        NSMonthCalendarUnit |
                                                        NSDayCalendarUnit |
                                                        NSHourCalendarUnit |
                                                        NSSecondCalendarUnit |
                                                        NSMinuteCalendarUnit) fromDate:theDate];
#endif
    
    [dateComps setHour:hour];
    [dateComps setMinute:minute];
    [dateComps setSecond:0];
    
    NSDate *processedDate = [calendar dateFromComponents:dateComps];
    
    return processedDate;
}


NSInteger dayOfTheWeekFromDate(NSDate *aDate) {
    
    NSCalendar *calendar = cachedCalendar();

#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_1
    NSDateComponents *dateComps = [calendar components:(NSCalendarUnitWeekday) fromDate:aDate];
#else
    NSDateComponents *dateComps = [calendar components:(NSWeekdayCalendarUnit) fromDate:aDate];
#endif
    
    return [dateComps weekday];
}


NSInteger dayOfTheMonthFromDate(NSDate *aDate) {
    
    NSCalendar *calendar = cachedCalendar();
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_1
    NSDateComponents *dateComps = [calendar components:(NSCalendarUnitDay) fromDate:aDate];
#else
    NSDateComponents *dateComps = [calendar components:(NSDayCalendarUnit) fromDate:aDate];
#endif
    
    return [dateComps day];
}

NSInteger currentMonth(void) {
    
    NSCalendar *calendar = cachedCalendar();
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_1
    NSDateComponents *dateComps = [calendar components:(NSCalendarUnitMonth) fromDate:[NSDate date]];
#else
    NSDateComponents *dateComps = [calendar components:(NSMonthCalendarUnit) fromDate:[NSDate date]];
#endif
    
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
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_1
    [dateComps setWeekOfYear:shift];
#else
    [dateComps setWeek:shift];
#endif
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

#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_1
    NSDateComponents *dateComps = [calendar components:(NSCalendarUnitYear |
                                                        NSCalendarUnitMonth |
                                                        NSCalendarUnitDay |
                                                        NSCalendarUnitHour |
                                                        NSCalendarUnitMinute |
                                                        NSCalendarUnitSecond) fromDate:theDate];
    NSRange days = [calendar rangeOfUnit:NSCalendarUnitDay
                                  inUnit:NSCalendarUnitMonth
                                 forDate:[calendar dateFromComponents:dateComps]];
#else
    NSDateComponents *dateComps = [calendar components:(NSYearCalendarUnit |
                                                        NSMonthCalendarUnit |
                                                        NSDayCalendarUnit |
                                                        NSHourCalendarUnit |
                                                        NSSecondCalendarUnit |
                                                        NSMinuteCalendarUnit) fromDate:theDate];
    NSRange days = [calendar rangeOfUnit:NSDayCalendarUnit
                                  inUnit:NSMonthCalendarUnit
                                 forDate:[calendar dateFromComponents:dateComps]];
#endif
    
    NSInteger lastDay = days.length;
    
    if (dayOfMonth > lastDay)
        dayOfMonth = lastDay;
    
    [dateComps setDay:dayOfMonth];
    [dateComps setSecond:0];
    
    NSDate *processedDate = [calendar dateFromComponents:dateComps];
    
    return processedDate;
    
}





