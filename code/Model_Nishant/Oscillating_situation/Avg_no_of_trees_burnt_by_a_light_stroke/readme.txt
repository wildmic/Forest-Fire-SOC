We want to see the variation of number of trees burnt per fire stroke as a function of changing ratio, p by f.

We do it for p=0.005
Grid size=256x256

The basic procedure involves counting the number of burnt trees and number of lightening strokes after the initial transient period.  We consider first 500 iteration as the transient period.


lightcounter.m- it stores the number of lighening strokes for various p/f ratios

burntcounter.m- it stores the number of burnt trees for various p/f ratios

p_by_f.m- it stores the various p/f ratios used. we go from 100-100000 in 50 steps.
For every ratio, we go with 10000 iterations.

variation.fig- it plots the variation of avg number of trees burnt by a lightening stroke as a function of p/f