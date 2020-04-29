       IDENTIFICATION DIVISION.
       PROGRAM-ID. NEW-TITLE-TEST.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01  TITLE                   PIC X(30).
           01  YEAR                    PIC 9(4).
           01  DIRECTOR                PIC X(30).
           01  EXPECTED-SUBJECT        PIC X(100).
           01  ACTUAL-SUBJECT EXTERNAL PIC X(100).
           01  SEND-MAIL               PIC X(30) VALUE 'SEND-MAIL-MOCK'.
       LINKAGE SECTION.
       COPY 'test-context.cpy'.
       PROCEDURE DIVISION USING TEST-CONTEXT.
       MAIN-PROCEDURE.
            PERFORM MEMBERS-ALERTED-TEST.
            GOBACK.

       MEMBERS-ALERTED-TEST.
           MOVE 'The Abyss' TO TITLE.
           MOVE 1989 TO YEAR.
           MOVE 'James Cameron' TO DIRECTOR.
           MOVE 'New Movie - The Abyss (1989), Dir: James Cameron' TO
                   EXPECTED-SUBJECT.

           CALL 'NEW-TITLE' USING TITLE, YEAR, DIRECTOR, SEND-MAIL.

           CALL 'ASSERT-TXT-EQUAL' USING TEST-CONTEXT,
                               'MEMBERS-ALERTED-TEST',
                               EXPECTED-SUBJECT, ACTUAL-SUBJECT.

       END PROGRAM NEW-TITLE-TEST.
