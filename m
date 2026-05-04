Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063112D7393
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 07:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777879066; cv=none; b=c13Jej0Eu5SpmAHVI3s7u9uBVJxzWRttgvCzpDa9xpt2CnkivWfNo+R8YsVAxiUSDDCLPTMTiti0EGSqX2j5BJ45bW5A+v6jdHdOyboz7UqzzV/2gQtO2CQ7G4gdT5cRsSXqw65zaSi4MiZ7j4ZFmv5+gQqChTA7YUmsHU2IBLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777879066; c=relaxed/simple;
	bh=S2ywDK9Z/XmW1DdLWAaR4LWz/VfKoc196yZKCu9VRe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CgZKQe8UL05hY7Xl+hagPPovCdKKuB7k+dUFmlE3e9eKJSXuaVh4DzwJhfpW45uYiWK462u4LqP9NgyhD9/MnvmoGKVylB4DpT3qlkBYiVweWu069DdeuXnFNO5NJ+V+SG1usHXGeYWrqGNNDGKTzj2VNkeUADDO1vew0EwIndc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BNqx5rRb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XzcQ02vj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BNqx5rRb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XzcQ02vj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DKXY3470735
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 07:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BvsC7vS8QiLKFxVRhuJGpH17bq45h1P4AoYtDVy8ksQ=; b=BNqx5rRb5CIcNCsR
	CNREwUAaymoTDVT0u8XlDeYGV1R2XAXtW3omxdfQ4gLcHFfzCabL41ziaCJlUbwM
	krOuToYz4xZtgqy25I1/U6cBrBfgZ06SlImH7hldqxYvOSLgFAcC7S9GCo1xN8Kx
	UXZJuEPcCfwIv+4QahndXKtMD33k9GF2tsKpivl+/LFzOehQo2Feu6oHu7/VQk2Y
	gv8sRQ1X7CzVpIVHd7EP3Fd/gRKCgILJX8Bf0yEsa8f2DxoDzK02XKR1PjEpHnyv
	HQWiZ2qyx/KaPbEDLhOaymJyKA062C1BD5uEbDVojHEE1EN3pkGBBqP7DBsmd19u
	JDhnhA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9bvmnmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 07:17:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-364edd430e6so3704407a91.2
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 00:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777879063; x=1778483863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BvsC7vS8QiLKFxVRhuJGpH17bq45h1P4AoYtDVy8ksQ=;
        b=XzcQ02vjl8t+OE7AZZ35GNpf9cmA8lRVD2AAUIIpK+y2DQvRH1cL2OqCFIX8GSu0l4
         MFmO7eeFLdi4FBsoC9kVeiqsXZJ+kSIixTiXy1sUKFuzG86in7e0jBZif9CKdQNBKLht
         3c7ZiLF3BuGPW509Mo5afcPVE+x3lzDk6zyz0cd9nWWfESdm/VghIz6E3S8dJlKm/aHn
         tk8ZCG7+hvankfexyPqm87UQm5TL9kO0lIQutRs9IX7ajLHNYeJw9v1eDJ351vBzcNWt
         /pj9YThRLtyqCxAUxIeUrestbZ/Q25coG8qMwvXeKCPpOCcMLtk+TdGMXI72MaDgruTJ
         MUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777879063; x=1778483863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BvsC7vS8QiLKFxVRhuJGpH17bq45h1P4AoYtDVy8ksQ=;
        b=ecQVlXQeDZUgfYn5/8YYGKskBYewdYX8ut7trk4JUVXG9pgc4YhKCruyZCNQc0laWZ
         uHJr5yLQ3cZ88MuNirx9xDltUKMwg/Q3bMX7sneLg0yNDsGeNbJnt2nZ4e2rAnhBnSER
         gOj3eQkzxyMpKHxnvi2txyoFHJ9OMz0Ik83GAXL/mUgAwsU/MGXAKkFssSV97gFa5Hq5
         +ZN4xfVDSzMB5I3QCziwqjwae863eiacxJfGe7O2LrE2/OGlNZyqmdaTpu2rJpaevmPZ
         y7kEyKhEWyAjV+xr/sDl1KzfEnCAk6oqp97HaoIUteC6hB5EeQEWhfQ5mZ0TmabfZjKN
         99BQ==
