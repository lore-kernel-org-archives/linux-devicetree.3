Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793832277;
	b=dg+ittf92TkIQbiEIiZeAFddgqlpfOahnf5YUGl6/iU2ERaiarSNcQwBFfvCxXF1sM9X
	 JbQt8FOLshTN2nde6QhuTcekLEtfOJzYEKT08kT4m4d1gyPdNGX6p1d6BXjm3oHV1K5U7
	 Yfexwq6QESN4BnP13gSPXEefz7ZCVFjO0r8RRdzdq5j44aT3o+ELj4TOVzxDOiQJ99i0x
	 A/bPRUHOZzpOJnJEFngaK3111luKQkm5eaz4CqtWBCcVyPnKU5cH4kl4sb+CygzJxKRXc
	 EIC7iO2Rz5i3HmDK4RWGh5e2S/zYYBHXtzDucH+9JfAh18JdYUA7jz428qAxVL2zk5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=OfxaueTyc8XbQISpMtsIlMHRs6clavLyxX39MYG47W4=;
	b=u+UFpVY1t1lVAYy2KVNNSkDNDBAbyjb0VGhQiEH8f6jEweCRT4MOsvAmVJPmK4UfsASP
	 9NRFJxay0tX9nUrR1Ooie3+l6hJEtczuXTVrEPZXhSzrg246ppYkZ6a2LuLJ3DBetAMkl
	 9xWOcuQvaBRfE5qksjAJ7FeKdWlZgWolkSBmMjgiScrMY269mb/x/aiQuB5hld7N7iebL
	 ME0ICyZcJMMzFZLDcdACmXhlbN2lQyLD87QJ8+DPBuU7Ad4kLpLpsjy4mLVqrzt04J+Q7
	 7dTSdhCVGksNp20ZYa4vp3idYjTgl7IoWJtgfJwzf8O+E6A8ITrrAKY85ZZ58w+A2gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GFmcmu9h;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AE6606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 22:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17AE6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GFmcmu9h
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso253839f8f.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 14:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793832274; x=1794437074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OfxaueTyc8XbQISpMtsIlMHRs6clavLyxX39MYG47W4=;
        b=GFmcmu9hLbT7gL7Z0iSuvfx4/E6mlopRAZlbgNKa0yii9goBfsKgPBukEIE+tIItrQ
         4j52+KBXv5zQS3mN4LNkgbyzpUlbywZdKyvhXhPeTbyG1/haq++/bdaV2M/JQS2gx/Zx
         ixW3HJSUEaZ9c67TLhIrVm34ofUY6UYebVkxYy/3P0JaQ9QADTINPpMMMX3Lfx9JG/Kx
         T1xSSE0Fa1xlR5pRVVCBWwoJDM7HQ00f36mFlOw5bvq7eD9TLhNCRoWoioqiewUvibDl
         x3CH0tXoBEFYoNYiJLBsWPG42h5iV4pzTg8bRWzArVSsygd5wUBKWEAxPujUAh8FBguC
         JbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793832274; x=1794437074;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OfxaueTyc8XbQISpMtsIlMHRs6clavLyxX39MYG47W4=;
        b=ndPcUL7uwlNX9IvUxAtcKqYDGQ9g59WdVOiExLBsNBdKYd7hyUtIUwz8GndiZuVwyK
         SsUptEirrSDQfYRcbnqHvifUrcF5K8Il/YMsr9igjgCGccJlqnO7qXBBn1pQiAYpMjkv
         xujqxtcEEA+XK8PYZTwuXg4iPhSpZe2hIMen5Y2vTadpuXbFon7NU5kImEiH0pZ1j6ju
         IV9h2EM3E8h0BTp/JpEL3WWIsPuALKT+cA+QEkIyGCv7PqbN2Vo+9jSuPBd/PmxEd1IO
         eNRJrVjdvsDzn46tGUUBHgvfH+qxDkawXeEqBh+vXLHu8XlG2QVSSouJdjMZ6wZZDhEv
         wZ1A==
X-Forwarded-Encrypted: i=1; AKwUvBzKFhRhy9SbrJLmWsrXtR2xXmRhqvQY32O6iiz0TgFzVugr4Woto5Mv9GLsvjahVYCWTem7i9JTQvle@vger.kernel.org
X-Gm-Message-State: APuU4Z9tER9PheVqMMyCXSKjjeLQaNxvM4iuEL2sjvQf8pj6qAF/uUho
	VKvCfZnqlUHd+i8yeudObP8JVYWbILuIhtggptYXrlzOqalZH8kWFNfp4wBCKlNqWz8=
