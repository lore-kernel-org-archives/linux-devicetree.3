Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EDC19D092
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 21:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776548817; cv=none; b=sHvFi4BG9wbT/7XjUG8adKKVK9y9vPIa9JHDdkG2FwYFhkT3t96T5hRQMGHVnBimWrIpHMnwoNz8YhhPoCi6jhbCazhdHNXSspPNqcPx5cQu6bDi2VcP+Qj8z3U6+7OwGU/m09oZL3ynUNg0LsZZrNNUloUQr6IZimeBQzyJIw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776548817; c=relaxed/simple;
	bh=CyRHcuY8zYNdos8cSAYeyx6FOS92k2vX+NfUNR6+NvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PVvTlwVizoon9R6/EBCj5yNg+vM1szc0MSxIKQsw75N9oIRQQYYkovtgZL2KTbFjuz5TBfk+0KLOrzMxBUupYxBHnAkyy2G+kKyFO0WZ7/yf2lUlNKkCH1kNvyMciWVfVwwAaqSUPT/uJrpYp57Dss6qFeYJXGVuMG7P52p85AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=rkiFmKRi; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="rkiFmKRi"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4243bf9be36so864302fac.3
        for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 14:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776548812; x=1777153612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HlFal52AkQM6BisW0M/k3f7NMBBq+4z5klxPyW4MPx4=;
        b=rkiFmKRiFU7njH2JrGUhcQBiwd1AxwF/hYMHnMwP0n5DkkVucJpN3TF/RzKGcz5Rpr
         WWHHPmojEh4cHYXCSUYuYt7u2foMRCi6tlE9xdXGEmnfHiucZVa26jbLUjEOjQOxOCo0
         0vDEgstM55V4Di5gEoUBJrlifNyIoLinZAPSI6buqnGZQhBultbEf5fwoyUZ16VIsWk8
         I7pNXZ5A+jppFcuY+SZdJABv3KqEVQUwW4lceZbZzK8hS40QBgRjw/mCmH5SQ+FwtirK
         IFdcFpEaipPr1ztug935MZowFwm2hOqpGjW/h9bMyEPlR3qojqfGqavZMEyAssYejJJ6
         lARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776548812; x=1777153612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HlFal52AkQM6BisW0M/k3f7NMBBq+4z5klxPyW4MPx4=;
        b=SCBvgVYXN2SEkSiCVrEVOoeLU9+HLcM/q8NxPd4bGoy9zEFdYL3nCEnu647pjRn9OC
         4SHjJ8FXTdmotImA3TuGu9E2hsZ9QpCtNsu5pv6ACV6wfh5zCKnJGr2tqFi7C7sR91vU
         ow48/m7ZX0K6/6aiOGGje+v+rDhWaOKekxGSAaxiY6Pqg9oeKIFGWKN7TxpuittPdg53
         o3b2+GAm0yxPzJ4mNsoKRfAyoZE8AqeepNfx3L5OH2R2C0S/2ritmRT3lYDV1S7xZqVB
         fzWADtYDl2sdpdFn57Ot6womuI7TdfOqNP1NxvlK1TRKYQnih7tlvh5Oews96qK9EOL9
         W9CA==
X-Forwarded-Encrypted: i=1; AFNElJ+PJO2c+4mI/meTMXpeWdnlK9lmoXhmAH85Gm31o18GfIxnd+mcd1h3v9brEuNg2nFhRGKOsQIQAnPH@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp1baM6+05E7Zluc1C3UY3njmzxtfpfgqwKjwcB5AoEx2kEGlD
	zipJY1k15VOzlxdrmcFmOb/bN3m0yASPmLL8mdgEMuZ4BiRN0Sjwc6jeaCPzqb9vcaI=
X-Gm-Gg: AeBDieuo355ky9obv9uVqITX6+JgFOLh/9tvkB7UEjcn9vAx1k4GUttsk7NIQeyOcwf
	+kvrJOnWSPKz9cPsdIFPOkIrDUV6Q5NkyIDyu2mSM9gmDZFmhtKFvp10zPLpKmvdsksynm0kzu1
	gtyozYGxs0opIlm1zdhhvvDvKBrFXd3vjLbu12VIdKpB45/v1x4a2GuANgl43lsvQM3v+Gmku6o
	tT6GeZGXfKBcWyVzTVAYF5tGys+gZsjiGP49YfI9icchgJ21RgF7jZ5W9v51V2xXZJ/gtNCsRKV
	K2jEOFW9X0OYfE0A1IPok+zOUeddqAaAbghiZ87AXiw8GpREZSn0IJt+VmCGpQDNZkKek7PsBoL
	EleQ5ULLzXxZVabNiZ2WDM58iZd/AKMmiHg68KQZj49zyCfiQLwZvA855FVSHTGVYNBf3lYSyDn
	XiNcpYHsOhUmA/k1uQzKBQcKAErRqK5hcD8Z3seLqy5dSKWWMouzAqM67fn0IZsWBoq6Y+uCUKr
	xxD7sr7XxYxEOBvFhAk6fQ=
