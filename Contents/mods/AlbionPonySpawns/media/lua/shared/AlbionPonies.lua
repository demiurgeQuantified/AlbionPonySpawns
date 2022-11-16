---Returns a numerically indexed table that is the combination of the two input tables.
---@param a table
---@param b table
---@return table
local function MergeTables(a, b)
    if not a then return b elseif not b then return a end
    local result = {}
    for _,v in pairs(a) do
        table.insert(result, v)
    end
    for _,v in pairs(b) do
        table.insert(result, v)
    end
    return result
end

local Ponies = {}

Ponies.gen4Ponies = {'FluttershyPlushie', 'RarityPlushie', 'ApplejackPlushieHat', 'ShiningArmorPlushie', 'RainbowDashPlushie', 'DerpyHoovesPlushie',
'TwilightSparklePlushie', 'PinkiePiePlushie', 'CelestiaPlushie', 'LunaPlushie', 'CadancePlushie', 'ChrysalisPlushie', 'SpitfirePlushie',
'OctaviaPlushie', 'VinylScratchPlushie', 'HoovesPlushie', 'CheerileePlushie', 'LyraPlushie', 'BonbonPlushie', 'BigMacPlushie', 'SongbirdPlushie',
'ZecoraPlushie', 'TrixieLulamoonPlushie', 'SoarinPlushie', 'GrannySmithPlushie', 'BraeburnPlushieComplete', 'CaramelApplePlushie',
'NightmareMoonPlushie', 'StarlightGlimmerPlushie', 'SunsetShimmerPlushie', 'ScootalooPlushie', 'SweetiePlushie', 'ApplebloomPlushie',
'WoonaPlushie', 'SpikePlushie'}

Ponies.otherGens = {'HitchPlushie', 'SproutPlushie', 'ZippPlushie', 'SunnyPlushie', 'IzzyPlushie', 'PippPetalsPlushie', 'FizzyPlushie'}

Ponies.ocs = {'PompPlushie', 'CosmosPlushie', 'SunlightPlushie', 'LuckyPlushie', 'SlidingBoltPlushie', 'BastlerPlushie', 'PastelPlushie',
'AnonfillyPlushie', 'LightyPlushie', 'GrapefruitPlushie', 'JubileePlushie', 'ScarletPlushie', 'TechnoColtPlushie', 'SoulHarmonyPlushie',
'NuximuPlushie', 'BakerPlushie', 'SofiePlushie', 'MoonbowPlushie', 'CelestialAegisPlushie', 'LilyPlushie', 'BlueSkiesPlushie', 'FeatherBloomPlushie',
'BitRateCompletePlushie', 'ZenithPlushie'}

Ponies.albionSpawnlist = {'FluttershyPlushie', 'RarityPlushie', 'ApplejackPlushieHat', 'RainbowDashPlushie', 'DerpyHoovesPlushie',
'TwilightSparklePlushie', 'PinkiePiePlushie', 'CelestiaPlushie', 'LunaPlushie', 'CadancePlushie', 'ChrysalisPlushie', 'SpitfirePlushie',
'OctaviaPlushie', 'VinylScratchPlushie', 'HoovesPlushie', 'CheerileePlushie', 'LyraPlushie', 'BonbonPlushie', 'SongbirdPlushie',
'ZecoraPlushie', 'TrixieLulamoonPlushie', 'GrannySmithPlushie', 'NightmareMoonPlushie', 'StarlightGlimmerPlushie', 'SunsetShimmerPlushie',
'SunnyPlushie', 'PippPetalsPlushie', 'IzzyPlushie', 'ScootalooPlushie', 'SweetiePlushie', 'ApplebloomPlushie'}

function Ponies.getAllPonies()
    return MergeTables(MergeTables(Ponies.gen4Ponies, Ponies.otherGens), Ponies.ocs) -- oh who cares how efficient this is
end

return Ponies