       IDENTIFICATION DIVISION.
       PROGRAM-ID. RATING-STUB.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01 RATING-TO-USE EXTERNAL PIC 9(1)V9(1).
       LINKAGE SECTION.
       COPY 'rating-params.cpy'.
       PROCEDURE DIVISION USING IMDB-ID, RATING.
       MAIN-PROCEDURE.
            MOVE RATING-TO-USE TO RATING.
            GOBACK.
       END PROGRAM RATING-STUB.
