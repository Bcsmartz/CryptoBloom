#!/bin/sh

echo $1 $2

DURATION=$1 #3600
WORKERNAME=$2

# PRE PURGE
rm $HOME_DIR/Desktop/mine/recordXSCs.log

OBSCURE_AD="XSC1UJmkHsP5HrRwbFhHvaaycW2Vz7Fo2BsxjydSicj1FbFmFXS4VQV4YrmaZuhgQZSbfqZzxc1NL6AXjBpnn6Rf25uRv5t2bV"
XTNC_AD="XtazhWGcozBXaVZGUochAm4VcJgpvLR8hVLJE9EY9VzwBgoWpNhV1GDYbwUthao444C4SKDYi2KR324a84MzgjiKScaBa9viZu5"
LOKI_AD="LEak4Lxdgw2VBUbnrPJfWpB4grWhrq6gHM5dAD3cqu5vdSM5fgJEeGYED6BmYeD3R6VRTvR3oqzC3foTwoDLjG67TEYth7d"

cd $HOME_DIR/Desktop/mine/xmrig/build

#-o xsc.luckypool.io:8866 -u $OBSCURE_AD -p obscure-$WORKERNAME --variant 1 -k \

DIFF=210

timeout "${DURATION}s" ./xmrig -a cryptonight-pico --donate-level 1 \
-o obscure.herominers.com:10480 -u $OBSCURE_AD.$DIFF -p obscure-$WORKERNAME --variant 1 -k \
-o xsc.cnpool.cc:32593 -u $OBSCURE_AD.${DIFF}@${WORKERNAME} -p $LOKI_AD --variant 1 -k \
-o xsc.cnpool.cc:32590 -u $OBSCURE_AD.${DIFF}@${WORKERNAME} -p $XTNC_AD --variant 1 -k \
-t 1 > $HOME_DIR/Desktop/mine/recordXSCs.log 2>&1 &

#tail -f $HOME_DIR/Desktop/mine/recordXSCs.log
