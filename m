Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E2638F643
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 01:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489602; cv=none; b=qMUDV93lDGltvvN+vtQ4c7N10SiV5tnIJ2ElVvEKlf3CqtI2ixU7vJY6TLrSZN+n+nZMh0TSIMs/2JQUXx3EyBHq+eA8mgR8Mq4dTRoeKqv1EzxcqmhotwLvtD5PqBmmpOxGnhZmNb59Dzk6KxZz/bFMzr1eDPt8P+HE86Wjy3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489602; c=relaxed/simple;
	bh=evJCgtmUCKMOUoX5jIoibYRIq4Js+xZOoni/9Fwf0RA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fznrIol8qleN6MvsJvmlFeMojaM3RR3KIT6LJbnkm+VxHCzn4izH/q5+aYZuCKe/6l+UtrYXQ5aGNSOMGOz3nFJqpQQ8itUy4X4JOCXIwcymp1Lqd9XO4ZKtUzxbq0LVxqUByTNPRiueEMaPRul/iKe+vAluWd0OL8dEN8k5zyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F3XwXZnX; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F3XwXZnX"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a28cdf7a92so70366e87.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 18:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774489598; x=1775094398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMM8gnzSZHuXSR/4tgTYg0ThVeyoW9N0uLZg0sQTEPk=;
        b=F3XwXZnX5ju96FUaDalJB4ylLq2PiI9l3XXhGChR0Hee6/hD49o7wGfzJZ72hMtPYe
         wngoq+vWFQmckdIf7Q/JpVvXMxRU8lGwR9/ucdnmDDu1e/3iE2iuvs/BdbXJkXwN9yVJ
         nVXQVnAE9jFgRhi+bQLyEga67x26VAyUFz3t5q+zgTLdzueYJRwc+Gx53OIXkc0IMpre
         41MsieE7UOTWXC+KfO5n0BdP23P+s+HgcEHa1iycTot9zwpUPDoVzVvQoLQ2DFQ9YxT1
         UgzEmxvClT8Xq3Lqd3wHqsgwL5lKp5QT/TRvUoBPGLAFb01m8lTvru2XY6BpiTKwkV8A
         OwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774489598; x=1775094398;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tMM8gnzSZHuXSR/4tgTYg0ThVeyoW9N0uLZg0sQTEPk=;
        b=WVkXtuV09RddJ8rQSi9zm9/KIey/l/aPNwUivRvGncvJwX/+TOZHHHLCgYi7sGvqKV
         HYNq9WnowzbFuhP5LtMV/ZZcbzOPHCNBOAl9iAqn0dohb/OYJCmLvZaeZ7dPzJJYFZj5
         2LIly7G0CetoqpQwv7kb6KOl/GrfE5g8yrQOED+4+D3YRKFYd/e6PXBuq2EZ3Yr0UfDZ
         ClAKki1cLM3TwJ0FP9QhHF2CFai7i73Ap6SQ2S+NgVbDrgLAmw8dB8/A9B+Ak7slNU3K
         YHXa0zvsjdTM7nZms4eMUZr5vE0zxEwlSkVPaQJllxMKArfysQuWKQJSdzdxzpMb+SLz
         HOew==
X-Forwarded-Encrypted: i=1; AJvYcCU1raS6gP8m4dx42sq/2Bz6tgto5qdjUB+8rIyhFEjLKveBTKR26jc5AvrUHWnSiiRjdoEjVyHyoTEE@vger.kernel.org
X-Gm-Message-State: AOJu0YyRS+8L8CB8YWv0sOCJRmt2f0LfatNznDSnzfU0xHNfMt5BpI7y
	UhuQ90C2uXXlmHzXHFJi4G9BJwaT5736OAllEKLxb/M5y3R2xV/aahsMveJ3QlDgkOc=
