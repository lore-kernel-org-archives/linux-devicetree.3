Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5352F346E54
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 20:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780517775; cv=none; b=AQD/CTGdNVBqhOsJSEeOtNC6fy39TcNG4CfJqW+K7XUHxWtJdPPSzcuNf0EZI0kQ+WjJLnhrodH2yEiUodeZizD/DzykaDb5/5OlD+WGw4KCvT6a5wY5PuQBp9dkzuHf0Jw7GNRur82pd1vR/D2YVjZUp/HH8598X5TZIn603cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780517775; c=relaxed/simple;
	bh=uju2qUqP6KdkKoE4mkwXyH942aqQZvusiVEA1kO+8AM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZXB8TGt+q71+nrT3sua+CBS9+gBByo9B+ScdgcEeesF/HFH0f2J/IErtGi/91qypjTqOFKeYZ4KvzlTXV0B8NgJvz+CXXGgexoLSDXZrOJwRvIFN9/l00e6UxVweNSU2KQKT+Biwhfzbaw69EGECjMQZUM8UZLUIB1xiQ6EDMG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOICcc9D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XTTBhODe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOICcc9D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XTTBhODe"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653KAPF22076277
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 20:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tdGPBYH1AlfHm8bFOEliOqGQvSdU1I2yIHjPmzJXzwU=; b=jOICcc9D664B4BP5
	ttbAg+6UnvKfGywPjeWn18FJ3l68IH0AK0bA9F5Pj+yDhOGOTlvR5XRmkq6nRhD3
	HPeUOkRjlVpyb3TGz7Q6BGTDT+kGAoidJ7wAn/v07jgSzwqIN0ZFE8rE2D/2N4c8
	60ULnZNjkmd8+/+W/kCELZBsHdMlzywye2u7nXptF1/5z+DKgszhePucBvC5eqwq
	YfyyqqiPGO9iUSVt+/3dDZ9eAIrQS0//GnDxfA2Jm+LHT9NJxmgZ3O/N8vaqCwDV
	Lj/aB2uFx9wIr7KsdlikxxJ0K2Zg8VLsWvgA4Ag0l+p8vbldkS/u7/tfg6wvBAP8
	tRlCvg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejev1bgdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 20:16:11 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3075fa5a407so1084644eec.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 13:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780517770; x=1781122570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tdGPBYH1AlfHm8bFOEliOqGQvSdU1I2yIHjPmzJXzwU=;
        b=XTTBhODe9lWJiVdXd9BLY5rV7hDk7Tb3K5fIFETQ3FeZbW1JyulCdHJYKCIc0TPlJ2
         PDtY9kkOylHxMIiLU51vZAv1lYB1mils32cEfx9l8bUgb6byJ6qHtSiC+YtWFtBijgNr
         W4Xdrs+9zJewS/bCTalVv2g7/hG0EXgJRfJeuJkkWbIKMjQQRQad5m4AHtcvZSDal8ZI
         d9QfR09urBy3K0AVYd+PknMJJdc27EvEt9otAcWq5TU6UHxIE2uIDBuKPEKe9h08irQY
         VUJ9MJb2STTjZxxAn0/Uc5HMqQmVUuPsjv9alMU9MVMOTz3kSCzbKBZIJ6j0k83b4Eca
         I5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780517770; x=1781122570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdGPBYH1AlfHm8bFOEliOqGQvSdU1I2yIHjPmzJXzwU=;
        b=sYggSlmgFRxxC09WHbzCxjE7wAKUbgIRfiIvksy50zTfUU4ZBToHzgVPH20C6q1sYb
         0uXaeM3B2pqW0hq4iCvh4Gk016DMoh1BW5bVq0VbGvLrUSInjMibbBUVDYFxXCK9xhd8
         xJY10xausjh3hLGwF335lZZ0f5ruvV4maE9iGfJq7nE0JHIqhGOwp+ISyVYiGdCNycs9
         lcBcEUL2JPtpRnETTKxDxoxlwxY+IXxr+YsSynbZI5jJlokw8LLquzM7tCO8pkr6yIbh
         wt0kiQL6+2S82A4lYcKo3rMFe2aTs/3rCDpSpYc4VL/fsAOWZV6L+cxyzq3JiKTT941h
         n5Dg==
X-Forwarded-Encrypted: i=1; AFNElJ9X7Bea0i81APfTlSgz99XsCCUWr5Qqf2zlMyw2TX7STEODuL7QrLu7TRdqEqNSf2GP5tsSDK7922kt@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz4q3SCrRp38qU3ahQKlnlgsmjFA+Is4IIS8L9xzhMBkLqhWx8
	Bp5PiYdUnBSSHev0yc2rhZF6NbG4U+X15wIVHy9IIfMA9FGzhQsuDgSxvbHsQrh24T04t1jTX0I
	JN64sOLb0IPruVKncUUtOFJLYxvX4hAgxvOaICa2r7CJRhRMT6C0aV1U+OZlO/wrF
