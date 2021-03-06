# plot2.R  (Florian Sobieczky - Coursera)

T<-read.csv("household_power_consumption.txt", sep=";");
TT<-as.matrix(T);   # more convenient to deal with matrix

W1<-TT[,3][TT[,1]=="1/2/2007"];  # Extract first day
W2<-TT[,3][TT[,1]=="2/2/2007"];  # Extract second day
W<-append(W1, W2, after = length(W1)) # put them together in one vector
                                 # Note: W<-TT[,3][TT[,1]=="2/1/2007" || TT[,1]=="2/2/2007"]
  				 #       didn't work for some reason ....

png("plot2.png");		 # Generate the png-file.

par(mar = c(3,4,2,2));           # choice of 4 for more space on left side
plot(W, ylab="Global Active Power (kilowatts)", xlab="", type="l", xaxt='n');
axis(1, at = c(1,length(W)/2,length(W)), labels=c("Thu","Fri","Sat"));
    # Note: xaxt='n' first switches standard xlabels off, axis(...) puts Thu,Fri,Sat there
dev.off(); 

	



