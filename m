Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8383242B3
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 15:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303765; cv=none; b=RoGzNq8IxxzjlRI9e65ikzChx54DXuWDPIZL2kiYdu7TsnSL1iDW8IWejhobpsjQk5Q3L/qtgw1S1v3XZQ25DVqY2peJdHbtyd/vSfUHgRsLHwks3yvzM6bI1lEQiLK1Nj784SvA6DFA8fOjBByIk8fn3I1KkJYwPm09ddJdQgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303765; c=relaxed/simple;
	bh=KsLcNT8hiJYwF6tLQbiKBJ7Ba7XPy8kw53IL7gQ84cQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hrkaducwPkgKEAb1KdN4nXRNiNuSpZp1PHYdqwx3dd+WOtt7iU9xLYgkdYAH5FWCwYUCE8rcxN4Xi7gjw721pM57T2yOpR1cEpvpRMU16gz3LqspRWfr2xozmhhU63j3IC7PrFGYaX0U78UgDyu4OO1LakJVNNsZsqUy3fvCtjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=V3qd0Hyi; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="V3qd0Hyi"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-42ff0576868so1766339fac.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 08:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777303761; x=1777908561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OA0PiNLpvEPfacQ8HQI+/+hgOLmfZZQTdbn57QrSlu8=;
        b=V3qd0HyiVNHkMM83n3+vvE3JeNwrApVNCuSejMTW149qeJ+Oh5a6Bl0/1wqH7nPjLt
         pGsy+7tq1Tv8cz4w+tK8i6sJ1B9OEHgruBURvBewEjyedQ8JCnf3YAnSZrBobcYg5pqv
         9JKXgJr9oXLj1oZHCJfaZrLBfId6VnuB6jFCYp4PMCvgYhORONapS5eUSx8KKPNWy1+9
         A5voojhIJdDmWOGNisJRNBMEbPSsU9CRswGXxj1WXS9iwOrHWQVar48h7YxcX+vi2S/c
         cIxTi+KSgH5F3TqqT/QYHs5ldL6HULBlhy4cMxvNL+Z4MmOj8+8iSMBwvSJGsySFhg7t
         UvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777303761; x=1777908561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OA0PiNLpvEPfacQ8HQI+/+hgOLmfZZQTdbn57QrSlu8=;
        b=YS1LtDjvFWPFSDI9Kyu7LHayZBiG/uOISc/e9cmf1CSy9pTJFzGbMFPJk1D6sHOTxJ
         +oMW2SG95QayqM4Uob7GzzX4nPDGNceYL5bG5thTp+y0zvX1DhuUau5rBjImlH7W5KME
         7tvEiDVDA3TOUpQ0NayR8Dl6sQ6tsSjp2B3MBdIOrFZ7lm4pqWy0BbYy83z3X93DmC+j
         1MvnGFoYT1N9Q876749TBTxBL70H8GTRG+UsG1Wv/hNii7B0rtX5AIWxNFaCbns6Gt10
         BUlzzWJ4+5uiwUQ2Vip+ihPc7ZJ1MCAnuUJNAkWpcFFA8xSPfB6wd4Nn8WmIEZsxGJMQ
         yqCA==
X-Forwarded-Encrypted: i=1; AFNElJ8QvE6uNrbLj7t/7Qu6pjFGApvxn1rQBl/k9qBtq2f/a0pq06PHve5ScWz6TDj7GB4rOrKuLxgODZaL@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1+ryJNNKT1yGMBgDHX1QWbG8DgZyWFrAcMUZxyjTjU1S2ZokU
	CoxXbmqji5QbYcA/+iqVbdmLYUItJVihEdO+DX47XzcObrotR04FvAE6of2mY3l2dkI=
