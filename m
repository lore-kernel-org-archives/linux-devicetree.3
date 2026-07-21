Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5358A3B9950
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784670552; cv=none; b=fQn5Z5GuwUytLJ0sDU3+8596PXeOTd1TbOj8fohRfiAa5MMzxgFc4gXrPg9vcoZerOL1mvHqU91a7brPrybfelJ4ceORgxs12gHXKhyCMYjRU66MCpdkJV8nzk/upjMBvjlMOpERbpJtE4Z3VNicvw3P3SdN+wD6VuzyC44QsqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784670552; c=relaxed/simple;
	bh=TTzIq7jSHz4AYC3VS6WS9o/imjClM0fmeZAsDYpYJjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u3oQqlpLkqtc5oZhWN7bs7wtuIKH6g/UW5TmHHJVw2z3+Lu36ekidsOSGygwuQ3Lx2DpVuHAZfFtZkwTRbu59EBFJYSFtPl3NU6nEOSiqymNFH9BSe8th3TM9XCPSdCdNOBSBB7icnoeGF0SQaj/uUuRwOlHUDgBc4v+0jc7GOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w8zX/jVc; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w8zX/jVc"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39db55d6e0bso5250071fa.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784670547; x=1785275347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jJPK6WsZUoetFgU5n/OkwtbmgnvsORPlU3I309PYPVI=;
        b=w8zX/jVcYOsrNLylISxexZgTzz4BgtYLaxx3RvOHCcxYn78k9z8hktLW6j9OEuP9+j
         pvKQf1xO1bZY7YipSQDsXY7OyMwVo5TZtXxPnDWpkCPNFETw3QLma8/ks1A05l2EPJmE
         4SqyQ2rohv1TItbKjLyRTADyFiwGpXVrhSeClBuZvviW38Vt/ZgrDUwFNtNfDx4882fP
         dgLwEft5u4sgWoBTQczdoRx6qSwPIjWhiM8DjB/UMCKsZB7g97mi3/+uLunsATgce7tC
         yZ64h4e4rN/009s6kPGcbR3+iW/7CaHFy6SPaRWWGeAQjos+9qJDmz7pxJLS7plusTbP
         vb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784670547; x=1785275347;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jJPK6WsZUoetFgU5n/OkwtbmgnvsORPlU3I309PYPVI=;
        b=bZ9lcrIrRT8mRLEH9piLQCDw6MklqMmQzIWK+Cc6rpbgD3E5uLP9h0FJZBrZEmnZmV
         G1iEl6TdC5l+M+Xza29IYX5eusjzC9/eHGPOp93GBE7Rl0RCg4DQ3sfFwc/qkEcl+0qb
         4eobvtbHZfgGvvg1S7YKM/YbG8lN1f/1YCbzi6yAK+xDi3xVS02kuiyhK5+r/eCQUqr2
         ytfP/o6kv5xlOy1bvxff7svNdW5M+7NH0ngVTllpElNOebmT9SRFw+nMfDwhofQVQOZd
         hYOoV2GbBauJdXICPwiAXQDpYXMEtkuOa538qV7OWD2cpargo5/6QDAUZnvC4uceFneW
         QbgQ==
X-Forwarded-Encrypted: i=1; AHgh+RrTtqREndDI781UjgzKdPDkcVSNqcrhdgLOnNbAGCg1Ajtxa4HDRXXbHoiAF3hvIKQi7WHgRLrD+Npe@vger.kernel.org
X-Gm-Message-State: AOJu0YwDLaBdQwXxcSKht3XzHV0y3o5AvNzAJ+cv6R3IqZWwDGMil9T8
	GHHmGXBKt3h1tOrqez7FMgjkbXU4bN5vN74lrjEj6moK6KxVjSZ4bvduMo44xwnCm/c=
