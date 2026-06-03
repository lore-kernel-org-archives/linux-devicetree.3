Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0B2312807
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 20:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780519905; cv=none; b=h91s6b+0Xt3f7vuviQbRMCU1Y/baIxzegtgmh1nxZFII6rrnh3xsQCqao7Y7NOWVkb7PdJXt/WkxVrsrkPmBzzac9Ou0P74dH3DXhUkHZxURybMggj7J26/1Ei4m+Xbrafv5GijBULPZ8cvLVD4qCZRgPOoksrjH6RnatznYPjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780519905; c=relaxed/simple;
	bh=1uMm2Rcqu1NNpytvjug438SGSw/P+tCIxmIUvjiUo1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hJYQpl6cee6OyBKUw5fhuuvjdyBJNCA8wvHni2Aqis8NKD73Zn9V2olhwGQyDzTSd8hrNMAfJQQbXP74ZBykiR/LMOorjbswVnhhNK9dD5JKh0xGOuP0oPSrQPswroojTxcJO6f1yU9F3e9B2/3rvpKFK4FgvWUHG/3SUsUFXYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wsYplK3L; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wsYplK3L"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aa60bb018aso274908e87.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 13:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780519901; x=1781124701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnGt4OfgecwyI8Q97acu9yV/LdmjE+6r9fX+VlxJVhw=;
        b=wsYplK3LoRCuw/vnjsnT9sflkVQJPWVPNXjbXF5fJuOR7aEqNpTnoew7Wfcn1Uv/g4
         w9VWuMnJW43kOg9XfXtZ7VmTxrggER7BMM6PSg9Tt6zBpD7NIZrljUdhlvPMv4E0S+QY
         iyA+AwwN1Mrx3dgjdoPcRoxvOBgGD6DIijOzqWqWf2okfrD4ZJRlIJvVC42kTmkBbiKY
         m94XOWZFUkfOwdXLPiy19dCnDfg0ZGWUfs42v5wXFEyuQLnbClyeRBkMTx/plRPZjHRR
         V7pC/X97UkssknNMgpIzHU7RvvN+cq0aIt3eeqyIUDMmhCWlXG6hZO7Zb+Gn+piunF8x
         +EHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780519901; x=1781124701;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SnGt4OfgecwyI8Q97acu9yV/LdmjE+6r9fX+VlxJVhw=;
        b=cyInWt3rJ7MOYpdwkIRyFkPCbC3f3QQ2JhS4OPXD+C3gBu1UBefxtJt0paY/1uVqC6
         CS72cJQ5Zq9+0DL9RvVxRL6f1ddBrypqgai0QltcD9lXWabOSf/6z30xxB+5xSDJpp/X
         SOIJhVYgdZ8/hcyXKm881TD5QR6/lvp0WQw1kBqhcIcq7dYx5XF7tSDkt/vfk06Y6mf3
         4PhksuA1NIN2mQEJaXOWq/h5vgqfrfUCecwdTJ37NSgYG2vvHM9YG62bjv1IdkLSRxKr
         8cSEGVzioNXpgaDjsumUz3B3dYUwkWdovKXEBP3I0MrBOdtPozclEt8Jt4Q1Vla/MF5E
         RQJA==
X-Forwarded-Encrypted: i=1; AFNElJ8lcOheTo6zug7dumoBqDfuuoMeGI9OwiKExHWkB66IgU3vKhdtPYsmSs68TVAhZUx8qWoXNaC/uRJ2@vger.kernel.org
X-Gm-Message-State: AOJu0YwLrVk+/nUgGMFI1bAdoqTL+HfQuzNknTP2ebig6aY5WiKfGeIe
	6Rn6iT+WOjqoyz61aEnO8cxFAimVDn+9FQeuxdnKdRlMLojwLjUAc7kbu97ZeR/SuWY=
X-Gm-Gg: Acq92OGFzB+5f1VsTq7TvfDDvAoBTGeu2IjAjL3BjrP9pDfSg0wSDocRypbMQezYak2
	tYuOzegOElEDPiI6mniBEsXuWNoI5WVBnZxY7n1bA7g+MczKuhkkvsZnLUkm1n99SJHa6NOWy/B
	eGv2qT3qMVbHLkf7t3did0HA3/Kg/N+jaILm+y36SJMBygYNCG4rjR1adBAlfp+dAuj2dxuFXKS
	Yhfhh5nzme/y5Nd2Z1iNiGkTVqMXHSRISviGaD0cRODz8eGeSFxLNYkdxnHe8HGGIu9EsRp2HJB
	LHFVNGlDdF5H7FfHtnupeW0dQGQXmskK/Z//J6kX4bybPiPV0BiMfwup/LS2bSbb5VuBRexucWS
	QGuglRcHzR7/uUImT0Cp2wiyRom8ylee5DDlOaMAS8tcIJbV0/SVPjQW3LLcrnXdus90V+9JD+N
	uu9lk6CwE0OHNoIADvDpbHvDdI8X4bNcgPEcm3CDrFeVcren1MxVK7KdGsgaKjFy/TkIs44/0W7
	0R01VQ3zMIJHCW2
