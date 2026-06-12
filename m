Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D0E3A5E9E
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256964; cv=none; b=q0dDKPU4y/zbtEH0Ae/XUQbzsdY8QlPOigahUh6KfEKHSNg5RM5zJVeqTnvE9HUv//ncHz0TZ9OUIPkvyb7P0BomjlKqkEwZrFBgs8m8xFOc9DO1/MdHuJoyckCftI4EJ/dXh4bvRTVoCFanG2fDhSVaDDQj5C5DnS2fzXnGG3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256964; c=relaxed/simple;
	bh=yc6AQIpTFzCK3Amfe19dBLsBJQvdflaZ7/6J7NBajWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gzcrdMEETC7gLKeSlLOG1SeAOXKAiRL4uDyoEzAlCpAo6CARwQD8e2zXeWkAVU+0BTaUKb5GgyyGtubFXm4rqJ9CM8KV605j9lZjmkltpYQf41hL7L0XFAWpJJlXOKRDGZXl3Tpig+2ZRFfbpIVsHVBrpssfbCFwNzPzaDOTho8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bcu6JEGT; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bcu6JEGT"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aa64cbb08fso93668e87.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 02:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781256958; x=1781861758; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrPR7xSpOuZlmh+JGym7wD7YJj4NLuArxxQbY8dlBkg=;
        b=Bcu6JEGT2wnF5anHE/oXCjFVFN7qm+GhLpR5wfrTVEiBDWB0wjTAJMMtE6eHqfA7Lp
         H0XBBEZPnVB7ifYhwrg6v3Etd6LbwCeyO62JHmdU7WKDtaU6rKWB1B9FvbNkAs1l6qsB
         6VmU55TjaKOM9ul0udMSu2s0fhXDG6QEGAvSq6gXI0VO+xezLNd5Mb0kvV0nydjjfeQB
         jEA+KqXheDOsiZECcYOhwPNiqW8Lwm62DDcAcp/TmsnTHJSBQSo+zM0ME4SzsVyz9Lq6
         gJEyWrwCUY5OrVlNZ80zHUEDHwFcIR982s9acA/CwdALu0wJKMoRiHop4BNXI7AVGxYr
         EkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256958; x=1781861758;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TrPR7xSpOuZlmh+JGym7wD7YJj4NLuArxxQbY8dlBkg=;
        b=R9fB6Mcx3oOsWGveJUGnKkTPsCyigHZo1UHSej6INfl+M5uG9TkOthXZ3Hlvw91VAW
         7s6DgyGRW0QmB4I12Fzv5az8yvCKpjJ6pL8BT+mSwCWMe96uFlA6mWFVuFuzuc7SnsxC
         7BSKKnGqyzerMPSzKDF7rfpcCCoQDD8huFZMAAZyvE8hMtvSfP0QklgENmucdkpru+yv
         6AWSFBWLLdGIYAzGL1/UpY7PudRnKgXRxtrXzcbX1eFX6tBxTE8P/kDskvgauVCZiGcx
         6AJCkbP6H3sAMG7A4bcRMdid0LzdLhramWmkkC03GUbR+bTWW5wqC+U7TAxZx9yZhRvo
         Z1zw==
X-Forwarded-Encrypted: i=1; AFNElJ/ftQRE04I34Ta8Efc6uBkTm5anpdjbRfq2klY6s4hGXHfhpgceJ86hWEMSa4+sU1pc230KC984MpGa@vger.kernel.org
X-Gm-Message-State: AOJu0YylN9wyKa92CUItkuTX7pWZyGfqjcep5pjCBtp8SXwZMxiyIKUI
	BLH9JhahQ88OcjbUS1RJ/A6DjjcrYhgpo8odfK9Ndr5ZeBEIn/VBmyM9N9S/EtzclwQ=
