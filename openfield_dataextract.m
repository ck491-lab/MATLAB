
function[DataFile]=openfield_dataextract(filename)
%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%
% To extend the code for use with different selected data or a different
% spreadsheet, generate a function instead of a script.

% Auto-generated by MATLAB on 2019/03/14 11:55:43
%edited to be used for any file by Emma Holt 4/2/19
%% Import the data
[~, ~, raw] = xlsread(filename);
headings=raw(1,:);
raw = raw(2:end,:);
finish=length(raw(1,:));
for a=1:finish
    whichnum{1,a}(:)=isnumeric(raw{1,a}(:));
end
whichnum=cell2mat(whichnum);
wherenum=find(whichnum==1);
wherechar=find(whichnum==0);
stringVectors = string(raw(:,[wherechar]));
stringVectors(ismissing(stringVectors)) = '';
raw = raw(:,[wherenum]);
%% Create output variable
data = reshape([raw{:}],size(raw));

%% Create table
DataFile = table;

%% Allocate imported array to column variable names
for x=1:length(wherechar)
    wherecharhead=headings(1,wherechar);
    wherecharhead = regexprep(wherecharhead, '\s+', '');
    DataFile.(wherecharhead{1,x}) = categorical(stringVectors(:,x));
end

for j=1:length(wherenum)
    wherenumhead=headings(1,wherenum);
    wherenumhead = regexprep(wherenumhead, '\s+', ''); 
    wherenumhead = regexprep(wherenumhead, '\(|)','');
    wherenumhead = regexprep(wherenumhead, '\<|>','');
    wherenumhead = regexprep(wherenumhead, '\>|<','');
    DataFile.(wherenumhead{1,j}) = data(:,j);
end

%% Clear temporary variables
clearvars data raw stringVectors a finish headings wherechar wherenum whichnum wherecharhead wherenumhead j x;
end