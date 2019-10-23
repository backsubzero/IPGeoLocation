{******************************************************************************}
{                                                                              }
{           IPGeoLocation.Classes                                              }
{                                                                              }
{           Copyright (C) Antônio José Medeiros Schneider Júnior               }
{                                                                              }
{           https://github.com/antoniojmsjr                                    }
{                                                                              }
{                                                                              }
{******************************************************************************}
{                                                                              }
{  Licensed under the Apache License, Version 2.0 (the "License");             }
{  you may not use this file except in compliance with the License.            }
{  You may obtain a copy of the License at                                     }
{                                                                              }
{      http://www.apache.org/licenses/LICENSE-2.0                              }
{                                                                              }
{  Unless required by applicable law or agreed to in writing, software         }
{  distributed under the License is distributed on an "AS IS" BASIS,           }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.    }
{  See the License for the specific language governing permissions and         }
{  limitations under the License.                                              }
{                                                                              }
{******************************************************************************}
unit IPGeoLocation.Classes;

interface

uses System.SysUtils, System.Classes, REST.Types;

type

  TTypeIPGeoLocationProvider = (UNKNOWN=0, IPInfo=1, IPGeoLocation=2,
                                IP2Location=3, IPApi=4, IPStack=5,
                                IPIfy=6);

  TTypeIPGeoLocationRequestLimitPer = (iglPer_UNKNOWN=0,
                                       iglPer_Day=1,
                                       iglPer_Month=2,
                                       iglPer_Year=3);

  TTypeIPGeoLocationExceptionKind = (iglEXCEPT_UNKNOWN=0,
                                     iglEXCEPT_HTTP=1,
                                     iglEXCEPT_PARAMS_NOT_FOUND=2,
                                     iglEXCEPT_API=3);

  TEventIPGeoLocationResultString = procedure(const AValue: string) of object;

  {$REGION 'EIPGeoLocationException'}

  EIPGeoLocationException = class(Exception)
  private
    { private declarations }
  protected
    { protected declarations }
    FProvider: string;
    FKind: TTypeIPGeoLocationExceptionKind;
  public
    { public declarations }
    constructor Create(const pKind: TTypeIPGeoLocationExceptionKind;
                       const pProvider: string;
                       const pMessage: string);
    property Kind: TTypeIPGeoLocationExceptionKind read FKind;
    property Provider: string read FProvider;
  end;

  {$ENDREGION}

  {$REGION 'EIPGeoLocationRequestException'}

  EIPGeoLocationRequestException = class(EIPGeoLocationException)
  private
    { private declarations }
    FStatusCode: Integer;
    FStatusText: string;
    FURL: string;
    FMethod: TRESTRequestMethod;
  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create(const pKind: TTypeIPGeoLocationExceptionKind;
                       const pProvider: string;
                       const pURL: string;
                       const pStatusCode: Integer;
                       const pStatusText: string;
                       const pMethod: TRESTRequestMethod;
                       const pMessage: string);
    property URL: string read FURL;
    property StatusCode: Integer read FStatusCode;
    property StatusText: string read FStatusText;
    property Method: TRESTRequestMethod read FMethod;
  end;

  {$ENDREGION}

  {$REGION 'Interfaces'}

  IIPGeoLocationProvider = interface;
  IIPGeoLocationRequest = interface;

  IIPGeoLocation = interface
    ['{938C5905-D014-40B3-880D-44D53E8FC5DD}']
    function GetIP(const Value: string): IIPGeoLocation;
    function GetProvider(const Value: TTypeIPGeoLocationProvider): IIPGeoLocationProvider; //RECUPERA AS INFORMAÇÕES NO BANCO DE DADOS/ARQUIVO INI ETC..

    property IP[const Value: string]: IIPGeoLocation read GetIP;
    property Provider[const Value: TTypeIPGeoLocationProvider]: IIPGeoLocationProvider read GetProvider;
  end;

  //INFORMAÇÕES DO PROVEDOR DA API
  IIPGeoLocationProvider = interface
    ['{D1A4E37B-21E2-4B52-9B24-234DCA01ABDD}']
    function GetID: string;
    function GetURI: string;
    function GetRequestAccept: string;
    function GetKey: string;
    function GetRequestPer: TTypeIPGeoLocationRequestLimitPer;
    function GetRequestLimit: LongInt;
    function GetAvailable: TDateTime;
    function GetTimeout: Integer;
    function Params: IIPGeoLocationProvider;
    function GetRequest: IIPGeoLocationRequest;
    function GetEnd: IIPGeoLocation;

    property ID: string read GetID;
    property URI: string read GetURI;
    property Key: string read GetKey;
    property RequestAccept: string read GetRequestAccept;
    property RequestPer: TTypeIPGeoLocationRequestLimitPer read GetRequestPer;
    property RequestLimit: LongInt read GetRequestLimit;
    property Available: TDateTime read GetAvailable;
    property Timeout: Integer read GetTimeout;
    property Request: IIPGeoLocationRequest read GetRequest;
    property &End: IIPGeoLocation read GetEnd;
  end;

  IIPGeoLocationRequest = interface
    ['{D0D9674D-ABE9-46BD-B417-4BA685413B19}']
    function GetIP: string;
    function GetProvider: string;
    function GetHostName: string;
    function GetCountryCode: string;
    function GetCountryCode3: string;
    function GetCountryName: string;
    function GetCountryFlag: string;
    function GetRegion: string;
    function GetCity: string;
    function GetZipCode: string;
    function GetLatitude: double;
    function GetLongitude: double;
    function GetTimeZoneName: string;
    function GetTimeZoneOffset: string;
    function GetISP: string;
    function Execute: IIPGeoLocationRequest;
    function ToJSON(pResult: TEventIPGeoLocationResultString): IIPGeoLocationRequest;
    function GetEnd: IIPGeoLocationProvider;

    property IP: string read GetIP;
    property Provider: string read GetProvider;
    property HostName: string read GetHostName;
    property CountryCode: string read GetCountryCode;
    property CountryCode3: string read GetCountryCode3;
    property CountryName: string read GetCountryName;
    property CountryFlag: string read GetCountryFlag; //URL
    property Region: string read GetRegion;
    property City: string read GetCity;
    property ZipCode: string read GetZipCode;
    property Latitude: double read GetLatitude;
    property Longitude: double read GetLongitude;
    property TimeZoneName: string read GetTimeZoneName;
    property TimeZoneOffset: string read GetTimeZoneOffset;
    property ISP: string read GetISP;
    property &End: IIPGeoLocationProvider read GetEnd;
  end;

  {$ENDREGION}

  {$REGION 'TIPGeoLocation'}

  TIPGeoLocation = class(TInterfacedObject, IIPGeoLocation)
  strict private
    { private declarations }
    FIP: string;
    function GetIP(const Value: string): IIPGeoLocation;
    function GetProvider(const Value: TTypeIPGeoLocationProvider): IIPGeoLocationProvider;
  protected
    { protected declarations }
  public
    { public declarations }
    class function New: IIPGeoLocation;
  end;

  {$ENDREGION}

implementation

uses IPGeoLocation.Providers;

{$REGION 'TIPGeoLocation'}

class function TIPGeoLocation.New: IIPGeoLocation;
begin
  Result := Self.Create();
end;

function TIPGeoLocation.GetProvider(
  const Value: TTypeIPGeoLocationProvider): IIPGeoLocationProvider;
begin
  case Value of
    TTypeIPGeoLocationProvider.UNKNOWN:        raise Exception.Create('Provider não identificado...');
    TTypeIPGeoLocationProvider.IPInfo:         Result := TIPGeoLocationProviderIPInfo.Create(Self, FIP);
    TTypeIPGeoLocationProvider.IPGeoLocation:  Result := TIPGeoLocationProviderIPGeoLocation.Create(Self, FIP);
    TTypeIPGeoLocationProvider.IP2Location:    Result := TIPGeoLocationProviderIP2Location.Create(Self, FIP);
    TTypeIPGeoLocationProvider.IPAPI:          Result := TIPGeoLocationProviderIPAPI.Create(Self, FIP);
    TTypeIPGeoLocationProvider.IPStack:        Result := TIPGeoLocationProviderIPStack.Create(Self, FIP);
    TTypeIPGeoLocationProvider.IPIfy:          Result := TIPGeoLocationProviderIPIfy.Create(Self, FIP);
  else
    raise Exception.Create('Provider não implementado...');
  end;
end;

function TIPGeoLocation.GetIP(const Value: string): IIPGeoLocation;
begin
  Result := Self;
  FIP := Value;
end;

{$ENDREGION}

{$REGION 'EIPGeoLocationException'}

constructor EIPGeoLocationException.Create(const pKind: TTypeIPGeoLocationExceptionKind;
  const pProvider: string;
  const pMessage: string);
begin
  FKind := pKind;
  FProvider := pProvider;
  Message := pMessage;
end;

{$ENDREGION}

{$REGION 'EIPGeoLocationRequestException'}

constructor EIPGeoLocationRequestException.Create(const pKind: TTypeIPGeoLocationExceptionKind;
  const pProvider: string; const pURL: string; const pStatusCode: Integer;
  const pStatusText: string; const pMethod: TRESTRequestMethod;
  const pMessage: string);
begin
  FKind := pKind;
  FProvider := pProvider;
  FURL := pURL;
  FStatusCode := pStatusCode;
  FStatusText := pStatusText;
  FMethod := pMethod;
  Message := pMessage;
end;

{$ENDREGION}

end.
