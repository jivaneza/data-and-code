use_bpm 120

define :intro do
  use_synth :piano
  play :C4, release: 4, amp: 0.3
  sleep 1
  play :A, amp: 04, attack: 2
  sleep 1
  play :C, amp: 0.5, attack: 1
  sleep 1
end

define :outro do
  use_synth :piano
  play_chord chord(:C4, :major), release: 4, amp: 0.3
  sleep 4
end

define :upbeat_melody do
  use_synth :piano
  play_pattern_timed [:C4, :E4, :G4, :B4], [0.5, 0.5, 0.5, 0.5], attack: 0.2, release: 0.3, amp: 0.7
end

define :melody_two do
  use_synth :piano
  play_pattern_timed [:C4, :E4, :G4, :B4], [0.5, 0.5, 0.5, 0.5], attack: 0.2, release: 0.3, amp: 0.7
  play :G4, amp: 2, attack: 0.5, release: 1
  sleep 0.5
  play :B4, amp: 2, attack: 0.5, release: 1
  sleep 0.5
  play :D5, amp: 2, attack: 0.5, release: 1
  sleep 0.5
  play :F5, amp: 2, attack: 0.5, release: 1
end

define :upbeat_bass do
  use_synth :saw
  play_pattern_timed [:C2, :E2, :G2, :B2], [0.5, 0.5, 0.5, 0.5], release: 0.3, amp: 0.5
end

define :upbeat_percussion do
  sample :bd_haus, amp: 1.5
  sleep 0.5
  sample :sn_dub, amp: 1
  sleep 0.5
end

define :upbeat_chords do
  use_synth :piano
  play_chord chord(:C4, :major), release: 1, amp: 0.5
  sleep 1
end

define :variation do
  use_synth :piano
  play_pattern_timed [:G4, :B4, :D5, :F5], [0.25, 0.25, 0.25, 0.25], attack: 0.1, release: 0.2, amp: 0.6
  play :G4, amp: 2, attack: 0.5, release: 1
  sleep 0.5
  play :B4, amp: 2, attack: 0.5, release: 1
  sleep 0.5
  play :D5, amp: 2, attack: 0.5, release: 1
  sleep 0.5
  play :F5, amp: 2, attack: 0.5, release: 1
end

live_loop :upbeat_song do
  intro
  play :C, attack: 4, amp: 4
  sleep 1
  play :C, attack: 4, amp: 5
  2.times do
    upbeat_melody
    upbeat_bass
    upbeat_percussion
    upbeat_chords
  end
  sleep 1
  variation
  sleep 1
  2.times do
    melody_two
    upbeat_bass
    upbeat_percussion
    upbeat_chords
  end
  outro
end
