Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCAC2248A0
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 08:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778487754; cv=none; b=m2rTFlBut+wMEU6yUYFn4EBhyPSxjJvrnPENKbU5bRmsWRk1OY9TMlrxcv2OhFjgbeNQtFrGxfFFjD79GlOuX3D3b/IDfxBxH8oTBNrIH8PUn1WZkRM6GFizWo+7lZUQKQo+Hc0VfonhfE6hggNfQPqJ65BjRiXtSAzoneFVtxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778487754; c=relaxed/simple;
	bh=xDPwfIZXTeW3yq3e+uusrA8W/Zw3xwvvavaC7B7WOb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VTLgV5TuVE7wTI4HL/djrq+60l0ldtvq88EGfY0BJVC5GZuwcSCexZq6Ajyt6YCdtBd5kx7AGN+TCJLRNMlVRp8e2Z20hhajjtyJKGA9ACYbwL0P1i+W5GUmeCK88QoQ8Kii9wIwQX8UiY3tP3+p4rn8C+vG9PufkBFGgzihgLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEOQbUu2; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pEOQbUu2"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a860667fabso3612250e87.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 01:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778487740; x=1779092540; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6S8mBYkFiwNSV2sm1TejB3CD4/6gNBSvCKYv8dIJSuw=;
        b=pEOQbUu2H+zOx9ZBV4oO3C4BiW3h2lBp6NjAe49h69GtJmkq+PE1F4pDxqxlDixxqE
         e7qMxfZwfIk7bw3xzDGvqRY8XV1muUAtAh+m7Z74eldJyg6f/0ITQ6lRfBDXNf7nFYAu
         GhKwXy8NeyrGDZc5PsfixtlyvMvCPVGmi5NWzxOVeckYvIf2fWd6VAnvPna0Pp5PQC9n
         a5TW2A+yPTkcFFTNoXS0lO89BTxTLqK6+m4/4LU4TIUUHukWqG8LHNuEJUkZv0d3WjOX
         YUs/rNcAwx33ZT4DFCh1od8wGXLpMxz5WwRMJDdHyPNp+erhhtDylda03AA/5K5FGevh
         m8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778487740; x=1779092540;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6S8mBYkFiwNSV2sm1TejB3CD4/6gNBSvCKYv8dIJSuw=;
        b=F4KJ31fihfHiAEma69wnaYTC5UagKL2T731Qp9T12nGjb9aB+TUuFEwxzQ1HTqMWAf
         cZBbRy+9m8FMPRQ8XwdTgqNkze89VfLIzQXMQYzmV235k2y+EZukzqYDDchyIRIDyHbQ
         vvUpmgm3yJn819gaqvm2bnsQkjjxXtNdcDBnQJuy+q736D+oGGMmq2PCbvvPWGyMfmMG
         OTikuB7Te/VeUARyyR/2I3dpl584QqOaeGF5z+PUxB6G2Sa9z/A5w1exnJuMc97E27E+
         mfWM4FWee6COiYrHiE368IpgDU8WLyAm/NNolmZajqgbPEc/dEuR0gsnysspJZXTfGtf
         v09w==
X-Forwarded-Encrypted: i=1; AFNElJ/y0M/uGAOWL6Id0RTUYc09DY5RYY4DLzBgTG/rjrsHjU5SyquelcVRjDJtoCHENJIFV4lmL2uVYAnY@vger.kernel.org
X-Gm-Message-State: AOJu0YzWtnBRu4c8/djj2JEKnVi2j45+boGxeY0UvQS0EAUorAElOxdL
	cjlpH3nRA51vkaEM85mO5QD/Ec3jzMS/fnT/+vwfLPo6jBomzxT1qDVn
X-Gm-Gg: Acq92OEN3sxfxGiR8Uxld+nnXKEshflPMCWXpBLsIDyfQ5N9cHaMCxBD92UM2JVrbXt
	5lS9atWBNbScrjt1bL9HgkXy/CXGm+8BGUWSfaCwo48ioEHd+fKlTGHEpvmEVBPoGxhsAGBqMuV
	AAelBPEmAB5ma1lyUxa0C04ukO9Qc1hVbnKsc/NvxmOY4+9cZeJBdWKfIMLmPyoQocvR/ccedOb
	bQYCwlMuAvlORUxroKoOZF2DTFg2zKP70DiF0dhYafq08iKw/jEPFm3q22UuRzrRB+pjOo57OW+
	c3Z9Acb0j72sCO2zpI600Kp4IwnHnIqbS2xQ9vJTe3EryzOA785hCUtH6Ul7EvNr7hw4JbWI3nI
	1W9UHa+/MSDrGjMJNy1ppWiQc2Xq2YcCh3Lbh3TZyM0dMmyvgKmg5pxbkiH7YKlgTSwf2oR/wLk
	LAWRtJwehyqIWrEE2ePWf/XQ8d4NaCk/gfPvNcJj2raNz6cfmRcWmfQuoW8zmi8KnscyoBrTNnQ
	Ct3TpyY
