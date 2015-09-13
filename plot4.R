# plot4.R  (Florian Sobieczky - Coursera)

T<-read.csv("household_power_consumption.txt", sep=";");
TT<-as.matrix(T);   # more convenient to deal with matrix


U1<-TT[,7][TT[,1]=="1/2/2007"];  # Extract first day
V1<-TT[,8][TT[,1]=="1/2/2007"];  
W1<-TT[,9][TT[,1]=="1/2/2007"];  
H1<-TT[,5][TT[,1]=="1/2/2007"];  # <-- Voltage!
K1<-TT[,4][TT[,1]=="1/2/2007"];  # <-- Reactive Power
S1<-TT[,3][TT[,1]=="1/2/2007"];  # <-- Active Power
U2<-TT[,7][TT[,1]=="2/2/2007"];  # Extract second day
V2<-TT[,8][TT[,1]=="2/2/2007"]; 
W2<-TT[,9][TT[,1]=="2/2/2007"]; 
H2<-TT[,5][TT[,1]=="2/2/2007"];
K2<-TT[,4][TT[,1]=="2/2/2007"];
S2<-TT[,3][TT[,1]=="2/2/2007"]; 

U<-append(U1, U2, after = length(U1)); # put them together in one column
V<-append(V1, V2, after = length(V1));
W<-append(W1, W2, after = length(W1));
H<-append(H1, H2, after = length(H1));
K<-append(K1, K2, after = length(K1));
S<-append(S1, S2, after = length(S1));


png("plot4.png");		 # Generate the png-file.

par(mfrow = c(2,2));		 # Will be filled row-wise: i.e. Voltage is second plot.


      				 #  Topleft: like Plot2 (will copy-pase, now):

par(mar = c(4,4,2,2));           # choice of 4 for more space on left side
plot(S, ylab="Global Active Power", xlab="", type="l", xaxt='n');
axis(1, at = c(1,length(W)/2,length(W)), labels=c("Thu","Fri","Sat"));

      	    	     	   	 #  Toprigh: This is the `new' Voltage Plot:

par(mar = c(4,4,2,2));           # choice of 4 for more space on left side
plot(H, ylab="Voltage", xlab="datetime", type="l", xaxt='n');
axis(1, at = c(1,length(W)/2,length(W)), labels=c("Thu","Fri","Sat"));


	     		         #  Bottomleft: This is Plot3:

par(mar = c(4,4,2,2));           # choice of 4 for more space on left side
plot(U, ylab="Energy sub metering", type="l", xlab="", xaxt='n', ylim=c(0,38));
lines(V, col="red");             # First plot with lines U, then add lines V, and W.
lines(W, col="blue");
axis(1, at = c(1,length(W)/2,length(W)), labels=c("Thu","Fri","Sat"));
			         # Put Thu, Fri, Sat on X-axis (as label of three ticks.)
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),   lty=c(1,1), lwd=c(2,2), box.lwd=0);   # Legend

		   	    
				 # Bottomright: 

par(mar = c(4,4,2,2));           # choice of 4 for more space on left side
plot(K, ylab="Global_reactive_power", xlab="datetime", type="l", xaxt='n');
axis(1, at = c(1,length(W)/2,length(W)), labels=c("Thu","Fri","Sat"));


dev.off(); 
