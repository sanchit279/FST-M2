-- Load input file from HDFS
inputFile = LOAD 'hdfs:///user/jivan/input.txt' AS (line:chararray);
-- Tokeize each word in the file (Map)
words = FOREACH inputFile GENERATE FLATTEN(TOKENIZE(line)) AS word;
-- Combine the words from the above stage
grpd = GROUP words BY word;
-- Count the occurence of each word (Reduce)
totalCount = FOREACH grpd GENERATE $0 AS word, COUNT($1) AS no_of_words;

--To remove old outputs
rmf hdfs:///user/jivan/PigOutput1;
-- Store the result in HDFS
STORE totalCount INTO 'hdfs:///user/jivan/PigOutput1';