X-Gm-Gg: ATEYQzwRhTz8ZKSNBHynYdUOErFSaek3L/IOjUSUmkn15q9mlYO6Ss+pbUhH4xbkGOA
	km3y345cyeaVjEQAv9A7NIEeH6puHuYMTveYRN8BkR6E6PThTVV6zoQ1UHZ93D5YarZpfTl+6VD
	ZE/rU72KTZ5vwordQA5cOUubaO7iSRFLAjT7J/mrNrfxrqBTdbOv+sYpFLJ2mYDJx5kcSk7NHUG
	LSxlmrjsk1Ewgz03oywOwKkDYMO2EIU3c2uHKFGFf2hthOgW9ByX4BtCZsHTJ95eAud4MvxKDP7
	7stW/4NX71yIuFl0MD/4DXTJpCUQZmYJmfNwGDXkDWPunB7VWoGj7OQHeNC9l/U7rGOJ16Ipu51
	JZWdThq25hvLnFUW3KGIKR/I3ZyJsQmLKZKQFpefMGmDH2HfaS+fftICfmlL/VIm8fmcUQ4ytn3
	Pf8vjZ1XFJFVRvk5lfbyBHjudUpFXIx7tb2phLT5go/vKCC2V8Yo2sGZKYvudIb+UXqLsVqr+3f
	td0u2pibe0J3kKD
X-Received: by 2002:a05:6512:3d0b:b0:5a2:78e2:504b with SMTP id 2adb3069b0e04-5a29b9a974emr1031388e87.7.1774489597790;
        Wed, 25 Mar 2026 18:46:37 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a064c187sm243911e87.27.2026.03.25.18.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 18:46:37 -0700 (PDT)
Message-ID: <72ef6c9e-feb6-4e57-b8cc-7801bd748698@linaro.org>
Date: Thu, 26 Mar 2026 03:46:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/26/26 03:04, Bryan O'Donoghue wrote:
> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
> PHY devices.
> 
> The hardware can support both CPHY, DPHY and a special split-mode DPHY. We
> capture those modes as:
> 
> - PHY_QCOM_CSI2_MODE_DPHY
> - PHY_QCOM_CSI2_MODE_CPHY
> - PHY_QCOM_CSI2_MODE_SPLIT_DPHY

Distinction between PHY_QCOM_CSI2_MODE_DPHY and PHY_QCOM_CSI2_MODE_SPLIT_DPHY
is
1) insufficient in just this simplistic form, because the assignment of
particular lanes is also needed,
2) and under the assumption that the lane mapping is set somewhere else, then
there should be no difference between PHY_QCOM_CSI2_MODE_{DPHY,SPLIT_DPHY},
it's just DPHY, and the subtype is deductible from data-lanes property on
the consumer side.

So far the rationale is unclear, why anything above regular PHY_TYPE_DPHY
and PHY_TYPE_CPHY is needed here, those two are sufficient.

> 
> The CSIPHY devices have their own pinouts on the SoC as well as their own
> individual voltage rails.
> 
> The need to model voltage rails on a per-PHY basis leads us to define
> CSIPHY devices as individual nodes.
> 
> Two nice outcomes in terms of schema and DT arise from this change.
> 
> 1. The ability to define on a per-PHY basis voltage rails.
> 2. The ability to require those voltage.
> 
> We have had a complete bodge upstream for this where a single set of
> voltage rail for all CSIPHYs has been buried inside of CAMSS.
> 
> Much like the I2C bus which is dedicated to Camera sensors - the CCI bus in
> CAMSS parlance, the CSIPHY devices should be individually modelled.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 130 +++++++++++++++++++++
>   include/dt-bindings/phy/phy-qcom-mipi-csi2.h       |  15 +++
>   2 files changed, 145 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..63114151104b4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm CSI2 PHY
> +
> +maintainers:
> +  - Bryan O'Donoghue <bod@kernel.org>
> +
> +description:
> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sensors
> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY
> +  modes.
> +
> +properties:
> +  compatible:
> +    const: qcom,x1e80100-csi2-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 1
> +    description:
> +      The single cell specifies the PHY operating mode.
> +      See include/dt-bindings/phy/phy-qcom-mipi-csi2.h for valid values.

