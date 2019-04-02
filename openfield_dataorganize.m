%% written by Emma Holt 3/14/19
%you need to convert the text file that you got from reducing into a normal
    %excel format
%you need to make sure you have all of your treatment, etc columns filled
    %out
%% import excel sheet into matlab

%path is folder where your excel data sheet is
path='Y:\Eric and Sarah\Behavior\Developmental Tianeptine Study\Dev FLX Adult TIA Crossover Study (DAALTO)\Behavioral Data\Open Field\Post FLX treatment';
cd(path)
filename=[path,'\','postFLX_10min_stdcenter.xlsx']; %name of your excel file
[DataFile]=openfield_dataextract(filename) %function will extract from excel and put into Matlab table
numbins=6; %the number of bins will vary based on the length of the intervals
% DataFile=prepostFLXcombined;

%% ***REMEMBER TO CHANGE SAVE PATH AND SAVE FILE NAME AT BOTTOM***

%% separating out groups
%to identify each group (if row contains specified group it will be a 1);
%for example, my groups are Male PN FLX, Male PN VEH, Female PN FLX, Female PN VEH,etc
whichmales=ismember(DataFile.Sex,'Male');
whichfemales=ismember(DataFile.Sex,'Female');
whichPNFLX=ismember(DataFile.Treatment,'FLX');
whichPNVEH=ismember(DataFile.Treatment,'VEH');
whichadultFLX=ismember(DataFile.AdultFLXTreatment,'FLX');
whichadultVEH=ismember(DataFile.AdultFLXTreatment,'VEH');

%for by box analysis
whichbox1=ismember(DataFile.Encl,1);
whichbox2=ismember(DataFile.Encl,2);
whichbox3=ismember(DataFile.Encl,3);
whichbox4=ismember(DataFile.Encl,4);
whichbox5=ismember(DataFile.Encl,5);
whichbox6=ismember(DataFile.Encl,6);
whichbox7=ismember(DataFile.Encl,7);
whichbox8=ismember(DataFile.Encl,8);
whichbox9=ismember(DataFile.Encl,9);
whichbox10=ismember(DataFile.Encl,10);

%% create matrices for each group/bin (template)
for x=1:numbins
    bin=find((DataFile.Interval)==x);
    for n=1:length(bin)
        if whichmales(bin(n,1),1)==1 & whichPNFLX(bin(n,1),1)==1
            malesPNFLX_bins(n,x)=bin(n,1);
        else
            malesPNFLX_bins(n,x)=NaN;
        end
        
        if whichmales(bin(n,1),1)==1 & whichPNVEH(bin(n,1),1)==1 
            malesPNVEH_bins(n,x)=bin(n,1);
        else
            malesPNVEH_bins(n,x)=NaN;
        end
        
        if whichfemales(bin(n,1),1)==1 & whichPNFLX(bin(n,1),1)==1 
            femalesPNFLX_bins(n,x)=bin(n,1);
        else
            femalesPNFLX_bins(n,x)=NaN;
        end
        
        if whichfemales(bin(n,1),1)==1 & whichPNVEH(bin(n,1),1)==1 
            femalesPNVEH_bins(n,x)=bin(n,1);
        else
            femalesPNVEH_bins(n,x)=NaN;
        end 
        
        if whichmales(bin(n,1),1)==1 & whichPNFLX(bin(n,1),1)==1 & whichadultFLX(bin(n,1),1)==1
            malesFLXFLX_bins(n,x)=bin(n,1);
        else
            malesFLXFLX_bins(n,x)=NaN;
        end
        
        if whichmales(bin(n,1),1)==1 & whichPNVEH(bin(n,1),1)==1 & whichadultVEH(bin(n,1),1)==1
            malesVEHVEH_bins(n,x)=bin(n,1);
        else
            malesVEHVEH_bins(n,x)=NaN;
        end
        
        if whichfemales(bin(n,1),1)==1 & whichPNFLX(bin(n,1),1)==1 & whichadultFLX(bin(n,1),1)==1
            femalesFLXFLX_bins(n,x)=bin(n,1);
        else
            femalesFLXFLX_bins(n,x)=NaN;
        end
        
        if whichfemales(bin(n,1),1)==1 & whichPNVEH(bin(n,1),1)==1 & whichadultVEH(bin(n,1),1)==1
            femalesVEHVEH_bins(n,x)=bin(n,1);
        else
            femalesVEHVEH_bins(n,x)=NaN;
        end
        
        if whichmales(bin(n,1),1)==1 & whichPNFLX(bin(n,1),1)==1 & whichadultVEH(bin(n,1),1)==1
            malesFLXVEH_bins(n,x)=bin(n,1);
        else
            malesFLXVEH_bins(n,x)=NaN;
        end
        
        if whichmales(bin(n,1),1)==1 & whichPNVEH(bin(n,1),1)==1 & whichadultFLX(bin(n,1),1)==1
            malesVEHFLX_bins(n,x)=bin(n,1);
        else
            malesVEHFLX_bins(n,x)=NaN;
        end
        
        if whichfemales(bin(n,1),1)==1 & whichPNFLX(bin(n,1),1)==1 & whichadultVEH(bin(n,1),1)==1
            femalesFLXVEH_bins(n,x)=bin(n,1);
        else
            femalesFLXVEH_bins(n,x)=NaN;
        end
        
        if whichfemales(bin(n,1),1)==1 & whichPNVEH(bin(n,1),1)==1 & whichadultFLX(bin(n,1),1)==1
            femalesVEHFLX_bins(n,x)=bin(n,1);
        else
            femalesVEHFLX_bins(n,x)=NaN;
        end
    end
end
% remove NaNs

    remove=isnan(malesPNFLX_bins(:,x));
    malesPNFLX_bins(remove,:)=[];
    clear remove
    
    remove=isnan(malesPNVEH_bins(:,x));
    malesPNVEH_bins(remove,:)=[];
    clear remove
    
    remove=isnan(femalesPNFLX_bins(:,x));
    femalesPNFLX_bins(remove,:)=[];
    clear remove
    
    remove=isnan(femalesPNVEH_bins(:,x));
    femalesPNVEH_bins(remove,:)=[];
    clear remove
    
    remove=isnan(malesFLXFLX_bins(:,x));
    malesFLXFLX_bins(remove,:)=[];
    clear remove
    
    remove=isnan(malesVEHVEH_bins(:,x));
    malesVEHVEH_bins(remove,:)=[];
    clear remove
    
    remove=isnan(femalesFLXFLX_bins(:,x));
    femalesFLXFLX_bins(remove,:)=[];
    clear remove
    
    remove=isnan(femalesVEHVEH_bins(:,x));
    femalesVEHVEH_bins(remove,:)=[];
    clear remove
    
    remove=isnan(malesFLXVEH_bins(:,x));
    malesFLXVEH_bins(remove,:)=[];
    clear remove
    
    remove=isnan(malesVEHFLX_bins(:,x));
    malesVEHFLX_bins(remove,:)=[];
    clear remove
    
    remove=isnan(femalesFLXVEH_bins(:,x));
    femalesFLXVEH_bins(remove,:)=[];
    clear remove
    
    remove=isnan(femalesVEHFLX_bins(:,x));
    femalesVEHFLX_bins(remove,:)=[];
    clear remove
    
%for by box analysis
for x=1:numbins
    bin=find((DataFile.Interval)==x);
    for n=1:length(bin)
        if whichbox1(bin(n,1),1)==1 
            box1_bins(n,x)=bin(n,1);
        else
            box1_bins(n,x)=NaN;
        end
        if whichbox2(bin(n,1),1)==1 
            box2_bins(n,x)=bin(n,1);
        else
            box2_bins(n,x)=NaN;
        end
        if whichbox3(bin(n,1),1)==1 
            box3_bins(n,x)=bin(n,1);
        else
            box3_bins(n,x)=NaN;
        end
        if whichbox4(bin(n,1),1)==1 
            box4_bins(n,x)=bin(n,1);
        else
            box4_bins(n,x)=NaN;
        end
        if whichbox5(bin(n,1),1)==1 
            box5_bins(n,x)=bin(n,1);
        else
            box5_bins(n,x)=NaN;
        end
        if whichbox6(bin(n,1),1)==1 
            box6_bins(n,x)=bin(n,1);
        else
            box6_bins(n,x)=NaN;
        end
        if whichbox7(bin(n,1),1)==1 
            box7_bins(n,x)=bin(n,1);
        else
            box7_bins(n,x)=NaN;
        end
        if whichbox8(bin(n,1),1)==1 
            box8_bins(n,x)=bin(n,1);
        else
            box8_bins(n,x)=NaN;
        end
        if whichbox9(bin(n,1),1)==1 
            box9_bins(n,x)=bin(n,1);
        else
            box9_bins(n,x)=NaN;
        end
        if whichbox10(bin(n,1),1)==1 
            box10_bins(n,x)=bin(n,1);
        else
            box10_bins(n,x)=NaN;
        end
    end
end
    remove=isnan(box1_bins(:,x));
    box1_bins(remove,:)=[];
    clear remove
    remove=isnan(box2_bins(:,x));
    box2_bins(remove,:)=[];
    clear remove
    remove=isnan(box3_bins(:,x));
    box3_bins(remove,:)=[];
    clear remove
    remove=isnan(box4_bins(:,x));
    box4_bins(remove,:)=[];
    clear remove
    remove=isnan(box5_bins(:,x));
    box5_bins(remove,:)=[];
    clear remove
    remove=isnan(box6_bins(:,x));
    box6_bins(remove,:)=[];
    clear remove
    remove=isnan(box7_bins(:,x));
    box7_bins(remove,:)=[];
    clear remove
    remove=isnan(box8_bins(:,x));
    box8_bins(remove,:)=[];
    clear remove
    remove=isnan(box9_bins(:,x));
    box9_bins(remove,:)=[];
    clear remove
    remove=isnan(box10_bins(:,x));
    box10_bins(remove,:)=[];
    clear remove
%% organizing by measure using template

%cleaning up some variables
clear bin whichfemales whichmales whichPNFLX whichPNVEH whichadultFLX whichadultVEH whichbox1 whichbox2 whichbox3 whichbox4 whichbox5 whichbox6 whichbox7 whichbox8 whichbox9 whichbox10

allgroups={malesFLXFLX_bins,malesVEHVEH_bins,femalesFLXFLX_bins,femalesVEHVEH_bins,malesFLXVEH_bins,malesVEHFLX_bins,femalesFLXVEH_bins,femalesVEHFLX_bins};

% allgroups={malesPNFLX_bins,malesPNVEH_bins,femalesPNFLX_bins,femalesPNVEH_bins};

%determine ID numbers for each group
for a=1:length(allgroups)
        IDs{1,a}=DataFile.ID(allgroups{1,a}(:,1));  
end

for a=1:length(allgroups)
    for x=1:numbins
        basic_movements{1,a}(:,x)=DataFile.BasicMovements(allgroups{1,a}(:,x));  
        for y=1:length(basic_movements{1,a}(:,x))
            basic_movements_avgs{1,a}(y,1)=nanmean(basic_movements{1,a}(y,:));
        end
    end
end
% for a=1:length(allgroups)
%     for x=1:numbins
%         basic_movements{1,a}(:,x)=DataFile.BasicMovementsRatio(allgroups{1,a}(:,x));  
%         for y=1:length(basic_movements{1,a}(:,x))
%             basic_movements_avgs{1,a}(y,1)=nanmean(basic_movements{1,a}(y,:));
%         end
%     end
% end

for a=1:length(allgroups)
    for x=1:numbins
        immobility{1,a}(:,x)=DataFile.Immobility(allgroups{1,a}(:,x));  
        for y=1:length(immobility{1,a}(:,x))
            immobility_avgs{1,a}(y,1)=nanmean(immobility{1,a}(y,:));
        end
    end
end

% for a=1:length(allgroups)
%     for x=1:numbins
%         immobility{1,a}(:,x)=DataFile.ImmobilityRatio(allgroups{1,a}(:,x));  
%         for y=1:length(immobility{1,a}(:,x))
%             immobility_avgs{1,a}(y,1)=nanmean(immobility{1,a}(y,:));
%         end
%     end
% end
for a=1:length(allgroups)
    for x=1:numbins
        rearing{1,a}(:,x)=DataFile.Rearing(allgroups{1,a}(:,x));  
        for y=1:length(rearing{1,a}(:,x))
            rearing_avgs{1,a}(y,1)=nanmean(rearing{1,a}(y,:));
        end
    end
end

for a=1:length(allgroups)
    for x=1:numbins
        time_rearing{1,a}(:,x)=DataFile.TMRearing(allgroups{1,a}(:,x));
        for y=1:length(time_rearing{1,a}(:,x))
            time_rearing_avgs{1,a}(y,1)=nanmean(time_rearing{1,a}(y,:));
        end
    end
end

% 
% for a=1:length(allgroups)
%     for x=1:numbins
%         time_rearing{1,a}(:,x)=DataFile.TMRearingRatio(allgroups{1,a}(:,x));
%         for y=1:length(time_rearing{1,a}(:,x))
%             time_rearing_avgs{1,a}(y,1)=nanmean(time_rearing{1,a}(y,:));
%         end
%     end
% end
for a=1:length(allgroups)
    for x=1:numbins
%         periphery_distance{1,a}(:,x)=DataFile.Zone1Distancein(allgroups{1,a}(:,x));    
          periphery_distance{1,a}(:,x)=DataFile.PeripheryDistancein(allgroups{1,a}(:,x));    
        for y=1:length(periphery_distance{1,a}(:,x))
            periphery_distance_avgs{1,a}(y,1)=nanmean(periphery_distance{1,a}(y,:));
        end
    end
end

for a=1:length(allgroups)
    for x=1:numbins
%         periphery_time{1,a}(:,x)=DataFile.Zone1TotTimesec(allgroups{1,a}(:,x));    
        periphery_time{1,a}(:,x)=DataFile.PeripheryTotTimesec(allgroups{1,a}(:,x));    
        for y=1:length(periphery_time{1,a}(:,x))
            periphery_time_avgs{1,a}(y,1)=nanmean(periphery_time{1,a}(y,:));
        end
    end
end

for a=1:length(allgroups)
    for x=1:numbins
%         center_distance{1,a}(:,x)=DataFile.Zone2Distancein(allgroups{1,a}(:,x));    
        center_distance{1,a}(:,x)=DataFile.CenterDistancein(allgroups{1,a}(:,x));            
        for y=1:length(center_distance{1,a}(:,x))
            center_distance_avgs{1,a}(y,1)=nanmean(center_distance{1,a}(y,:));
        end
    end
end

for a=1:length(allgroups)
    for x=1:numbins
%         center_time{1,a}(:,x)=DataFile.Zone2TotTimesec(allgroups{1,a}(:,x));    
        center_time{1,a}(:,x)=DataFile.CenterTotTimesec(allgroups{1,a}(:,x));    
        for y=1:length(center_time{1,a}(:,x))
            center_time_avgs{1,a}(y,1)=nanmean(center_time{1,a}(y,:));
        end
    end
end
% for a=1:length(allgroups)
%     for x=1:numbins
% %         center_time{1,a}(:,x)=DataFile.Zone2TotTimesec(allgroups{1,a}(:,x));    
%         center_time{1,a}(:,x)=DataFile.CenterTotTimesecRatio(allgroups{1,a}(:,x));    
%         for y=1:length(center_time{1,a}(:,x))
%             center_time_avgs{1,a}(y,1)=nanmean(center_time{1,a}(y,:));
%         end
%     end
% end
for a=1:length(center_time)
    for x=1:numbins
        for y=1:length(center_time{1,a}(:,x))
            CPtime_ratio{1,a}(y,x)=(center_time{1,a}(y,x))/(periphery_time{1,a}(y,x));
        end
        for y=1:length(CPtime_ratio{1,a}(:,x))
            CPtime_ratio_avgs{1,a}(y,1)=nanmean(CPtime_ratio{1,a}(y,:));
        end
    end
end

for a=1:length(center_distance)
    for x=1:numbins
        for y=1:length(center_distance{1,a}(:,x))
            CPdistance_ratio{1,a}(y,x)=(center_distance{1,a}(y,x))/(periphery_distance{1,a}(y,x));
        end
        for y=1:length(CPdistance_ratio{1,a}(:,x))
            CPdistance_ratio_avgs{1,a}(y,1)=nanmean(CPdistance_ratio{1,a}(y,:));
        end
    end
end

allboxes={box1_bins, box2_bins, box3_bins, box4_bins, box5_bins, box6_bins, box7_bins, box8_bins, box9_bins, box10_bins};

for a=1:length(allboxes)
    for x=1:numbins
        bybox_center_time{1,a}(:,x)=DataFile.CenterTotTimesec(allboxes{1,a}(:,x));   
%         bybox_center_time{1,a}(:,x)=DataFile.Zone2TotTimesec(allboxes{1,a}(:,x));    
        for y=1:length(bybox_center_time{1,a}(:,x))
            bybox_center_time_avgs{1,a}(y,1)=nanmean(bybox_center_time{1,a}(y,:));
        end
    end
end

for a=1:length(allboxes)
    for x=1:numbins
        bybox_basic_movements{1,a}(:,x)=DataFile.BasicMovements(allboxes{1,a}(:,x));  
        for y=1:length(bybox_basic_movements{1,a}(:,x))
            bybox_basic_movements_avgs{1,a}(y,1)=nanmean(bybox_basic_movements{1,a}(y,:));
        end
    end
end

clear a ans filename n numbins x y malesPNFLX_bins malesPNVEH_bins femalesPNFLX_bins femalesPNVEH_bins femalesFLXFLX_bins...
    femalesFLXVEH_bins femalesVEHFLX_bins femalesVEHVEH_bins malesFLXFLX_bins malesFLXVEH_bins malesVEHFLX_bins malesVEHVEH_bins...
    box1_bins box2_bins box3_bins box4_bins box5_bins box6_bins box7_bins box8_bins box9_bins box10_bins

% savepath='Y:\Eric and Sarah\Behavior\Developmental Tianeptine Study\Dev FLX Adult TIA Crossover Study (DAALTO)\Behavioral Data\Open Field\Post FLX treatment'; %change the savepath if you want to save in a different folder
% save([savepath,'\','DAALTO_pre_postFLXcomp_10min_stdcenter.mat'])