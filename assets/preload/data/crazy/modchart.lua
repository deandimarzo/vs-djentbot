function start(song)
    djentMode = "magnet"    
end


function update (elapsed)

    local currentBeat = (songPos / 1000)*(bpm/60)
    
    -- Swirly mode
    if djentMode == "swirly" then
        for i=0,7 do
            if (i < 4) then
                -- setActorX(_G['defaultStrum2X'] + (32 * math.sin((currentBeat + i*0.25) * math.pi) * 4), i)
                -- setActorY(_G['defaultStrum2Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
            else
                setActorX(_G['defaultStrum5X'] + (32 * math.sin((currentBeat + i*0.25) * math.pi) * 4), i)
                setActorY(_G['defaultStrum5Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
            end

        end
    end
    
    if djentMode == "magnet" then
        for i=0,7 do
            if (i < 4) then
                -- setActorX(_G['defaultStrum2X'] + (32 * math.sin((currentBeat + i*0.25) * math.pi) * 4), i)
                -- setActorY(_G['defaultStrum2Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
            else
                setActorX(_G['defaultStrum5X'], i)
                setActorY(_G['defaultStrum5Y'], i)
            end

        end
    end
    
    

end
