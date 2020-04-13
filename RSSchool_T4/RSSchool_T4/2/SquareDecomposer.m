#import "SquareDecomposer.h"

@implementation SquareDecomposer

NSMutableArray * RecurFinder(int total, NSMutableArray * current) {
    int sum = calcProduct(current);
    if (sum > total) {
        return nil;
    } else if (sum == total) {
        return current;
    } else {
        int newInt = MIN((int)sqrt(total - sum), [current.lastObject intValue] - 1);
        NSMutableArray * newArr = nil;
        while (newInt > 0) {
            newArr = [current mutableCopy];
            NSNumber * newVal = [[NSNumber alloc] initWithInt:newInt];
            [newArr addObject:newVal];
            newArr = RecurFinder(total, newArr);
            if (newArr != nil){
                return newArr;
            }
            newInt--;
        }
        return nil;
    }
}

int calcProduct(NSMutableArray * curArr) {
    int res = 0;
    for (int i = 0; i < curArr.count; i++) {
        res = res + [curArr[i] intValue] * [curArr[i] intValue];
    }
    return res;
}

- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
    int val = [number intValue];
    if (val < 0) {
        return nil;
    }
    NSMutableArray * resultArr = nil;
    int startVal = val - 1;
    while (startVal > 0) {
        resultArr = RecurFinder(val * val, [[NSMutableArray alloc] initWithObjects: [[NSNumber alloc] initWithInt:startVal], nil]);
        if (resultArr != nil){
            break;
        }
        startVal--;
    }
    NSArray *sorted = [resultArr sortedArrayUsingComparator:^(id a, id b) {
        if ([a intValue] < [b intValue]) {
            return NSOrderedAscending;
        } else if ([b intValue] < [a intValue]) {
            return NSOrderedDescending;
        } else {
            return NSOrderedSame;
        }
    }];
    return sorted;
}

@end
