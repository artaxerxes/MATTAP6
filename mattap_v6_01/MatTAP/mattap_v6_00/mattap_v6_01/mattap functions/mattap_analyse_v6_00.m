function [res, xl] = mattap_analyse_v6_00(stimulus, onsets, max_en)
%MatTAP Analysis Function
%Inputs:
%stimulus: metronome stimulus struct (created during mattap trials)
%onsets: onsets data from mattap eventdetect function
%max_en: number of metronomes
%
%Outputs
% res: results struct containing IRI and Async stats
% xl: results struct formatted for output to Excel

iri{1} = cell(2,2); %create empty cell for IRIs
iri{2} = iri{1}; %1 = sync phase, 2 = cont phase. 
isi = cell(2,2); %empty cell for isi. 

max_metro = 4; %metronome channels
max_taps = 2; %max number of tap channels

onsets_dim = max_metro + (max_metro/2 * max_taps); %space for 2 metronomes, 2 pure pulses (no jitt), + 2 taps per metronome.

if max_en == 1; %need to insert some empty cells to make a consistent array (aim to find more elegant solution!)
   onsets = [onsets(1) {[]} onsets(2) {[]} onsets(3:end)]; %insert gaps for metro 2
end

if length(onsets) < onsets_dim %must be missing tap channel 2
    dlen = onsets_dim - length(onsets); %difference in length
    app_cell = cell(1,dlen); %empty cell to append
    onsets = [onsets app_cell]; %add empty cells
end

tap_onsets = onsets(max_metro+1:max_metro+max_taps); %just input responses.
all_onsets = [onsets;onsets]; %create a double array to separate sync and cont phases. 
for m = 1:max_metro %each metronome chann
    m_ind = ~mod(1:max_metro, 2)+1; %m=3 and m=4 need to access m=1 and m=2 properties!
    if max_en ==1 && m_ind(m) ==2 %if only one metronome, skip metronome 2
        mon = NaN;
        cp_t(m) = NaN;
        all_onsets{1,m} = NaN;
        all_onsets{2,m} = NaN;    
    else
        mon = stimulus{m_ind(m)}.numBeeps; %duration of metronome being 'on'
        if length(onsets{m}) < mon %just in case!
            mon = length(onsets{m});
        end
        if ~isempty(onsets{m}) && length(onsets{m}) > mon
            cp_t(m) = onsets{m}(mon+1); %get cont phase start time.
        else
            cp_t(m) = NaN;
        end
        
        all_onsets{1,m} = onsets{m}(1:mon); %audible metronome beats
        all_onsets{2,m} = onsets{m}(mon+1:end); %silent metronome beats
    end
    for ph = 1:2 %sync and cont phases
        isi{ph,m} = diff(all_onsets{ph,m});
        mn_isi(ph,m) = nanmean(isi{ph,m}); %mean iri
        sd_isi(ph,m) = nanstd(isi{ph,m}); %sd IRI
    end
end

tmp_tap_onsets = cell(length(tap_onsets), max_metro/2); %create empty cell
split_tap_onsets = cell(2,1);
split_tap_onsets(1:2) = {tmp_tap_onsets,tmp_tap_onsets} ; %cell for each phase
mn_iri = nan(2,length(tap_onsets), max_metro/2); %empty matrix for iri
sd_iri = mn_iri; 

for ii = 1:length(tap_onsets) %each response input
    for m = 1:max_en
        if ~isnan(cp_t(m))
            cp_tmp = find(tap_onsets{ii}>= (cp_t(m)- stimulus{m}.isi/2)); %find taps occurring in the continuation phase (upto half period before)
            if ~isempty(cp_tmp)
                cp_ind(ii,m) = cp_tmp(1);
            else
                cp_ind(ii,m) = 0;
            end
        else
            cp_ind(ii,m) = length(tap_onsets{ii});
            cp_tmp = [];
        end
        
        if cp_ind(ii,m) > 0
            split_tap_onsets{1}{ii,m} = tap_onsets{ii}(1:cp_ind(ii,m)); %tap onsets in sync phase
            split_tap_onsets{2}{ii,m} = tap_onsets{ii}(cp_ind(ii,m):end); %tap onsets in cont phase.
        else
            split_tap_onsets{1}{ii,m} = []; %empty
            split_tap_onsets{2}{ii,m} = []; %empty
        end
        all_onsets{1,max_metro + (m-1)*length(tap_onsets) + ii} = split_tap_onsets{1}{ii,m}; %add sync phase and cont phase split taps to all_onsets
        all_onsets{2,max_metro + (m-1)*length(tap_onsets) + ii} = split_tap_onsets{2}{ii,m};
        for ph = 1:2
            iri{ph}{ii,m} = diff(split_tap_onsets{ph}{ii,m}); %get IRI
            mn_iri(ph,ii,m) = nanmean(iri{ph}{ii,m}); %mean iri
            sd_iri(ph,ii,m) = nanstd(iri{ph}{ii,m}); %sd IRI
        end
    end
end

 
%Create struct
res.original_onsets = onsets;
res.all_onsets = all_onsets;
res.isi = isi;
res.mn_isi = mn_isi;
res.sd_isi = sd_isi;
res.cp_t = cp_t; 
res.cp_ind = cp_ind;
res.iri = iri;
res.mn_iri = mn_iri;
res.sd_iri = sd_iri;



