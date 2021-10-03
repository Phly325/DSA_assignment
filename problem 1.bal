public type objectLearner record { 
    string UserName;
    string Firstnames;
    string Lastname;
    string[] preferred_formats;
    any[] past_subjects;
};

public type Learning_Material record { 
    string course;
    LearningObject Learning_Objects;
};

public type LearningObject record { 
    MaterialObject[] audio;
    MaterialObject[] video;
    MaterialObject[] text;
};

public type MaterialObject record { 
    string Name;
    string Dscrption;
    string Difficulty;
};

public type TopicResObject record { 
    string Name;
    string Dscrption;
    string Dfficulty;
};

public type ReqObject record { 
    string message;
};

public type ResObject record { 
    string message;
};
