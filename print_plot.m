function print_plot(plot_file_name, pp_options)

    % -----------------
    default_options.apply_tick_fix = true;
    default_options.format = 'eps';
    default_options.pdfcrop = false;
    default_options.eps2eps = true;
    default_options.fontname = 'Arial';
    default_options.fontsize = 18;
    % -----------------

    if (nargin < 2)
        pp_options = default_options;
    else
        pp_options = merge_structs(default_options, pp_options);
    end


% fontname
    h = findall (gcf, '-property', 'fontname');
    set (h, 'fontname', pp_options.fontname);


% tick fix
    if (pp_options.apply_tick_fix == true)
        set(gca(),'xtick', get(gca(),'xtick') )
        set(gca(),'position', [0.17,0.15,0.75,0.75]);
    end


% EPS    
    plot_file_name_eps = cstrcat(plot_file_name, '.eps');
    print (plot_file_name_eps, '-deps', '-color', cstrcat('-F:', num2str(pp_options.fontsize)));

    if (pp_options.eps2eps == true)
        system(cstrcat('eps2eps ', plot_file_name_eps, ' ', plot_file_name_eps, '.tmp'));
        system(cstrcat('mv ', plot_file_name_eps, '.tmp ', plot_file_name_eps));
    end


% PDF
    if (strcmp(pp_options.format,'pdf'))
        system(cstrcat('epstopdf ', plot_file_name_eps));

        if (pp_options.pdfcrop == true)
            system(cstrcat('pdfcrop ', plot_file_name, '.pdf'));
            system(cstrcat('mv ', plot_file_name, '-crop.pdf  ', plot_file_name, '.pdf'));
        end

        system(cstrcat('rm ', plot_file_name_eps));
    end
end
