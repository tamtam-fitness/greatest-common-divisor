#!/bin/bash

validate_arg() {
  # 自然数判定(0以外で始まる数値列)
  if [[ $1 =~ ^[1-9][0-9]*$ ]]; then
    return 0
  else
    echo "error: invalild arg" $1
    exit 1
  fi

}

call_gcd() {
    # ユークリッドの互除法で解く。

    # 入力値を a, b とした時、
    # a を b で割り切れた（= 余りが 0 となった）ときの除数 a を最大公約数とする。
    # b で割り切れない場合は、元のbの値をaとし、余りをbとし繰り返す。
    while [ !  0 -eq "$2" ]; do
	    set -- "$2" "`expr "$1" % "$2"`"
	done
	echo "$1"
}

validate_arg $1
validate_arg $2
call_gcd $1 $2