X-Gm-Gg: Acq92OH1P2lvP6xNJb5E7nGDnU2pgASbAuCxqH5s3nw4xmlMJQ329EsJbtuuFx5IIH/
	MjF7FzPxOMGnIZVbRktIe07hitw8Y17WPnUgqB3kuOrC7A3Xk7rSvhiVi0icni7t0j/U3BPKJec
	jxAJ5IlspBT351LGwwgdrJxD7Ay9S/rY2+fHfOBgL/7Ow86fZkpTRUOmYPiTszhYC1/AmrEQQqc
	UaEUzfxSyut3DPa3h2FA1tN4UYUZzDC8+CZu6XvRpANRJFFLPKt+2r8svcl+QgrmaPYAjWsq5ym
	ME7O4/m2Nz/CcB0ufRIkzZagJdJzV4VEZ2xb2MzDCv8YpefV60TMP8UHUjUBfpKbeQwGDSP2Ljz
	tCQYaHDJaIZLNIu2A2KxWLgbLwaioQ83kH7rFROlnjROpNIBghZ0owdRhf23M/150Xmmzp85w3m
	K8TH6HOZ/6TzM=
X-Received: by 2002:a05:7300:641b:b0:304:886b:b07a with SMTP id 5a478bee46e88-3074fab15d4mr2432750eec.14.1780517770092;
        Wed, 03 Jun 2026 13:16:10 -0700 (PDT)
X-Received: by 2002:a05:7300:641b:b0:304:886b:b07a with SMTP id 5a478bee46e88-3074fab15d4mr2432730eec.14.1780517769522;
        Wed, 03 Jun 2026 13:16:09 -0700 (PDT)
Received: from [10.62.37.26] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85f60sm4477681eec.8.2026.06.03.13.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 13:16:08 -0700 (PDT)
Message-ID: <ec98ef2f-02b4-4086-8b4b-07b6953dbd20@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 13:16:07 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <478df3ed-d4ef-43aa-bb84-e2075798542b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 71DUzLCaXzzjJnT_vk0ayH1HA3e3XWig
X-Authority-Analysis: v=2.4 cv=PNE/P/qC c=1 sm=1 tr=0 ts=6a208b8b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=1kt9EUYtsfdhOYU2EzIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 71DUzLCaXzzjJnT_vk0ayH1HA3e3XWig
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE5NiBTYWx0ZWRfX7eJRzGgL73qD
 vzkiZFhDNKGK0KWf4384FK+Xvqk8Qo1lXiJdJ77oZ++g2i71LBcEy/9P91SpZN1pNao+kXcDLRM
 nry8/uODSB8hJNKJ2wLE22e/LKzvNDB9CEaDu2B0FehaHscyvQ62fWTnjws2BDnAFvlffX59H31
 sMjhRfKnKU4tOtuvLQX4fsjBfYOjvGW0gjvv88w/v3pfE8R3vX2TiwY30V2EYpxagRNLxiT1wV8
 yrq0e4rXXyUL+giVmwq9HXKh1rpBPUkx1vh4ibcRoVAbCXeOKKIqkXUTlGdjhqHHl3RLb4qnFob
 v5EXgLH3VNDLa03pXbDjWgk8RICmPVHQmqlx+2VR+aGllNY35WNAwlcNKUrjiVEGdF3+NTljj2v
 cyMddfqNEtBI2aRlCNk23bHYiVSq03BL4o0aLIbpQcyNIFVFNbCK76qWUNp4jH68NdMkf+whWJB
 R1PGi8dRrvM124S++qA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1011 malwarescore=0 spamscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030196

Hi,

