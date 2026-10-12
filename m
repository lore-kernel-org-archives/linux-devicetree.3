Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3FA3939D2
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797787; cv=none; b=Iea0KqMEHRmsPihv3GgHkPRWoR7U9CEJVFeb42YsQq4eE4RO3p2mAHSvyissYb2sCcbGBM9gdYik89Q/UYLV6nR0tTizLdPPbVMt7029ipUkjNTM69tRZDynhKktT9rYKG0oSs3n8BsBEVjXSr5Ij33IJFJuDFl4wDeJ9UikOnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797787; c=relaxed/simple;
	bh=LASZqrLY1ba6bJ9r9c5Rs/iTZdNGREMx91rXLmcgaGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mxr3hppvhQvtdg62zLy871MIj72R/C0eAQXUDZeWI9ZBP750GJLGWYb9uvUz//eOqbsHUF1ZCWIBK10L3drR41XaJZwuH6/UL74mK7SXmC0wsWU2eVlbyNvbE3wAfGW3gIKnSRZs66K30bRLutZ1pxqQA2QmPrSKMX5ZLknSOjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IGPCwvt1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aMbSNjBZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IGPCwvt1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aMbSNjBZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KlEn1439169
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aNfbkWr5wnS5VB6dUyT2oeWRhJlFNcm7TZmPyZKuY4Y=; b=IGPCwvt13Lzm4gbx
	P9aWkNvONHsOjePWpvoUfgoEmW8Cea64bcyFtQImhd+LO0XgzcIrYOuiLwyxgqRR
	YDsTqNEjmaNo4jqckklWnxyWty1Gl+Ol+oWq/QhM7PwFP9sHLfJVtJf8h+fSS6+V
	p78yL+Y4OAnDQIjKzIE/CUkf+YJQilziTnQpytlBEKQbpZ9sApkTATS1wDDAWpIo
	Gevloz8yVOEyD139YrxrwgnBxizta3qz7HOXXRMvhRv+z3q7mR3ugIRAaxsYAYgp
	LJsemhBYvYVZYHVDqrBzRnU55YxeopSv7Yq02Gmqul1ngXonhzQYTeiL+NuHbL2a
	LKzDgA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkhbsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:36:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a7fa5e0442so2373313a91.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 02:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791797783; x=1792402583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aNfbkWr5wnS5VB6dUyT2oeWRhJlFNcm7TZmPyZKuY4Y=;
        b=aMbSNjBZyK+dWR0h248/zaHUDKlpo24+UIWgaI7J6UgyD4OvAIgQLHt0PF1hI5vAyr
         M10cb3sSmpGex2c4Nh/SJhAgKY2bok8QL3cWlM/p9VVWOuV+iPQO6VEXu2o5m3vEiphB
         HY4H0MgqgXy3/nQQq/n++WSM+ArlbesGC7OmJcACm2iPrNx+roIjeyVebuutzDXxRIiE
         A7J3wOIaaCBj0yjSeJO4QDCoIZL2LugUkhVJlsPrXUKQ8gkcHHutcfKbp9+NmvZ0ACx9
         D467/YkVloHm3deME3b9JiGcWH3kTHWZI/nsr7wcArbo7I7bS+e7QFZAnIvrz56rPRMp
         QtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797783; x=1792402583;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNfbkWr5wnS5VB6dUyT2oeWRhJlFNcm7TZmPyZKuY4Y=;
        b=c1ISC19isGrZceTLpoVKbfBGIqOpTkpXc6j3+y6DYwO2tc0Hxzhd+TigrSNzojDjUh
         N3r706wWA0YowendWL9/ppIjqEIIVjH/xcO64Id9/3P5rRQxiNZWfEEedVo1cgsCbnv5
         VxBdUj1Ii1TtHzttghGfvYfgAfL1kZyoYIBz1QIXTI3e9ITZQUJCm+ceoHtp6JPTjjq0
         sCCP9w211FVzVzW/0YYTMSTAPYqsyN4kBaVA1yINCl30nmjAZXeDLC9teKWiFw3+iCZQ
         yN9xfAbzRizqo5t2D7MuSzlu9uY1fn56PNk4fkFsYhtPXJIy+Qs1EfVWQxIN48KfKwtK
         I4zQ==
X-Forwarded-Encrypted: i=1; AKwUvByV76ZhpN3tnkplvqLN84avoMqGRfUsmFzeSzZx3qOfauuu3pWVV4dEHkohul1NUl21nw2dpvqFz3mT@vger.kernel.org
X-Gm-Message-State: AFq9FYL6g6lbm3BHRWj02GlXz/2usKXnpR0iIU97L1N8Nvj6Cc10rq2m
	//j4Kw6W+2SxuP16hma/GUixv2bc/uhsRJQ7YiQZ0XFT+Hy5wVStWVOEm/UtU6vqWpm6jaktFTF
	GhUEx5Ro1k9/ZLX9Gh1N6C3ppQJP4OXpNWM45+6iNffsAaOYng8XrKcVhQeymdYgvzF0upq+0