X-Gm-Gg: AR+sD12Nt6porDmAbyGm4fBG5bdd1fYUCl+CevuspvzZsmLiePjrJCCejUSghAntipy
	2FZq1fuyfH4eIo3093gWrMwF77uFiPt0AVnWs8vqTObDAf2UfFTaMs4sy2VbaSJ2Cs1JwNmJ4QL
	jF3gc10aOwk9VOJt8jhhABTtqz0g0g7NFaZ3W0wwS7mMxZ2rNBc1ja/h4fSijIiINtc5Vbd3HBF
	nHrm3jIPzvS+3t6/ky/yQBKq/rXAW7sGdp/MbcC0jaagAeyLuRpr5C/UHY6XQWhHse4aUCBfnLc
	nURw4yNRjqTBiV+6UnK5v3ZQPE4zejWu2U2JoH7Ojy4FFC/+df9/fV5MEAlovMud89ETfsxV6wf
	AgOoFimHiab07GPN0xxLPWVoFiA52MMzqsEY6JGi0q2CTanUAf0hUGZOvEbm5dZzren2uUJE+0u
	wN0Q4Mqm5UVn4jVkWTBYdDV9eNeYBVxEFEIlYkna8M0wBBk/oUCdNomdly
X-Received: by 2002:a2e:be28:0:b0:39c:6e71:8332 with SMTP id 38308e7fff4ca-39eeb6a2bf5mr5917561fa.1.1784670547167;
        Tue, 21 Jul 2026 14:49:07 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6d558d5sm1317761fa.30.2026.07.21.14.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 14:49:06 -0700 (PDT)
Message-ID: <b974f1be-b802-40a3-a54c-f7e3c8fbbece@linaro.org>
Date: Wed, 22 Jul 2026 00:49:05 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
To: Frank Li <Frank.li@oss.nxp.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org>
 <20260720-x1e-csi2-phy-v13-1-160c31958863@linaro.org>
 <al_BEUNJOrqVPQWw@lizhi-Precision-Tower-5810>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <al_BEUNJOrqVPQWw@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Frank.

On 7/21/26 21:57, Frank Li wrote:
> On Mon, Jul 20, 2026 at 02:11:34AM +0100, Bryan O'Donoghue wrote:
>> Add a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs. This PHY
>> supports both DPHY and CPHY operation. A special mode of DPHY operation -
>> called variously split-mode or combo-mode also allows for two sensors to be
>> connected to one PHY.
>>
>> The submitted binding here describes the DPHY modes of operation only. CPHY
>> is left to future work.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 195 +++++++++++++++++++++
>>   1 file changed, 195 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> new file mode 100644
>> index 0000000000000..880fe602945cb
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> @@ -0,0 +1,195 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm X1E80100 SoC CSI2 PHY
>> +
>> +maintainers:
>> +  - Bryan O'Donoghue <bod@kernel.org>
>> +
>> +description:
>> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sensors
>> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY
>> +  modes.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,x1e80100-csi2-phy
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#phy-cells":
>> +    const: 1
>> +    description:
>> +      The single cell specifies the PHY operating mode.
>> +
>> +  clocks:
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core
>> +      - const: timer
>> +      - const: ahb
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  operating-points-v2: true
>> +
>> +  opp-table:
>> +    type: object
>> +
>> +  power-domains:
>> +    items:
>> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
>> +      - description: MMCX voltage rail
>> +      - description: MXC or MXA voltage rail
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: top
>> +      - const: mmcx
>> +      - const: mx
>> +
>> +  vdda-0p9-supply:
>> +    description: Phandle to a 0.9V regulator supply to a PHY.
>> +
>> +  vdda-1p2-supply:
>> +    description: Phandle to 1.2V regulator supply to a PHY.
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        description:
>> +          Sensor input. Always present. A single sensor is described by a
>> +          single endpoint with one to four data lanes. DPHY split mode,
>> +          where two independent sensors share the same PHY, is described
>> +          by two endpoints; endpoint@0 with exactly two data-lanes and
>> +          endpoint@1 with exactly one data-lane.
> 
> Sorry, jump in so late. I have questions about this design
> 
> why not model each lane as sperated phys.
> 
> csi1 {
> 	...
> 	phys = <&phy 0>, <&phy 1>; // use lane 0 and 1, connect sensor 1
> };
> 
> csi2 {
> 	...
> 	phys = <&phy 2>; // use lan 2, connect sensor 2.
> };
> 

Such design has a number of flaws and in general it looks overly
complicated. From the beginning it's unclear how to distinguish
a clock lane from a data lane, how to specify lane frequencies etc.

-- 
Best wishes,
Vladimir
