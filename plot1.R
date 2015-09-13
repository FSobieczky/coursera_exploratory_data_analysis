# plot1.R  (Florian Sobieczky - Coursera)

T<-read.csv("household_power_consumption.txt", sep=";");
TT<-as.matrix(T);   # more convenient to deal with matrix
lx<-length(TT[1,]); # will appear more often than once,
ly<-length(TT[,1]); # adds to clarity to make these defs.

W1<-TT[,3][TT[,1]=="1/2/2007"];  # Extract first day
W2<-TT[,3][TT[,1]=="2/2/2007"];  # Extract second day
W<-append(W1, W2, after = length(W1)) # put them together in one vector
                                 # Note: W<-TT[,3][TT[,1]=="2/1/2007" || TT[,1]=="2/2/2007"]
  				 #       didn't work for some reason ....
V<-na.omit(as.numeric(W)); 	 # Make the type numeric, through out `NA's'.
png("plot1.png");		 # Generate the png-file.
hist(V,  main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)",ylab="Frequency");
dev.off();





