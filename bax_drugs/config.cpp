
class CfgPatches {
    class BaxDrugs {
        name = "BAX's Experimental Drugs";
        author = "BAXENATOR";
        url = "";
        requiredVersion = 1.0;
        requiredAddons[] = {
            "ace_medical_engine",
            "ace_medical_treatment"
        };
        weapons[] = {
            "BAX_RecovaMax_item",
            "BAX_ChronoClot_item",
            "BAX_SwayFlex_item",
            "BAX_RegenaBoost_item",
            "BAX_Adrenaline_item",
            "BAX_RecoilRedux_item"
        };
        units[] = {
            "BAX_RecovaMax_ItemHolder",
            "BAX_ChronoClot_ItemHolder",
            "BAX_SwayFlex_ItemHolder",
            "BAX_RegenaBoost_ItemHolder",
            "BAX_Adrenaline_ItemHolder",
            "BAX_RecoilRedux_ItemHolder"
        };
        skipWhenMissingDependencies = 1;
    };
};

class CfgWeapons {
    class ItemCore;
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class BAX_RecovaMax_item: ACE_ItemCore {
        scope = 2;
        author = "BAXENATOR";
        model = "\bax_drugs\assets\models\recovaMax.p3d";
        // model = "\z\ace\addons\medical_treatment\data\morphine.p3d";
        picture = "\bax_drugs\assets\pictures\recovaMax_ca.paa";
        displayName = "RecovaMax";
        descriptionShort = "Full Heal";
        descriptionUse = "Full Heal";
        ACE_isMedicalItem = 1;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };

    class BAX_ChronoClot_item: ACE_ItemCore {
        scope = 2;
        author = "BAXENATOR";
        model = "\bax_drugs\assets\models\chronoClot.p3d";
        // model = "\z\ace\addons\medical_treatment\data\morphine.p3d";
        picture = "\bax_drugs\assets\pictures\chronoClot_ca.paa";
        displayName = "ChronoClot";
        descriptionShort = "Slow Heal";
        descriptionUse = "Slow Heal";
        ACE_isMedicalItem = 1;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };

    class BAX_SwayFlex_item: ACE_ItemCore {
        scope = 2;
        author = "BAXENATOR";
        model = "\bax_drugs\assets\models\swayFlex.p3d";
        // model = "\z\ace\addons\medical_treatment\data\morphine.p3d";
        picture = "\bax_drugs\assets\pictures\swayFlex_ca.paa";
        displayName = "SwayFlex";
        descriptionShort = "Reduce Weapon Sway";
        descriptionUse = "Reduce Weapon Sway";
        ACE_isMedicalItem = 1;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };

    class BAX_RegenaBoost_item: ACE_ItemCore {
        scope = 2;
        author = "BAXENATOR";
        model = "\bax_drugs\assets\models\regenaBoost.p3d";
        // model = "\z\ace\addons\medical_treatment\data\morphine.p3d";
        picture = "\bax_drugs\assets\pictures\regenaBoost_ca.paa";
        displayName = "RegenaBoost";
        descriptionShort = "Increase Stamina Regen";
        descriptionUse = "Increase Stamina Regen";
        ACE_isMedicalItem = 1;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };

    class BAX_Adrenaline_item: ACE_ItemCore {
        scope = 2;
        author = "BAXENATOR";
        model = "\bax_drugs\assets\models\adrenaline.p3d";
        // model = "\z\ace\addons\medical_treatment\data\morphine.p3d";
        picture = "\bax_drugs\assets\pictures\adrenaline_ca.paa";
        displayName = "Adrenaline";
        descriptionShort = "Increase Movement Speed";
        descriptionUse = "Increase Movement Speed";
        ACE_isMedicalItem = 1;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };

    class BAX_RecoilRedux_item: ACE_ItemCore {
        scope = 2;
        author = "BAXENATOR";
        model = "\bax_drugs\assets\models\recoilredux.p3d";
        // model = "\z\ace\addons\medical_treatment\data\morphine.p3d";
        picture = "\bax_drugs\assets\pictures\recoilRedux_ca.paa";
        displayName = "RecoilRedux";
        descriptionShort = "Increase Recoil Control";
        descriptionUse = "Increase Recoil Control";
        ACE_isMedicalItem = 1;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };

    class BAX_Experiphrine_item: ACE_ItemCore {
        scope = 2;
        author = "BAXENATOR";
        model = "\bax_drugs\assets\models\experiphrine.p3d";
        // model = "\z\ace\addons\medical_treatment\data\morphine.p3d";
        picture = "\bax_drugs\assets\pictures\experiphrine_ca.paa";
        displayName = "Experiphrine";
        descriptionShort = "Experimental Super Drug";
        descriptionUse = "Experimental Super Drug";
        ACE_isMedicalItem = 1;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };
};