%Calc asynchronies
for ph = 1:2 %1 = sync phase, 2 = cont phase
    %Chann 1 = metronome A, 2 = Metronome B, 3 = Pure (no jitt) A, 4 = Pure
    %(no jitt) B, 5 = Response input 1 refA, 6 = Response input 2 refA, 7 =
    %Response input 1 refB, Response input 2 refB;
    
    [asy{ph}, mn_asy{ph}, sd_asy{ph}, aligned_onsets{ph}] = calc_all_asyncs_bi(all_onsets(ph,:));
    
end
        
   
%Create struct
res.asy = asy;
res.mn_asy = mn_asy;
res.sd_asy = sd_asy;
res.aligned_onsets = aligned_onsets;
     
    
    
 
    
    %Generate ISI/IRI outputs for Excel  
    
    IRItab = {'ISI_MA', 'ISI_MB', 'IRI_Resp1_refMA', 'IRI_Resp2_refMA', 'IRI_Resp1_refMB', 'IRI_Resp2_refMB'};
        
    IRIDat_sync = {isi{1,1}, isi{1,2}, iri{1}{1,1}, iri{1}{2,1}, iri{1}{1,2}, iri{1}{2,2}}; %combine IRI values for each tab (will more elegant one day)
    IRIDat_cont = {isi{2,1}, isi{2,2}, iri{2}{1,1}, iri{2}{2,1}, iri{2}{1,2}, iri{2}{2,2}}; %combine IRI values for each tab (will more elegant one day)
    IRIStats_sync = {[mn_isi(1,1);sd_isi(1,1)], [mn_isi(1,2);sd_isi(1,2)],...
                     [mn_iri(1,1,1);sd_iri(1,1,1)], [mn_iri(1,2,1);sd_iri(1,2,1)],...
                     [mn_iri(1,1,2);sd_iri(1,1,2)], [mn_iri(1,2,2);sd_iri(1,2,2)]}; %means and sds
                 
    IRIStats_cont = {[mn_isi(2,1);sd_isi(2,1)], [mn_isi(2,2);sd_isi(2,2)],...
                     [mn_iri(2,1,1);sd_iri(2,1,1)], [mn_iri(2,2,1);sd_iri(2,2,1)],...
                     [mn_iri(2,1,2);sd_iri(2,1,2)], [mn_iri(2,2,2);sd_iri(2,2,2)]}; %means and sds
                 
     %create struct
     xl.IRItab = IRItab;
     xl.IRIDat_sync = IRIDat_sync;
     xl.IRIDat_cont = IRIDat_cont;
     xl.IRIStats_sync = IRIStats_sync;
     xl.IRIStats_cont = IRIStats_cont;
     
                 
     
    %Generate Asynchrony outputs for excel. 
    
    Asytab = {'Asy_Resp1_refMA', 'Asy_Resp2_refMA', 'Asy_Resp1_refMB', 'Asy_Resp2_refMB',...
              'Asy_Resp1_refMApure', 'Asy_Resp2_refMApure', 'Asy_Resp1_refMBpure', 'Asy_Resp2_refMBpure'};
    
%Chann 1 = metronome A, 2 = Metronome B, 3 = Pure (no jitt) A, 4 = Pure (no jitt) B, 5 = Response input 1 refA, 6 = Response input 2 refA, 
% 7 = Response input 1 refB, Response input 2 refB;
    
    asyncs = asy{1}; 
    AsyDat_sync = {asyncs{1,5}, asyncs{1,6}, asyncs{2,7}, asyncs{2,8}, asyncs{3,5}, asyncs{3,6}, asyncs{4,7}, asyncs{4,8}};
    asyncs = asy{2}; 
    AsyDat_cont = {asyncs{1,5}, asyncs{1,6}, asyncs{2,7}, asyncs{2,8}, asyncs{3,5}, asyncs{3,6}, asyncs{4,7}, asyncs{4,8}};
    
    mn_asyncs = mn_asy{1};
    sd_asyncs = sd_asy{1};
    AsyStats_sync = [mn_asyncs(1,5), mn_asyncs(1,6), mn_asyncs(2,7), mn_asyncs(2,8), mn_asyncs(3,5), mn_asyncs(3,6), mn_asyncs(4,7), mn_asyncs(4,8);...
        sd_asyncs(1,5), sd_asyncs(1,6), sd_asyncs(2,7), sd_asyncs(2,8), sd_asyncs(3,5), sd_asyncs(3,6), sd_asyncs(4,7), sd_asyncs(4,8)];
    
    mn_asyncs = mn_asy{2};
    sd_asyncs = sd_asy{2};
    AsyStats_cont = [mn_asyncs(1,5), mn_asyncs(1,6), mn_asyncs(2,7), mn_asyncs(2,8), mn_asyncs(3,5), mn_asyncs(3,6), mn_asyncs(4,7), mn_asyncs(4,8);...
        sd_asyncs(1,5), sd_asyncs(1,6), sd_asyncs(2,7), sd_asyncs(2,8), sd_asyncs(3,5), sd_asyncs(3,6), sd_asyncs(4,7), sd_asyncs(4,8)];
    
    %Create struct
    xl.Asytab = Asytab;
    xl.AsyDat_sync =  AsyDat_sync;
    xl.AsyDat_cont = AsyDat_cont; 
    xl.AsyStats_sync = AsyStats_sync;
    xl.AsyStats_cont = AsyStats_cont;
    
    
    
   