X-Received: by 2002:a05:6512:684:b0:5a8:638f:cc9c with SMTP id 2adb3069b0e04-5a8a94aa770mr4687218e87.17.1778487739469;
        Mon, 11 May 2026 01:22:19 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8cbfc4dcbsm672723e87.16.2026.05.11.01.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 01:22:17 -0700 (PDT)
Message-ID: <92e2d1ab-c973-45a2-b0c4-d7c672c610e0@gmail.com>
Date: Mon, 11 May 2026 11:22:16 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: iio: light: Add ROHM BH1730FVC binding
To: Alexandre Hamamdjian <azkali.limited@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, CTCaer <ctcaer@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260511-bh1730-v1-0-e0df1f499135@gmail.com>
 <20260511-bh1730-v1-1-e0df1f499135@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260511-bh1730-v1-1-e0df1f499135@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for patches Alexandre!

It's nice to see these upstreamed :)

On 10/05/2026 21:09, Alexandre Hamamdjian wrote:
> From: CTCaer <ctcaer@gmail.com>
> 
> Add a YAML binding for the ROHM BH1730FVC ambient light sensor.
> Documents the required compatible string, the als-vdd/als-vid
> regulators, and the rohm,integration-cycle, rohm,lux-multiplier,
> rohm,opt-win-coeff and rohm,gain-coeff calibration properties
> consumed by the driver.
> 
> Signed-off-by: CTCaer <ctcaer@gmail.com>
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> ---
>   .../bindings/iio/light/rohm,bh1730fvc.yaml         | 95 ++++++++++++++++++++++
>   1 file changed, 95 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/light/rohm,bh1730fvc.yaml b/Documentation/devicetree/bindings/iio/light/rohm,bh1730fvc.yaml
> new file mode 100644
> index 000000000000..6273b69e82ab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/light/rohm,bh1730fvc.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/light/rohm,bh1730fvc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ROHM BH1730FVC ambient light sensor
> +
> +maintainers:
> +  - CTCaer <ctcaer@gmail.com>
> +
> +description:
> +  Digital 16-bit ambient light sensor with an I2C interface. The device has
> +  two photodiodes (visible and infrared) and supports four gain settings and
> +  programmable integration time.
> +
> +properties:
> +  compatible:
> +    const: rohm,bh1730fvc
> +
> +  reg:
> +    maxItems: 1
> +
> +  als-vdd-supply:
> +    description: Regulator for the analog/digital supply (VDD).
> +
> +  als-vid-supply:
> +    description: Regulator for the LED indicator supply (VID).
> +
> +  rohm,integration-cycle:
> +    description:
> +      Number of internal clock cycles used for the ADC integration time.
> +      Used together with rohm,lux-multiplier to calibrate the lux output.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  rohm,lux-multiplier:
> +    description:
> +      Lux scaling multiplier applied after integration. Used together with
> +      rohm,integration-cycle to calibrate the lux output.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  rohm,opt-win-coeff:
> +    description:
> +      Optical-window calibration coefficients. Specified as a flat list of
> +      triplets <rc cv ci>, one triplet per window region, where rc is the
> +      visible/IR ratio cutoff and cv/ci are the visible and IR weighting
> +      factors used in that region.
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    items:
> +      minItems: 3
> +      maxItems: 3

I am not sure if I read the driver patch (2/2) correctly, but if I did, 
then these coefficients are used to compute Luxes out of the raw sensor 
data. I believe it would help anyone integrating (or investigating) this 
sensor, if you added the actual formula here as a comment. If I read 
this right, the formula is _somehting_ like:


Lx = (cv[win] * ch0_data - ci[win] * ch1_data) / gain / int_time

Here the cv[win] and ci[win] are selected from the opt-win-coeff -table, 
depending on the measured ch1_data/ch0_data ratio, right?

> +  rohm,gain-coeff:
> +    description:
> +      Per-gain sensitivity coefficients. Eight u32 values arranged as four
> +      <cl fl> pairs, one pair for each supported gain (1x, 2x, 64x, 128x).
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 8
> +    maxItems: 8

Is the gain-coeff only used as a saturation limit for increasing or 
decreasing the gain? Are they just raw channel values?

> +
> +required:
> +  - compatible
> +  - reg

I will leave this to other reviewers, but I would guess the sensor does 
always require vdd?

> +dependencies:
> +  rohm,integration-cycle: ['rohm,lux-multiplier']
> +  rohm,lux-multiplier: ['rohm,integration-cycle']
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        light-sensor@29 {
> +            compatible = "rohm,bh1730fvc";
> +            reg = <0x29>;
> +            als-vdd-supply = <&vdd_als>;
> +            als-vid-supply = <&vid_als>;
> +            rohm,integration-cycle = <38>;
> +            rohm,lux-multiplier = <1000>;
> +            rohm,opt-win-coeff = <260 1290 2733>,
> +                                 <550 795 859>,
> +                                 <1090 510 345>,
> +                                 <2130 276 130>;
> +            rohm,gain-coeff = <3000 0xffffffff
> +                               2000 9800
> +                               15 60000
> +                               0 1300>;
> +        };
> +    };
> +
> +...
> 


-- 
---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
