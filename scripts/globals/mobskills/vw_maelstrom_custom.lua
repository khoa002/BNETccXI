---------------------------------------------
--  Maelstrom
--
--  Description: Deals water damage to enemies within range. Additional effect: STR Down.
--  Type: Magical (Water)
--
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_STR_DOWN;
	MobStatusEffectMove(mob, target, typeEffect, 50, 3, 120);

	local dmgmod = 2;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3.5,ELE_WATER,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
