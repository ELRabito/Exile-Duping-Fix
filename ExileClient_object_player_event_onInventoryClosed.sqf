/**
 * ExileClient_object_player_event_onInventoryClosed
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
if((!(ExileClientCurrentInventoryContainer isEqualTo "ObjNull") && (ExileClientCurrentInventoryContainer iskindOf "AllVehicles") || (ExileClientCurrentInventoryContainer isKindOf 'Exile_Container_Abstract')) ||
(!(ExileClientCurrentInventorySecondaryContainer isEqualTo "ObjNull") && (ExileClientCurrentInventorySecondaryContainer iskindOf "AllVehicles") || (ExileClientCurrentInventorySecondaryContainer isKindOf 'Exile_Container_Abstract'))) then
{
    { 
        if !((typeOf _x) in ["GroundWeaponHolder", "WeaponHolderSimulated", "LootWeaponHolder"]) then
        {
            ["vehicleSaveRequest", [netId _x]] call ExileClient_system_network_send;
        };
            
    } forEach 
    [
        ExileClientCurrentInventoryContainer,
        ExileClientCurrentInventorySecondaryContainer
    ];
};
ExileClientInventoryOpened = false;
ExileClientCurrentInventoryContainer = objNull;
ExileClientCurrentInventorySecondaryContainer = objNull;
true