X-Gm-Gg: AYBFou0T8YVQ403OEu8RC4cRULRlgodVoanutM7gcY43D0g/vCRH/7rG/QvLQ+FLElQ
	9VaK8b/5T4Igc+O9u1/Ji37eJq2TtPoFU32iNHPwOBiDTfalaZMOPB6fNCCM0q5NC4rRe49J33h
	uNQgnSOpfdZWzw51axms+MKSUS7oqAVtfqAKK2he94KyBfsQs3/fuQHMDrldLwQqqgGxdG0pQDC
	7+B/C6ZRESxNuK6hGpVhAR1IxdDhzDh/Q8u+fsF/KKDgUYpFlIsv5zPdGmvMsBiRAg8UPUQMjaM
	LymLgvAuJcTD1YDuaswjR+zino27MVv68xWQsKpEjoHfxhUquBhZKf4BcuVGTwemUqMmstMiTYM
	jS8Hy/Wa2iRHyEduFXMqlapgP1hYtiNxjjTYb2eayz88ExisfeYP/s/LbmALHyXCcgqy+aJMwYx
	fGH9Uph4lM75ORkstdDa4cE9hfKVvqTATn98Zz87Ev8JxB6/oJj2yQ2TB8Ie2MOsgcd0cTvf9hd
	NcGLG7AsmqTKwHB4Ox0nDFle6yrz8f8wT9dS1PJdUQuM6iiG3Zhh8/RJxecUktMQMivfw/u0J73
	XDpy3zzGVXeQFAg4RGaqH5g7YzVXZIUw8eWu0AU49FsbyFN3w5ciIQqzvBCZpm8=
X-Received: by 2002:a05:6000:24c4:b0:48d:f9dd:e3de with SMTP id ffacd0b85a97d-48e6e511219mr38508954f8f.45.1793832274218;
        Wed, 04 Nov 2026 14:44:34 -0800 (PST)