X-Gm-Gg: AeBDietW+ex0Y57nU8U7DEfVMjjbgeMPiAhjaQ7XokZxmKfXjGPYXPgw37FJE/Da7rQ
	x9QVGTErBnfzV0wUgTYgVc0ho9tidxrAsu9wccYgGhHhlAHazDTOgnAVtbU7sJ/1I+o0L+Y4H3D
	OHFT6JV93MQ897lvhXmR3S7liGzQkIeUjZ/fNVAgHSr6pBSLPVI2MwJYKn66adKYbzK6IWN8V74
	hfv1G/S2kpKeru6B3KK/afqoVb4KwE6nNxEIdtEG3KEVq0mAc707wrKhOtZT3Zp+3OztptmbdIp
	QA56oy0VGWg1b08daaZdC6GKbC+WmuNF+Z3ron2dwNXKw6+oMOiTi8LVmxW5Mdi5OmkYFOesxUu
	WywMmjDHMz4x+t88oQlwDlsJ++HX5IBUccyyq1I7cid+azuetKu1d4zhiy/k6mtUBdkGvz+U9Qk
	44B2FwAXajYeJhD5SS+EnWmOZmHt+iqb78PZSRLSIwLCT3tLexX3ONhJpW88NH0LxDWah8CCFtn
	Gm7Ae9eJ7Pu
X-Received: by 2002:a05:6870:810a:b0:417:533b:7999 with SMTP id 586e51a60fabf-42abf2546afmr24857653fac.1.1777303761046;
        Mon, 27 Apr 2026 08:29:21 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:96f5:eee9:c87c:c599? ([2600:8803:e7e4:500:96f5:eee9:c87c:c599])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42ff2b6b2cdsm12933091fac.1.2026.04.27.08.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 08:29:20 -0700 (PDT)
Message-ID: <93a7ca0d-46a1-4b14-8f49-348018c4158b@baylibre.com>
Date: Mon, 27 Apr 2026 10:29:19 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] dt-bindings: iio: adc: avia-hx711: add avia,hx710b
 compatible
To: Piyush Patle <piyushpatle228@gmail.com>, ak@it-klinger.de,
 jic23@kernel.org
Cc: nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260427100950.33936-1-piyushpatle228@gmail.com>
 <20260427100950.33936-2-piyushpatle228@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260427100950.33936-2-piyushpatle228@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/27/26 5:09 AM, Piyush Patle wrote:
> The HX710B shares the same two-wire interface as the HX711 but differs
> in its channel and gain model: gain is fixed at 128 and the number of
> trailing PD_SCK pulses selects the input channel rather than the gain.
> 
> Add avia,hx710b to the compatible enum. Document the chip differences
> in the description and add chip-specific supply properties (dvdd-supply,
> vsup-supply, vref-supply) and a rate-gpios property for the HX711 RATE
> pin. Add allOf constraints that forbid HX711-only properties on HX710B
> nodes and vice versa. Clarify the clock-frequency description to
> reflect its actual purpose: controlling the SCK bit-bang timing.

Krzysztof gave a Reviewed-by on the last revision [1], so you need to
include that here or explain why you didn't pick it up. If you just make
a trivial change, you can still pick it up. In this case though, I think
that enough changes were made that it is worth having a DT maintainer have
another look.

https://lore.kernel.org/linux-iio/20260423-famous-tody-of-opposition-73c8af@quoll/

