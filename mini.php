<?php $a=file('xjj.txt');$b=$a[array_rand($a)];header("Location:$b");
