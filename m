Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EDB30C617
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774490598; cv=none; b=RxdZhPYi58WoUJgt8Nx6DlOjDXYIUUMyzUayOBwJJBSe0XO/bT69zIvAILHmgKmSbq/HYqpSwVtvBVI3C+6Xqpm4dl5LKH1Uyx1pvEz4B72HaEfJyICubvxNoKAWqYBZxCLc+jyQ+WsVt4w0CjpGC6JH1Qzj3xDu0afFL7l+K/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774490598; c=relaxed/simple;
	bh=898EE3uTRWNqQWKaeojRbazK62aRyTS+EtJVfzejI9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EGRHny1+PX3sHYZ2TU4LIahby4AEDH5J3Le9pCGjuRHJiRlwxW1rsOUM75GcpzKR2v+RW03bei/j7Ug7/GxOZIkutxofV6yuz8zEN7JDLS5WqmatEdN9cJWUeo9LrNDCGpPtc0npHeIe27u/n4rBE6gQ2WE+9j/H6YRTibrrJzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SCT8lSIV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SCT8lSIV"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso3658185e9.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 19:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774490595; x=1775095395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ssl/A4FTlxsDnKppPyscG81oRYVzD7RmlywNbIRpMjg=;
        b=SCT8lSIV+AHUb537eBT8wDlPWCrIKB/52C1EgssRzCkkygUuCZHTwXhOGyG3Brz973
         lD6+uYHKKuGqKEqbrvnjfE25Ko9snsXGxmCIML83BNNuXQAyJFQyJbEO07ivgIADKNcJ
         rPEz0t9vX1AH2ABGc4DsC1IVh/XOOaG0aFujDtyYVtr/tjMaMwbBoaulVKpkvK1Q3e1f
         Og2S7TzDOm30ov9O+/ADFaOi8DM+hcwsZMiFzqsLta3+1PILwkVZpUcDV6hiiRBMfKU/
         UkBqyaCUOPouv+lcvtmZSqhmshTw1bemi+TfWsJW66/tAvb8ndXqoahSbVj43tKgRhho
         hXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774490595; x=1775095395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ssl/A4FTlxsDnKppPyscG81oRYVzD7RmlywNbIRpMjg=;
        b=O2V3M3aX4LlBEuOtU5UWcvQArzr7WwCx1VGfQ+vSzypxM9CkZkz4Rsv+xkAqK/LjTz
         eaZXwtl7GXqIMlViG9CTpVUULMA3CcvB4JxiNojbgRmBHEHAnJwnBhkiRwjMEr33WRiN
         0KIL3XLrZfPoh3y11UEWo6eAQfbRMRbyfhR5INcTAybp/qdn70ZELowdzOsUrkuEs0ZP
         m5v7LKk1hJzevcefQUilVkxAsBnsAw2+zsUCAWTjPn6SpDDR/IbB0dcBQm1Zk2BHuExb
         T4TMUH0qba9C6kGDea3rpt1ajlK+oiW8VTR0x0SqtbfMjv1J4d+Tjaca81JduGo1bndF
         t4+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOoWh3rrx9iD4akt1CXQpLy5Bpp7Hmv1D98VJQ5rRkSwW3e/TJqX8Zzygg0tJLueldFQ/pGlWJt9kj@vger.kernel.org
X-Gm-Message-State: AOJu0YwAhTrsuLet0C38uIT8XnLu9qheNw0gLMLAfFjLgx7dW3LCYSmE
	7bsAtjWxaF2dqZizMgA0Dxp9UXdxb6tyXcgLIH1q2zhY3wXGdTikc1RFqkIyhmvyQhI=
X-Gm-Gg: ATEYQzxtzO0MxFQdwK4li+4cCJwdKYtWd2/4exwG8h4YerSk7Ht8FlUV7CPp+mMAiZh
	mxKzHwYABBTJ8Q4fZKodQDUP9Xm1QYCgIS6kfFHWkKS3IfDVNcYKPEXywAasbM4Ntzgi+s0Bb2Q
	G5cZq1/kcEk19dUttaeXo0UZcBcVzfNTi+ZrO24SVqjKkLhTCbIFRu0Ybwd+654IRa9K+a3/Ykc
	sPuB6L56f4xtwmUD383emGgZMmpJxEAs8JxU7WxZpIwRnezmzitHy6zLCxSnDZ0Z7DOnrR6uHe3
	dhDoIj8Bl5WnnAyFXwhFp2b1zbUtK5hjOe1VO0pgxMKoP61cUFOaEf5B98JpRtrxzQvFqkxiSy/
	jjB2QOqTKvFnfLnszd7i2jiUqecj96a+6ajmw50gfEoLhxNRl9Slzp/98NOrA52HsSkZloCiXU+
	5yCmv5o5lQm0YPnvQDABCkJp4Alk8Lei+rGjE=