X-Gm-Gg: AYBFou0nkqqjjppRwwEuiFZv1cPAIxfvtKpfgqFvFFPper67oraNh6YcTSfCUdJpGga
	XF3ag8XIvgB9hSQqnMEjO9GvncqTv6o60XUi3PqJrXVDnc6gHQ7MQaF/IO+3oo4EIygtFCbnT2S
	hhsAI+Bjum7M9zZygQ3PD6WP13annCTyyJad6cWcB2Ow/9MuqYVYagtVATOkCdD+l14W6cCiQYk
	2haT+mR3JC+STzQTPpPCyjn7QXV31eXLnN01CEF72FPWksMY5AlrYnsGb8/IXIO8tgqsfD9KiYI
	636D94JSouOkyF3wwF5gu90Vk+82V97Eyqn67+RNqhrreSdxg07XtT9eKTsA+pjZ+mcMQovj+WH
	bmddJfXicF1EYgiq8ej9mnelWkk5izM4lif1sh+RjbXTLlruM3ToPeFgPPVNALgPtNkzcibRdXb
	6bLyh2Jqnlnfo=
X-Received: by 2002:a17:90b:4d85:b0:3a4:c946:9f4e with SMTP id 98e67ed59e1d1-3ab3acdc386mr6665530a91.58.1791797783179;
        Mon, 12 Oct 2026 02:36:23 -0700 (PDT)
X-Received: by 2002:a17:90b:4d85:b0:3a4:c946:9f4e with SMTP id 98e67ed59e1d1-3ab3acdc386mr6665518a91.58.1791797782625;
        Mon, 12 Oct 2026 02:36:22 -0700 (PDT)
Received: from [10.79.117.80] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab8a393666sm10999279a91.15.2026.10.12.02.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:36:21 -0700 (PDT)
Message-ID: <7a091ebe-86d7-4edb-9fa3-9026d2c44176@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 15:06:16 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: qcom: Add Glymur OOBMSS PAS
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
 <20261009-oob-support-glymur-v1-1-96cc8ffcced3@oss.qualcomm.com>
 <20261012-impossible-illustrious-dog-702afc@quoll>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20261012-impossible-illustrious-dog-702afc@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzOCBTYWx0ZWRfX3J8uEdbo0Q/i
 ajow9T25plU9Qfij9S1gPj3aDWNvwilkuvLBeDb9vHlLcL5NNH6mJHqPl7Eqm55r9qVIiEV8aIC
 OnArHoExb4MJpRdNbrKbDzNK7bj6vjZ6g5ZqNg8UhY5ax9p1BQpgKvUqHaKKYTLSjnryYVQp+zz
 Lr8Vj6aguKh0qZssx+CNPjBhqJTPoxJoL0yY0Hn8Uwh6KNnfDSSBKv0Pb0VDS1jU53akYTKafjj
 zNPYV2w+DJWiylBkAI3QRUKR0MFCEfJx6AfLLdNUT55aCVtU2f3DvTmMkWCefTDYVaVpdE0NkH7
 DSpyDFgLH+lcQcHA/cBh2A6UApbrCcnLCDUJur3xdhSWx2aDmOyMYgWcGtBEvn+5uGOqEluj+6+
 n4rGar5W9RdyP3SquVBg0fRDMrWJNSKIQ3EYtNuZ/Cud2ZCp/Fb0S0AFbaluhsH8Qmo5mecDrp+
 6aMqeMtxXHqy19pr2gw==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6accaa18 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=P-IC7800AAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=UONzWho2_RmusEta7RoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzOCBTYWx0ZWRfX+Ggdg1OcsFhi
 fkjjr6IH4nf27kVzB7OcVwkdQjjIrVgpXY7kYJXwBeIaHCgzft1egPogK11Q18yK4VB31SjGgJN
 78/Q/6iQcQm4Y5AXY2sktv6ui6AlmiA=
X-Proofpoint-ORIG-GUID: BsJY1Fa55Gik-_Zwun7o_QzELXDMt2Pk
X-Proofpoint-GUID: BsJY1Fa55Gik-_Zwun7o_QzELXDMt2Pk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120038



On 10/12/2026 2:25 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 09, 2026 at 12:47:39PM +0530, Anvesh Jain P wrote:
>> Document the Glymur OOBMSS PAS node with its secure GLink edge,
>> shared-memory signaling, firmware carveouts, and power resources.
>>
> 
> A nit, subject: drop second/last, redundant "binding". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
>


Hi Krzysztof,

Thanks for reviewing this series. I’ll drop the redundant “binding” from
the subject in the next revision.

>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  .../bindings/remoteproc/qcom,glymur-oob-pas.yaml   | 156 +++++++++++++++++++++
>>  1 file changed, 156 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oob-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oob-pas.yaml
>> new file mode 100644
>> index 000000000000..bd4f397da40f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oob-pas.yaml
>> @@ -0,0 +1,156 @@
>> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/remoteproc/qcom,glymur-oob-pas.yaml#
> 
> Filename must match the compatible.
>

Ack, will rename binding file.

