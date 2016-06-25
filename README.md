# README

## ORACLE támogatás

Le kell tölteni az Oracle honlapjáról az Instant Client-ből a Basic csomagot és az SDK-t.

[http://www.oracle.com/technetwork/database/features/instant-client/index.html](http://www.oracle.com/technetwork/database/features/instant-client/index.html)

**Basic telepítése**

A ZIP formátumú csomagokat kell letölteni és Basic-ből az "instantclient_xx.x" almappa tartalmát bemásolni a
Dockerfile melletti opt/oracle/instantclient mappába.

**SDK telepítése**

A ZIP fomrátumú csomagot kell szintén letölteni és az "instantclient_xx.x" almappa tartalmát bemásolni a
Dockerfile melletti opt/oracle/instantclient mappába. Ez egy "sdk" almappát fog jelenteni az
"opt/oracle/instantclient" alatt


