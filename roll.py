#!/usr/bin/python

from random import randint
import re

dice_re = re.compile(r"(\d)d(\d)(\+(\d))?")

def roll(dice, pen=False):
    m = dice_re.match(dice).groups()
    return rolldice(maybeint(m[0]),maybeint(m[1]),maybeint(m[2]),pen)

def maybeint(exp):
    if exp == None:
        return 0
    return int(exp)

def rolldice(num,size,mod,pen):
    if size == 0:
        size = 20
    if num == 0:
        num = 1
    total = 0
    for i in range(num):
        die = randint(1,size)
        if pen and (die == size):
            die += rolldice(1,size,0,pen)
        total += die
    return total+mod

if __name__ == "__main__":
    from optparse import OptionParser
    import sys
    usage = "%prog [options] dice"
    parser = OptionParser(usage)
    parser.add_option("-p","--penetration", action="store_true",
                      dest="pen", default=False, help="use penetration/acing")
    (options, args) = parser.parse_args()
    if len(args) != 1:
        parser.error("incorrect number of arguments")
    sys.stdout.write("%d" % roll(args[0],options.pen))
