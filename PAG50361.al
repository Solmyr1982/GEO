page 50361 "geoname"
{
    Caption = 'geoname';
    SourceTable = "geoname";
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("geonameid"; "geonameid")
                {
                }
                field("name"; "name")
                {
                }
                field("asciiname"; "asciiname")
                {
                }
                field(alternatenames; alternatenames)
                {
                }
                field("latitude"; "latitude")
                {
                }
                field("longitude"; "longitude")
                {
                }
                field("feature class"; "feature class")
                {
                }
                field("feature code"; "feature code")
                {
                }
                field("country code"; "country code")
                {
                }
                field("cc2"; "cc2")
                {
                }
                field("admin1 code"; "admin1 code")
                {
                }
                field("admin2 code"; "admin2 code")
                {
                }
                field("admin3 code"; "admin3 code")
                {
                }
                field("admin4 code"; "admin4 code")
                {
                }
                field("population"; "population")
                {
                }
                field("elevation"; "elevation")
                {
                }
                field("dem"; "dem")
                {
                }
                field("timezone"; "timezone")
                {
                }
                field("modification date"; "modification date")
                {
                }
                field("country name"; "country name")
                {
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Import Geo Data")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    ImportGeodata;
                end;
            }
        }
    }

    local procedure ImportGeodata()
    var
        geoname: Record geoname;
        FileManagement: Codeunit "File Management";
        InputFile: FILE;
        Path: Text;
        TextLine: Text;
        FileName: Text;
        CurrFieldValue: Text;
        i: Integer;
        CurrFieldNo: Integer;

        Window: Dialog;
        RecNo: Integer;
        RecordsQty: Integer;
        CurrentProgress: Integer;
    begin
        //if not Confirm(ConfirmationQst) then
        //  exit;

        if Confirm(DeleteQst) then
            geoname.DeleteAll();

        Path := FileManagement.OpenFileDialog('Select geodata file', FileName, FileManagement.GetToFilterText('', '.txt'));
        InputFile.OPEN(Path);
        InputFile.TEXTMODE(TRUE);
        InputFile.SEEK(0);

        RecordsQty := InputFile.LEN;
        RecNo := 0;
        Window.OPEN(ProgressLbl);

        REPEAT
            RecNo := InputFile.POS;
            IF CurrentProgress <> ROUND(RecNo / RecordsQty * 10000, 1) THEN BEGIN
                CurrentProgress := ROUND(RecNo / RecordsQty * 10000, 1);
                Window.UPDATE(1, CurrentProgress);
            END;

            InputFile.READ(TextLine);
            CurrFieldNo := 1;
            for i := 1 to StrLen(TextLine) do begin
                if TextLine[i] = SeparatorLbl then begin
                    case CurrFieldNo of
                        1:
                            Evaluate(geoname.geonameid, CurrFieldValue);
                        2:
                            geoname.name := CutString(CurrFieldValue, 250);
                        3:

                            geoname.asciiname := CutString(CurrFieldValue, 250);
                        4:
                            ;
                        //geoname.alternatenames := CutString(CurrFieldValue, 250);
                        5:
                            if CurrFieldValue <> '' then
                                Evaluate(geoname.latitude, CurrFieldValue);
                        6:
                            if CurrFieldValue <> '' then
                                Evaluate(geoname.longitude, CurrFieldValue);
                        7:
                            ;
                        //geoname."feature class" := CutString(CurrFieldValue, 1);
                        8:
                            ;
                        //geoname."feature code" := CutString(CurrFieldValue, 10);
                        9:
                            geoname."country code" := CutString(CurrFieldValue, 2);
                        10:
                            ;
                        //geoname."cc2" := CutString(CurrFieldValue, 10);
                        11:
                            ;
                        //geoname."admin1 code" := CutString(CurrFieldValue, 20);
                        12:
                            ;
                        //geoname."admin2 code" := CutString(CurrFieldValue, 80);
                        13:
                            ;
                        //geoname."admin3 code" := CutString(CurrFieldValue, 20);
                        14:
                            ;
                        //geoname."admin4 code" := CutString(CurrFieldValue, 20);
                        15:
                            ;
                        //if CurrFieldValue <> '' then
                        //  Evaluate(geoname.population, CurrFieldValue);
                        16:
                            ;
                        //if CurrFieldValue <> '' then
                        //  Evaluate(geoname.elevation, CurrFieldValue);
                        17:
                            ;
                        //if CurrFieldValue <> '' then
                        //  Evaluate(geoname.dem, CurrFieldValue);
                        18:
                            ;
                        //geoname."timezone" := CutString(CurrFieldValue, 40);
                        19:
                            ;
                    //if CurrFieldValue <> '' then
                    //  Evaluate(geoname."modification date", CurrFieldValue);
                    end;

                    CurrFieldNo += 1;
                    clear(CurrFieldValue);
                end else begin
                    CurrFieldValue += TextLine[i];
                end;
            end;
            //if CurrFieldValue <> '' then
            //  Evaluate(geoname."modification date", CurrFieldValue);

            CurrFieldNo := 1;
            clear(CurrFieldValue);
            //geoname."country name" := CountryCodeToName(geoname."country code");
            geoname.Insert();

        UNTIL InputFile.POS >= InputFile.LEN;

        InputFile.CLOSE;
        Window.CLOSE;

    end;

    local procedure CutString(InText: Text; lenght: Integer): Text;
    begin
        if strlen(InText) <= lenght then
            exit(InText)
        else
            exit(CopyStr(InText, 1, lenght));
    end;

    var
        SeparatorLbl: Label '	';
        ConfirmationQst: Label 'All existing geodata will be deleted. Do you want to continue?';
        DeleteQst: Label 'Do you want to delete all existing data?';
        ProgressLbl: Label 'Progress @1@@@@@@@@@@@@@';

}