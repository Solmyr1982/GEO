page 50405 "Geoname Setup"
{
    Caption = 'Geoname Setup';
    SourceTable = "Geoname Setup";
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Database Server"; "Database Server")
                {
                }
                field("Database Name"; "Database Name")
                {
                }
                field("Database User"; "Database User")
                {
                }
                field("Database Password"; "Database Password")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        reset;
        if not get then begin
            init;
            id := '00000000-0000-0000-0000-000000000000';
            insert;
        end;
    end;

}