X-Received: by 2002:a05:6512:3c9a:b0:5aa:7779:8946 with SMTP id 2adb3069b0e04-5aa81f428bdmr1972e87.8.1780519901179;
        Wed, 03 Jun 2026 13:51:41 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbcd3sm833651e87.25.2026.06.03.13.51.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 13:51:40 -0700 (PDT)
Message-ID: <f01c0e22-4e5c-44e7-9ea4-4bc8d53aea2e@linaro.org>
Date: Wed, 3 Jun 2026 23:51:40 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
 <478df3ed-d4ef-43aa-bb84-e2075798542b@kernel.org>
 <ec98ef2f-02b4-4086-8b4b-07b6953dbd20@oss.qualcomm.com>
 <514cf213-5778-45e1-8d70-d3fe27991fcc@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <514cf213-5778-45e1-8d70-d3fe27991fcc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/3/26 23:24, Vijay Kumar Tumati wrote:
> 
> 
> On 6/3/2026 1:16 PM, Vijay Kumar Tumati wrote:
>> Hi,
>>
>> On 6/2/2026 3:51 PM, Bryan O'Donoghue wrote:
>>> On 02/06/2026 22:59, Vladimir Zapolskiy wrote:
>>>> On 5/23/26 05:48, Bryan O'Donoghue wrote:
>>>>> Add a base schema initially compatible with x1e80100 to describe
>>>>> MIPI CSI2
>>>>> PHY devices.
>>>>>
>>>>> The hardware can support both CPHY, DPHY and a special split-mode DPHY.
>>>>>
>>>>> The schema here defines three ports:
>>>>>
>>>>> port@0:
>>>>>        The first input port where a sensor is always required.
>>>>>
>>>>> port@1:
>>>>>        A second optional input port which if present implies DPHY
>>>>> split-mode.
>>>>>
>>>>> port@2:
>>>>>        A third always required output port which connects to the
>>>>> controller.
>>>>>
>>>>
>>>> This port numeration is imperfect, because port@0 and port@2 are
>>>> required,
>>>> while middle port@1 is optional.
>>>>
>>>> Like it was stated before a number of times, it seems natural to operate
>>>> with two ports, where input port may have two endpoints rather than 3
>>>> ports,
>>>> also that approach solves the problem of a hole in the port numeration.
>>>
>>> Can you confirm this is what you are after ?
>>>
>>> port@0 {
>>>       #address-cells = <1>;
>>>       #size-cells = <0>;
>>>
>>>       endpoint@0 {              /* primary sensor */
>>>           reg = <0>;
>>>           data-lanes = <0 1 2 3>;
>>>           remote-endpoint = <&sensor0_out>;
>>>       };
>>>
>>>       endpoint@1 {              /* split-mode second sensor, optional */
>>>           reg = <1>;
>>>           data-lanes = <0>;
>>>           remote-endpoint = <&sensor1_out>;
>>>       };
>>> };
>>>
>>> port@1 {                     /* output to CAMSS, was port@2 */
>>>       endpoint { remote-endpoint = <&controller_in>; };
>>> };
>>>
>>> This works for me BTW.
>> Either way, do we need to document the constraint of using port@0 or
>> endpoint@0 'only' for the 4+1 or 2+1 mode and the other one is for the
>> 1+1 mode? Or is it implicit from this bindings for a developer?>
>>>>> The CSIPHY devices have their own pinouts on the SoC as well as
>>>>> their own
>>>>> individual voltage rails.
>>>>>
>>>>> The need to model voltage rails on a per-PHY basis leads us to define
>>>>> CSIPHY devices as individual nodes.
>>>>>
>>>>> Two nice outcomes in terms of schema and DT arise from this change.
>>>>>
>>>>> 1. The ability to define on a per-PHY basis voltage rails.
>>>>> 2. The ability to require those voltage.
>>>>>
>>>>> We have had a complete bodge upstream for this where a single set of
>>>>> voltage rail for all CSIPHYs has been buried inside of CAMSS.
>>>>>
>>>>> Much like the I2C bus which is dedicated to Camera sensors - the CCI
>>>>> bus in
>>>>> CAMSS parlance, the CSIPHY devices should be individually modelled.
>>>>>
>>>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>> ---
>>>>>     .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 209 ++++++++
>>>>> + ++++++++++++
>>>>>     1 file changed, 209 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-
>>>>> csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-
>>>>> csi2-phy.yaml
>>>>> new file mode 100644
>>>>> index 0000000000000..270375f949880
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>>>>> @@ -0,0 +1,209 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Qualcomm CSI2 PHY
>>>>> +
>>>>> +maintainers:
>>>>> +  - Bryan O'Donoghue <bod@kernel.org>
>>>>> +
>>>>> +description:
>>>>> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI
>>>>> CSI2 sensors
>>>>> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and
>>>>> D-PHY
>>>>> +  modes.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: qcom,x1e80100-csi2-phy
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  "#phy-cells":
>>>>> +    const: 1
>>>>> +    description:
>>>>> +      The single cell specifies the PHY operating mode.
>>>>
>>>> #phy-cells should be 0, because the PHY operating mode is well defined
>>>> by 'bus-type' property of an endpoint on the sensor side, the opposite
>>>> side of CAMSS/CSID as a CSIPHY "consumer" should not dictate the PHY
>>>> type.
>>>
>>> Rob said consumer but, I'm also not very bothered about that. bus-type
>>> is perfectly acceptable to me.
>>>
>>>>> +
>>>>> +  clocks:
>>>>> +    maxItems: 2
>>>>> +
>>>>> +  clock-names:
>>>>> +    items:
>>>>> +      - const: core
>>>>> +      - const: timer
>>>>> +
>>>>> +  interrupts:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  operating-points-v2:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  power-domains:
>>>>> +    items:
>>>>> +      - description: MMCX voltage rail
>>>>> +      - description: MXC or MXA voltage rail
>>>>
>>>> Only "qcom,x1e80100-csi2-phy" device is supported so far, unlikely it's
>>>> the case that "MXC or MXA voltage rail" should be specified, it'd be
>>>> just one of two or both.
>>>
>>> Hmm. I'm not being clear here if this is your take, I will reword it
>>> to make it clearer this generation of PHY _must_ have either
>>>
>>> - MMCX and MXC
>>> or
>>> - MMCX and MXA
>> I am not sure of this, Bryan. If you look at the PHY core clock
>> separately, sure, that is correct. But all of them, on this platform as
>> well, share the RCG, which requires all 3 power domains. So
>> fundamentally, you need to enable all of those from each PHY. You can
>> make it constant 3 power domains.>
>>>>> +
>>>>> +  power-domain-names:
>>>>> +    items:
>>>>> +      - const: mmcx
>>>>> +      - const: mx
>>>>> +
>>>>> +  vdda-0p9-supply:
>>>>> +    description: Phandle to a 0.9V regulator supply to a PHY.
>>>>> +
>>>>> +  vdda-1p2-supply:
>>>>> +    description: Phandle to 1.2V regulator supply to a PHY.
>>>>> +
>>>>> +  ports:
>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>>> +
>>>>> +    properties:
>>>>> +      port@0:
>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>> +        description: Sensor input. Always present.
>>>>> +        unevaluatedProperties: false
>>>>> +
>>>>> +        properties:
>>>>> +          endpoint:
>>>>> +            $ref: /schemas/media/video-interfaces.yaml#
>>>>> +            unevaluatedProperties: false
>>>>> +            properties:
>>>>> +              data-lanes:
>>>>> +                minItems: 1
>>>>> +                maxItems: 4
>>>>> +              clock-lanes:
>>>>> +                maxItems: 1
>>>>> +              remote-endpoint: true
>>>>> +            required:
>>>>> +              - data-lanes
>>>>> +              - remote-endpoint
>>>>> +
>>>>> +      port@1:
>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>> +        description:
>>>>> +          Second sensor input. When present, indicates DPHY split
>>>>> mode.
>>>>> +        unevaluatedProperties: false
>>>>> +
>>>>> +        properties:
>>>>> +          endpoint:
>>>>> +            $ref: /schemas/media/video-interfaces.yaml#
>>>>> +            unevaluatedProperties: false
>>>>> +            properties:
>>>>> +              data-lanes:
>>>>> +                maxItems: 1
>>>>> +              clock-lanes:
>>>>> +                maxItems: 1
>>>>> +              remote-endpoint: true
>>>>> +            required:
>>>>> +              - data-lanes
>>>>> +              - clock-lanes
>>>>> +              - remote-endpoint
>>>>
>>>> As it's stated above, it should be converted to a single port with two
>>>> endpoints, it'd be done in accordance to video-interfaces.yaml.
>>>>
>>>>> +
>>>>> +      port@2:
>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>> +        description: Output to CAMSS controller.
>>>>> +        unevaluatedProperties: false
>>>>> +
>>>>> +        properties:
>>>>> +          endpoint:
>>>>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
>>>>> +            unevaluatedProperties: false
>>>>> +            properties:
>>>>> +              remote-endpoint: true
>>>>> +            required:
>>>>> +              - remote-endpoint
>>>>> +
>>>>> +    required:
>>>>> +      - port@0
>>>>> +      - port@2
>>>>> +
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - reg
>>>>> +  - "#phy-cells"
>>>>> +  - clocks
>>>>> +  - clock-names
>>>>> +  - interrupts
>>>>> +  - operating-points-v2
>>>>> +  - power-domains
>>>>> +  - power-domain-names
>>>>> +  - vdda-0p9-supply
>>>>> +  - vdda-1p2-supply
>>>>> +  - ports
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>>>>> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>>>>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>>>>> +
>>>>> +    csiphy4: csiphy@ace4000 {
>>>>> +        compatible = "qcom,x1e80100-csi2-phy";
>>>>> +        reg = <0x0ace4000 0x2000>;
>>>>> +        #phy-cells = <1>;
>>>>> +
>>>>> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
>>>>> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
>>>>> +        clock-names = "core",
>>>>> +                      "timer";
>>>>> +
>>>>> +        operating-points-v2 = <&csiphy_opp_table>;
>>>>> +
>>>>> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
>>>>> +
>>>>> +        power-domains = <&rpmhpd RPMHPD_MMCX>,
>>>>> +                        <&rpmhpd RPMHPD_MX>;
>>>>> +        power-domain-names = "mmcx",
>>>>> +                             "mx";
> Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +

If CSIPHYs are true subdevices under the umbrella CAMSS device and well
described as subnodes, then likely none of power domains are needed to be
repeatedly described in the children device nodes, since this information
can be obtained from the parent device by the driver.

Technically 'power-domains' property can be safely removed, I believe.

>>>>> +        vdda-0p9-supply = <&vreg_l2c_0p8>;
>>>>> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
>>>>> +
>>>>> +        ports {
>>>>> +            #address-cells = <1>;
>>>>> +            #size-cells = <0>;
>>>>> +
>>>>> +            port@0 {
>>>>> +                reg = <0>;
>>>>> +                csiphy0_in_ep: endpoint {
>>>>> +                    data-lanes = <0 1>;
>>>>> +                    clock-lanes = <2>;
>>>>> +                    remote-endpoint = <&sensor_out>;
>>>>> +                };
>>>>> +            };
>>>>> +
>>>>> +            port@2 {
>>>>> +                reg = <2>;
>>>>> +                csiphy0_out_ep: endpoint {
>>>>> +                    remote-endpoint = <&controller_in>;
>>>>> +                };
>>>>> +            };
>>>>> +        };
>>>>> +    };
>>>>> +
>>>>> +    csiphy_opp_table: opp-table {
>>>>> +        compatible = "operating-points-v2";
>>>>> +
>>>>> +        opp-300000000 {
>>>>> +            opp-hz = /bits/ 64 <300000000>;
>> I wonder why you would have only one clock here. You should be setting
>> the rate for both the core and timer, isn't it?>>> + required-opps =
>> <&rpmhpd_opp_low_svs_d1>,
>>>>> +                            <&rpmhpd_opp_low_svs_d1>;
>> Same here, it should 3 power domains set.>>> +        };
>>>>> +
>>>>> +        opp-400000000 {
>>>>> +            opp-hz = /bits/ 64 <400000000>;
>>>>> +            required-opps = <&rpmhpd_opp_low_svs>,
>>>>> +                            <&rpmhpd_opp_low_svs_d1>;
>> Why is one at svs and the other at svs_d1? Shouldn't both be svs?>>>
>> +        };
>>>>> +
>>>>> +        opp-480000000 {
>>>>> +            opp-hz = /bits/ 64 <480000000>;
>>>>> +            required-opps = <&rpmhpd_opp_low_svs>,
>>>>> +                            <&rpmhpd_opp_low_svs_d1>;
>> And here, both should be svs_l1?>>> +        };
>>>>> +    };
>>>>>
>>>>

-- 
Best wishes,
Vladimir
