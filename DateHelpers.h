//
//  DateHelpers.h
//  pillboxie
//
//  Created by Jared on 9/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

// NOTE: GREGORIAN CALENDAR SUPPORT ONLY

#import <UIKit/UIKit.h>

// Calculate the number of days (the number of "midnights") between two dates.
NSUInteger daysBetween(NSDate *fromDate, NSDate *toDate);

// Set the date to 0:0:0:0000
NSDate *setDateToMidnite(NSDate *aDate);

// Set the date to hour:minute:0:0000
NSDate *setDatetoHourAndMinute(NSDate *theDate, int hour, int minute);

// Integer of the day of the week
int dayOfTheWeekFromDate(NSDate *aDate);

// Integer of the day of the month
int dayOfTheMonthFromDate(NSDate *aDate);

// Integer of the current month
int currentMonth(void);

// Shifts the month of the date by the specified number of months. Adding a 2 months to December 15 1989, for example, will return February 15 1990
NSDate *shiftDateByXmonths(NSDate *aDate, int shift);

// Same as shiftDatebyXmonths, but with weeks.
NSDate *shiftDateByXweeks(NSDate *aDate, int shift);

// Same as shiftDatebyXmonths, but with days.
NSDate *shiftDateByXdays(NSDate *aDate, int shift);

// Sets the given date to the specified day of the month in which theDate falls. 
// If outside the bounds of the days for that month, dayOfMonth is set to either the first or last day, whichever is appropriate.
NSDate *setDateToDayOfMonth(NSDate *theDate, int dayOfMonth);