X-Received: by 2002:a05:600c:c089:b0:485:35ee:f836 with SMTP id 5b1f17b1804b1-48715fba9d6mr67260955e9.2.1774490594918;
        Wed, 25 Mar 2026 19:03:14 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48720926246sm4251725e9.26.2026.03.25.19.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 19:03:14 -0700 (PDT)
Message-ID: <f1c8c412-1d27-4c83-8c5e-76b9369ea6e9@linaro.org>
Date: Thu, 26 Mar 2026 02:03:37 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <72ef6c9e-feb6-4e57-b8cc-7801bd748698@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <72ef6c9e-feb6-4e57-b8cc-7801bd748698@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/03/2026 01:46, Vladimir Zapolskiy wrote:
> On 3/26/26 03:04, Bryan O'Donoghue wrote:
>> Add a base schema initially compatible with x1e80100 to describe MIPI 
>> CSI2
>> PHY devices.
>>
>> The hardware can support both CPHY, DPHY and a special split-mode 
>> DPHY. We
>> capture those modes as:
>>
>> - PHY_QCOM_CSI2_MODE_DPHY
>> - PHY_QCOM_CSI2_MODE_CPHY
>> - PHY_QCOM_CSI2_MODE_SPLIT_DPHY
> 
> Distinction between PHY_QCOM_CSI2_MODE_DPHY and 
> PHY_QCOM_CSI2_MODE_SPLIT_DPHY
> is
> 1) insufficient in just this simplistic form, because the assignment of
> particular lanes is also needed,
> 2) and under the assumption that the lane mapping is set somewhere else, 
> then
> there should be no difference between PHY_QCOM_CSI2_MODE_{DPHY,SPLIT_DPHY},
> it's just DPHY, and the subtype is deductible from data-lanes property on
> the consumer side.
> 
> So far the rationale is unclear, why anything above regular PHY_TYPE_DPHY
> and PHY_TYPE_CPHY is needed here, those two are sufficient.

Because knowing the split-mode exists and that you have asked about how 
such a thing would be supported, I thought about how to represent that 
mode right from the start, even if we don't support it.

To support split phy we will need to pass the parameter.

So we define those parameters upfront.

> 
>>
>> The CSIPHY devices have their own pinouts on the SoC as well as their own
>> individual voltage rails.
>>
>> The need to model voltage rails on a per-PHY basis leads us to define
>> CSIPHY devices as individual nodes.
>>
>> Two nice outcomes in terms of schema and DT arise from this change.
>>
>> 1. The ability to define on a per-PHY basis voltage rails.
>> 2. The ability to require those voltage.
>>
>> We have had a complete bodge upstream for this where a single set of
>> voltage rail for all CSIPHYs has been buried inside of CAMSS.
>>
>> Much like the I2C bus which is dedicated to Camera sensors - the CCI 
>> bus in
>> CAMSS parlance, the CSIPHY devices should be individually modelled.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 130 +++++++++++ 
>> ++++++++++
>>   include/dt-bindings/phy/phy-qcom-mipi-csi2.h       |  15 +++
>>   2 files changed, 145 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2- 
>> phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2- 
>> phy.yaml
>> new file mode 100644
>> index 0000000000000..63114151104b4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> @@ -0,0 +1,130 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm CSI2 PHY
>> +
>> +maintainers:
>> +  - Bryan O'Donoghue <bod@kernel.org>
>> +
>> +description:
>> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 
>> sensors
>> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and 
>> D-PHY
>> +  modes.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,x1e80100-csi2-phy
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#phy-cells":
>> +    const: 1
>> +    description:
>> +      The single cell specifies the PHY operating mode.
>> +      See include/dt-bindings/phy/phy-qcom-mipi-csi2.h for valid values.
> 
> include/dt-bindings/phy/phy.h should be good enough as it's stated above.

