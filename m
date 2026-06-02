Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E984837CD3E
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 21:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780437590; cv=none; b=hs8T5whk2QfHfwyMyLPZo5GgyqkyHvOBkxFpTtCf6f+M8bIhh5v+KV1H8YcgiZEoE4c4YEhyH5rdZCGykDnYkUNuWehRq9kf5/rU/x/WNfFURR2NYBt5QNlkOrWGTyRg7xRhIQ9CRolch6yf+xZxpyazORf9ueCQamsukgJNULs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780437590; c=relaxed/simple;
	bh=B5wOD4aE4a17EXFpKcNzecgy6k/iGpJ3WdyEjdtjTrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Be+JzFUB4PaCMG6zJ54WG2+GlyfDdVOb8AiF9DVTMQ3jBCGqDHUHr1D2KPNfLqSMy+npEUP1Q8UUKJXUPeSDdCBvO2yeB3bGV+ra3NxVOnqFHXvyYg/nT4VQlAqbzFUy5y7NSa1sRC48O0T8UhgmroiZA6em0/ZTNqDG7z9/bCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e26UbWN/; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e26UbWN/"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3967701fc3cso5107801fa.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 14:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780437587; x=1781042387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rYnZ3lqT7DmKRSTxtVSgTNnxHdLejTszMrt6K93BCk=;
        b=e26UbWN/7eZLaMpiJIw3nw5ADo2j0I/ERoKbCdORwsrvLSDdw+iIGoWk+j+HYfp3zE
         FIw24wHtYm2SCP+d6DTmH3V0bIiRPrgoQgIkYEr31P+kNUb5OXcvOj9pTU1m1iKHjisw
         VDZhkXeyULah1M5ttYEpElI5qi5mWwN3wffQozAkBug+BffRK5nknStpts+uLxUHRUaS
         EQy1RI0+SPsIHvcqgBoDmd4ooekzev26DiXSFE8XfLURzsbKzURLSjUHoRox5Dg56ART
         PWissr7BWWbP6+7bWW8bLDxuUnt6X//Y3Wfl+fDtuVfLLwPhtUplIencnRLLS3yeF8S2
         SopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780437587; x=1781042387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/rYnZ3lqT7DmKRSTxtVSgTNnxHdLejTszMrt6K93BCk=;
        b=SCVePSRnwevgWNe/OElqiNvaLZB6x3W3LeGTk0SDswVTpIQoWgHXBPwaigPKOZqqFZ
         Ukl9tZQtVFZiq6A5AVDM/0M1bqwPxwGf1PLc8krST4qYIJGNyIg2iaOGj25XmtietvM8
         t5tH7urOVkasYcHTP7JyUucH1AkO+eXa8DhjmCaPUXgtJ3EvVEwiAC40hl5Sh0f0uKuM
         7RSAou2psKYd6HZV4bJC5Tqt54P+KMfHqi6e7ge8BfFFajR49FQ30WO3ostXwWLQ8rck
         XuWYOLd+RR2BpTaRY2KEHJyiDCFi/egFoA50yQRYHG4WQTB3PPOJo2IR9yXyVrg4RJgZ
         GtKg==
X-Forwarded-Encrypted: i=1; AFNElJ+2JWuNikSXaaq02NfopyTiVbfALvRCr/bt+vRQurFyJdpYluATOXqUEOsjJYSV3KYX2OySDNoI2Kd9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+P5A9Z4IKNcdoE9qqp7QzN7XTiwN8YsOFU/Nf5lePaNnGPsdx
	qeoYIZBxfzQgB6UGEb8CsDuzbrrLl0Eio6uUdq04iuSIFrjC5/Oc+1wIhenALnY1neQ=
X-Gm-Gg: Acq92OGsIOoi+wq3LKOlTo8dcjTpK635c0mvjWrHl3GRM4ilBtVA3LHnYsM1Ra3ug34
	o3WCvHCFx0mVY8bdeMjaSrGDyZ8jYlBtuZ0aZOK5AL69GlI4xt/myjzD3icT1Z/eTvxNVIBBhgG
	Axik9yNobBwd1QQP9NV16XGqV+kVOdWQk7JqCqyjDjimpropyn2gCMtn7K1RBpdIOD62WJxdjBp
	RzXFIsYt3ndUz0F+kbAgE/5cX+MUq3P71DyjIRYWHqDflFqiquEUPQil07ndoKH5EwIBDi72w1/
	r89e2zm2aYYLVlZoagKbRVvuwLWKO7nnJ+jtr13PwQG5oMTK5VmrV1T4t1zrGvU8OENPQz/F8HA
	G0eZXWbdavZKWCpxPgwQyNIkWs8HG8T5qgfu/CHT014ckVuCla0AtmYSQh6G+fOLde70ez1VLLi
	7Dm3CO8+Xe5/c8esJAINPtpmoyR35Sqj9qbk709J1WeKuZfasxaobCqOC4nD5jx4HkCwAWGPKYE
	TVbUQ0LdfLs+oFu