Received: from [192.168.0.167] ([109.76.163.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed551dbasm6028154f8f.37.2026.11.04.14.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:44:33 -0800 (PST)
Message-ID: <427eb0e0-5e10-4f24-8686-4d06c26cdd13@linaro.org>
Date: Wed, 4 Nov 2026 22:44:31 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 20:54, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Document the Qualcomm SM8150 Camera Subsystem. The IP integrates four
> CSIPHY, four CSID (two full and two lite), two VFE and two VFE-Lite
> instances, with 42 clocks, 12 interrupts, eight IOMMU streams, four
> interconnect paths and three power domains.
> 
> SM8150 has a different register layout, clock tree and power domain
> topology from SM8250, so describe it in a dedicated schema instead of
> using qcom,sm8250-camss as a fallback.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> ---
>   .../bindings/media/qcom,sm8150-camss.yaml          | 477 +++++++++++++++++++++
>   1 file changed, 477 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> new file mode 100644
> index 000000000000..a65067352b58
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> @@ -0,0 +1,477 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm8150-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8150 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Andrew Gigena <mail@andrewgigena.dev>
> +
> +description: |
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8150-camss
> +
> +  clocks:
> +    minItems: 42
> +    maxItems: 42
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: camnoc_axi_src
> +      - const: cpas_ahb
> +      - const: cphy_rx_src
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy0_timer_src
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy1_timer_src
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy2_timer_src
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: csiphy3_timer_src
> +      - const: vfe0_axi
> +      - const: vfe0
> +      - const: vfe0_src
> +      - const: vfe0_cphy_rx
> +      - const: vfe0_csid
> +      - const: vfe0_csid_src
> +      - const: vfe1_axi
> +      - const: vfe1
> +      - const: vfe1_src
> +      - const: vfe1_cphy_rx
> +      - const: vfe1_csid
> +      - const: vfe1_csid_src
> +      - const: vfe_lite0
> +      - const: vfe_lite0_src
> +      - const: vfe_lite0_cphy_rx
> +      - const: vfe_lite0_csid
> +      - const: vfe_lite0_csid_src
> +      - const: vfe_lite1
> +      - const: vfe_lite1_src
> +      - const: vfe_lite1_cphy_rx
> +      - const: vfe_lite1_csid
> +      - const: vfe_lite1_csid_src
> +      - const: slow_ahb_src
> +      - const: gcc_ahb
> +      - const: gcc_axi_hf
> +      - const: gcc_axi_sf
> +
> +  interrupts:
> +    minItems: 12
> +    maxItems: 12
> +
> +  interrupt-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: vfe0
> +      - const: csid0
> +      - const: vfe1
> +      - const: csid1
> +      - const: vfe_lite0
> +      - const: csid_lite0
> +      - const: vfe_lite1
> +      - const: csid_lite1
> +
> +  iommus:
> +    maxItems: 8
> +
> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: cam_ahb
> +      - const: cam_hf_0_mnoc
> +      - const: cam_hf_1_mnoc
> +      - const: cam_sf_0_mnoc
> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: ife0
> +      - const: ife1
> +      - const: top
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data from CSIPHY0.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data from CSIPHY1.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data from CSIPHY2.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data from CSIPHY3.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +  reg:
> +    minItems: 12
> +    maxItems: 12
> +
> +  reg-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: vfe0
> +      - const: csid0
> +      - const: vfe1
> +      - const: csid1
> +      - const: vfe_lite0
> +      - const: csid_lite0
> +      - const: vfe_lite1
> +      - const: csid_lite1
> +
> +  vdda-phy-supply:
> +    description:
> +      Phandle to a regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +
> +required:
> +  - clock-names
> +  - clocks
> +  - compatible
> +  - interconnects
> +  - interconnect-names
> +  - interrupts
> +  - interrupt-names
> +  - iommus
> +  - power-domains
> +  - power-domain-names
> +  - reg
> +  - reg-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm8150.h>
> +    #include <dt-bindings/clock/qcom,sm8150-camcc.h>
> +    #include <dt-bindings/interconnect/qcom,sm8150.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss: camss@ac65000 {
> +            compatible = "qcom,sm8150-camss";
> +
> +            reg = <0 0xac65000 0 0x1000>,
> +              <0 0xac66000 0 0x1000>,
> +              <0 0xac67000 0 0x1000>,
> +              <0 0xac68000 0 0x1000>,
> +              <0 0xacaf000 0 0x4000>,
> +              <0 0xacb3000 0 0x1000>,
> +              <0 0xacb6000 0 0x4000>,
> +              <0 0xacba000 0 0x1000>,
> +              <0 0xacc4000 0 0x4000>,
> +              <0 0xacc8000 0 0x1000>,
> +              <0 0xaccb000 0 0x4000>,
> +              <0 0xaccf000 0 0x1000>;
> +
> +            reg-names = "csiphy0",
> +              "csiphy1",
> +              "csiphy2",
> +              "csiphy3",
> +              "vfe0",
> +              "csid0",
> +              "vfe1",
> +              "csid1",
> +              "vfe_lite0",
> +              "csid_lite0",
> +              "vfe_lite1",
> +              "csid_lite1";
> +
> +            interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +              <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +              <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +              <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +              <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +              <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +              <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +              <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +              <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +              <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +              <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
> +              <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>;
> +
> +            interrupt-names = "csiphy0",
> +              "csiphy1",
> +              "csiphy2",
> +              "csiphy3",
> +              "vfe0",
> +              "csid0",
> +              "vfe1",
> +              "csid1",
> +              "vfe_lite0",
> +              "csid_lite0",
> +              "vfe_lite1",
> +              "csid_lite1";
> +
> +            power-domains = <&camcc IFE_0_GDSC>,
> +              <&camcc IFE_1_GDSC>,
> +              <&camcc TITAN_TOP_GDSC>;
> +
> +            power-domain-names = "ife0",
> +              "ife1",
> +              "top";
> +
> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +              <&camcc CAM_CC_CAMNOC_AXI_CLK_SRC>,
> +              <&camcc CAM_CC_CPAS_AHB_CLK>,
> +              <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
> +              <&camcc CAM_CC_CSIPHY0_CLK>,
> +              <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +              <&camcc CAM_CC_CSI0PHYTIMER_CLK_SRC>,
> +              <&camcc CAM_CC_CSIPHY1_CLK>,
> +              <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +              <&camcc CAM_CC_CSI1PHYTIMER_CLK_SRC>,
> +              <&camcc CAM_CC_CSIPHY2_CLK>,
> +              <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +              <&camcc CAM_CC_CSI2PHYTIMER_CLK_SRC>,
> +              <&camcc CAM_CC_CSIPHY3_CLK>,
> +              <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +              <&camcc CAM_CC_CSI3PHYTIMER_CLK_SRC>,
> +              <&camcc CAM_CC_IFE_0_AXI_CLK>,
> +              <&camcc CAM_CC_IFE_0_CLK>,
> +              <&camcc CAM_CC_IFE_0_CLK_SRC>,
> +              <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +              <&camcc CAM_CC_IFE_0_CSID_CLK>,
> +              <&camcc CAM_CC_IFE_0_CSID_CLK_SRC>,
> +              <&camcc CAM_CC_IFE_1_AXI_CLK>,
> +              <&camcc CAM_CC_IFE_1_CLK>,
> +              <&camcc CAM_CC_IFE_1_CLK_SRC>,
> +              <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +              <&camcc CAM_CC_IFE_1_CSID_CLK>,
> +              <&camcc CAM_CC_IFE_1_CSID_CLK_SRC>,
> +              <&camcc CAM_CC_IFE_LITE_0_CLK>,
> +              <&camcc CAM_CC_IFE_LITE_0_CLK_SRC>,
> +              <&camcc CAM_CC_IFE_LITE_0_CPHY_RX_CLK>,
> +              <&camcc CAM_CC_IFE_LITE_0_CSID_CLK>,
> +              <&camcc CAM_CC_IFE_LITE_0_CSID_CLK_SRC>,
> +              <&camcc CAM_CC_IFE_LITE_1_CLK>,
> +              <&camcc CAM_CC_IFE_LITE_1_CLK_SRC>,
> +              <&camcc CAM_CC_IFE_LITE_1_CPHY_RX_CLK>,
> +              <&camcc CAM_CC_IFE_LITE_1_CSID_CLK>,
> +              <&camcc CAM_CC_IFE_LITE_1_CSID_CLK_SRC>,
> +              <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +              <&gcc GCC_CAMERA_AHB_CLK>,
> +              <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +              <&gcc GCC_CAMERA_SF_AXI_CLK>;
> +
> +            clock-names = "camnoc_axi",
> +              "camnoc_axi_src",
> +              "cpas_ahb",
> +              "cphy_rx_src",
> +              "csiphy0",
> +              "csiphy0_timer",
> +              "csiphy0_timer_src",
> +              "csiphy1",
> +              "csiphy1_timer",
> +              "csiphy1_timer_src",
> +              "csiphy2",
> +              "csiphy2_timer",
> +              "csiphy2_timer_src",
> +              "csiphy3",
> +              "csiphy3_timer",
> +              "csiphy3_timer_src",
> +              "vfe0_axi",
> +              "vfe0",
> +              "vfe0_src",
> +              "vfe0_cphy_rx",
> +              "vfe0_csid",
> +              "vfe0_csid_src",
> +              "vfe1_axi",
> +              "vfe1",
> +              "vfe1_src",
> +              "vfe1_cphy_rx",
> +              "vfe1_csid",
> +              "vfe1_csid_src",
> +              "vfe_lite0",
> +              "vfe_lite0_src",
> +              "vfe_lite0_cphy_rx",
> +              "vfe_lite0_csid",
> +              "vfe_lite0_csid_src",
> +              "vfe_lite1",
> +              "vfe_lite1_src",
> +              "vfe_lite1_cphy_rx",
> +              "vfe_lite1_csid",
> +              "vfe_lite1_csid_src",
> +              "slow_ahb_src",
> +              "gcc_ahb",
> +              "gcc_axi_hf",
> +              "gcc_axi_sf";

42 is ofc a sacred number so its a pity BUT you almost certainly don't 
need the _src clocks here.

> +
> +            iommus = <&apps_smmu 0x840 0x620>,
> +              <&apps_smmu 0x860 0x620>,
> +              <&apps_smmu 0xA40 0x620>,
> +              <&apps_smmu 0xA60 0x620>,
> +              <&apps_smmu 0xC40 0x620>,
> +              <&apps_smmu 0xC60 0x620>,
> +              <&apps_smmu 0xE40 0x620>,
> +              <&apps_smmu 0xE60 0x620>;
> +
> +            interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
> +                <&mmss_noc MASTER_CAMNOC_HF0 0 &mc_virt SLAVE_EBI_CH0 0>,
> +                <&mmss_noc MASTER_CAMNOC_HF1 0 &mc_virt SLAVE_EBI_CH0 0>,
> +                <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>;
> +
> +            interconnect-names = "cam_ahb",
> +              "cam_hf_0_mnoc",
> +              "cam_hf_1_mnoc",
> +              "cam_sf_0_mnoc";
> +
> +            vdda-phy-supply = <&vreg_l5a_0p88>;
> +            vdda-pll-supply = <&vreg_l3c_1p2>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    csiphy_ep0: endpoint@0 {
> +                        reg = <0>;
> +                        clock-lanes = <7>;
> +                        data-lanes = <0 1 2 3>;
> +                        remote-endpoint = <&sensor_ep>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> 

