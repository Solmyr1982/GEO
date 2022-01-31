table 50361 "geoname"
{
    Caption = 'geoname';

    fields
    {
        field(1; geonameid; integer)
        {
            Caption = 'geonameid';
            DataClassification = ToBeClassified;
        }
        field(2; name; text[250])
        {
            Caption = 'name';
            DataClassification = ToBeClassified;
        }
        field(3; asciiname; text[250])
        {
            Caption = 'asciiname';
            DataClassification = ToBeClassified;
        }
        field(4; alternatenames; text[250])
        {
            Caption = 'alternatenames';
            DataClassification = ToBeClassified;
        }
        field(5; latitude; decimal)
        {
            Caption = 'latitude';
            DecimalPlaces = 6;
            DataClassification = ToBeClassified;
        }
        field(6; longitude; decimal)
        {
            Caption = 'longitude';
            DecimalPlaces = 6;
            DataClassification = ToBeClassified;
        }
        field(7; "feature class"; text[1])
        {
            Caption = 'feature class';
            DataClassification = ToBeClassified;
        }
        field(8; "feature code"; text[10])
        {
            Caption = 'feature code';
            DataClassification = ToBeClassified;
        }
        field(9; "country code"; text[2])
        {
            Caption = 'country code';
            DataClassification = ToBeClassified;
        }
        field(10; cc2; text[200])
        {
            Caption = 'cc2';
            DataClassification = ToBeClassified;
        }
        field(11; "admin1 code"; text[20])
        {
            Caption = 'admin1 code';
            DataClassification = ToBeClassified;
        }
        field(12; "admin2 code"; text[80])
        {
            Caption = 'admin2 code';
            DataClassification = ToBeClassified;
        }
        field(13; "admin3 code"; text[20])
        {
            Caption = 'admin3 code';
            DataClassification = ToBeClassified;
        }
        field(14; "admin4 code"; text[20])
        {
            Caption = 'admin4 code';
            DataClassification = ToBeClassified;
        }
        field(15; population; integer)
        {
            Caption = 'population';
            DataClassification = ToBeClassified;
        }
        field(16; elevation; integer)
        {
            Caption = 'elevation';
            DataClassification = ToBeClassified;
        }
        field(17; dem; integer)
        {
            Caption = 'dem';
            DataClassification = ToBeClassified;
        }
        field(18; timezone; text[40])
        {
            Caption = 'timezone';
            DataClassification = ToBeClassified;
        }
        field(19; "modification date"; date)
        {
            Caption = 'modification date';
            DataClassification = ToBeClassified;
        }
        field(100; "country name"; text[50])
        {
            Caption = 'country name';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; geonameid)
        {
        }
        key(Key2; latitude, longitude)
        {
        }
    }

    fieldgroups
    {
    }
}