X-Received: by 2002:a05:6808:1442:b0:467:ca8:c397 with SMTP id 5614622812f47-4799c8782efmr3858530b6e.4.1776548812273;
        Sat, 18 Apr 2026 14:46:52 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b1f8:aabe:74d7:21ba? ([2600:8803:e7e4:500:b1f8:aabe:74d7:21ba])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4799fead505sm3790789b6e.2.2026.04.18.14.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Apr 2026 14:46:50 -0700 (PDT)
Message-ID: <23a00548-feac-4ce6-9a71-509b7636b372@baylibre.com>
Date: Sat, 18 Apr 2026 16:46:48 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: iio: adc: avia-hx711: add avia,hx710b
 compatible
To: Piyush Patle <piyushpatle228@gmail.com>, jic23@kernel.org,
 ak@it-klinger.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260418170549.312446-1-piyushpatle228@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260418170549.312446-1-piyushpatle228@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/18/26 12:05 PM, Piyush Patle wrote:
> Add the HX710B compatible to the binding and describe the variant-specific
> channel and gain model.
> 
> Also add an example node for HX710B so the schema covers both supported
> parts.
> 
> Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
> ---
>  .../bindings/iio/adc/avia-hx711.yaml          | 36 +++++++++++++++----
>  1 file changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> index 9c57eb13f892..19318c4dd994 100644
> --- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/iio/adc/avia-hx711.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: AVIA HX711 ADC chip for weight cells
> +title: AVIA HX711 and HX710B ADCs
>  
>  maintainers:
>    - Andreas Klinger <ak@it-klinger.de>
> @@ -12,9 +12,19 @@ maintainers:
>  description: |
>    Bit-banging driver using two GPIOs:
>    - sck-gpio gives a clock to the sensor with 24 cycles for data retrieval
> -    and up to 3 cycles for selection of the input channel and gain for the
> -    next measurement
> -  - dout-gpio is the sensor data the sensor responds to the clock
> +    and 1 to 3 additional cycles for selection of the input channel and gain
> +    for the next measurement
> +  - dout-gpio is the sensor data output the sensor drives in response to
> +    the clock
> +
> +  HX711: 24-bit ADC with selectable gain (32/64/128) and two differential
> +  input channels. Channel A supports gain 64 and 128; channel B supports
> +  gain 32.
> +
> +  HX710B: 24-bit ADC with fixed gain of 128. Channel 0 is the differential
> +  input and channel 1 measures the DVDD-AVDD supply voltage difference.
> +  Channel selection for the next conversion is controlled by the number of
> +  trailing PD_SCK pulses.

The bits about "bit-banging" and "channel selection" sound like driver
implementation details that don't belong in the DT bindings.

>  
>    Specifications about the driver can be found at:
>    http://www.aviaic.com/ENProducts.aspx
> @@ -23,11 +33,12 @@ properties:
>    compatible:
>      enum:
>        - avia,hx711
> +      - avia,hx710b
>  
>    sck-gpios:
>      description:
>        Definition of the GPIO for the clock (output). In the datasheet it is
> -      named PD_SCK
> +      named PD_SCK.

Save the cleanups for a separate patch to keep the adding HX710B changes clear.

I'm guessing the existing binding for HX711 is quite old because it is quite
incomplete.

It has avdd-supply, but is missing vsup-supply and dvdd-supply.

It should probably also have a way to describe how the rate pin is wired.

And it should have a clocks property instead of clock-frequency.

It would make sense to have two clocks, on for XI/XO and one for PD_SCK.
The second one being optional because of sck-gpios.

HX710B has many fewer pins, so we will need an:

allOf:
  - if:
      properties:
	compatible:
	  const: avia,hx710b

section that sets anything for pins that chip doesn't have to false, like
vsup-supply.

HX710B also has a vref-supply that HX711 doesn't have. (Unless these are the
same thing by a different name?)


>      maxItems: 1
>  
>    dout-gpios:
> @@ -43,6 +54,9 @@ properties:
>        Definition of the regulator used as analog supply
>  
>    clock-frequency:
> +    description:
> +      Bit-bang clock frequency on PD_SCK. Keep the PD_SCK high time below
> +      the chip power-down threshold.

I suspect that this was meant to be the crystal frequency (XI/XO), not PD_SCK
since sck-gpios already exists for PD_SCK

>      minimum: 20000
>      maximum: 2500000
>      default: 400000
> @@ -58,10 +72,20 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> -    weight {
> +    /* HX711 example */

The compatible string already has the part number, so this comment
doesn't really and any new info.

> +    weight0 {
>          compatible = "avia,hx711";
>          sck-gpios = <&gpio3 10 GPIO_ACTIVE_HIGH>;
>          dout-gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
>          avdd-supply = <&avdd>;
>          clock-frequency = <100000>;
>      };
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    /* HX710B example */
> +    weight1 {
> +        compatible = "avia,hx710b";
> +        sck-gpios = <&gpio3 11 GPIO_ACTIVE_HIGH>;
> +        dout-gpios = <&gpio0 8 GPIO_ACTIVE_HIGH>;
> +        avdd-supply = <&avdd>;
> +    };

There is nothing significantly different about this example, so it
isn't particularly useful.

