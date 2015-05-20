#function for read line using sep ","
readstring <- function () {
	Str <- readline("Enter:")
	as.numeric(unlist(strsplit(Str, ",")))
}

irekae <- function(a,col){
	maxid <- which.max(a[,col])
	temp <- a[maxid,]
	a[maxid,] <- a[col,]
	a[col,] <- temp
}

n <- as.numeric(readline("行列の次数は?:"))

a <- matrix(0,n,n+1)

#opframe <- data.frame(output)
#opframe <- edit(opframe)

for(i in 1:n){
	a[i,] <- readstring()
}


for(i in 1:n){
	irekae(a,i)
	p <- a[i,i]
	if(abs(p)<1.0e-6){
		print("一意解を持ちません")
		q()
	}
	#第i行を(i,i)成分で除算
	a[i,] <- a[i,]/a[i,i]

	#第i行より下の行は
	for(j in 1:n){
		if(j==i){
			j <- j+1
			next
		}
		a[j,] <- a[j,] - a[j,i]*a[i,]
		j<-j+1
	}
}

x <- a[,n+1]


output <- data.frame(a)
output
write.table(output, "output.csv", quote=F, sep=",", col.names=F, append=F)