class CfgVehicles
{
    class Item_Base_F;

    class BAX_RecovaMax_ItemHolder: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = "RecovaMax";
        author = "BAXENATOR";
        // editorCategory = "EdCat_Equipment";
        // editorSubcategory = "EdSubcat_InventoryItems";
        vehicleClass = "Items";
        // model = "\A3\Weapons_F\DummyItemHorizontal.p3d";
        class TransportItems
        {
            class MyACEItem
            {
                name = "BAX_RecovaMax_item";
                count = 1;
            };
        };
    };

    class BAX_ChronoClot_ItemHolder: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = "ChronoClot";
        author = "BAXENATOR";
        // editorCategory = "EdCat_Equipment";
        // editorSubcategory = "EdSubcat_InventoryItems";
        vehicleClass = "Items";
        // model = "\A3\Weapons_F\DummyItemHorizontal.p3d";
        class TransportItems
        {
            class MyACEItem
            {
                name = "BAX_ChronoClot_item";
                count = 1;
            };
        };
    };

    class BAX_SwayFlex_ItemHolder: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = "SwayFlex";
        author = "BAXENATOR";
        // editorCategory = "EdCat_Equipment";
        // editorSubcategory = "EdSubcat_InventoryItems";
        vehicleClass = "Items";
        // model = "\A3\Weapons_F\DummyItemHorizontal.p3d";
        class TransportItems
        {
            class MyACEItem
            {
                name = "BAX_SwayFlex_item";
                count = 1;
            };
        };
    };

    class BAX_RegenaBoost_ItemHolder: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = "RegenaBoost";
        author = "BAXENATOR";
        // editorCategory = "EdCat_Equipment";
        // editorSubcategory = "EdSubcat_InventoryItems";
        vehicleClass = "Items";
        // model = "\A3\Weapons_F\DummyItemHorizontal.p3d";
        class TransportItems
        {
            class MyACEItem
            {
                name = "BAX_RegenaBoost_item";
                count = 1;
            };
        };
    };

    class BAX_Adrenaline_ItemHolder: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = "Adrenaline";
        author = "BAXENATOR";
        // editorCategory = "EdCat_Equipment";
        // editorSubcategory = "EdSubcat_InventoryItems";
        vehicleClass = "Items";
        // model = "\A3\Weapons_F\DummyItemHorizontal.p3d";
        class TransportItems
        {
            class MyACEItem
            {
                name = "BAX_Adrenaline_item";
                count = 1;
            };
        };
    };

    class BAX_RecoilRedux_ItemHolder: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = "RecoilRedux";
        author = "BAXENATOR";
        // editorCategory = "EdCat_Equipment";
        // editorSubcategory = "EdSubcat_InventoryItems";
        vehicleClass = "Items";
        // model = "\A3\Weapons_F\DummyItemHorizontal.p3d";
        class TransportItems
        {
            class MyACEItem
            {
                name = "BAX_RecoilRedux_item";
                count = 1;
            };
        };
    };

    class BAX_Experiphrine_ItemHolder: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = "Experiphrine";
        author = "BAXENATOR";
        // editorCategory = "EdCat_Equipment";
        // editorSubcategory = "EdSubcat_InventoryItems";
        vehicleClass = "Items";
        // model = "\A3\Weapons_F\DummyItemHorizontal.p3d";
        class TransportItems
        {
            class MyACEItem
            {
                name = "BAX_Experiphrine_item";
                count = 1;
            };
        };
    };
};

class ACE_Medical_Treatment_Actions {
    class Morphine;

    class RecovaMax: Morphine {
        displayName = "Inject RecovaMax";
        displayNameProgress = "Injecting RecovaMax";

        items[] = {"BAX_RecovaMax_item"};
        consumeItem = 1;

        medicRequired = 0;
        allowSelfTreatment = 1;
        // treatmentTime = 2; // This is handled by autoinjector time setting in ace

        condition = "";
        callbackSuccess = "bax_drugs_recovamax_fnc_fullHeal";
    };

    class ChronoClot: Morphine {
        displayName = "Inject ChronoClot";
        displayNameProgress = "Injecting ChronoClot";

        items[] = {"BAX_ChronoClot_item"};
        consumeItem = 1;

        medicRequired = 0;
        allowSelfTreatment = 1;
        // treatmentTime = 2; // This is handled by autoinjector time setting in ace

        condition = "";
        callbackSuccess = "bax_drugs_chronoclot_fnc_slowHeal";
    };

    class SwayFlex: Morphine {
        displayName = "Inject SwayFlex";
        displayNameProgress = "Injecting SwayFlex";

        items[] = {"BAX_SwayFlex_item"};
        consumeItem = 1;