>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Glymur Out-of-Band Management Subsystem (OOBMSS) PAS
>> +
>> +maintainers:
>> +  - Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> +
>> +description: |
>> +  Qualcomm Glymur Out-of-Band Management Subsystem (OOBMSS) contains two
>> +  processors running Zephyr, managed together as one remoteproc instance.
>> +  The Out-of-Band Trusted Execution Environment (OOB-TEE) is the primary
>> +  processor. The OOB-Non-Secure processor is an auxiliary processor that
>> +  depends on the primary processor and cannot function independently.
>> +
>> +  The primary processor runs the primary image, while the auxiliary
>> +  processor runs the secondary image. Each processor has its own DTB.
>> +  The two images and their DTBs have separate PAS identifiers for
>> +  authentication and dedicated reserved-memory carveouts.
>> +
>> +  OOBMSS is booted by earlier-stage firmware and uses an XO clock and the
>> +  CX and MX power domains. Shared Memory Point-to-Point (SMP2P) provides
>> +  boot, shutdown, handover and ping/pong signaling, as well as fatal error
>> +  notifications. The subsystem exposes a secure GLink edge to the host,
>> +  with doorbell interrupts provided by the Inter-Processor Communication
>> +  Controller (IPCC).
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,glymur-oobmss-pas
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    items:
>> +      - description: Watchdog interrupt
>> +      - description: Fatal interrupt
>> +      - description: Ready interrupt
>> +      - description: Handover interrupt
>> +      - description: Stop acknowledge interrupt
>> +      - description: Pong interrupt
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: wdog
>> +      - const: fatal
>> +      - const: ready
>> +      - const: handover
>> +      - const: stop-ack
>> +      - const: pong
>> +
>> +  clocks:
>> +    items:
>> +      - description: XO clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: xo
>> +
>> +  power-domains:
>> +    items:
>> +      - description: CX power domain
>> +      - description: MX power domain
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: cx
>> +      - const: mx
>> +
>> +  memory-region:
>> +    items:
>> +      - description: Secure firmware carveout
>> +      - description: Secure device tree carveout
>> +      - description: Non-secure firmware carveout
>> +      - description: Non-secure device tree carveout
>> +
>> +  firmware-name:
>> +    items:
>> +      - description: Secure firmware
>> +      - description: Secure device tree firmware
>> +      - description: Non-secure firmware
>> +      - description: Non-secure device tree firmware
>> +
>> +  qcom,smem-states:
>> +    minItems: 2
>> +    description: States used by the AP to signal OOBMSS
>> +
>> +  qcom,smem-state-names:
>> +    minItems: 2
>> +    description: The names of the state bits used for SMP2P output
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - power-domains
>> +  - power-domain-names
>> +  - memory-region
> 
> firmware-name as well, I guess?
> 
>

I think firmware-name should remain optional. The driver provides
defaults when loading images, and attach-only operation does not request
firmware.

>> +
>> +allOf:
>> +  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,rpmh.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +    #define IPCC_MPROC_OOB_S 56
>> +    #define IPCC_MPROC_OOB   55
> 
> Drop these two
>

noted, will remove these definition.
>> +
>> +    remoteproc@1f000000 {
>> +        compatible = "qcom,glymur-oobmss-pas";
>> +        reg = <0x1f000000 0x30000>;
>> +
>> +        interrupts-extended = <&intc GIC_SPI 86 IRQ_TYPE_EDGE_RISING>,
>> +                              <&smp2p_oobmss_in 0 IRQ_TYPE_EDGE_RISING>,
>> +                              <&smp2p_oobmss_in 1 IRQ_TYPE_EDGE_RISING>,
>> +                              <&smp2p_oobmss_in 2 IRQ_TYPE_EDGE_RISING>,
>> +                              <&smp2p_oobmss_in 3 IRQ_TYPE_EDGE_RISING>,
>> +                              <&smp2p_oobmss_in 9 IRQ_TYPE_EDGE_RISING>;
>> +        interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack", "pong";
>> +
>> +        clocks = <&rpmhcc RPMH_CXO_CLK>;
>> +        clock-names = "xo";
>> +        power-domains = <&rpmhpd RPMHPD_CX>,
>> +                        <&rpmhpd RPMHPD_MX>;
>> +        power-domain-names = "cx", "mx";
>> +
>> +        memory-region = <&oob_secure_mem>, <&oobdtbqc_mem>,
>> +                        <&oob_nonsecure_mem>, <&oobdtboem_mem>;
>> +        firmware-name = "qcom/glymur/oobmss_tee.mbn",
>> +                        "qcom/glymur/oobmss_qc_dtb.mbn",
>> +                        "qcom/glymur/oobmss_ns.mbn",
>> +                        "qcom/glymur/oobmss_oem_dtb.mbn";
>> +        qcom,smem-states = <&smp2p_oobmss_out 1>,
>> +                           <&smp2p_oobmss_out 8>;
>> +        qcom,smem-state-names = "stop", "ping";
>> +
>> +        glink-edge {
>> +            interrupts-extended = <&ipcc IPCC_MPROC_OOB_S
> 
> Just use numbers here
>

Ack.
> Best regards,
> Krzysztof

-- 
Best Regards,
Anvesh

