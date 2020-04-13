#import "ArrayCalculator.h"

@implementation ArrayCalculator

+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    NSMutableArray *digits = [array mutableCopy];
    int j = 0;
    while (j < digits.count){
        if ([digits[j] isKindOfClass: [NSNumber class]]){
            j++;
        } else {
            [digits removeObject: digits[j]];
        }
    }
    NSArray *sorted = [digits sortedArrayUsingComparator:^(id a, id b) {
        if (abs([a intValue]) < abs([b intValue])) {
            return NSOrderedDescending;
        } else if (abs([b intValue]) < abs([a intValue])) {
            return NSOrderedAscending;
        } else {
            return NSOrderedSame;
        }
    }];
    if (sorted.count == 0){
        return 0;
    }
    int product = 1;
    int minNegative = 0;
    int minPositive = 0;
    for (int i = 0; i < sorted.count; i++){
        int element = [sorted[i] intValue];
        if (i >= numberOfItems) {
            if (product < 0 && element > 0) {
                product = product * element / minNegative;
            } else if (product < 0 && element < 0) {
                product = product * element / minPositive;
            } else {
                break;
            }
        } else {
            product = product * element;
            if (element < 0) {
                if (minNegative == 0 || element > minNegative) {
                    minNegative = element;
                }
            } else {
                if (minPositive == 0 || element < minPositive) {
                    minPositive = element;
                }
            }
        }
    }
    return product;
}

@end
