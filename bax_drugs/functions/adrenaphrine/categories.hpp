
class BAX_Drugs_Adrenaphrine {
    class Root {
    file = "\bax_drugs\functions\adrenaphrine";
        class postinit {};
        class preinit {};
        // class postinit { postInit=1; };
        // class preinit { preInit=1; };
        class speedBoost {};
        class speedBoostLocal {};
    };
};

class ACE_Advanced_Fatigue {
    file = "\bax_drugs\functions\adrenaphrine\ace_overrides";
    class override {
        class handleEffects;
    };
};
