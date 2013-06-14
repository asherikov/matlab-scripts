function print_plot(plot_file_name, ...
    pp_options = struct('apply_tick_fix', true, ...
                        'fontsize', 18, ...
                        'format', 'eps', ...
                        'pdfcrop', false, ...
                        'eps2eps', true))
% options
%   apply_tick_fix = true
%   fontsize = 18
%   fileformat = 'eps'
%   pdfcrop = false
%   eps2eps = true


% tick fix
    if (isfield(pp_options, 'apply_tick_fix') && (pp_options.apply_tick_fix == true))
        set(gca(),'xtick', get(gca(),'xtick') )
        set(gca(),'position', [0.17,0.15,0.75,0.75]);
    end


% EPS    
    plot_file_name_eps = cstrcat(plot_file_name, '.eps');
    print (plot_file_name_eps, '-deps', '-color', cstrcat('-F:', num2str(pp_options.fontsize)));

    if (isfield(pp_options, 'eps2eps') && (pp_options.eps2eps == true))
        system(cstrcat('eps2eps ', plot_file_name_eps, ' ', plot_file_name_eps, '.tmp'));
        system(cstrcat('mv ', plot_file_name_eps, '.tmp ', plot_file_name_eps));
    end


% PDF
    if (isfield(pp_options, 'fileformat') && (strcmp(pp_options.fileformat,'pdf')))
        system(cstrcat('epstopdf ', plot_file_name_eps));

        if (isfield(pp_options, 'pdfcrop') && (pp_options.pdfcrop == true))
            system(cstrcat('pdfcrop ', plot_file_name, '.pdf'));
            system(cstrcat('mv ', plot_file_name, '-crop.pdf  ', plot_file_name, '.pdf'));
        end

        system(cstrcat('rm ', plot_file_name_eps));
    end
end
