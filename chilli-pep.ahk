; chilli.ahk — Pepper Patch pattern by Hylite
; Field: 28 wide x 21 tall | Walls: TOP + LEFT + RIGHT (open bottom)
;
; Sequence per rep:
;   0. Align      — slam top wall then nudge right wall (short)
;   1. Reposition — walk 6 tiles left, 4 tiles down
;   2. Square     — 9x9 clockwise: down → left → up → right
;   3. Inner fill — spiral inward: smaller square then diamond
;   4. Square     — retrace same 9x9 clockwise
;   5. Return     — slam top wall then nudge right wall
;
; Settings: Size M | Reps 3 | InvertLR off | InvertFB off
;           Camera Left | Sprinkler Upper Right | Distance 7

s := 9 * size              ; 9x9 square side length
h := s / 2                 ; half = midpoint
si := s * 0.55             ; inner square size (~5 tiles)
d := Sqrt(s**2 + s**2)     ; full diagonal
tile := size               ; 1 tile

loop reps {

    ; ==========================================
    ; PHASE 0 — ALIGN to top-right corner
    ; Short right nudge to avoid grinding wall
    ; ==========================================
    send "{" TCFBKey " down}"
    Walk(15)
    send "{" TCFBKey " up}"

    send "{" AFCLRKey " down}"
    Walk(6)
    send "{" AFCLRKey " up}"

    ; ==========================================
    ; PHASE 1 — REPOSITION
    ; 6 tiles left, 4 tiles down
    ; ==========================================
    send "{" TCLRKey " down}"
    Walk(6 * tile)
    send "{" TCLRKey " up}"

    send "{" AFCFBKey " down}"
    Walk(4 * tile)
    send "{" AFCFBKey " up}"

    ; ==========================================
    ; PHASE 2 — OUTER SQUARE (9x9 clockwise)
    ; Start: top-right → down → left → up → right
    ; ==========================================

    send "{" AFCFBKey " down}"
    Walk(s)
    send "{" AFCFBKey " up}"

    send "{" TCLRKey " down}"
    Walk(s)
    send "{" TCLRKey " up}"

    send "{" TCFBKey " down}"
    Walk(s)
    send "{" TCFBKey " up}"

    send "{" AFCLRKey " down}"
    Walk(s)
    send "{" AFCLRKey " up}"

    ; ends top-right of square

    ; ==========================================
    ; PHASE 3 — INNER FILL
    ; Step inward to inner square start, trace
    ; inner square, then diamond on its midpoints
    ; ==========================================

    ; Step inward to top-right of inner square
    send "{" TCLRKey " down}"
    Walk(s * 0.225)
    send "{" TCLRKey " up}"

    send "{" AFCFBKey " down}"
    Walk(s * 0.225)
    send "{" AFCFBKey " up}"

    ; Inner square clockwise: down → left → up → right
    send "{" AFCFBKey " down}"
    Walk(si)
    send "{" AFCFBKey " up}"

    send "{" TCLRKey " down}"
    Walk(si)
    send "{" TCLRKey " up}"

    send "{" TCFBKey " down}"
    Walk(si)
    send "{" TCFBKey " up}"

    send "{" AFCLRKey " down}"
    Walk(si)
    send "{" AFCLRKey " up}"

    ; ends top-right of inner square
    ; now do diamond on inner square midpoints

    ; Move to top-middle of inner square
    send "{" TCLRKey " down}"
    Walk(si / 2)
    send "{" TCLRKey " up}"

    ; Diamond: top-mid → right-mid → bottom-mid → left-mid → top-mid
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

    ; back at top-mid of inner square, walk to top-right of outer square
    send "{" AFCLRKey " down}"
    Walk(si / 2 + s * 0.225)
    send "{" AFCLRKey " up}"

    send "{" TCFBKey " down}"
    Walk(s * 0.225)
    send "{" TCFBKey " up}"

    ; ==========================================
    ; PHASE 4 — RETRACE OUTER SQUARE (clockwise)
    ; Start: top-right, same as phase 2
    ; ==========================================

    send "{" AFCFBKey " down}"
    Walk(s)
    send "{" AFCFBKey " up}"

    send "{" TCLRKey " down}"
    Walk(s)
    send "{" TCLRKey " up}"

    send "{" TCFBKey " down}"
    Walk(s)
    send "{" TCFBKey " up}"

    send "{" AFCLRKey " down}"
    Walk(s)
    send "{" AFCLRKey " up}"

    ; ends top-right of square

    ; ==========================================
    ; PHASE 5 — RETURN to top-right corner
    ; Short right nudge, no grinding
    ; ==========================================
    send "{" TCFBKey " down}"
    Walk(15)
    send "{" TCFBKey " up}"

    send "{" AFCLRKey " down}"
    Walk(6)
    send "{" AFCLRKey " up}"

}
