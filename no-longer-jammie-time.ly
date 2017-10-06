\version "2.14.2"

\header {
  title = "This Is My Father‘s World"
  % Remove default LilyPond tagline
  tagline = ##f
}

\paper {
  #(set-paper-size "letter")
}

global = {
  \key g \major
  \time 4/4
  \partial 2
}

sopranoVoice = \relative c'' {
  \global
  \dynamicUp
  r2 | r1 | r4 d8(c) b4 a | b b c2~ |
  c4 b8(a) g4 b | c d d2~ | d4 c b a |
  g4 a8(b) a4 b8(c) | d4 e fis8(e) d4 |
  b4 c d2~ | d4 fis fis e | d d e2~ | e4
  fis8(e) d4 d | c b a2~ | a4 g a2 |
  a4 a8(b) c2 | d2.
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

altoVoice = \relative c' {
  \global
  \dynamicUp
  % Music follows here.
  \transpose f d \relative c' {
  % Music follows here.
  r4 f8 (g) | a4 c a g | f2. g8 (a) | bes4 d c a | g2. \bar ""
  d'4 c a a g8(f) | a4 g f c | f8(g) a4 c g8(a) | f2. \bar ""
  c'4 | f c d es? | f2. f8(es?) | d4 f es? d c2. \bar ""
  d4 | c4 a a g8(f) | a4 g f c | f8(g) a4 c g8(a) | f2. \bar "|."
  }  
}

verseAltoVoice = \lyricmode {
  % Lyrics follow here.
  This is my fa -- ther's world,
  and to my lis -- tening ears
  all na -- ture sings, and round me rings
  the mu -- sic of the spheres.
  
  This is my fa -- ther's world:
  I rest me in the thought
  of rocks and trees, of skies and seas,
  His hand the won -- ders wrought.  
}

tenorVoice = \relative c' {
  \global
  \dynamicUp
  % Music follows here.
  d2 | c2 b | a2 g | g2 fis |
  e2 d | e fis | d1 |
  d2 e | fis d | fis g |
  a2 b | b g | a d | fis d |
  d d | d4 d2 d4 | d2.
}

verseTenorVoice = \lyricmode {
  % Lyrics follow here.
  This is my fa -- ther's world:
  I rest me in the thought
  of rocks and trees, of skies and seas,
  His hand the won -- ders wrought.
  His hand the won -- ders wrought.
}

sopranoVoicePart = \new Staff \with {
  instrumentName = "Soprano"
  midiInstrument = "violin"
  \consists "Ambitus_engraver"
} { \sopranoVoice }
\addlyrics { \verseSopranoVoice }

altoVoicePart = \new Staff \with {
  instrumentName = "Alto"
  midiInstrument = "violin"
  \consists "Ambitus_engraver"
} { \altoVoice }
\addlyrics { \verseAltoVoice }

tenorVoicePart = \new Staff \with {
  instrumentName = "Tenor"
  midiInstrument = "violin"
  \consists "Ambitus_engraver"
} { \clef "bass" \tenorVoice }
\addlyrics { \verseTenorVoice }

\score {
  <<
    \sopranoVoicePart
    \altoVoicePart
    \tenorVoicePart
  >>
  \layout { }
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 100 4)
    }
  }
}