On 6/2/2026 3:51 PM, Bryan O'Donoghue wrote:
> On 02/06/2026 22:59, Vladimir Zapolskiy wrote:
>> On 5/23/26 05:48, Bryan O'Donoghue wrote:
>>> Add a base schema initially compatible with x1e80100 to describe MIPI 
>>> CSI2
>>> PHY devices.
>>>
>>> The hardware can support both CPHY, DPHY and a special split-mode DPHY.
>>>
>>> The schema here defines three ports:
>>>
>>> port@0:
>>>       The first input port where a sensor is always required.
>>>
>>> port@1:
>>>       A second optional input port which if present implies DPHY 
>>> split-mode.
>>>
>>> port@2:
>>>       A third always required output port which connects to the 
>>> controller.
>>>
>>
>> This port numeration is imperfect, because port@0 and port@2 are 
>> required,
>> while middle port@1 is optional.
>>
>> Like it was stated before a number of times, it seems natural to operate
>> with two ports, where input port may have two endpoints rather than 3 
>> ports,
>> also that approach solves the problem of a hole in the port numeration.
> 
> Can you confirm this is what you are after ?
> 
> port@0 {
>      #address-cells = <1>;
>      #size-cells = <0>;
> 
>      endpoint@0 {              /* primary sensor */
>          reg = <0>;
>          data-lanes = <0 1 2 3>;
>          remote-endpoint = <&sensor0_out>;
>      };
> 
>      endpoint@1 {              /* split-mode second sensor, optional */
>          reg = <1>;
>          data-lanes = <0>;
>          remote-endpoint = <&sensor1_out>;
>      };
> };
> 
> port@1 {                     /* output to CAMSS, was port@2 */
>      endpoint { remote-endpoint = <&controller_in>; };
> };
> 
> This works for me BTW.
Either way, do we need to document the constraint of using port@0 or 
endpoint@0 'only' for the 4+1 or 2+1 mode and the other one is for the 
1+1 mode? Or is it implicit from this bindings for a developer?>
>>> The CSIPHY devices have their own pinouts on the SoC as well as their 
>>> own
>>> individual voltage rails.
>>>
>>> The need to model voltage rails on a per-PHY basis leads us to define
>>> CSIPHY devices as individual nodes.
>>>
>>> Two nice outcomes in terms of schema and DT arise from this change.
>>>
>>> 1. The ability to define on a per-PHY basis voltage rails.
>>> 2. The ability to require those voltage.
>>>
>>> We have had a complete bodge upstream for this where a single set of
>>> voltage rail for all CSIPHYs has been buried inside of CAMSS.
>>>
>>> Much like the I2C bus which is dedicated to Camera sensors - the CCI 
>>> bus in
>>> CAMSS parlance, the CSIPHY devices should be individually modelled.
>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>    .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 209 +++++++++ 
>>> ++++++++++++
>>>    1 file changed, 209 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100- 
>>> csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100- 
>>> csi2-phy.yaml
>>> new file mode 100644
>>> index 0000000000000..270375f949880
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>>> @@ -0,0 +1,209 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm CSI2 PHY
>>> +
>>> +maintainers:
>>> +  - Bryan O'Donoghue <bod@kernel.org>
>>> +
>>> +description:
>>> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 
>>> sensors
>>> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and 
>>> D-PHY
>>> +  modes.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,x1e80100-csi2-phy
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  "#phy-cells":
>>> +    const: 1
>>> +    description:
>>> +      The single cell specifies the PHY operating mode.
>>
>> #phy-cells should be 0, because the PHY operating mode is well defined
>> by 'bus-type' property of an endpoint on the sensor side, the opposite
>> side of CAMSS/CSID as a CSIPHY "consumer" should not dictate the PHY 
>> type.
> 
> Rob said consumer but, I'm also not very bothered about that. bus-type 
> is perfectly acceptable to me.
> 
>>> +
>>> +  clocks:
>>> +    maxItems: 2
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: core
>>> +      - const: timer
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  operating-points-v2:
>>> +    maxItems: 1
>>> +
>>> +  power-domains:
>>> +    items:
>>> +      - description: MMCX voltage rail
>>> +      - description: MXC or MXA voltage rail
>>
>> Only "qcom,x1e80100-csi2-phy" device is supported so far, unlikely it's
>> the case that "MXC or MXA voltage rail" should be specified, it'd be
>> just one of two or both.
> 
> Hmm. I'm not being clear here if this is your take, I will reword it to 
> make it clearer this generation of PHY _must_ have either
> 
> - MMCX and MXC
> or
> - MMCX and MXA
I am not sure of this, Bryan. If you look at the PHY core clock 
separately, sure, that is correct. But all of them, on this platform as 
well, share the RCG, which requires all 3 power domains. So 
fundamentally, you need to enable all of those from each PHY. You can 
make it constant 3 power domains.>
>>> +
>>> +  power-domain-names:
>>> +    items:
>>> +      - const: mmcx
>>> +      - const: mx
>>> +
>>> +  vdda-0p9-supply:
>>> +    description: Phandle to a 0.9V regulator supply to a PHY.
>>> +
>>> +  vdda-1p2-supply:
>>> +    description: Phandle to 1.2V regulator supply to a PHY.
>>> +
>>> +  ports:
>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>> +
>>> +    properties:
>>> +      port@0:
>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>> +        description: Sensor input. Always present.
>>> +        unevaluatedProperties: false
>>> +
>>> +        properties:
>>> +          endpoint:
>>> +            $ref: /schemas/media/video-interfaces.yaml#
>>> +            unevaluatedProperties: false
>>> +            properties:
>>> +              data-lanes:
>>> +                minItems: 1
>>> +                maxItems: 4
>>> +              clock-lanes:
>>> +                maxItems: 1
>>> +              remote-endpoint: true
>>> +            required:
>>> +              - data-lanes
>>> +              - remote-endpoint
>>> +
>>> +      port@1:
>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>> +        description:
>>> +          Second sensor input. When present, indicates DPHY split mode.
>>> +        unevaluatedProperties: false
>>> +
>>> +        properties:
>>> +          endpoint:
>>> +            $ref: /schemas/media/video-interfaces.yaml#
>>> +            unevaluatedProperties: false
>>> +            properties:
>>> +              data-lanes:
>>> +                maxItems: 1
>>> +              clock-lanes:
>>> +                maxItems: 1
>>> +              remote-endpoint: true
>>> +            required:
>>> +              - data-lanes
>>> +              - clock-lanes
>>> +              - remote-endpoint
>>
>> As it's stated above, it should be converted to a single port with two
>> endpoints, it'd be done in accordance to video-interfaces.yaml.
>>
>>> +
>>> +      port@2:
>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>> +        description: Output to CAMSS controller.
>>> +        unevaluatedProperties: false
>>> +
>>> +        properties:
>>> +          endpoint:
>>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
>>> +            unevaluatedProperties: false
>>> +            properties:
>>> +              remote-endpoint: true
>>> +            required:
>>> +              - remote-endpoint
>>> +
>>> +    required:
>>> +      - port@0
>>> +      - port@2
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - "#phy-cells"
>>> +  - clocks
>>> +  - clock-names
>>> +  - interrupts
>>> +  - operating-points-v2
>>> +  - power-domains
>>> +  - power-domain-names
>>> +  - vdda-0p9-supply
>>> +  - vdda-1p2-supply
>>> +  - ports
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>>> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>>> +
>>> +    csiphy4: csiphy@ace4000 {
>>> +        compatible = "qcom,x1e80100-csi2-phy";
>>> +        reg = <0x0ace4000 0x2000>;
>>> +        #phy-cells = <1>;
>>> +
>>> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
>>> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
>>> +        clock-names = "core",
>>> +                      "timer";
>>> +
>>> +        operating-points-v2 = <&csiphy_opp_table>;
>>> +
>>> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
>>> +
>>> +        power-domains = <&rpmhpd RPMHPD_MMCX>,
>>> +                        <&rpmhpd RPMHPD_MX>;
>>> +        power-domain-names = "mmcx",
>>> +                             "mx";
>>> +
>>> +        vdda-0p9-supply = <&vreg_l2c_0p8>;
>>> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
>>> +
>>> +        ports {
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>> +
>>> +            port@0 {
>>> +                reg = <0>;
>>> +                csiphy0_in_ep: endpoint {
>>> +                    data-lanes = <0 1>;
>>> +                    clock-lanes = <2>;
>>> +                    remote-endpoint = <&sensor_out>;
>>> +                };
>>> +            };
>>> +
>>> +            port@2 {
>>> +                reg = <2>;
>>> +                csiphy0_out_ep: endpoint {
>>> +                    remote-endpoint = <&controller_in>;
>>> +                };
>>> +            };
>>> +        };
>>> +    };
>>> +
>>> +    csiphy_opp_table: opp-table {
>>> +        compatible = "operating-points-v2";
>>> +
>>> +        opp-300000000 {
>>> +            opp-hz = /bits/ 64 <300000000>;
I wonder why you would have only one clock here. You should be setting 
the rate for both the core and timer, isn't it?>>> +            
required-opps = <&rpmhpd_opp_low_svs_d1>,
>>> +                            <&rpmhpd_opp_low_svs_d1>;
Same here, it should 3 power domains set.>>> +        };
>>> +
>>> +        opp-400000000 {
>>> +            opp-hz = /bits/ 64 <400000000>;
>>> +            required-opps = <&rpmhpd_opp_low_svs>,
>>> +                            <&rpmhpd_opp_low_svs_d1>;
Why is one at svs and the other at svs_d1? Shouldn't both be svs?>>> 
+        };
>>> +
>>> +        opp-480000000 {
>>> +            opp-hz = /bits/ 64 <480000000>;
>>> +            required-opps = <&rpmhpd_opp_low_svs>,
>>> +                            <&rpmhpd_opp_low_svs_d1>;
And here, both should be svs_l1?>>> +        };
>>> +    };
>>>
>>
>> -- 
>> Best wishes,
>> Vladimir
> 
> 
Thanks,
Vijay.

