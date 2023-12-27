fb1-5: fb1-5.l fb1-5.y
	bison -d fb1-5.y
	flex -o fb1-5.c fb1-5.l
	gcc -lfl -o $@.bin fb1-5.tab.c fb1-5.c
