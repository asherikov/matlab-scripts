%
% Merges two structures with conflicting fields. The conflicting fields are
% assigned to the values obtained from the second structure.
%
% Source: http://stackoverflow.com/questions/38645/what-are-some-efficient-ways-to-combine-two-structures-in-matlab
%
function out_struct = merge_structs (in_struct1, in_struct2)
    concat_cell = [ fieldnames(in_struct1)' fieldnames(in_struct2)';
                    struct2cell(in_struct1)' struct2cell(in_struct2)'];

    [_junk, rows] = unique(concat_cell(1,:), 'last');

    filtered_cell = concat_cell(:, rows);

    out_struct = struct(filtered_cell{:});
end
