library(trackViewer)
setwd('/home/phaneuf/ros_tol_gdv/iscR')


feats <- read.csv(file = "./iscR_feats.csv", stringsAsFactors = FALSE)
aa_chain <- feats[feats$feature == "Chain", ]
feats <- feats[feats$feature != "Chain", ]

muts <- read.csv(file = "./iscR_ale_muts.csv", stringsAsFactors = FALSE)

mutations <- GRanges("r", IRanges(muts$AA.pos, width = 1, names = muts$name))
muts$border_color <- muts$mutation.effect.color
mutations$score <- muts$mutation.count

# Ideally, the bottom would add the score label to the node, but it doesn't work
mutations$node.label <- as.character(mutations$score)
mutations$node.label.col <- "black"

mutations$border <- muts$border_color
muts$text_colors <- muts$mutation.effect.color
mutations$label.parameter.gp <- gpar(col = muts$text_colors)
mutations$dashline.col <- muts$mutation.effect.color
mutations$color <- muts$selection.pressure.color


features <- GRanges("r", IRanges(feats$start, end = feats$end))
feats$height <- rep(0.03, length(features))
features$height <- feats$height

features$featureLayerID <- paste(feats$layer)
names(features) <- paste(feats$feature)
features$fill <- feats$color
features$color <- feats$color

legend_data <- read.csv(
  file = "./iscR_ale_muts_legend.csv",
  stringsAsFactors = FALSE
  )

legend <- list(
  labels = legend_data$name,
  fill = legend_data$fill,
  col = legend_data$edge
)

# x11(width = 10, height = 6.5)  # Will output to a separate window; good for testing
pdf("IscR.pdf", width=13, height=6.5)
lolliplot(mutations,
          features,
          legend = legend,
          ranges = GRanges("r", IRanges(aa_chain$start, aa_chain$end)),
          # yaxis = FALSE
)

# grid.text("Mutations across PykF's amino acid chain", x=.5, y=0.98, just="top", gp=gpar(cex=1.5, fontface="bold"))
dev.off()