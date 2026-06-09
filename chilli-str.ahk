; chilli-str.ahk — Strawberry Field pattern by Cyclone
; Walls: top + right | InvertFB baked in
;
; Settings: Size M | Reps 3 | InvertLR off | InvertFB off
;           Camera Left | Sprinkler Upper Right | Distance 7

s := 9 * size
si := s * 0.55
tile := size

loop reps {

    ; PHASE 0 — ALIGN to top-right corner (short nudge)
    send "{" AFCFBKey " down}"
    Walk(5)
    send "{" AFCFBKey " up}"

    send "{" AFCLRKey " down}"
    Walk(5)
    send "{" AFCLRKey " up}"

    ; PHASE 1 — REPOSITION: 3 left, 5 down
    send "{" TCLRKey " down}"
    Walk(3 * tile)
    send "{" TCLRKey " up}"

    send "{" TCFBKey " down}"
    Walk(5 * tile)
    send "{" TCFBKey " up}"

    ; PHASE 2 — OUTER SQUARE (9x9 clockwise)
    ; Start: top-right → down → left → up → right
    send "{" TCFBKey " down}"
    Walk(s)
    send "{" TCFBKey " up}"

    send "{" TCLRKey " down}"
    Walk(s)
    send "{" TCLRKey " up}"

    send "{" AFCFBKey " down}"
    Walk(s)
    send "{" AFCFBKey " up}"

    send "{" AFCLRKey " down}"
    Walk(s)
    send "{" AFCLRKey " up}"

    ; PHASE 3 — INNER FILL: inner square + diamond
    ; Step inward to top-right of inner square
    send "{" TCLRKey " down}"
    Walk(s * 0.225)
    send "{" TCLRKey " up}"

    send "{" TCFBKey " down}"
    Walk(s * 0.225)
    send "{" TCFBKey " up}"

    ; Inner square clockwise: down → left → up → right
    send "{" TCFBKey " down}"
    Walk(si)
    send "{" TCFBKey " up}"

    send "{" TCLRKey " down}"
    Walk(si)
    send "{" TCLRKey " up}"

    send "{" AFCFBKey " down}"
    Walk(si)
    send "{" AFCFBKey " up}"

    send "{" AFCLRKey " down}"
    Walk(si)
    send "{" AFCLRKey " up}"

    ; Move to top-middle for diamond
    send "{" TCLRKey " down}"
    Walk(si / 2)
    send "{" TCLRKey " up}"

    ; Diamond: top-mid → right-mid → bottom-mid → left-mid → top-mid
    send "{" AFCLRKey " down}{" TCFBKey " down}"
    Walk(Sqrt((si/2)**2 + (si/2)**2))
    send "{" AFCLRKey " up}{" TCFBKey " up}"

    send "{" TCLRKey " down}{" TCFBKey " down}"
    Walk(Sqrt((si/2)**2 + (si/2)**2))
    send "{" TCLRKey " up}{" TCFBKey " up}"

    send "{" TCLRKey " down}{" AFCFBKey " down}"
    Walk(Sqrt((si/2)**2 + (si/2)**2))
    send "{" TCLRKey " up}{" AFCFBKey " up}"

    send "{" AFCLRKey " down}{" AFCFBKey " down}"
    Walk(Sqrt((si/2)**2 + (si/2)**2))
    send "{" AFCLRKey " up}{" AFCFBKey " up}"

    ; Walk back to top-right of outer square
    send "{" AFCLRKey " down}"
    Walk(si / 2 + s * 0.225)
    send "{" AFCLRKey " up}"

    send "{" AFCFBKey " down}"
    Walk(s * 0.225)
    send "{" AFCFBKey " up}"

    ; PHASE 4 — RETRACE OUTER SQUARE (clockwise)
    send "{" TCFBKey " down}"
    Walk(s)
    send "{" TCFBKey " up}"

    send "{" TCLRKey " down}"
    Walk(s)
    send "{" TCLRKey " up}"

    send "{" AFCFBKey " down}"
    Walk(s)
    send "{" AFCFBKey " up}"

    send "{" AFCLRKey " down}"
    Walk(s)
    send "{" AFCLRKey " up}"

    ; PHASE 5 — RETURN to top-right corner (short nudge)
    send "{" AFCFBKey " down}"
    Walk(5)
    send "{" AFCFBKey " up}"

    send "{" AFCLRKey " down}"
    Walk(5)
    send "{" AFCLRKey " up}"

}
