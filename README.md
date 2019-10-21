![Maintained YES](https://img.shields.io/badge/Maintained%3F-yes-green.svg)  
![Ask Me Anything !](https://img.shields.io/badge/Ask%20me-anything-1abc9c.svg)

# IPGeoLocation

Biblioteca de geolocalização por IP.

Implementa uma classe de abstração que recupera informações de geolocalização de um IP utilizando provedores de solução “IP-Geolocation”.

## O que é a geolocalização de IP?

A geolocalização baseada em endereços IP é uma técnica usada para estimar a localização geográfica de um dispositivo conectado à Internet usando o endereço IP do mesmo.  Este mecanismo depende de que o endereço IP do dispositivo apareça em um banco de dados com sua respectiva localização, endereço postal, cidade, país, região ou coordenadas geográficas, que são alguns dos níveis de detalhe que podem ser registrados.

Para mais informações: [Geolocalização de IPs](https://www.lacnic.net/3107/3/lacnic/geolocalizac%C3%A3o-de-ips)

## Para que?

Essa tecnologia é amplamente usada em:

* Geo Marketing
  * Propagandas direcionadas/sob medida
  * Informação interessante com base na localização
  * Promoções/campanhas destinadas a certo público/local
  * Empresas de turismo, companhias aéreas, redes hoteleiras
  * Entretenimento
  
* Direcionamento de conteúdo
  * Portais “globais” com conteúdos “locais”
  * Informações no idioma do leitor
  * Conteúdo de interesse local (notícia, novidades, etc)
  * Portais de notícias
  * Serviços de informação meteorológica
  * Serviços de emergência
  
* Controle de acesso (à conteúdos/serviços)
  * Restringir acesso conteúdo/serviços com base na “localização” do usuário
  * Conteúdos específicos para determinado “público”
  * Censura
  * Jogos online
  * Streaming vídeos/músicas

* Segurança
  * Restringir tráfego, por localização do usuário
  * Em situação de emergência/ataque descartar tráfego “não esperado”
  * Controle de SPAM
  * Firewalls
  * Governos

## Provedores Homologados

| Provedor | Site | API |
|---|---|---|
| IP2Location | https://www.ip2location.com | https://api.ip2location.com/v2 |
| IP Geolocation | https://ipgeolocation.io | https://api.ipgeolocation.io/ipgeo |
| IP Stack  | https://ipstack.com | http://api.ipstack.com |
| IP Ify | https://geo.ipify.org | https://geo.ipify.org/api/v1 |
| IP API | https://ipapi.com | http://api.ipapi.com/api |
| IP Info | https://ipinfo.io | https://ipinfo.io |
| IP Geolocation API | https://ipgeolocationapi.com | https://api.ipgeolocationapi.com/geolocate |
| IP Data | https://ipdata.co | https://api.ipdata.co |

## Demo

[Demo.zip](https://github.com/antoniojmsjr/IPGeoLocation/files/3751804/Demo.zip)

```delphi
  try
     TIPGeoLocation
    .New
      .IP['189.27.181.129']
      .Provider[TTypeIPGeoLocationProvider.IPInfo]
      .Params
      .Request
        .Execute
        .ToJSON(ResultJSON); 
  except
    on E: EIPGeoLocationRequestException do
      begin
        ShowMessage(E.Message);
      end;
  end;
```
![IP Geolocalização](https://user-images.githubusercontent.com/20980984/67174716-834e3f80-f399-11e9-9d5f-daa1e268a78e.png)


## Licença

(https://img.shields.io/badge/license-Apache%202-blue.svg)](./LICENSE)
