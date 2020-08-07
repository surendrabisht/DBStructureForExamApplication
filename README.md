# DBStructureForExamApplication
Application was made in Powerbuilder. Only Db Structure Uploaded


### question:
This table will have questions (Objective +subjective) with diagram. 
Question deleted will be saved as question_enabled=0 so it doesn’t affect previous tests given.  
'Question type will be O (Objective) or S (subjective). Question diagram will have location of picture for Question.

### Answer: 
this Table will have saved answers for the questions. Answers deleted will be saved as answer_enabled=0.

### tests: 
This table will have various tests that can be taken by candidate. 

### test_questions_mapping:  
This table will save questions mapped to the test.

### test_logs: 
This table will have records of all the tests taken by the user. User can give same tests again. If finishtime is null for a particular test, that test is not complete. User cannot appear the new instance of same test if previous same test is not finished. Time Taken is saved in seconds.
### test_logs_answers: 
This table will be responsible to save the submitted answers for the particular test. The moment user clicks on give test, all the mapped questions for particular test in inserted in this table.  On each submission of answers, these entries will be updated. Reviewer will update marks for subjective question in test in this table.


## Deletion & update effect on tables

Test History should not be affected. 
-	So For any deletion on questions, answers it will not affect history. Deleting tests and answers will set it to disabled mode. Updating correct answer & marks will not affect history.
-	Deleting Tests will delete test if test is not appeared, otherwise test will be disabled.
If test needs to be deleted, delete from tests &  test_questions_mapping, otherwise update test_enabled=0 on tests.
-	Deleting Test history will delete data from test_logs & test_logs_answers. (not implemented deleting test history for now)