> 
> Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
> ---
> Changes in v4:
> - Add vref-supply for the HX710B VREF reference voltage pin.
> - Remove dvdd-supply from the HX710B forbidden properties list; the
>   HX710B has a DVDD supply and the DVDD-AVDD channel relies on it.
> - Add allOf block forbidding vref-supply on HX711 nodes.
> - Add an HX710B example showing vref-supply.
> - Update description: avoid specific channel-number references in
>   hardware text.
> 
> Changes in v3:
> - Drop the vref-supply mention from avdd-supply; no such binding
>   property exists.
> - Drop the clock-frequency sentence that repeated the schema default.
> - Restore the example node name to weight.
> - Remove the separate HX710B example.
> 
> Changes in v2:
> - Remove driver implementation details from the description and describe
>   hardware behaviour only.
> - Drop unrelated punctuation cleanup.
> - Add dvdd-supply and vsup-supply optional properties for HX711.
> - Add rate-gpios optional property for the HX711 RATE pin and forbid it
>   on HX710B.
> - Add the allOf if/then block forbidding HX711-only properties on
>   HX710B nodes.
> - Clarify clock-frequency as SCK bit-bang timing, not a crystal or
>   external clock input.
> - Sort compatible enum alphabetically.
> - Remove redundant example comments.
> - Update the HX711 example to exercise rate-gpios.
> ---
>  .../bindings/iio/adc/avia-hx711.yaml          | 82 +++++++++++++++----
>  1 file changed, 67 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> index 9c57eb13f892..fddd296bfaca 100644
> --- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> @@ -4,49 +4,91 @@
>  $id: http://devicetree.org/schemas/iio/adc/avia-hx711.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: AVIA HX711 ADC chip for weight cells
> +title: AVIA HX711 and HX710B ADCs
>  
>  maintainers:
>    - Andreas Klinger <ak@it-klinger.de>
>  
>  description: |
> -  Bit-banging driver using two GPIOs:
> -  - sck-gpio gives a clock to the sensor with 24 cycles for data retrieval
> -    and up to 3 cycles for selection of the input channel and gain for the
> -    next measurement
> -  - dout-gpio is the sensor data the sensor responds to the clock
> +  The HX711 is a 24-bit ADC with selectable gain (32/64/128) and two
> +  differential input channels. Channel A supports gain 64 and 128;
> +  channel B supports gain 32.
>  
> -  Specifications about the driver can be found at:
> -  http://www.aviaic.com/ENProducts.aspx
> +  The HX710B is a 24-bit ADC with fixed gain of 128. One input measures
> +  the differential voltage between the two input pins; a second measures
> +  the DVDD-AVDD supply voltage difference for battery level detection.
>  
>  properties:
>    compatible:
>      enum:
> +      - avia,hx710b
>        - avia,hx711
>  
>    sck-gpios:
>      description:
> -      Definition of the GPIO for the clock (output). In the datasheet it is
> -      named PD_SCK
> +      GPIO for the clock output (PD_SCK in the datasheet).
>      maxItems: 1
>  
>    dout-gpios:
>      description:
> -      Definition of the GPIO for the data-out sent by the sensor in
> -      response to the clock (input).
> -      See Documentation/devicetree/bindings/gpio/gpio.txt for information
> -      on how to specify a consumer gpio.
> +      GPIO for the data output from the sensor (DOUT in the datasheet).
>      maxItems: 1
>  
>    avdd-supply:
>      description:
> -      Definition of the regulator used as analog supply
> +      Analog supply voltage (AVDD). Also serves as the voltage reference on
> +      both chips.
> +
> +  dvdd-supply:
> +    description:
> +      Digital supply voltage (DVDD). For the HX710B, DVDD must be greater
> +      than or equal to AVDD. When DVDD is a battery rail and AVDD is a
> +      regulated supply, one channel monitors the DVDD-AVDD difference for
> +      battery level detection.
> +
> +  vsup-supply:
> +    description:
> +      Supply voltage for the on-chip regulator (VSUP). HX711 only.
> +
> +  vref-supply:
> +    description:
> +      Reference voltage input (VREF). HX710B only. When omitted, the driver
> +      assumes VREF is tied to AVDD on the board.
> +
> +  rate-gpios:
> +    description:
> +      GPIO connected to the RATE pin (HX711 only). When driven low the
> +      output data rate is 10 SPS; when driven high it is 80 SPS. If
> +      omitted the RATE pin state is determined by the board wiring.
> +    maxItems: 1
>  
>    clock-frequency:
> +    description:
> +      Controls the SCK bit-bang timing. The value is used to derive the
> +      delay between SCK edges; keep the SCK high time below 60 us to
> +      avoid triggering chip power-down mode.
>      minimum: 20000
>      maximum: 2500000
>      default: 400000
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: avia,hx710b
> +    then:
> +      properties:
> +        vsup-supply: false
> +        rate-gpios: false
> +
> +  - if:

Could just be else:

Probably OK either way though.

> +      properties:
> +        compatible:
> +          const: avia,hx711
> +    then:
> +      properties:
> +        vref-supply: false
> +
>  required:
>    - compatible
>    - sck-gpios
> @@ -62,6 +104,16 @@ examples:
>          compatible = "avia,hx711";
>          sck-gpios = <&gpio3 10 GPIO_ACTIVE_HIGH>;
>          dout-gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
> +        rate-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
>          avdd-supply = <&avdd>;
>          clock-frequency = <100000>;
>      };
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    weight {
> +        compatible = "avia,hx710b";
> +        sck-gpios = <&gpio3 10 GPIO_ACTIVE_HIGH>;
> +        dout-gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
> +        avdd-supply = <&avdd>;
> +        vref-supply = <&vref>;
> +    };

