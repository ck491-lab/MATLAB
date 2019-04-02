function[convertedfilename]=ConvertReducedOFfile(RawFile,convertedfilename)
%open file
fid=fopen(RawFile,'rt');
%figure out how many columns are there
firstline=fgetl(fid);
ncol=1+sum(firstline==',');
%reset to beginning of file
fseek(fid,0,0);
%read data
indata=textscan(fid,repmat('%s',1,ncol),'Delimiter',',','CollectOutput',1);
headings=textscan(firstline,repmat('%s',1,ncol),'Delimiter',',','CollectOutput',1);
%convert indata and headings into cellarray that isn't annoying
for x=1:length(indata{1,1})
    indata_mat(x,:)=indata{1,1}(x,:);
end
for x=1:length(headings{1,1})
    headings_mat(:,x)=cellstr(regexprep(headings{1,1}(:,x), '"', ''));
end
%rename headings into something matlab will tolerate
    headings_mat = regexprep(headings_mat, '\s+', ''); 
    headings_mat = regexprep(headings_mat, '\(|)','');
    headings_mat = regexprep(headings_mat, '\<|>','');
    headings_mat = regexprep(headings_mat, '\>|<','');
    
%convert info into a table
T=cell2table(indata_mat,'VariableNames',headings_mat);
%write the table to an excel file
writetable(T,convertedfilename);
%close file
fclose(fid);

clear ans fid firstline headings headings_mat indata indata_mat ncol T x
end