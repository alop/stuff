#!/usr/bin/env python3

import random
from prometheus_client import CollectorRegistry, Gauge, push_to_gateway


def testThing():
    n = random.randint(1,10)
    guess = int(input("Enter a number from 1 to 10: "))
    while n != "guess":
        if guess < n:
            print("Higher")
            guess = int(input("Enter a number from 1 to 10: "))
        elif guess > n:
            print("lower")
            guess = int(input("Enter a number from 1 to 10: "))
        else:
            print("You guessed it")
            pushSuccess()
            break


def pushSuccess():
    registry = CollectorRegistry()
    g = Gauge('job_last_success_unixtime', 'User Guessed correctly', registry=registry)
    g.set_to_current_time()
    push_to_gateway('localhost:9091', job='batchA', registry=registry)


if __name__ == "__main__":
    testThing()
