       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRICING-TEST.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01  IMDB-ID     PIC X(10).
           01  RATING-TO-USE EXTERNAL   PIC 9(1)V9(1).
           01  RENTAL-PRICE    PIC 9(2)V9(2).
           01  EXPECTED-PRICE  PIC 9(2)V9(2).
       LINKAGE SECTION.
       COPY 'test-context.cpy'.
       PROCEDURE DIVISION USING TEST-CONTEXT.
       MAIN-PROCEDURE.
            PERFORM AVERAGE-RATED-MOVIE-PRICE-TEST.
            PERFORM HIGH-RATED-MOVIE-PRICE-TEST.
            PERFORM LOW-RATED-MOVIE-PRICE-TEST.
            GOBACK.

       AVERAGE-RATED-MOVIE-PRICE-TEST.
           MOVE 'tt2527338' TO IMDB-ID.
           MOVE 6.7 TO RATING-TO-USE.
           MOVE 4.95 TO EXPECTED-PRICE.

           CALL 'PRICE-MOVIE' USING IMDB-ID, RENTAL-PRICE,
                                   'RATING-STUB'.

           CALL 'ASSERT-NUM-EQUAL' USING TEST-CONTEXT,
                               'AVERAGE-RATED-MOVIE-PRICE-TEST',
                               EXPECTED-PRICE, RENTAL-PRICE.

       HIGH-RATED-MOVIE-PRICE-TEST.
           MOVE 'tt8367814' TO IMDB-ID.
           MOVE 7.9 TO RATING-TO-USE.
           MOVE 5.95 TO EXPECTED-PRICE.

           CALL 'PRICE-MOVIE' USING IMDB-ID, RENTAL-PRICE,
                                   'RATING-STUB'.

           CALL 'ASSERT-NUM-EQUAL' USING TEST-CONTEXT,
                               'AVERAGE-RATED-MOVIE-PRICE-TEST',
                               EXPECTED-PRICE, RENTAL-PRICE.

       LOW-RATED-MOVIE-PRICE-TEST.
           MOVE 'tt4009460' TO IMDB-ID.
           MOVE 1.4 TO RATING-TO-USE.
           MOVE 3.95 TO EXPECTED-PRICE.

           CALL 'PRICE-MOVIE' USING IMDB-ID, RENTAL-PRICE,
                                   'RATING-STUB'.

           CALL 'ASSERT-NUM-EQUAL' USING TEST-CONTEXT,
                               'AVERAGE-RATED-MOVIE-PRICE-TEST',
                               EXPECTED-PRICE, RENTAL-PRICE.

       END PROGRAM PRICING-TEST.