        medicRequired = 0;
        allowSelfTreatment = 1;
        // treatmentTime = 2; // This is handled by autoinjector time setting in ace

        condition = "";
        callbackSuccess = "bax_drugs_swayflex_fnc_reflexHeal";
    };

    class RegenaBoost: Morphine {
        displayName = "Inject RegenaBoost";
        displayNameProgress = "Injecting RegenaBoost";

        items[] = {"BAX_RegenaBoost_item"};
        consumeItem = 1;

        medicRequired = 0;
        allowSelfTreatment = 1;
        // treatmentTime = 2; // This is handled by autoinjector time setting in ace

        condition = "";
        callbackSuccess = "bax_drugs_regenaboost_fnc_increaseRegen";
    };

    class Adrenaline: Morphine {
        displayName = "Inject Adrenaline";
        displayNameProgress = "Injecting Adrenaline";

        items[] = {"BAX_Adrenaline_item"};
        consumeItem = 1;

        medicRequired = 0;
        allowSelfTreatment = 1;
        // treatmentTime = 2; // This is handled by autoinjector time setting in ace

        condition = "";
        callbackSuccess = "bax_drugs_adrenaline_fnc_speedBoost";
    };

    class RecoilRedux: Morphine {
        displayName = "Inject RecoilRedux";
        displayNameProgress = "Injecting RecoilRedux";

        items[] = {"BAX_RecoilRedux_item"};
        consumeItem = 1;

        medicRequired = 0;
        allowSelfTreatment = 1;
        // treatmentTime = 2; // This is handled by autoinjector time setting in ace

        condition = "";
        callbackSuccess = "bax_drugs_recoilRedux_fnc_recoilBoost";
    };

    class Experiphrine: Morphine {
        displayName = "Inject Experiphrine";
        displayNameProgress = "Experiphrine";

        items[] = {"BAX_Experiphrine_item"};
        consumeItem = 1;

        medicRequired = 0;
        allowSelfTreatment = 1;
        // treatmentTime = 2; // This is handled by autoinjector time setting in ace

        condition = "";
        callbackSuccess = "bax_drugs_experiphrine_fnc_superBoost";
    };
};

class ace_medical_treatment {
    // class Morphine {
    //     painReduce = 0.8;
    //     hrIncreaseLow[] = {-10, -20};
    //     hrIncreaseNormal[] = {-10, -30};
    //     hrIncreaseHigh[] = {-10, -35};
    //     timeInSystem = 1800;
    //     timeTillMaxEffect = 30;
    //     maxDose = 4;
    //     incompatibleMedication[] = {};
    //     viscosityChange = -10;
    // };

    class Medication {
        class Experiphrine {
            timeInSystem = 3600;
            maxDose = 11;
            timeTillMaxEffect = 900;
        };
    };
};

class CfgFunctions {
    #include "\bax_drugs\functions\chronoclot\categories.hpp"
    #include "\bax_drugs\functions\recovamax\categories.hpp"
    #include "\bax_drugs\functions\swayflex\categories.hpp"
    #include "\bax_drugs\functions\regenaBoost\categories.hpp"
    #include "\bax_drugs\functions\adrenaline\categories.hpp"
    #include "\bax_drugs\functions\recoilRedux\categories.hpp"
    #include "\bax_drugs\functions\experiphrine\categories.hpp"
};

class Extended_PreInit_EventHandlers {
    class Adrenaline {
        init = "call bax_drugs_adrenaline_fnc_preinit";
    };

    class ChronoClot {
        init = "call bax_drugs_chronoclot_fnc_preinit";
    };

    class Experiphrine {
        init = "call bax_drugs_experiphrine_fnc_preinit";
    };

    class RecoilRedux {
        init = "call bax_drugs_recoilredux_fnc_preinit";
    };

    class RecovaMax {
        init = "call bax_drugs_recovamax_fnc_preinit";
    };

    class RegenaBoost {
        init = "call bax_drugs_RegenaBoost_fnc_preinit";
    };

    class SwayFlex {
        init = "call bax_drugs_swayflex_fnc_preinit";
    };
};

class Extended_PostInit_EventHandlers {
    class Adrenaline {
        init = "call bax_drugs_adrenaline_fnc_postinit";
    };

    class ChronoClot {
        init = "call bax_drugs_chronoclot_fnc_postinit";
    };

    class Experiphrine {
        init = "call bax_drugs_experiphrine_fnc_postinit";
    };

    class RecoilRedux {
        init = "call bax_drugs_recoilredux_fnc_postinit";
    };

    class RecovaMax {
        init = "call bax_drugs_recovamax_fnc_postinit";
    };

    class RegenaBoost {
        init = "call bax_drugs_RegenaBoost_fnc_postinit";
    };

    class SwayFlex {
        init = "call bax_drugs_swayflex_fnc_postinit";
    };
};