X-Received: by 2002:a2e:bc2a:0:b0:396:975f:c384 with SMTP id 38308e7fff4ca-396ac314d06mr1880491fa.6.1780437587064;
        Tue, 02 Jun 2026 14:59:47 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abd6cbe6sm3606351fa.0.2026.06.02.14.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 14:59:46 -0700 (PDT)
Message-ID: <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
Date: Wed, 3 Jun 2026 00:59:40 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/23/26 05:48, Bryan O'Donoghue wrote:
> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
> PHY devices.
> 
> The hardware can support both CPHY, DPHY and a special split-mode DPHY.
> 
> The schema here defines three ports:
> 
> port@0:
>      The first input port where a sensor is always required.
> 
> port@1:
>      A second optional input port which if present implies DPHY split-mode.
> 
> port@2:
>      A third always required output port which connects to the controller.
> 

This port numeration is imperfect, because port@0 and port@2 are required,
while middle port@1 is optional.

Like it was stated before a number of times, it seems natural to operate
with two ports, where input port may have two endpoints rather than 3 ports,
also that approach solves the problem of a hole in the port numeration.

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
>   .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 209 +++++++++++++++++++++
>   1 file changed, 209 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..270375f949880
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -0,0 +1,209 @@
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

#phy-cells should be 0, because the PHY operating mode is well defined
by 'bus-type' property of an endpoint on the sensor side, the opposite
side of CAMSS/CSID as a CSIPHY "consumer" should not dictate the PHY type.

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
> +      - description: MMCX voltage rail
> +      - description: MXC or MXA voltage rail

Only "qcom,x1e80100-csi2-phy" device is supported so far, unlikely it's
the case that "MXC or MXA voltage rail" should be specified, it'd be
just one of two or both.

> +
> +  power-domain-names:
> +    items:
> +      - const: mmcx
> +      - const: mx
> +
> +  vdda-0p9-supply:
> +    description: Phandle to a 0.9V regulator supply to a PHY.
> +
> +  vdda-1p2-supply:
> +    description: Phandle to 1.2V regulator supply to a PHY.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description: Sensor input. Always present.
> +        unevaluatedProperties: false
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +              clock-lanes:
> +                maxItems: 1
> +              remote-endpoint: true
> +            required:
> +              - data-lanes
> +              - remote-endpoint
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description:
> +          Second sensor input. When present, indicates DPHY split mode.
> +        unevaluatedProperties: false
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                maxItems: 1
> +              clock-lanes:
> +                maxItems: 1
> +              remote-endpoint: true
> +            required:
> +              - data-lanes
> +              - clock-lanes
> +              - remote-endpoint

As it's stated above, it should be converted to a single port with two
endpoints, it'd be done in accordance to video-interfaces.yaml.

> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description: Output to CAMSS controller.
> +        unevaluatedProperties: false
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            unevaluatedProperties: false
> +            properties:
> +              remote-endpoint: true
> +            required:
> +              - remote-endpoint
> +
> +    required:
> +      - port@0
> +      - port@2
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
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
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
> +        power-domains = <&rpmhpd RPMHPD_MMCX>,
> +                        <&rpmhpd RPMHPD_MX>;
> +        power-domain-names = "mmcx",
> +                             "mx";
> +
> +        vdda-0p9-supply = <&vreg_l2c_0p8>;
> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                csiphy0_in_ep: endpoint {
> +                    data-lanes = <0 1>;
> +                    clock-lanes = <2>;
> +                    remote-endpoint = <&sensor_out>;
> +                };
> +            };
> +
> +            port@2 {
> +                reg = <2>;
> +                csiphy0_out_ep: endpoint {
> +                    remote-endpoint = <&controller_in>;
> +                };
> +            };
> +        };
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
> +                            <&rpmhpd_opp_low_svs_d1>;
> +        };
> +
> +        opp-480000000 {
> +            opp-hz = /bits/ 64 <480000000>;
> +            required-opps = <&rpmhpd_opp_low_svs>,
> +                            <&rpmhpd_opp_low_svs_d1>;
> +        };
> +    };
> 

-- 
Best wishes,
Vladimir