include/dt-bindings/phy/phy.h should be good enough as it's stated above.

> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: timer
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  operating-points-v2:
> +    maxItems: 1
> +
> +  power-domains:
> +    items:
> +      - description: MXC or MXA voltage rail
> +      - description: MMCX voltage rail
> +
> +  power-domain-names:
> +    items:
> +      - const: mx
> +      - const: mmcx
> +
> +  vdda-0p9-supply:
> +    description: Phandle to a 0.9V regulator supply to a PHY.
> +
> +  vdda-1p2-supply:
> +    description: Phandle to 1.2V regulator supply to a PHY.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - operating-points-v2
> +  - power-domains
> +  - power-domain-names
> +  - vdda-0p9-supply
> +  - vdda-1p2-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> +    #include <dt-bindings/phy/phy-qcom-mipi-csi2.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    csiphy4: csiphy@ace4000 {
> +        compatible = "qcom,x1e80100-csi2-phy";
> +        reg = <0x0ace4000 0x2000>;
> +        #phy-cells = <1>;
> +
> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
> +        clock-names = "core",
> +                      "timer";
> +
> +        operating-points-v2 = <&csiphy_opp_table>;
> +
> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +        power-domains = <&rpmhpd RPMHPD_MX>,
> +                        <&rpmhpd RPMHPD_MMCX>;
> +        power-domain-names = "mx",
> +                             "mmcx";
> +
> +        vdda-0p9-supply = <&vreg_l2c_0p8>;
> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
> +    };
> +
> +    csiphy_opp_table: opp-table {
> +        compatible = "operating-points-v2";
> +
> +        opp-300000000 {
> +            opp-hz = /bits/ 64 <300000000>;
> +            required-opps = <&rpmhpd_opp_low_svs_d1>,
> +                            <&rpmhpd_opp_low_svs_d1>;
> +        };
> +
> +        opp-400000000 {
> +            opp-hz = /bits/ 64 <400000000>;
> +            required-opps = <&rpmhpd_opp_low_svs>,
> +                            <&rpmhpd_opp_low_svs>;
> +        };
> +
> +        opp-480000000 {
> +            opp-hz = /bits/ 64 <480000000>;
> +            required-opps = <&rpmhpd_opp_low_svs>,
> +                            <&rpmhpd_opp_low_svs>;
> +        };
> +    };
> +
> +    isp@acb7000 {
> +        phys = <&csiphy4 PHY_QCOM_CSI2_MODE_DPHY>;
> +    };

This example is incomplete in sense that it does not include CAMSS
CSIPHY IP hardware configuration in whole.

> diff --git a/include/dt-bindings/phy/phy-qcom-mipi-csi2.h b/include/dt-bindings/phy/phy-qcom-mipi-csi2.h
> new file mode 100644
> index 0000000000000..fa48fd75c58d8
> --- /dev/null
> +++ b/include/dt-bindings/phy/phy-qcom-mipi-csi2.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
> +/*
> + * Qualcomm MIPI CSI2 PHY constants
> + *
> + * Copyright (C) 2026 Linaro Limited
> + */
> +
> +#ifndef __DT_BINDINGS_PHY_MIPI_CSI2__
> +#define __DT_BINDINGS_PHY_MIPI_CSI2__
> +
> +#define PHY_QCOM_CSI2_MODE_DPHY		0
> +#define PHY_QCOM_CSI2_MODE_CPHY		1
> +#define PHY_QCOM_CSI2_MODE_SPLIT_DPHY	2
> +
> +#endif /* __DT_BINDINGS_PHY_MIPI_CSI2__ */
> 

-- 
Best wishes,
Vladimir
