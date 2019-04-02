%% import excel file
%path is folder where your excel data sheet is
path='Y:\Eric and Sarah\Behavior\Developmental Tianeptine Study\Dev FLX Adult TIA Crossover Study (DAALTO)\Behavioral Data\NSF\post FLX treatment';
cd(path)
filename=[path,'\','post FLX NSF full data.xlsx']; %name of your excel file
[DataFile]=openfield_dataextract(filename) %function will extract from excel and put into Matlab table

savepath='Y:\Eric and Sarah\Behavior\Developmental Tianeptine Study\Dev FLX Adult TIA Crossover Study (DAALTO)\Behavioral Data\NSF\post FLX treatment'; %change the savepath if you want to save in a different folder
%% ***REMEMBER TO CHANGE NAME OF SAVED FILE AT BOTTOM***
% DataFile=postFLXNSFfulldata;

%% separating out groups
%to identify each group (if row contains specified group it will be a 1);
%for example, my groups are Male PN FLX, Male PN VEH, Female PN FLX, Female PN VEH,etc
whichmales=ismember(DataFile.Sex,'Male');
whichfemales=ismember(DataFile.Sex,'Female');
whichPNFLX=ismember(DataFile.P2P11FLXVehicle,'FLX');
whichPNVEH=ismember(DataFile.P2P11FLXVehicle,'VEH');
whichadultFLX=ismember(DataFile.AdultFLXVehicle,'FLX');
whichadultVEH=ismember(DataFile.AdultFLXVehicle,'VEH');

%for by box analysis
whichbox1=ismember(DataFile.Box,1);
whichbox2=ismember(DataFile.Box,2);
whichbox3=ismember(DataFile.Box,3);
whichbox4=ismember(DataFile.Box,4);

%% create matrices by treatment group
for n=1:length(DataFile.Mouse)
    x=1;
    groupmem=find(~isnan(DataFile.Mouse));
        if whichmales(n,1)==1 & whichPNFLX(n,1)==1 & whichadultFLX(n,1)==1
            malesFLXFLX(n,x)=groupmem(n,1);
        else
            malesFLXFLX(n,x)=NaN;
        end
        
        if whichmales(n,1)==1 & whichPNVEH(n,1)==1 & whichadultVEH(n,1)==1
            malesVEHVEH(n,x)=groupmem(n,1);
        else
            malesVEHVEH(n,x)=NaN;
        end
        
        if whichfemales(n,1)==1 & whichPNFLX(n,1)==1 & whichadultFLX(n,1)==1
            femalesFLXFLX(n,x)=groupmem(n,1);
        else
            femalesFLXFLX(n,x)=NaN;
        end
        
        if whichfemales(n,1)==1 & whichPNVEH(n,1)==1 & whichadultVEH(n,1)==1
            femalesVEHVEH(n,x)=groupmem(n,1);
        else
            femalesVEHVEH(n,x)=NaN;
        end
        
        if whichmales(n,1)==1 & whichPNFLX(n,1)==1 & whichadultVEH(n,1)==1
            malesFLXVEH(n,x)=groupmem(n,1);
        else
            malesFLXVEH(n,x)=NaN;
        end
        
        if whichmales(n,1)==1 & whichPNVEH(n,1)==1 & whichadultFLX(n,1)==1
            malesVEHFLX(n,x)=groupmem(n,1);
        else
            malesVEHFLX(n,x)=NaN;
        end
        
        if whichfemales(n,1)==1 & whichPNFLX(n,1)==1 & whichadultVEH(n,1)==1
            femalesFLXVEH(n,x)=groupmem(n,1);
        else
            femalesFLXVEH(n,x)=NaN;
        end
        
        if whichfemales(n,1)==1 & whichPNVEH(n,1)==1 & whichadultFLX(n,1)==1
            femalesVEHFLX(n,x)=groupmem(n,1);
        else
            femalesVEHFLX(n,x)=NaN;
        end
        
        if whichbox1(n,1)==1 
            box1(n,x)=groupmem(n,1);
        else
            box1(n,x)=NaN;
        end
        if whichbox2(n,1)==1 
            box2(n,x)=groupmem(n,1);
        else
            box2(n,x)=NaN;
        end
        if whichbox3(n,1)==1 
            box3(n,x)=groupmem(n,1);
        else
            box3(n,x)=NaN;
        end
        if whichbox4(n,1)==1 
            box4(n,x)=groupmem(n,1);
        else
            box4(n,x)=NaN;
        end
end
%remove NaNs
    remove=isnan(malesFLXFLX(:,x));
    malesFLXFLX(remove,:)=[];
    clear remove
    
    remove=isnan(malesVEHVEH(:,x));
    malesVEHVEH(remove,:)=[];
    clear remove
    
    remove=isnan(femalesFLXFLX(:,x));
    femalesFLXFLX(remove,:)=[];
    clear remove
    
    remove=isnan(femalesVEHVEH(:,x));
    femalesVEHVEH(remove,:)=[];
    clear remove
    
    remove=isnan(malesFLXVEH(:,x));
    malesFLXVEH(remove,:)=[];
    clear remove
    
    remove=isnan(malesVEHFLX(:,x));
    malesVEHFLX(remove,:)=[];
    clear remove
    
    remove=isnan(femalesFLXVEH(:,x));
    femalesFLXVEH(remove,:)=[];
    clear remove
    
    remove=isnan(femalesVEHFLX(:,x));
    femalesVEHFLX(remove,:)=[];
    clear remove
    
    remove=isnan(box1(:,x));
    box1(remove,:)=[];
    clear remove
    
    remove=isnan(box2(:,x));
    box2(remove,:)=[];
    clear remove
    
    remove=isnan(box3(:,x));
    box3(remove,:)=[];
    clear remove
    
    remove=isnan(box4(:,x));
    box4(remove,:)=[];
    clear remove
%% organizing by measure using template

%cleaning up some variables
clear bin groupmem whichfemales whichmales whichPNFLX whichPNVEH whichadultFLX whichadultVEH whichbox1 whichbox2 whichbox3 whichbox4  

allgroups={malesFLXFLX,malesVEHVEH,femalesFLXFLX,femalesVEHVEH,malesFLXVEH,malesVEHFLX,femalesFLXVEH,femalesVEHFLX};
allboxes={box1,box2,box3,box4};

for a=1:length(allgroups)
        NSF_latency{1,a}(:,1)=sort(DataFile.NSFLatencytoEat(allgroups{1,a}(:,1)));  
        NSF_latency_avgs{1,a}=nanmean(NSF_latency{1,a});
end

for a=1:length(allgroups)
        homecage_latency{1,a}(:,1)=sort(DataFile.Latency(allgroups{1,a}(:,1)));  
        homecage_latency_avgs{1,a}=nanmean(homecage_latency{1,a});
end

for a=1:length(allgroups)
        amount_consumed{1,a}(:,1)=sort(DataFile.AmountConsumed(allgroups{1,a}(:,1)));  
        amount_consumed_avgs{1,a}=nanmean(amount_consumed{1,a});
end

for a=1:length(allboxes)
        bybox_NSF_latency{1,a}(:,1)=sort(DataFile.NSFLatencytoEat(allboxes{1,a}(:,1)));  
        bybox_NSF_latency_avgs{1,a}=nanmean(bybox_NSF_latency{1,a});
end

for a=1:length(allboxes)
        bybox_homecage_latency{1,a}(:,1)=sort(DataFile.Latency(allboxes{1,a}(:,1)));  
        bybox_homecage_latency_avgs{1,a}=nanmean(bybox_homecage_latency{1,a});
end

for a=1:length(allboxes)
        bybox_amount_consumed{1,a}(:,1)=sort(DataFile.AmountConsumed(allboxes{1,a}(:,1)));  
        bybox_amount_consumed_avgs{1,a}=nanmean(bybox_amount_consumed{1,a});
end

clear a DataFile box1 box2 box3 box4 femalesFLXFLX femalesFLXVEH femalesVEHFLX femalesVEHVEH malesFLXFLX malesFLXVEH malesVEHFLX malesVEHVEH n x y

%% survival analysis
x=[0;60;120;180;240;300;360]; %one minute intervals
for a=1:length(allgroups)
    censor{1,a}(:,1)=NSF_latency{1,a}(:,1);
    censor{1,a}(:,2)=ismember(NSF_latency{1,a}(:,1),360);
end
for a=1:length(allgroups)
    freq_table{1,a}=tabulate(NSF_latency{1,a});
end
for a=1:length(allgroups)
    [f,x]=ecdf(NSF_latency{1,a}(:,1),'censoring',censor{1,a}(:,2));
    survival_table{1,a}(:,1)=f;
    survival_table{1,a}(:,2)=x;
    clear f x
end
%% plot figures
%males
% Create figure
figure(); ecdf(NSF_latency{1,1}(:,1),'censoring',censor{1,1}(:,2),'function','survivor');
hold on; ecdf(NSF_latency{1,5}(:,1),'censoring',censor{1,5}(:,2),'function','survivor');
hold on; ecdf(NSF_latency{1,6}(:,1),'censoring',censor{1,6}(:,2),'function','survivor');
hold on; ecdf(NSF_latency{1,2}(:,1),'censoring',censor{1,2}(:,2),'function','survivor');
savefig([savepath,'\','survival_males_postFLX_NSF.fig']);
close all
%females
% Create figure
figure(); ecdf(NSF_latency{1,3}(:,1),'censoring',censor{1,3}(:,2),'function','survivor');
hold on; ecdf(NSF_latency{1,7}(:,1),'censoring',censor{1,7}(:,2),'function','survivor');
hold on; ecdf(NSF_latency{1,8}(:,1),'censoring',censor{1,8}(:,2),'function','survivor');
hold on; ecdf(NSF_latency{1,4}(:,1),'censoring',censor{1,4}(:,2),'function','survivor');
savefig([savepath,'\','survival_females_postFLX_NSF.fig']);
close all
%% save
save([savepath,'\','postFLX_NSF.mat'])
