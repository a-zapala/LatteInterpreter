all:
	alex -g ./src/LexLatte.x -o ./src/LexLatte.hs
	happy -g ./src/ParLatte.y -o ./src/ParLatte.hs
	ghc -i./src/ -o interpreter ./src/Main.hs

clean:
	rm -f ./src/*.o ./src/*.hi
