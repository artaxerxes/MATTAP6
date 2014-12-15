function [asyncs, mn_asyncs, sd_asyncs, aligned_onsets] = calc_all_asyncs_bi(all_onsets)

max_jj = length(all_onsets);
    max_ii = max_jj-1;
    for ii = 1:max_ii
        for jj = ii+1:max_jj
            tmp_aligned = warp_align_sheff(all_onsets{ii}, all_onsets{jj});
            if isempty(tmp_aligned)
                tmp_aligned = [NaN NaN]; %fill with NaN to stop it falling over. 
            end
            aligned_onsets{ii, jj} = tmp_aligned;
            tmp_asyncs = tmp_aligned(:,2) - tmp_aligned(:,1); %asyncs
            asyncs{ii,jj} = tmp_asyncs;
            mn_asyncs(ii,jj) = nanmean(tmp_asyncs); %mean of asyncs
            sd_asyncs(ii,jj) = nanstd(tmp_asyncs); %SD of asyncs
        end
    end
    
    %reversed
    
    for ii = 1:max_ii
        for jj = ii+1:max_jj
            tmp_aligned = warp_align_sheff(all_onsets{jj}, all_onsets{ii});
            if isempty(tmp_aligned)
                tmp_aligned = [NaN NaN]; %fill with NaN to stop it falling over. 
            end
            aligned_onsets{jj, ii} = tmp_aligned;
            tmp_asyncs = tmp_aligned(:,2) - tmp_aligned(:,1); %asyncs
            asyncs{jj,ii} = tmp_asyncs;
            mn_asyncs(jj,ii) = nanmean(tmp_asyncs); %mean of asyncs
            sd_asyncs(jj,ii) = nanstd(tmp_asyncs); %SD of asyncs
        end
    end