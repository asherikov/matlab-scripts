function yn = isoctave ()
    yn = exist('OCTAVE_VERSION','builtin') ~= 0;
end