X-Gm-Gg: Acq92OHdw5unHy6JRZrxphKz7Owzol09FhTMOsiAGTHPqMEn7xzKWBKKx5Un1cTH/dR
	fUSl2RYdLXMsiFiR+b0URd6AbZaLBSWgn72nXZlE9LKRRXs5Zzw+0ddXZBCt5Me52w+OZ/aPCd9
	DHaQrTRTyyqTZ2vCekA3omkCMK4/esMZN3Jiw28f0tpG3uQj4DKp/xknHJCZBu5SBy6x2aXbZK6
	PdW4F5wkTwl1HLMl2ynkmwHrSeUUzZbYDd5YjpbRztz1vNhLppRjNoQ3o4YyHg5fbH0nlZtIAmF
	KPlWaxUmz5gJZOxcVxXiwyYHe6KQq6wVLQ+vx9xNIC7TEg/PVQwKz8GjMb84deTA10qjouhZHJp
	GZB6BeaKf5WKd5xaeW9d4CkTrBiC9/La7yvzW4tDedQ4Algj1L5XcU2VkluUvXO4zNx2u1nChGk
	XZ9jWnZING4juQmkLgKPXXIuES1aK8NK+2mvYINgXwQsBH+5/PPt3byWq4AFSzt3+mnDarJxeeZ
	QIcrg==
X-Received: by 2002:a2e:bcc1:0:b0:393:d08b:2a0c with SMTP id 38308e7fff4ca-3992af6b7a2mr3254381fa.2.1781256957642;
        Fri, 12 Jun 2026 02:35:57 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f6b879sm4890051fa.38.2026.06.12.02.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 02:35:56 -0700 (PDT)
Message-ID: <7fd98a2f-2a5c-46bc-a819-14801780a448@linaro.org>
Date: Fri, 12 Jun 2026 12:35:56 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: media: i2c: Add os02g10 sensor
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
 <20260424092554.26130-2-elgin.perumbilly@siliconsignals.io>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260424092554.26130-2-elgin.perumbilly@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/26 12:25, Elgin Perumbilly wrote:
> Add bindings for Omnivision OS02G10 sensor.
> 
> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> ---
>   .../bindings/media/i2c/ovti,os02g10.yaml      | 91 +++++++++++++++++++
>   MAINTAINERS                                   |  7 ++
>   2 files changed, 98 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
> new file mode 100644
> index 000000000000..252059459390
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,os02g10.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OS02G10 Image Sensor
> +
> +maintainers:
> +  - Tarang Raval <tarang.raval@siliconsignals.io>
> +
> +description:
> +  The OmniVision OS02G10 is a 2MP (1920x1080) color CMOS image sensor controlled
> +  through an I2C-compatible SCCB bus. It outputs RAW10 format data and supports
> +  a 2-lane MIPI interface.
> +
> +properties:
> +  compatible:
> +    const: ovti,os02g10
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: XCLK clock
> +
> +  avdd-supply:
> +    description: Analog Domain Power Supply (2.8v)
> +
> +  dovdd-supply:
> +    description: I/O Domain Power Supply (1.8v)
> +
> +  dvdd-supply:
> +    description: Digital core Power Supply (1.5v)
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Reset Pin GPIO Control (active low)
> +
> +  port:
> +    description: MIPI CSI-2 transmitter port
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        required:
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - avdd-supply
> +  - dovdd-supply
> +  - dvdd-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera-sensor@3c {
> +            compatible = "ovti,os02g10";
> +            reg = <0x3c>;
> +            clocks = <&os02g10_clk>;
> +            reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
> +
> +            avdd-supply = <&os02g10_avdd_2v8>;
> +            dvdd-supply = <&os02g10_dvdd_1v2>;
> +            dovdd-supply = <&os2gb10_dovdd_1v8>;
> +
> +            port {
> +                cam_out: endpoint {
> +                    remote-endpoint = <&mipi_in_cam>;
> +                    data-lanes = <1 2>;
> +                    link-frequencies = /bits/ 64 <720000000>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 900fc00b73e6..8a0a55073c30 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19443,6 +19443,13 @@ T:	git git://linuxtv.org/media_tree.git
>   F:	Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
>   F:	drivers/media/i2c/og0ve1b.c
> 
> +OMNIVISION OS02G10 SENSOR DRIVER
> +M:	Tarang Raval <tarang.raval@siliconsignals.io>
> +M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
> +
>   OMNIVISION OS05B10 SENSOR DRIVER
>   M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
>   M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> --
> 2.34.1
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