While include/dt-bindings/phy/phy.h provides generic definitions for 
D-PHY and C-PHY, it does not contain a definition for Qualcomm's 
proprietary Split D-PHY mode. Because this hardware supports a 
vendor-specific operating mode, introducing a vendor-specific header to 
define that state is necessary.

This is exactly what we do with the QMP to support a similar use-case - 
the PHYs do vendor specific things, so we use vendor specific defines.

If we lock to phy.h CPHY/DPHY only then we exclude the possibility of 
say adding split-mode to an upstream SoC as the DT ABI will not then 
facilitate the mode.

> 
>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core
>> +      - const: timer
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  operating-points-v2:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    items:
>> +      - description: MXC or MXA voltage rail
>> +      - description: MMCX voltage rail
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: mx
>> +      - const: mmcx
>> +
>> +  vdda-0p9-supply:
>> +    description: Phandle to a 0.9V regulator supply to a PHY.
>> +
>> +  vdda-1p2-supply:
>> +    description: Phandle to 1.2V regulator supply to a PHY.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#phy-cells"
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - operating-points-v2
>> +  - power-domains
>> +  - power-domain-names
>> +  - vdda-0p9-supply
>> +  - vdda-1p2-supply
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>> +    #include <dt-bindings/phy/phy-qcom-mipi-csi2.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    csiphy4: csiphy@ace4000 {
>> +        compatible = "qcom,x1e80100-csi2-phy";
>> +        reg = <0x0ace4000 0x2000>;
>> +        #phy-cells = <1>;
>> +
>> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
>> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
>> +        clock-names = "core",
>> +                      "timer";
>> +
>> +        operating-points-v2 = <&csiphy_opp_table>;
>> +
>> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
>> +
>> +        power-domains = <&rpmhpd RPMHPD_MX>,
>> +                        <&rpmhpd RPMHPD_MMCX>;
>> +        power-domain-names = "mx",
>> +                             "mmcx";
>> +
>> +        vdda-0p9-supply = <&vreg_l2c_0p8>;
>> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
>> +    };
>> +
>> +    csiphy_opp_table: opp-table {
>> +        compatible = "operating-points-v2";
>> +
>> +        opp-300000000 {
>> +            opp-hz = /bits/ 64 <300000000>;
>> +            required-opps = <&rpmhpd_opp_low_svs_d1>,
>> +                            <&rpmhpd_opp_low_svs_d1>;
>> +        };
>> +
>> +        opp-400000000 {
>> +            opp-hz = /bits/ 64 <400000000>;
>> +            required-opps = <&rpmhpd_opp_low_svs>,
>> +                            <&rpmhpd_opp_low_svs>;
>> +        };
>> +
>> +        opp-480000000 {
>> +            opp-hz = /bits/ 64 <480000000>;
>> +            required-opps = <&rpmhpd_opp_low_svs>,
>> +                            <&rpmhpd_opp_low_svs>;
>> +        };
>> +    };
>> +
>> +    isp@acb7000 {
>> +        phys = <&csiphy4 PHY_QCOM_CSI2_MODE_DPHY>;
>> +    };
> 
> This example is incomplete in sense that it does not include CAMSS
> CSIPHY IP hardware configuration in whole.


No that's not the way examples work. You don't replicate entire nodes 
from other schemas you just give a terse reference.

> 
>> diff --git a/include/dt-bindings/phy/phy-qcom-mipi-csi2.h b/include/ 
>> dt-bindings/phy/phy-qcom-mipi-csi2.h
>> new file mode 100644
>> index 0000000000000..fa48fd75c58d8
>> --- /dev/null
>> +++ b/include/dt-bindings/phy/phy-qcom-mipi-csi2.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
>> +/*
>> + * Qualcomm MIPI CSI2 PHY constants
>> + *
>> + * Copyright (C) 2026 Linaro Limited
>> + */
>> +
>> +#ifndef __DT_BINDINGS_PHY_MIPI_CSI2__
>> +#define __DT_BINDINGS_PHY_MIPI_CSI2__
>> +
>> +#define PHY_QCOM_CSI2_MODE_DPHY        0
>> +#define PHY_QCOM_CSI2_MODE_CPHY        1
>> +#define PHY_QCOM_CSI2_MODE_SPLIT_DPHY    2
>> +
>> +#endif /* __DT_BINDINGS_PHY_MIPI_CSI2__ */
>>
> 

