//
//  DateHelpers.h
//  pillboxie
//
//  Created by Jared on 9/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>

NSUInteger daysBetween(NSDate *fromDate, NSDate *toDate);
NSDate *setDateToMidnite(NSDate *aDate);
NSDate *setDatetoHourAndMinute(NSDate *theDate, int hour, int minute);
int dayOfTheWeekFromDate(NSDate *aDate);
int dayOfTheMonthFromDate(NSDate *aDate);
int currentMonth(void);
NSDate *shiftDateByXmonths(NSDate *aDate, int shift);
NSDate *shiftDateByXweeks(NSDate *aDate, int shift);
NSDate *shiftDateByXdays(NSDate *aDate, int shift);
NSDate *setDateToDayOfMonth(NSDate *theDate, int dayOfMonth);
