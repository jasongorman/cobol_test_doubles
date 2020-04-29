       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRICE-MOVIE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01  RATING          PIC 9(1)V9(1).
       LINKAGE SECTION.
           01  IMDB-ID         PIC X(10).
           01  RENTAL-PRICE    PIC 9(2)V9(2).
           01  FETCH-RATING    PIC X(20).
       PROCEDURE DIVISION USING IMDB-ID, RENTAL-PRICE, FETCH-RATING.
       MAIN-PROCEDURE.
           CALL FETCH-RATING USING IMDB-ID, RATING.
           MOVE 4.95 TO RENTAL-PRICE.

           IF RATING > 7.0 THEN
               ADD 1.0 TO RENTAL-PRICE.

           IF RATING < 4 THEN
               SUBTRACT 1.0 FROM RENTAL-PRICE.

           GOBACK.
       END PROGRAM PRICE-MOVIE.
