//
//  DateHelpers.h
//  
//
//  Created by Jared Sinclair 9/2/11.
//  Copyright (c) 2014 Jared Sinclair. All rights reserved.
//


#import <Foundation/Foundation.h>

NSInteger daysBetween(NSDate *fromDate, NSDate *toDate);
NSDate *setDateToMidnite(NSDate *aDate);
NSDate *setDatetoHourAndMinute(NSDate *theDate, NSInteger hour, NSInteger minute);
NSInteger dayOfTheWeekFromDate(NSDate *aDate);
NSInteger dayOfTheMonthFromDate(NSDate *aDate);
NSInteger currentMonth(void);
NSDate *shiftDateByXmonths(NSDate *aDate, NSInteger shift);
NSDate *shiftDateByXweeks(NSDate *aDate, NSInteger shift);
NSDate *shiftDateByXdays(NSDate *aDate, NSInteger shift);
NSDate *setDateToDayOfMonth(NSDate *theDate, NSInteger dayOfMonth);
