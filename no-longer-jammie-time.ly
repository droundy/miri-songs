\version "2.14.2"

\header {
  title = "No Longer Jammie Time"
  composer = "David Roundy"
  % Remove default LilyPond tagline
  tagline = ##f
}

\paper {
  #(set-paper-size "letter")
}

global = {
  \key g \major
  \time 4/4
  \partial 2.
}

sopranoVoice = \relative c'' {
  \global
  \dynamicUp
  r2 | r1 |
}

verseSopranoVoice = \lyricmode {
  % Lyrics follow here.
  This is my fa -- ther's world,
  and to my lis -- tening ears
  all na -- ture sings, and round me rings
  the mu -- sic of the spheres.
  
  This is my fa -- ther's world:
  I rest me in the thought
  %of rocks and trees, of skies and seas,
  His hand the won -- ders wrought.
}

tenorVoice = \relative c {
  \global
  \dynamicUp
  % Music follows here.
  \repeat volta 2 {
  d4. d |
  \time 7/8
  g8 g g b b g4 e8 e e a fis d4 g8 g g b b g4
  \time 4/4 e8 a4 g4 g8 fis4 g4
  d4. d |
  \time 7/8 g8 g g b b g4 e8 e e a fis d4 g8 g g b b g4
  \time 4/4 e4 a8 g4 g8 fis4
  g2 r4
  d4
  g4. b g4 e4 a2 g4 fis4. a fis4 fis g2
  d4 g4. b g4 e4 a2 g4 fis4. a fis4 fis g2 r4
  d4
  }
}

verseTenorVoice = \lyricmode {
  It is
  no long -- er jam -- mie time!
  no long -- er jam -- mie time!
  no long -- er jam -- mie time!
  It is time to get dressed.
  It is
  no long -- er jam -- mie time!
  no long -- er jam -- mie time!
  no long -- er jam -- mie time!
  It is time to get dressed.
  I'll take off your sleep sack,
  I'll take off your foot -- ies.
  I'll take off your one -- sie,
  I'll take off your dai -- per...
  'cause
  It is
  no long -- er jam -- mie time!
  no long -- er jam -- mie time!
  no long -- er jam -- mie time!
  It is time to get dressed.
  It is
  no long -- er jam -- mie time!
  no long -- er jam -- mie time!
  no long -- er jam -- mie time!
  It is time to get dressed.
  I'll take off your sleep sack,
  I'll take off your foot -- ies.
  I'll take off your one -- sie,
  I'll take off your dai -- per...
  'cause
}

sopranoVoicePart = \new Staff \with {
  instrumentName = "Soprano"
  midiInstrument = "violin"
  \consists "Ambitus_engraver"
} { \sopranoVoice }
\addlyrics { \verseSopranoVoice }

tenorVoicePart = \new Staff \with {
  instrumentName = "Tenor"
  midiInstrument = "violin"
  \consists "Ambitus_engraver"
} { \clef "treble_8" \tenorVoice }
\addlyrics { \verseTenorVoice }

\score {
  <<
    \sopranoVoicePart
    \tenorVoicePart
  >>
  \layout { }
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 150 4)
    }
  }
}
