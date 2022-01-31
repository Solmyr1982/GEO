page 50406 "Geoname Processor"
{
    Caption = 'Geoname Processor';
    DelayedInsert = true;
    EntityName = 'GeonameProcessor';
    EntitySetName = 'GeonameProcessor';
    ODataKeyFields = ID;
    PageType = API;
    APIPublisher = 'GEO';
    APIGroup = 'GEO';
    SourceTable = "Geoname Setup";
    SourceTableView = SORTING(ID);

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ID; ID)
                {
                }
            }
        }
    }

    actions
    {
    }

    [ServiceEnabled]
    [Scope('Personalization')]
    procedure getGeodata(latitude: Decimal; longitude: Decimal) outParam: Text
    var
        GeonameSetup: Record "Geoname Setup";
        SQLConnection: DotNet SQLConnection;
        SQLCommand: DotNet SQLCommand;
        SQLReader: DotNet SQLReader;
        ConnectionString: Text;
        City: Text;
        Country: Text;
    begin
        GeonameSetup.Get();
        ConnectionString := 'Server=' + GeonameSetup."Database Server" + '; Database=' + GeonameSetup."Database Name" + '; User Id=' + GeonameSetup."Database User" + '; Password=' + GeonameSetup."Database Password" + ';';
        SQLConnection := SQLConnection.SqlConnection(ConnectionString);
        SQLConnection.Open;
        SQLCommand := SQLConnection.CreateCommand();
        SQLCommand.CommandText := 'SELECT TOP 1 asciiname, [country code], SQRT(POWER(69.1 * (latitude - ' + Format(latitude) + '), 2) + POWER(69.1 * (' + Format(longitude) + ' - longitude) * COS(latitude / 57.3), 2)) AS distance FROM [VTM180].[dbo].[SOL$geoname$297d3733-0487-4145-9eeb-599bf19e3ad6] ORDER BY distance;';
        SQLReader := SQLCommand.ExecuteReader;

        while SQLReader.Read() do begin
            City := SQLReader.GetString(0);
            Country := CountryCodeToName(SQLReader.GetString(1));
        end;

        outParam := City + ', ' + Country;
    end;

    local procedure CountryCodeToName(countrycode: Text): Text
    var
        countryname: Text;
    begin
        case countrycode of
            'AF':
                countryname := 'Afghanistan';
            'AL':
                countryname := 'Albania';
            'DZ':
                countryname := 'Algeria';
            'AS':
                countryname := 'American Samoa';
            'AD':
                countryname := 'Andorra';
            'AO':
                countryname := 'Angola';
            'AI':
                countryname := 'Anguilla';
            'AQ':
                countryname := 'Antarctica';
            'AG':
                countryname := 'Antigua and Barbuda';
            'AR':
                countryname := 'Argentina';
            'AM':
                countryname := 'Armenia';
            'AW':
                countryname := 'Aruba';
            'AU':
                countryname := 'Australia';
            'AT':
                countryname := 'Austria';
            'AZ':
                countryname := 'Azerbaijan';
            'BS':
                countryname := 'Bahamas';
            'BH':
                countryname := 'Bahrain';
            'BD':
                countryname := 'Bangladesh';
            'BB':
                countryname := 'Barbados';
            'BY':
                countryname := 'Belarus';
            'BE':
                countryname := 'Belgium';
            'BZ':
                countryname := 'Belize';
            'BJ':
                countryname := 'Benin';
            'BM':
                countryname := 'Bermuda';
            'BT':
                countryname := 'Bhutan';
            'BO':
                countryname := 'Bolivia';
            'BA':
                countryname := 'Bosnia and Herzegovina';
            'BW':
                countryname := 'Botswana';
            'BR':
                countryname := 'Brazil';
            'IO':
                countryname := 'British Indian Ocean Territory';
            'VG':
                countryname := 'British Virgin Islands';
            'BN':
                countryname := 'Brunei';
            'BG':
                countryname := 'Bulgaria';
            'BF':
                countryname := 'Burkina Faso';
            'BI':
                countryname := 'Burundi';
            'KH':
                countryname := 'Cambodia';
            'CM':
                countryname := 'Cameroon';
            'CA':
                countryname := 'Canada';
            'CV':
                countryname := 'Cape Verde';
            'KY':
                countryname := 'Cayman Islands';
            'CF':
                countryname := 'Central African Republic';
            'TD':
                countryname := 'Chad';
            'CL':
                countryname := 'Chile';
            'CN':
                countryname := 'China';
            'CX':
                countryname := 'Christmas Island';
            'CC':
                countryname := 'Cocos Islands';
            'CO':
                countryname := 'Colombia';
            'KM':
                countryname := 'Comoros';
            'CK':
                countryname := 'Cook Islands';
            'CR':
                countryname := 'Costa Rica';
            'HR':
                countryname := 'Croatia';
            'CU':
                countryname := 'Cuba';
            'CW':
                countryname := 'Curacao';
            'CY':
                countryname := 'Cyprus';
            'CZ':
                countryname := 'Czech Republic';
            'CD':
                countryname := 'Democratic Republic of the Congo';
            'DK':
                countryname := 'Denmark';
            'DJ':
                countryname := 'Djibouti';
            'DM':
                countryname := 'Dominica';
            'DO':
                countryname := 'Dominican Republic';
            'TL':
                countryname := 'East Timor';
            'EC':
                countryname := 'Ecuador';
            'EG':
                countryname := 'Egypt';
            'SV':
                countryname := 'El Salvador';
            'GQ':
                countryname := 'Equatorial Guinea';
            'ER':
                countryname := 'Eritrea';
            'EE':
                countryname := 'Estonia';
            'ET':
                countryname := 'Ethiopia';
            'FK':
                countryname := 'Falkland Islands';
            'FO':
                countryname := 'Faroe Islands';
            'FJ':
                countryname := 'Fiji';
            'FI':
                countryname := 'Finland';
            'FR':
                countryname := 'France';
            'PF':
                countryname := 'French Polynesia';
            'GA':
                countryname := 'Gabon';
            'GM':
                countryname := 'Gambia';
            'GE':
                countryname := 'Georgia';
            'DE':
                countryname := 'Germany';
            'GH':
                countryname := 'Ghana';
            'GI':
                countryname := 'Gibraltar';
            'GR':
                countryname := 'Greece';
            'GL':
                countryname := 'Greenland';
            'GD':
                countryname := 'Grenada';
            'GU':
                countryname := 'Guam';
            'GT':
                countryname := 'Guatemala';
            'GG':
                countryname := 'Guernsey';
            'GN':
                countryname := 'Guinea';
            'GW':
                countryname := 'Guinea-Bissau';
            'GY':
                countryname := 'Guyana';
            'HT':
                countryname := 'Haiti';
            'HN':
                countryname := 'Honduras';
            'HK':
                countryname := 'Hong Kong';
            'HU':
                countryname := 'Hungary';
            'IS':
                countryname := 'Iceland';
            'IN':
                countryname := 'India';
            'ID':
                countryname := 'Indonesia';
            'IR':
                countryname := 'Iran';
            'IQ':
                countryname := 'Iraq';
            'IE':
                countryname := 'Ireland';
            'IM':
                countryname := 'Isle of Man';
            'IL':
                countryname := 'Israel';
            'IT':
                countryname := 'Italy';
            'CI':
                countryname := 'Ivory Coast';
            'JM':
                countryname := 'Jamaica';
            'JP':
                countryname := 'Japan';
            'JE':
                countryname := 'Jersey';
            'JO':
                countryname := 'Jordan';
            'KZ':
                countryname := 'Kazakhstan';
            'KE':
                countryname := 'Kenya';
            'KI':
                countryname := 'Kiribati';
            'XK':
                countryname := 'Kosovo';
            'KW':
                countryname := 'Kuwait';
            'KG':
                countryname := 'Kyrgyzstan';
            'LA':
                countryname := 'Laos';
            'LV':
                countryname := 'Latvia';
            'LB':
                countryname := 'Lebanon';
            'LS':
                countryname := 'Lesotho';
            'LR':
                countryname := 'Liberia';
            'LY':
                countryname := 'Libya';
            'LI':
                countryname := 'Liechtenstein';
            'LT':
                countryname := 'Lithuania';
            'LU':
                countryname := 'Luxembourg';
            'MO':
                countryname := 'Macau';
            'MK':
                countryname := 'Macedonia';
            'MG':
                countryname := 'Madagascar';
            'MW':
                countryname := 'Malawi';
            'MY':
                countryname := 'Malaysia';
            'MV':
                countryname := 'Maldives';
            'ML':
                countryname := 'Mali';
            'MT':
                countryname := 'Malta';
            'MH':
                countryname := 'Marshall Islands';
            'MR':
                countryname := 'Mauritania';
            'MU':
                countryname := 'Mauritius';
            'YT':
                countryname := 'Mayotte';
            'MX':
                countryname := 'Mexico';
            'FM':
                countryname := 'Micronesia';
            'MD':
                countryname := 'Moldova';
            'MC':
                countryname := 'Monaco';
            'MN':
                countryname := 'Mongolia';
            'ME':
                countryname := 'Montenegro';
            'MS':
                countryname := 'Montserrat';
            'MA':
                countryname := 'Morocco';
            'MZ':
                countryname := 'Mozambique';
            'MM':
                countryname := 'Myanmar';
            'NA':
                countryname := 'Namibia';
            'NR':
                countryname := 'Nauru';
            'NP':
                countryname := 'Nepal';
            'NL':
                countryname := 'Netherlands';
            'AN':
                countryname := 'Netherlands Antilles';
            'NC':
                countryname := 'New Caledonia';
            'NZ':
                countryname := 'New Zealand';
            'NI':
                countryname := 'Nicaragua';
            'NE':
                countryname := 'Niger';
            'NG':
                countryname := 'Nigeria';
            'NU':
                countryname := 'Niue';
            'KP':
                countryname := 'North Korea';
            'MP':
                countryname := 'Northern Mariana Islands';
            'NO':
                countryname := 'Norway';
            'OM':
                countryname := 'Oman';
            'PK':
                countryname := 'Pakistan';
            'PW':
                countryname := 'Palau';
            'PS':
                countryname := 'Palestine';
            'PA':
                countryname := 'Panama';
            'PG':
                countryname := 'Papua New Guinea';
            'PY':
                countryname := 'Paraguay';
            'PE':
                countryname := 'Peru';
            'PH':
                countryname := 'Philippines';
            'PN':
                countryname := 'Pitcairn';
            'PL':
                countryname := 'Poland';
            'PT':
                countryname := 'Portugal';
            'PR':
                countryname := 'Puerto Rico';
            'QA':
                countryname := 'Qatar';
            'CG':
                countryname := 'Republic of the Congo';
            'RE':
                countryname := 'Reunion';
            'RO':
                countryname := 'Romania';
            'RU':
                countryname := 'Russia';
            'RW':
                countryname := 'Rwanda';
            'BL':
                countryname := 'Saint Barthelemy';
            'SH':
                countryname := 'Saint Helena';
            'KN':
                countryname := 'Saint Kitts and Nevis';
            'LC':
                countryname := 'Saint Lucia';
            'MF':
                countryname := 'Saint Martin';
            'PM':
                countryname := 'Saint Pierre and Miquelon';
            'VC':
                countryname := 'Saint Vincent and the Grenadines';
            'WS':
                countryname := 'Samoa';
            'SM':
                countryname := 'San Marino';
            'ST':
                countryname := 'Sao Tome and Principe';
            'SA':
                countryname := 'Saudi Arabia';
            'SN':
                countryname := 'Senegal';
            'RS':
                countryname := 'Serbia';
            'SC':
                countryname := 'Seychelles';
            'SL':
                countryname := 'Sierra Leone';
            'SG':
                countryname := 'Singapore';
            'SX':
                countryname := 'Sint Maarten';
            'SK':
                countryname := 'Slovakia';
            'SI':
                countryname := 'Slovenia';
            'SB':
                countryname := 'Solomon Islands';
            'SO':
                countryname := 'Somalia';
            'ZA':
                countryname := 'South Africa';
            'KR':
                countryname := 'South Korea';
            'SS':
                countryname := 'South Sudan';
            'ES':
                countryname := 'Spain';
            'LK':
                countryname := 'Sri Lanka';
            'SD':
                countryname := 'Sudan';
            'SR':
                countryname := 'Suriname';
            'SJ':
                countryname := 'Svalbard and Jan Mayen';
            'SZ':
                countryname := 'Swaziland';
            'SE':
                countryname := 'Sweden';
            'CH':
                countryname := 'Switzerland';
            'SY':
                countryname := 'Syria';
            'TW':
                countryname := 'Taiwan';
            'TJ':
                countryname := 'Tajikistan';
            'TZ':
                countryname := 'Tanzania';
            'TH':
                countryname := 'Thailand';
            'TG':
                countryname := 'Togo';
            'TK':
                countryname := 'Tokelau';
            'TO':
                countryname := 'Tonga';
            'TT':
                countryname := 'Trinidad and Tobago';
            'TN':
                countryname := 'Tunisia';
            'TR':
                countryname := 'Turkey';
            'TM':
                countryname := 'Turkmenistan';
            'TC':
                countryname := 'Turks and Caicos Islands';
            'TV':
                countryname := 'Tuvalu';
            'VI':
                countryname := 'U.S. Virgin Islands';
            'UG':
                countryname := 'Uganda';
            'UA':
                countryname := 'Ukraine';
            'AE':
                countryname := 'United Arab Emirates';
            'GB':
                countryname := 'United Kingdom';
            'US':
                countryname := 'United States';
            'UY':
                countryname := 'Uruguay';
            'UZ':
                countryname := 'Uzbekistan';
            'VU':
                countryname := 'Vanuatu';
            'VA':
                countryname := 'Vatican';
            'VE':
                countryname := 'Venezuela';
            'VN':
                countryname := 'Vietnam';
            'WF':
                countryname := 'Wallis and Futuna';
            'EH':
                countryname := 'Western Sahara';
            'YE':
                countryname := 'Yemen';
            'ZM':
                countryname := 'Zambia';
            'ZW':
                countryname := 'Zimbabwe';
        end;
        exit(countryname);
    end;

}

