context("Unit testing functions in the grUtils.R file.")

#
# grNew
#

test_that( 'grNew creates correct genomicRanges objects, everything specified', {
   start <- c( 101, 301, 511, 513, 813 )
   end <- c( 200, 500, 511, 612, 822 )
   chr <- 'chr1'
   strand <- '+'
   got <- grNew( start= start, end= end, chr=chr, strand= strand )
   want <- GRanges(
      ranges= IRanges( start= c( 101, 301, 511, 513, 813 ), end= c( 200, 500, 511, 612, 822 )),
      seqnames= c( "chr1" ),
      strand= c( "+" )
   );
   expect_is(got, 'GRanges')
   expect_equal(got, want)
   expect_equal( start(got), start )
   expect_equal( end(got), end )
   expect_equal( as.character( seqnames(got) ), rep( chr, length(start) ))
   expect_equal( as.character( strand(got) ), rep( strand, length(start) ))
})

test_that( 'grNew, one exon, strand by default', {
   start <- 101
   end <- 200
   chr <- 'chrX'
   strand <- '*'

   got <- grNew( start= start, end= end, chr=chr )

   want <- GRanges(
      ranges= IRanges( start= c( 101 ), end= c( 200 )),
      seqnames= c( "chrX" ),
      strand= c( "*" )
   );
   expect_is(got, 'GRanges')
   expect_equal(got, want)
   expect_equal( start(got), start )
   expect_equal( end(got), end )
   expect_equal( as.character( seqnames(got) ), rep( chr, length(start) ))
   expect_equal( as.character( strand(got) ), rep( strand, length(start) ))
})

#
# grAddColumn()
#

test_that( 'grAddColumn; normal use ok?', {
   gr <- grNew(
      start=  c( 101, 301, 511, 513, 813 ),
      end=    c( 200, 500, 511, 612, 822 ),
      chr=    "chr1",
      strand= "+"
   );
   exonFillColor <- c('red', 'orange', 'yellow', 'green', 'blue')
   want <- GRanges(
      ranges= IRanges( start= c( 101, 301, 511, 513, 813 ), end= c( 200, 500, 511, 612, 822 )),
      seqnames= c( "chr1" ),
      strand= c( "+" ),
      exonFillColor= c('red', 'orange', 'yellow', 'green', 'blue')
   );
   got <- grAddColumn( gr, 'exonFillColor', exonFillColor);

   # manual creation is the same as adding column
   expect_identical(got, want);

   # can recover the vector from the object
   expect_equal(got$exonFillColor, exonFillColor);

   # Not affecting the original, but creating a new copy.
   expect_null(gr$exonFillColor);

})

test_that( 'grAddColumn; wrapping data values works?', {
   gr <- grNew(
      start=  c( 101, 301, 511, 513, 813, 1000 ),
      end=    c( 200, 500, 511, 612, 822, 1100 ),
      chr=    "chr1",
      strand= "+"
   );

   oneWrapped <- grAddColumn(gr, 'col_1', 1);
   expect_equal( oneWrapped$col_1, rep(1,6) );

   threeWrapped <- grAddColumn( gr, 'col_3', c('a', 'b', 'c') );
   expect_equal( threeWrapped$col_3, rep( c('a', 'b', 'c'), 2 ));
})

#
# grLabelMap()
#

test_that( 'grLabelMap; adds or returns correct column for default pallette', {
   fail( 'Test column returned not implemented' )
   fail( 'Test column added not implemented' )
   fail( 'Test original gr unaffected not implemented' )
})

test_that( 'grLabelMap; adds or returns correct column for given pallette', {
   fail( 'Test column returned not implemented' )
   fail( 'Test column added not implemented' )
   fail( 'Test original gr unaffected not implemented' )
})

test_that( 'grLabelMap; adds or returns correct column for given labels', {
   fail( 'Test column returned not implemented' )
   fail( 'Test column added not implemented' )
   fail( 'Test original gr unaffected not implemented' )
})