X-Forwarded-Encrypted: i=1; AFNElJ/io4yvO/65jvIO3Zk/n8f0ZnAOuwJdkSzA4wmSA3uQv5QcBTXeZSRa+08x8TtmxTJqQs0r40DZtIRq@vger.kernel.org
X-Gm-Message-State: AOJu0YxY7QZjER1z2qi54QQudLiwA6qYN2aMjd24E8uJrA630pKvaYVx
	Wc2r0jJQDGGgnpA/oBzuMd1qxz6Mz5EzUObyyXSWU+97dCD/Ipg4huMralVaVBSB6f6K8FCMWxc
	FPP3jY2A3qBxoUp2bbIddnSpE/MGNxyGp4OwmZv8UazjMDLCfuHLl4Ra6quGg225r
X-Gm-Gg: AeBDietHRMPULRKxEiDdzR3I+2Ojx+tavLdpXOeTKsI+d/+q2Otu3qOxw4aSX23H1Eb
	HLIFXJdQMJ0P3ExrwN3ZxL0aLfPbIxb6iHPLYIhULqJdulrdZUTpal9Uqr5g5eWig0x07GUurGw
	Q7XO4qo1KVZKfFrrwP6KX6VxHm2VnIf/6/EwQnfoIBb8i0aeQISLw415XV89KflZVT0bjINnrUw
	X76PUcOf4Se/XRqxxbbBPc2H+MBksvAkFigGaGEinDoUFHlX/D6lmsrPNhUP0W9uHJ8aParDdnG
	2nYQP4JkFLrPhagCXplKiFpQRwrjXGvrhAG0RsfxgnJIhIg6vDTMhRLoMxNJtydW8TjhKAmGO5V
	0s5k9uDyOzS6jTeIy7+3QtwxJkTlyJnmYuSbePVlw5CGHhMGpf9908vl6rTPPz+vleChJpyuP
X-Received: by 2002:a17:90b:33ca:b0:35f:b1f3:ac12 with SMTP id 98e67ed59e1d1-3650cd08154mr8172121a91.4.1777879062778;
        Mon, 04 May 2026 00:17:42 -0700 (PDT)
X-Received: by 2002:a17:90b:33ca:b0:35f:b1f3:ac12 with SMTP id 98e67ed59e1d1-3650cd08154mr8172109a91.4.1777879062217;
        Mon, 04 May 2026 00:17:42 -0700 (PDT)
Received: from [10.218.15.248] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bdf2a71bsm13571815a91.1.2026.05.04.00.17.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:17:41 -0700 (PDT)
Message-ID: <a078818d-9355-4f97-9fc7-91f3fd61f369@oss.qualcomm.com>
Date: Mon, 4 May 2026 12:47:37 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: document the RPM
 Network-On-Chip interconnect in Shikra SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20260429-shikra_icc-v1-0-e3439903edf1@oss.qualcomm.com>
 <20260429-shikra_icc-v1-1-e3439903edf1@oss.qualcomm.com>
 <20260503-enormous-benign-salamander-8d074c@quoll>
Content-Language: en-US
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
In-Reply-To: <20260503-enormous-benign-salamander-8d074c@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kIi7UQubpwxcqixOreZrGrZOmbvTg_IM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA3NSBTYWx0ZWRfX0UlMsrYll8AU
 97kWmWMfbTNTUTokr4kQhqK7i+jlD1ByMh+8W2iluXJ5HRKH9C1b1vBaVn90wP55ZHAaE/iA4S9
 eBTjxrJ2xsXkKtpDaPL0YVLTEVSXxo0gOFKT9F9CL1odI/2FdUthes+vyc5C69VW+mH3OXjMwqd
 fSRi7Jv4j+jP7UvYYNGwSo9kPKjxkJNV9nhHNN/ddpSbhaoIeryPrZCHnF9ZHNHmMYurkF0NXwf
 lat8v1XpeP8/fJrkIEyMCx9VBZTXjIwdgbciv84owgDktquo7ZqO4YqXARUOKS12UQ+c6E57HQ2
 2sIPGSNZr3SUYXT1A7qnHw19ovgLlO1ipX9heSv+KJTECI0Wh9yNN+gt98DQ+V+ABwvF2DrH5a8
 CesXZoaQ3JWxgTLIM0kewEyhJvDtmjl019ULoXMt9Qq3oTFGUf6oewHMfxqYtCSuK0/PHlG/tUU
 VA8/o5HaHnyvJDfPJyg==
