function melodyPollHistogram(dist)
    n_sub = size(dist, 2);
    n_comp = size(dist, 1);
    counts_exact = zeros(n_sub, 1);
    counts_close = zeros(n_sub, 1);
    for i = 1:n_comp
        dist_set = unique(dist(i, :));
        count_exact_max = 0;
        count_close_max = 0;
        for j = 1:length(dist_set)
            count_exact_temp = sum(dist(i, :) == dist_set(j));
            if count_exact_temp > count_exact_max
                count_exact_max = count_exact_temp;
            end
            count_close_temp = sum(and(dist(i, :) <= dist_set(j) + 1, dist(i, :) >= dist_set(j) - 1));
            if count_close_temp > count_close_max
                count_close_max = count_close_temp;
            end
        end
        counts_exact(count_exact_max) = counts_exact(count_exact_max) + 1;
        counts_close(count_close_max) = counts_close(count_close_max) + 1;
    end
    subplot(1, 2, 1);
    bar((1:n_sub)', counts_exact);
    set(gca, 'FontSize', 18);
    title('Same Rating', 'FontSize', 36);
    xlabel('Number of Students', 'FontSize', 24);
    ylabel('Number of Trials', 'FontSize', 24);
    xlim([0.5, n_sub + 0.5]);
    ylim([0, n_comp]);
    subplot(1, 2, 2);
    bar((1:n_sub)', counts_close);
    set(gca, 'FontSize', 18);
    title('Rating Within One', 'FontSize', 36);
    xlabel('Number of Students', 'FontSize', 24);
    ylabel('Number of Trials', 'FontSize', 24);
    xlim([0.5, n_sub + 0.5]);
    ylim([0, n_comp]);
end