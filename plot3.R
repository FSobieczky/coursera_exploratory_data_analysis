# plot3.R  (Florian Sobieczky - Coursera)

T<-read.csv("household_power_consumption.txt", sep=";");
TT<-as.matrix(T);   # more convenient to deal with matrix


U1<-TT[,7][TT[,1]=="1/2/2007"];  # Extract first day
V1<-TT[,8][TT[,1]=="1/2/2007"];  
W1<-TT[,9][TT[,1]=="1/2/2007"];  
U2<-TT[,7][TT[,1]=="2/2/2007"];  # Extract second day
V2<-TT[,8][TT[,1]=="2/2/2007"]; 
W2<-TT[,9][TT[,1]=="2/2/2007"]; 

U<-append(U1, U2, after = length(U1)); # put them together in one column
V<-append(V1, V2, after = length(V1));
W<-append(W1, W2, after = length(W1));


png("plot3.png");		 # Generate the png-file.

par(mar = c(2,4,2,2));           # choice of 4 for more space on left side
plot(U, ylab="Energy sub metering", type="l", xaxt='n', ylim=c(0,38));
lines(V, col="red");             # First plot with lines U, then add lines V, and W.
lines(W, col="blue");
axis(1, at = c(1,length(W)/2,length(W)), labels=c("Thu","Fri","Sat"));
			         # Put Thu, Fri, Sat on X-axis (as label of three ticks.)

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),   lty=c(1,1), lwd=c(2,2));   # Legend
dev.off(); 

	



