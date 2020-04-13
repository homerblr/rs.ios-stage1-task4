#import "TelephoneFinder.h"

@implementation TelephoneFinder

- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*) number {
    NSDictionary *neighbours = @{
        @"0": @[@"8"],
        @"1": @[@"2", @"4"],
        @"2": @[@"1", @"3", @"5"],
        @"3": @[@"2", @"6"],
        @"4": @[@"1", @"5", @"7"],
        @"5": @[@"2", @"4", @"6", @"8"],
        @"6": @[@"3", @"5", @"9"],
        @"7": @[@"4", @"8"],
        @"8": @[@"5", @"7", @"9", @"0"],
        @"9": @[@"6", @"8"],
    };
    int val = [number intValue];
    if (val < 0) {
        return nil;
    }
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < number.length; i++){
        NSRange range = NSMakeRange(i, 1);
        NSArray * itsNeighbours = [neighbours valueForKey:[number substringWithRange:range]];
        for (int j = 0; j < itsNeighbours.count; j++){
            NSString * newNeighbour = [number stringByReplacingCharactersInRange:range withString:itsNeighbours[j]];
            [result addObject:newNeighbour];
        }
    }
    return result;
}

@end
