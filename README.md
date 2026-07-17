# SCP-SL-Community-Edition
SCP: SL Community Edition is a open source decompile of SCP: SL 12.0.2
To open the project, Unity 6.3 LTS (6000.3.10f1) is required.

# Currently known bugs:
1. Shotgun 1st-person animations do not synchronize (i.e., when I spectate a player as the host, the shotgun animation is not synced).
2. The shotgun does not reload for clients.
3. The cap's (SCP-268) invisibility doesn't work, and it is not visible in 3rd person.
4. SCP-106 has to get extremely close to grab a target, which shouldn't happen.
5. Many items are missing 3rd-person models and character animations.
6. The bag lacks 1st-person synchronization.
7. SCP lockers/pedestals do not synchronize, nor do items across the facility.
8. Facility structures such as the Armory (where the rifle and grenades spawn), medkit lockers, and SCP-079 generators [also do not sync].
9. If a spectator is watching a player, and that player dies and respawns, the spectator sees a black screen with floating hands (this is fixed if you spawn the spectator as another class and then back to spectator).
10. If you press the middle mouse button while holding the revolver, the animation will play for the player but not for the spectator.
11. Clients cannot talk while waiting for the round to start; only the host can.
12. SCP-939's head rotates weirdly while crouching.
13. SCP-939 has very strange running and walking animations.
14. The number of alive players is displayed incorrectly for the SCPs.
