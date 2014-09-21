---
title: "CodeBook.md"
author: "Krzysztof"
date: "Monday, September 22, 2014"
output: html_document
---
Orginal variables used as a core for this analysis are described in features_info.txt

After downloading data, following steps were performed on data.
1. Test and Train data were merged together
2. Feature data was linked with activity and subject information
3. Labels were introduced to the data set
4. The output table was created, containing summaries of the mean values for every activity and subject

In the output.txt we can find following columns:
1. Activity -[factor] the decriptive name of the activity performed during test
2. Subject - [factor] the number identifying person who conducted given measure
3:250 - [numeric] mean of the given variable for given subject and activity, for more detailed information look features_info.txt and readme for the tidy data