function start(song)
    -- djentMode "magnet" drags all notes into a single column
    -- djentMode "swirly" rotates notes and receptors around a single point like a cyclone
    -- djentMode "sideways" rotates the receptors 90deg so they sit on the right side of the screen

    -- djentLerp = "in" puts the current mode into a transitional lerp INTO the effect, "out" puts it out, and "none" makes the effect happen normally

    djentMode = "none"
    djentLerp = "none"

    lerpVal = 1 -- initialize the lerp Value at 0.
    lerpTime = 25 -- Time for each transition to take
    lerpClock = -1

    lastBeat = 0
    beatTimer = 0
    
end
     
function slerp(pos1, pos2, perc)
    
    slerp_perc = perc ^ 3
    
    return (1-slerp_perc)*pos1 + slerp_perc*pos2 -- Linear Interpolation
end


function update (elapsed)
    
    local currentBeat = (songPos / 1000)*(bpm/60)

    
    local targetBeat = math.floor(2 * (((songPos + 100) / 1000)*(bpm/60))) / 2 -- lands slerp on beat, rounded to eighth note...roughly.
    
    print(targetBeat)
    
    

    -- Actual modchart goes here:
    if (targetBeat == 64) then
        djentMode = "crazy"
        djentLerp = "in"   
        
    end
    if (targetBeat == 72) then
        djentLerp = "out"    
    end
    if (targetBeat == 80) then
        djentMode = "crazy"
        djentLerp = "in"    
    end
    if (targetBeat == 88) then
        djentLerp = "out"    
    end
    if (targetBeat == 99) then
        djentMode = "magnet"
        djentLerp = "in"    
        
    end
    if (targetBeat == 102) then
        djentLerp = "out"    
    end
    if (targetBeat == 104.5) then
        djentMode = "magnet"
        djentLerp = "in"    
    end
    if (targetBeat == 107) then
        djentLerp = "out"    
    end
    if (targetBeat == 110) then
        djentMode = "magnet"
        djentLerp = "in"    
    end
    if (targetBeat == 113) then
        djentLerp = "out"    
    end
    
    if (targetBeat == 116) then
        djentMode = "magnet"
        djentLerp = "in"    
    end
    if (targetBeat == 118.5) then
        djentLerp = "out"    
    end
    if (targetBeat == 121) then
        djentMode = "magnet"
        djentLerp = "in"    
    end
    if (targetBeat == 124) then
        djentLerp = "out"    
    end
    if (targetBeat == 126) then
        djentMode = "magnet"
        djentLerp = "in"    
    end
    if (targetBeat == 127.5) then
        djentLerp = "out"    
    end
    
    if (targetBeat == 128) then
        djentMode = "crazy"
        djentLerp = "in"    
    end
    if (targetBeat == 144) then
        djentMode = "magnet"
        djentLerp = "in"   
    end
    if (targetBeat == 151.5) then
        djentLerp = "out"    
    end
    if (targetBeat == 152) then
        djentMode = "crazy"
        djentLerp = "in"    
    end
    if (targetBeat == 160) then
        djentLerp = "out"    
    end
    
    if (targetBeat == 176) then
        djentMode = "swirly"
        djentLerp = "in"   
    end
    if (targetBeat == 190) then
        djentLerp = "out"    
    end
    if (targetBeat == 208) then
        djentMode = "swirly"
        djentLerp = "in"   
    end
    if (targetBeat == 225) then
        djentLerp = "out"    
    end
    
     if (targetBeat == 227) then
        djentMode = "magnet"
        djentLerp = "in"    
    end
    if (targetBeat == 231) then
        djentLerp = "out"    
    end
    if (targetBeat == 232.5) then
        djentMode = "magnet"
        djentLerp = "in"    
    end
    if (targetBeat == 235) then
        djentLerp = "out"    
    end
    
    if (targetBeat == 238) then
        djentMode = "magnet"
        djentLerp = "in"    
    end
    if (targetBeat == 240) then
        djentLerp = "out"    
    end 
    
    if (targetBeat == 243) then
        djentMode = "magnet"
        djentLerp = "in"    
    end
    if (targetBeat == 247) then
        djentLerp = "out"    
    end
    if (targetBeat == 248.5) then
        djentMode = "magnet"
        djentLerp = "in"    
    end
    if (targetBeat == 251) then
        djentLerp = "out"    
    end
    if (targetBeat == 254) then
        djentMode = "magnet"
        djentLerp = "in"    
    end
    if (targetBeat == 255.5) then
        djentLerp = "out"    
    end
    
     if (targetBeat == 256) then
        djentMode = "crazy"
        djentLerp = "in"    
    end
    if (targetBeat == 271) then
        djentLerp = "out"    
    end
    if (targetBeat == 272) then
        djentMode = "swirly"
        djentLerp = "in"    
    end
    if (targetBeat == 287) then
        djentLerp = "out"    
    end
    if (targetBeat == 292) then
        djentMode = "magnet"
        djentLerp = "in"    
    end
    if (targetBeat == 296) then
        djentMode = "crazy"  
        djentLerp = "in"  
    end
    
    if (targetBeat == 303) then
        djentLerp = "out"    
    end
    if (targetBeat == 303.5) then
        djentMode = "magnet"
        djentLerp = "out"    
    end
    
    if (targetBeat == 304) then
        djentMode = "none"
        djentLerp = "in"    
    end
    
    
    
    
    -- lerp behavior
    if (djentLerp == "in") then
        if (lerpClock == -1) then
            lerpClock = lerpTime
            djentLerp = "none"
            lerpVal = 1
        else 
            lerpVal = 1 - (lerpClock / lerpTime)
            lerpClock = lerpClock - 1
        end
        
        print(lerpClock)
        
    end
    
    if (djentLerp == "out") then
        if (lerpClock == -1) then
            lerpClock = lerpTime
            djentMode = "none"
               djentLerp = "none" 
            lerpVal = 1
        else 
            lerpVal = (lerpClock / lerpTime)
            lerpClock = lerpClock - 1
        end
        print(lerpClock)   
    end

    -- Swirly mode
    if djentMode == "swirly" then
        for i=0,7 do
            if (i > 3) then
                fromX = _G['defaultStrum'..i..'X']
                fromY = _G['defaultStrum'..i..'Y']
                toX =_G['defaultStrum5X'] + ((200) * math.sin((currentBeat/4 + i*0.5) * math.pi))
                toY = _G['defaultStrum5Y'] + ((32) * math.cos((currentBeat/4 + i*0.5) * math.pi))
                
                setActorX(slerp(fromX, toX, lerpVal), i)
                setActorY(slerp(fromY, toY, lerpVal), i)
            end
        end
    end

    -- magnet mode
    if djentMode == "magnet" then
        for i=0,7 do
            if (i > 3) then
                fromX = _G['defaultStrum'..i..'X']
                fromY = _G['defaultStrum'..i..'Y']
                toX = _G['defaultStrum5X']
                toY = _G['defaultStrum5Y']
                
                setActorX(slerp(fromX, toX, lerpVal), i)
                setActorY(slerp(fromY, toY, lerpVal), i)
            end
        end
    end
    
    if djentMode == "crazy" then
       -- testing actor rotation lmao this is great
        for i=0,7 do
           setActorAngle(slerp(0, songPos % 360, lerpVal), i) 
        end
     
    else
        for i=0,7 do
           setActorAngle(0, i) 
        end
    end

end
