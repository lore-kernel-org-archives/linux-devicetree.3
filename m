Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D84943F4C2
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 20:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786134242; cv=none; b=RJkLK5V6EDZk/RY0ZyLITX46xMzRIT6e9kldN8H3NYUOjMuO+jc5oj2ihmLWEGV5TooG7bRojgkH7jCZfl4DEncvb5yIiX9pJjOvdA27vc0gt5jNMESl3jWSkP2JHgdWamOAz3/i7X2MfaKtFqgX5tVsNMLnC/1qAdu/Vc2a614=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786134242; c=relaxed/simple;
	bh=n2eolYt5CCjeMz0TzIeeW8hw38gmzPboW1aYo9XSOT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJ4VY0UgpQRzML8OlqsJRBUMNe60zGP2rTvm/nVD3M6NB+JqYYRMyJXAHUKIBYNOxnQKooLyPrRJQ4b+c1/nVaultWbwnOH+dEeKEU8RW+sg2dRMaH9Kcah6NSNwM9z4SQvDebTJCmZ+S02GbBlYTfqglzHCMcEn2c/IppgR1+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pb/paLRn; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pb/paLRn"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7ec1e9d3359so8395a34.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 13:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786134238; x=1786739038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2J94HMnY+/NqeWFTSOyyflcz5JBZ7AWbftpPkiQyAxY=;
        b=pb/paLRnuz+UmApw1/ltZT62on/uFe5B9KscFULelbeCccabD4SvNmoRpeiYiNUy8F
         IsIGXW5Tsosbnw3nQBpUgm6UaMCe2TZHILrlncth/Go0ZcFmA2DjrWxcPJu87zbLzf22
         IzfoImxQxLB3b/vgbYbgogmb37LbW674XD++X+39AgZtIEO/L518TRhOpu4AwT/IlhD7
         mCxjCY4wF3nRr3YFkZcVijykDlALBY336Kozqjaj+oQYZCJSnsKgOjlrk6DJJYEnzYEv
         Jq6UheqgvpdBq7jM+0MCoUoyxHa0CBgYKFzIrPqLUKuJd1an+2QDNHo+ANsWzDzc111N
         JD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786134238; x=1786739038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2J94HMnY+/NqeWFTSOyyflcz5JBZ7AWbftpPkiQyAxY=;
        b=M4Uv/MGaIpRVHMxp96zA1qe5yYFD3qv1hZSe1GwyjWsjlnXuy9Ct0dZhqvovMb+6Aq
         1XKtiUGj/9KJjrg5HMYzgJTGufE4Wj+IKWObYKT7MxsZFaa5Rjqk18Pl95oUIZ+kxXVn
         1R8gAFLazCu9y8ubDfGYpe/LpOHwpkXXoWLDKieDZQw6T4EkxoMsGvzT7bE/pWObdGFK
         vAiCi11LxCQZ0jcucwRe2jUD90b19DmCk08w9zzbSkch0/RNe3QDOu9NYQwTIkLutTCn
         E2s1+yBkwDs6qj5o+ZZSTjdV/uV7No7IefkPON6FqfIb3DoyPbnyjCbmXF0xNnCY04xJ
         oqbA==
X-Forwarded-Encrypted: i=1; AHgh+RqQJLQBjYyxUb1lX84cnz3yVVrF5eH4z9J0qpTOIU3Lk4FCfDtjdE+rn2pRDVydOlVCbNEkiR+9MUYn@vger.kernel.org
X-Gm-Message-State: AOJu0YxXKb9MSSgyCQ0mqH84cUpxv13yLdG2ArFme9Jr+mt6G/H7L3VT
	04mC9d8kqq+Vs+rkVC53eL1d+yOpIIto6a8Y2JtFp5ZrGkqs66bYZQjzOM4Htkbkt6c=
X-Gm-Gg: AR+sD12Z4XLDyL5VEneii8S5c5UQiwVVl3Bc4vZ52P4SE5/+egjTYxbkLDM7YhpT8wy
	A0Gx057uL/kVPLMSYtkubnNwkllt81gl++r8JWD0sVTduYSDMn52yC9ObQMsNcaw9rCEvdlzR6J
	Mms2Qg7Sa3F31dLfhpG2tFORws9zuQV0uxw1tSYejYLO5MUiJVRmIVkaa2/dVORGUcvJO/A0pUs
	8/dPoF6WlW77RyrvflhjYNhUJBEQK+TyBAv0afxN3VtvdlaHvs/UHuRxcUpZVA2k5N4O0myPjqd
	drWYjB19futKJFWs+yFryKgqmwPpgSxH1pLE1V2pJ655LmUxM9Kyb3dS34XcHzMJ+nPOxs7Gz8B
	nf1a3nUm7naqMh17Mxg1X53LW469R6DHeMYcNkKGvRFQP87kWH9tpbZi3rT+2XE7qW58yfMiTKY
	rSsf3o3ExWwU/rnP65AhAk8YawwFJXEykCHQpG4ol+3FFFXMC7fZz3g/LXIOEpEiErbkvBMcjBt
	L/atvhoo6oAyvCY54ypcTWKTMhzoyceBCrv8zjB4EAWLV4=