X-Authority-Analysis: v=2.4 cv=dqLrzVg4 c=1 sm=1 tr=0 ts=69f84817 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=yHlWrU9OV0gRyedkY6sA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: kIi7UQubpwxcqixOreZrGrZOmbvTg_IM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040075



On 5/3/2026 9:47 PM, Krzysztof Kozlowski wrote:
> On Wed, Apr 29, 2026 at 02:03:48PM +0000, Raviteja Laggyshetty wrote:
>> +++ b/Documentation/devicetree/bindings/interconnect/qcom,shikra.yaml
>> @@ -0,0 +1,135 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/interconnect/qcom,shikra.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Shikra Network-On-Chip interconnect
>> +
>> +maintainers:
>> +  - Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.

I will fix it next revision.

> 
>> +  The Qualcomm Shikra interconnect providers support adjusting the
>> +  bandwidth requirements between the various NoC fabrics.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,shikra-config-noc
>> +      - qcom,shikra-mem-noc-core
>> +      - qcom,shikra-sys-noc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 1
>> +    maxItems: 4
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    maxItems: 4
>> +
>> +# Child node's properties
>> +patternProperties:
>> +  '^interconnect-[a-z0-9]+$':
>> +    type: object
>> +    description:
>> +      The interconnect providers do not have a separate QoS register space,
>> +      but share parent's space.
>> +
>> +    $ref: qcom,rpm-common.yaml#
>> +
>> +    properties:
>> +      compatible:
>> +        enum:
>> +          - qcom,shikra-clk-virt
>> +          - qcom,shikra-mc-virt
>> +          - qcom,shikra-mmrt-virt
>> +          - qcom,shikra-mmnrt-virt
>> +
>> +    required:
>> +      - compatible
>> +
>> +    unevaluatedProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +allOf:
>> +  - $ref: qcom,rpm-common.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          const: qcom,shikra-mem-noc-core
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: GPU-NoC AXI clock
>> +
>> +        clock-names:
>> +          items:
>> +            - const: gpu_axi
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          const: qcom,shikra-sys-noc
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: EMAC0-NoC AXI clock.
>> +            - description: EMAC1-NoC AXI clock.
>> +            - description: USB2-NoC AXI clock.
>> +            - description: USB3-NoC AXI clock.
>> +
>> +        clock-names:
>> +          items:
>> +            - const: emac0_axi
>> +            - const: emac1_axi
>> +            - const: usb2_axi
>> +            - const: usb3_axi
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - qcom,shikra-clk-virt
>> +            - qcom,shikra-config-noc
>> +            - qcom,shikra-mc-virt
>> +            - qcom,shikra-mmrt-virt
>> +            - qcom,shikra-mmnrt-virt
> 
> This if is pointless here, changes nothing and not really correct. Drop
> it, I will fix existing bindings.
> 
> OTOH, do all NoCs have children? If not, the patternProperties should be
> disallowed for such cases. Also clocks should be restricted, see my
> patch:
> 20260503161653.60785-4-krzysztof.kozlowski@oss.qualcomm.com
> 
Only system_noc has children, rest of the NoCs don't.
I will update the bindings to 
1. disallow the patternProperties for the NoCs which don't have children.
2. drop the redundant clock property check for child NoCs at top-level
   allOf:if:then:properties:.

Thanks,
Raviteja

> Best regards,
> Krzysztof
> 

