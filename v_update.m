function v=v_update(v,anyVmax,d,dec_p)
zero_speed=anyVmax-floor(anyVmax);
v=min(v+1,anyVmax);
v=min(v,d+zero_speed);
if (v-1)==zero_speed
    if rand<dec_p(1)
        v=max(v-1,zero_speed);
    end
else
    if rand<dec_p(2)
        v=max(v-1,zero_speed);
    end
end
end