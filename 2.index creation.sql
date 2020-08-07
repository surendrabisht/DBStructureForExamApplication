
---INDEXES CREATION---

--For Foreign keys ------------ 

IF EXISTS (SELECT name FROM sys.indexes  
            WHERE name = N'IX_Answer_questionid')   
       DROP INDEX IX_Answer_questionid ON answer;   
GO  
 
CREATE NONCLUSTERED INDEX IX_Answer_questionid  ON answer (question_id);   
GO  


GO  
IF EXISTS (SELECT name FROM sys.indexes  
            WHERE name = N'IX_questmapping_testid')   
       DROP INDEX IX_questmapping_testid ON test_questions_mapping;   
GO  
 
CREATE NONCLUSTERED INDEX IX_questmapping_testid  ON test_questions_mapping (test_id);   
GO  


GO  
IF EXISTS (SELECT name FROM sys.indexes  
            WHERE name = N'IX_logs_testid')   
       DROP INDEX IX_logs_testid ON test_logs;   
GO  
 
CREATE NONCLUSTERED INDEX IX_logs_testid  ON test_logs (test_id);   
GO  



GO  
IF EXISTS (SELECT name FROM sys.indexes  
            WHERE name = N'IX_loganswers_testlogid')   
       DROP INDEX IX_loganswers_testlogid ON test_logs_answers;   
GO  
 
CREATE NONCLUSTERED INDEX IX_loganswers_testlogid  ON  test_logs_answers(test_log_id);   

GO  

-- Done Adding Indexes For Foreign keys ------------
 

-- Non clustered indexes on questionid ---

GO  
IF EXISTS (SELECT name FROM sys.indexes  
            WHERE name = N'IX_questionmapping_questionid')   
       DROP INDEX IX_questionmapping_questionid ON test_questions_mapping;   
GO  
 
CREATE NONCLUSTERED INDEX IX_questionmapping_questionid  ON test_questions_mapping (question_id);   
GO  



GO  
IF EXISTS (SELECT name FROM sys.indexes  
            WHERE name = N'IX_loganswers_questionid')   
       DROP INDEX IX_loganswers_questionid ON test_logs_answers;   
GO  
 
CREATE NONCLUSTERED INDEX IX_loganswers_questionid  ON test_logs_answers (question_id);   
GO  



------ Done Adding Clustered indexes on questionid-------------------------------------
