; chilli-rose.ahk — Rose Field pattern by Cyclone
; Field: walls on bottom-right corner (partial bottom + partial right)
;
; Sequence per rep:
;   0. Align      — slam bottom wall then nudge right wall
;   1. Reposition — walk 3 tiles left, 3 tiles up
;   2. Square     — 9x9 counterclockwise: up → left → down → right
;   3. Inner fill — inner square + diamond on midpoints
;   4. Square     — retrace same 9x9 counterclockwise
;   5. Return     — slam bottom wall then nudge right wall
;
; Settings: Size M | Reps 3 | InvertLR off | InvertFB off
;           Camera Left | Sprinkler Lower Right | Distance 7

s := 9 * size              ; 9x9 square side length
si := s * 0.55             ; inner square size
tile := size               ; 1 tile

loop reps {

    ; ==========================================
    ; PHASE 0 — ALIGN to bottom-right corner
    ; Slam bottom wall then short right nudge
    ; ==========================================
    send "{" TCFBKey " down}"
    Walk(15)
    send "{" TCFBKey " up}"

    send "{" TCLRKey " down}"
    Walk(6)
    send "{" TCLRKey " up}"

    ; ==========================================
    ; PHASE 1 — REPOSITION
    ; 3 tiles left, 3 tiles up
    ; ==========================================
    send "{" AFCLRKey " down}"
    Walk(3 * tile)
    send "{" AFCLRKey " up}"

    send "{" AFCFBKey " down}"
    Walk(3 * tile)
    send "{" AFCFBKey " up}"

    ; ==========================================
    ; PHASE 2 — OUTER SQUARE (9x9 counterclockwise)
    ; Start: bottom-right → up → left → down → right
    ; ==========================================

    ; Right edge: up
    send "{" AFCFBKey " down}"
    Walk(s)
    send "{" AFCFBKey " up}"

    ; Top edge: left
    send "{" AFCLRKey " down}"
    Walk(s)
    send "{" AFCLRKey " up}"

    ; Left edge: down
    send "{" TCFBKey " down}"
    Walk(s)
    send "{" TCFBKey " up}"

    ; Bottom edge: right — ends bottom-right of square
    send "{" TCLRKey " down}"
    Walk(s)
    send "{" TCLRKey " up}"

    ; ==========================================
    ; PHASE 3 — INNER FILL
    ; Step inward, trace inner square + diamond
    ; ==========================================

    ; Step inward to bottom-right of inner square
    send "{" AFCLRKey " down}"
    Walk(s * 0.225)
    send "{" AFCLRKey " up}"

    send "{" AFCFBKey " down}"
    Walk(s * 0.225)
    send "{" AFCFBKey " up}"

    ; Inner square counterclockwise: up → left → down → right
    send "{" AFCFBKey " down}"
    Walk(si)
    send "{" AFCFBKey " up}"

    send "{" AFCLRKey " down}"
    Walk(si)
    send "{" AFCLRKey " up}"

    send "{" TCFBKey " down}"
    Walk(si)
    send "{" TCFBKey " up}"

    send "{" TCLRKey " down}"
    Walk(si)
    send "{" TCLRKey " up}"

    ; ends bottom-right of inner square
    ; move to bottom-middle for diamond
    send "{" AFCLRKey " down}"
    Walk(si / 2)
    send "{" AFCLRKey " up}"

    ; Diamond: bottom-mid → left-mid → top-mid → right-mid → bottom-mid
    send "{" AFCLRKey " down}{" AFCFBKey " down}"
    Walk(Sqrt((si/2)**2 + (si/2)**2))
    send "{" AFCLRKey " up}{" AFCFBKey " up}"

    send "{" TCLRKey " down}{" AFCFBKey " down}"
    Walk(Sqrt((si/2)**2 + (si/2)**2))
    send "{" TCLRKey " up}{" AFCFBKey " up}"

    send "{" TCLRKey " down}{" TCFBKey " down}"
    Walk(Sqrt((si/2)**2 + (si/2)**2))
    send "{" TCLRKey " up}{" TCFBKey " up}"

    send "{" AFCLRKey " down}{" TCFBKey " down}"
    Walk(Sqrt((si/2)**2 + (si/2)**2))
    send "{" AFCLRKey " up}{" TCFBKey " up}"

    ; back at bottom-mid, walk to bottom-right of outer square
    send "{" TCLRKey " down}"
    Walk(si / 2 + s * 0.225)
    send "{" TCLRKey " up}"

    send "{" TCFBKey " down}"
    Walk(s * 0.225)
    send "{" TCFBKey " up}"

    ; ==========================================
    ; PHASE 4 — RETRACE OUTER SQUARE (counterclockwise)
    ; Start: bottom-right
    ; ==========================================

    send "{" AFCFBKey " down}"
    Walk(s)
    send "{" AFCFBKey " up}"

    send "{" AFCLRKey " down}"
    Walk(s)
    send "{" AFCLRKey " up}"

    send "{" TCFBKey " down}"
    Walk(s)
    send "{" TCFBKey " up}"

    send "{" TCLRKey " down}"
    Walk(s)
    send "{" TCLRKey " up}"

    ; ==========================================
    ; PHASE 5 — RETURN to bottom-right corner
    ; ==========================================
    send "{" TCFBKey " down}"
    Walk(15)
    send "{" TCFBKey " up}"

    send "{" TCLRKey " down}"
    Walk(6)
    send "{" TCLRKey " up}"

}
