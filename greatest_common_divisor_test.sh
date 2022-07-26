#!/bin/bash

tmp=/tmp/$$

echo "---Normal Case---"
echo "when: (a > b)"
echo "6" > $tmp-expected
./greatest_common_divisor.sh 12 6 > $tmp-got
diff $tmp-expected $tmp-got || echo "error: case at (a > b)" >> $tmp-error

echo "when: (a = b)"
echo "13" > $tmp-expected
./greatest_common_divisor.sh 13 13 > $tmp-got
diff $tmp-expected $tmp-got || echo "error: case at (a = b)" >> $tmp-error

echo "when: (a < b)"
echo "5" > $tmp-expected
./greatest_common_divisor.sh 5 10 > $tmp-got
diff $tmp-expected $tmp-got || echo "error: case at (a < b)" >> $tmp-error

echo "---AbNormal Case---"
echo "when: there is no argument "
echo "error: invalild arg" > $tmp-expected
./greatest_common_divisor.sh > $tmp-got
diff $tmp-expected $tmp-got || echo " error: case at \"there is no argument\" " >> $tmp-error

echo "there is only one argument"
echo "error: invalild arg" > $tmp-expected
./greatest_common_divisor.sh > $tmp-got
diff $tmp-expected $tmp-got || echo " error: case at \"there is only one argument\" " >> $tmp-error


ERROR_EXIT () {
    cat $tmp-error
    rm -f $tmp-*
    exit 1
}

if [ -f $tmp-error ]; then
    echo "Error Occured."
    ERROR_EXIT
else 
    echo "All Cases Passed."
fi
