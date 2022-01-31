table 50362 "Geoname Setup"
{
    Caption = 'Geoname Setup';

    fields
    {
        field(1; ID; Guid)
        {
            Caption = 'ID';
            DataClassification = ToBeClassified;
        }
        field(2; "Database Server"; Text[30])
        {
            Caption = 'Database Server';
            DataClassification = ToBeClassified;
        }
        field(3; "Database Name"; Text[30])
        {
            Caption = 'Database Name';
            DataClassification = ToBeClassified;
        }
        field(4; "Database User"; Text[30])
        {
            Caption = 'Database User';
            DataClassification = ToBeClassified;
        }
        field(5; "Database Password"; Text[30])
        {
            Caption = 'Database Password';
            ExtendedDatatype = Masked;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; ID)
        {
        }
    }

    fieldgroups
    {
    }
}

