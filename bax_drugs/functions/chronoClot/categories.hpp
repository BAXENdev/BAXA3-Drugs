
class BAX_Drugs_ChronoClot {
    class Root {
    file = "\bax_drugs\functions\chronoClot";
        class findWorstWound {};
        class postinit {};
        class preinit {};
        // class postinit { postInit=1; };
        // class preinit { preInit=1; };
        class slowHeal {};
        class slowHealLocal {};
    };

    class Ace {
    file = "\bax_drugs\functions\chronoClot\ace";
        class addStitch {};
        class bandageWounds {};
        class stitchWounds {};
    };
};
