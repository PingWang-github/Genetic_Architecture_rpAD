library(qqman)

results_log <- read.table("case_control.assoc_2.logistic", head=TRUE)

# Manhattan plot
jpeg("manhattan_plot.jpeg")
manhattan(results_log, chr="CHR", bp="BP", p="P", snp="SNP",
          main = "Manhattan Plot",
          ylim = c(0, 10), cex = 0.6, cex.axis = 0.9,
          col = c("blue4", "orange3"), chrlabs = c(1:22, "P", "Q"))
dev.off()

# QQ plot
jpeg("QQ.jpeg")
qq(results_log$P, main = "Q-Q Plot")
dev.off()

# lambda
chi <- qchisq(results_log$P, df=1, lower.tail=F)
lambda <- median(chi)/qchisq(0.5,df=1)
lambda
