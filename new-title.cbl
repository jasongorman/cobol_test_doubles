       IDENTIFICATION DIVISION.
       PROGRAM-ID. NEW-TITLE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  SUBJECT     PIC X(100) VALUE SPACES.
       LINKAGE SECTION.
       01  TITLE       PIC X(30).
       01  YEAR        PIC 9(4).
       01  DIRECTOR    PIC X(30).
       01  SEND-MAIL   PIC X(30).
       PROCEDURE DIVISION USING TITLE, YEAR, DIRECTOR, SEND-MAIL.
       MAIN-PROCEDURE.
           STRING 'New Movie - '
               FUNCTION TRIM(TITLE)
               ' ('
               YEAR
               '), Dir: '
               FUNCTION TRIM(DIRECTOR)
           INTO SUBJECT
           END-STRING.
           CALL SEND-MAIL USING SUBJECT.
           GOBACK.
       END PROGRAM NEW-TITLE.