X-Received: by 2002:a05:6830:8286:b0:7e6:ee6d:cb1f with SMTP id 46e09a7af769-7f1e59c5ab5mr17070316a34.0.1786134238198;
        Fri, 07 Aug 2026 13:23:58 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b714:88c:313d:dee2? ([2600:8803:e7e4:500:b714:88c:313d:dee2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b76fe2fsm1910393a34.16.2026.08.07.13.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 13:23:57 -0700 (PDT)
Message-ID: <34ff47a2-1a53-4d99-a864-5bf633e05d4f@baylibre.com>
Date: Fri, 7 Aug 2026 15:23:56 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: adc: ti,ads112c04: Add binding
 for ADS112C04
To: Kyle Hsieh <kylehsieh1995@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260805-ti-ads112c04-driver-v3-0-49f436829e01@gmail.com>
 <20260805-ti-ads112c04-driver-v3-1-49f436829e01@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260805-ti-ads112c04-driver-v3-1-49f436829e01@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/5/26 12:38 AM, Kyle Hsieh wrote:
> Add device tree binding documentation for Texas Instruments ADS112C04
> I2C Analog-to-Digital Converters.
> 
> These devices provide 4-channel, 16-bit delta-sigma ADCs with an I2C
> interface, programmable gain amplifier (PGA), and data-ready (DRDY)
> interrupt output.
> 
> The binding uses child nodes to dynamically define the connected
> single-ended or differential channels.
> 
> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> ---
>  .../devicetree/bindings/iio/adc/ti,ads112c04.yaml  | 146 +++++++++++++++++++++
>  1 file changed, 146 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
> new file mode 100644
> index 000000000000..ff079bb5b3dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
> @@ -0,0 +1,146 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/ti,ads112c04.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments ADS112C04 ADC
> +
> +maintainers:
> +  - Kyle Hsieh <kylehsieh1995@gmail.com>
> +
> +description:
> +  The ADS112C04 (16-bit) are precision analog-to-digital converters (ADCs)
> +  with an I2C interface. They feature a flexible input multiplexer, a
> +  low-noise programmable gain amplifier (PGA), two programmable excitation
> +  current sources, a voltage reference, and a precision temperature sensor.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,ads112c04
> +
> +  reg:
> +    maxItems: 1
> +    description: I2C address of the device.
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Data ready (DRDY) interrupt output.
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO connected to the RESET pin. Active low.
> +
> +  avdd-supply: true
> +  dvdd-supply: true
> +
> +  refp-supply: true
> +  refn-supply: true
> +
> +  ti,refp-refn-resistor-ohms:
> +    description: Resistance of the external resistor between REFP and REFN.
> +
> +patternProperties:
> +  "^channel@[0-9a-b]$":
> +    $ref: adc.yaml
> +    unevaluatedProperties: false
> +    properties:
> +      reg:
> +        items:
> +          - maximum: 11
> +
> +      single-channel:
> +        maximum: 3
> +
> +      diff-channels:
> +        items:
> +          maximum: 3
> +
> +      excitation-channels:
> +        maxItems: 2
> +        items:
> +          maximum: 3

I{1,2}MUX can also be routed to the REFP and REFN pins, so we need to
go up to 5 here and add a description that explains the mapping.

> +
> +      excitation-current-nanoamp:
> +        maxItems: 2
> +        items:
> +          enum: [10000, 50000, 100000, 250000, 500000, 1000000, 1500000]
> +

The current outputs are not independently configurable on this one
so maxItems: 1 would be fine on this one.

Or I think this works too:

      excitation-current-nanoamp:
        items:
          - enum: [10000, 50000, 100000, 250000, 500000, 1000000, 1500000]


> +      burn-out-current-nanoamp:
> +        items:
> +          - enum: [10000]

When there is only one possibility:

             - const: 10000

> +
> +      reference-sources:
> +        items:
> +          - enum: [internal-2.048v, external, avdd]
> +            default: internal-2.048v

Since there is only one internal, we can just call it "internal".

> +
> +    dependencies:
> +      excitation-channels: [ excitation-current-nanoamp ]
> +      excitation-current-nanoamp: [ excitation-channels ]
> +
> +    oneOf:
> +      - required: [ single-channel ]
> +      - required: [ diff-channels ]
> +
> +required:
> +  - compatible
> +  - reg
> +  - avdd-supply
> +  - dvdd-supply
> +
> +dependencies:
> +  refn-supply: [ refp-supply ]
> +
> +oneOf:
> +  - required:
> +      - refp-supply
> +  - required:
> +      - ti,refp-refn-resistor-ohms
> +  - properties:
> +      refp-supply: false
> +      refn-supply: false
> +      ti,refp-refn-resistor-ohms: false
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        adc@40 {
> +            compatible = "ti,ads112c04";
> +            reg = <0x40>;
> +            interrupt-parent = <&gpio>;
> +            interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> +
> +            reset-gpios = <&gpio 13 GPIO_ACTIVE_LOW>;
> +            avdd-supply = <&vdd_3v3_reg>;
> +            dvdd-supply = <&vdd_3v3_reg>;
> +            refp-supply = <&vref_reg>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            channel@0 {
> +                reg = <0>;
> +                diff-channels = <0>, <1>;
> +            };
> +
> +            channel@1 {
> +                reg = <1>;
> +                single-channel = <2>;
> +            };
> +        };
> +    };
> 

