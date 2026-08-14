Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C083F415F3B
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693812; cv=none; b=Z6FxJb2caapEgZ95Krx7YrMgnpvwn3d5D1KZ0w7ikgm4eq+STrJWp/D5rIM2GTsQjGJnGLtV1Hi+PzhkNjlKQlb2MQypF+Be4GuxCE4IX4lDG/Y+9oneMOqlCvu9c6Ng+yINHNeNEHhPyvBaBPIhn2oJdsOX3g6tG8p5C5lq65g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693812; c=relaxed/simple;
	bh=WMqqcG7JGr/BQoXr4E81PEy0Q4abR4uomof6eiGH+88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DrPuA1vg4S7qsBNYMQ+HSiEa2mCDg+H+UnVTmoYHSdM14yukVxHJ44J5VYliKoRYXNW0IX9wl1VvNiqpbtWAfP/tux53m7BVApRO8a3ax1G1ERZ090Bkv+rlmw9k2b4DSvXWq/Ae4sp+4RT9sirC/zV5MXJSbWhoivNgV+KwvvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYHDky8T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2rIeCP7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYHDky8T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a2rIeCP7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7gZIQ711823
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ujj/m7aXNpjl5wtp/SJXi3OSqkC0iFNSKgCN1hD+fTg=; b=VYHDky8THo+Vt03h
	DRkYpeCti43xy/zyL2/XxSNbXAmcvYLUDDiuZ08BkGNvHIveFyN6NSgxncQOcVW9
	peg+MT6+8goc0JGSmGXpW1QK2zqS8iPrHeZVndzbVwt6wjK1zJMPlC0iS9l4IyH/
	LDgHUhcrGgPL8NUE3ty6R7WWHXVJJz6AQawpeJwxgJRKM+eG9jDY6EhMaPAm3nsG
	qI1OuHtvPB/Dvbzy6gHZLFVGYsor6FpfhN893pUgBMixJHCkdBP5I9YqQAZcbY1O
	tvzUakEJE+8koIdkUWyRvov5okCSiJx1p2DvBw+fWY3bUuGA2J/MOch+b5W4VdkT
	N3/IGQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h90u7wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:50:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso849880a91.3
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 00:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786693806; x=1787298606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ujj/m7aXNpjl5wtp/SJXi3OSqkC0iFNSKgCN1hD+fTg=;
        b=a2rIeCP7Gfwy3dOGsQJ3eoW4rNlOCQYVnCAA2M55Kpqk3gBSL8y/TkAPGDJFxNtLWL
         draOouOOSWNwrt2+DbuP1erRNWLawmUONbKbq29gNeXC8GTV5p2q+lRz+S9KaBmakTcV
         VItyeyaEOh+Y2cXgGyQneq8JLmzqTFjjYNL0a79bGjH2QFG18uQmOgJLfHhgotqBuTXE
         gSD3dEMcyDBpZEhrtzXd0yR8/oxGNd/CqDFD0pN00a0A9K5VDdws/6wLP1h+x8LEa5eL
         GQ6s07Kwe5PYYf00Ah9VZXU3TVBI2XSP9iedbPaouAtqsQS5W2/qNBOm/1MEO3KVpA7b
         JIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693806; x=1787298606;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ujj/m7aXNpjl5wtp/SJXi3OSqkC0iFNSKgCN1hD+fTg=;
        b=Akh+/P1qaKkrmqAmN0XetlnJiCaPYISXmdXkhuUlyCwmb8OuabfRmq8O4bf9OXWNyX
         ZYZlfauus+Ii4miH5iAVpd2d5gS+Hd2uz8BZSUStDR3uqvpCt76PUo494lWLaDLeqVP9
         MgzeR21h+o/TzuJAzFOaV7V1/N9sEf6T3D5nMq1YZDaAvZBF2kCgav8jNzAdO2u3tydT
         7KcG2GO+BbmbR15lUR1GZkFIkRv2kbb90/4jUIaZLl17egmOq10AM1Kho5zVXK+oF7pA
         QlV5edDIobfCHhSlmud3A7kDBLaE4/UJ3MEVxdqVWmHQAkLLruYVGCibi7rwek9nkdcL
         4QtQ==
X-Forwarded-Encrypted: i=1; AHgh+RrQr3qf7gOAMp/thkU61K4Kq/28EyNCQt0T6BYaKGacgIEWCnd05PAlIso++WWEy1GmbCZD/Pa/0lLw@vger.kernel.org
X-Gm-Message-State: AOJu0YwwXTjOYh3v83GQ+wMqn44el4AJXKOJUtyjIMoAU7H120AF7QDL
	D/UDLrIYRHnJDQAzws6edWhJEfwAsEaIu19E3Rafo0U46G5Sh/7vKXS88LgqIZ4rZH4Kd3gJyna
	ynDoAGU+3IsSni30DB/4hkRwrNQDwRq9xY/GxbOnmr8iyjRFvdpmBKFVQpF4ar+/T
X-Gm-Gg: AR+sD12EWaG0h4FoQeZPpyme7gBKBxNytEdwr+9W9u52Ojyc+xuZXWHYOYbXOQ8WvMd
	xdSJFTWOLgvH2f6WvgPCusShcVMXiBAueejsYiFPZBUoqRh7ziQiSRnhUf6C7c62JzT7vdjawnW
	MTlAji3Rv+1UqXaWbQcsP1EsEVF3CjejNNUy0BrViCmTQ/4VeWoZEcgKzNYnlyr3gURNGncXgNW
	XSxxbeEz+JknsunPZnKS4FqXeM+LZX0Wq2H7pKdphduL38KQlKqBsDv13jpwgn/AFRvvc6Pdvmx
	iaMBoJTNtS2E53pmjUJ6peIo/W7ld0XJWsO+DUIMN5bkec2sZal/apHGkbZEN8gzvjxh6Dr7XSh
	l5DIF0/ID6B+y59kz20ezDcwrrQ1+NDnwKV1cn8RbxFt248IgwfdvdAZw8W81CRBYPXFsrkgP5I
	ib0vXCDib5YDARxxClfDM=
X-Received: by 2002:a17:90b:52cd:b0:37f:df85:272f with SMTP id 98e67ed59e1d1-3933bad2bf5mr4356231a91.19.1786693806098;
        Fri, 14 Aug 2026 00:50:06 -0700 (PDT)
X-Received: by 2002:a17:90b:52cd:b0:37f:df85:272f with SMTP id 98e67ed59e1d1-3933bad2bf5mr4356160a91.19.1786693805582;
        Fri, 14 Aug 2026 00:50:05 -0700 (PDT)
Received: from [10.79.117.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394eb752fe2sm1578288a91.14.2026.08.14.00.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 00:50:05 -0700 (PDT)
Message-ID: <23162a62-b499-4223-bab8-aaa5b575dab3@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:19:57 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/15] dt-bindings: clock: qcom: Add Kuno Global Clock
 Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-10-5e0ede4a0c72@oss.qualcomm.com>
 <20260813-glorious-secret-mantis-dcc083@quoll>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260813-glorious-secret-mantis-dcc083@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ovh/DS/t c=1 sm=1 tr=0 ts=6a7ec8af cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tqvfEU5OP8eIFZPyU8cA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfXzEjy+iNRtFnI
 xe8FWM7KcxNZTqKz9bLAAiNEawU0W6HQgavE7Ylo/UySqrEiaKJrEoTHTukPr0yGWc41k1EEgzt
 FY6eLGokt4TcWNaVOTK/fzH0gQqVu2E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfXzh8JViVT/zQy
 MEgySUErx5LIVIxIHbDQI2yeeJnCfkc3B1HQkyZpGaiE3zQs/HmS33T8v6Dahx7QExkuOutQ+D/
 zRt4lrh0Uz7tdWKIdXz/d3yynExJmydzRuOBrxHNmfWfwlSs2JnbqlVhA1MTOzIt86/QEdYwjRG
 bNUuICUUHC9PH3AF68eb0qkGIZzBMpgqUj/Dd8pfYO0MadZ6iRmszLrtTEgYwfDUvpOebkatd/I
 IT6UPYuDwHIRGo6hDugGXj9cW5fY2r7ywIbhaLqUcYLV+MFsvbbmNgg1tKGvkR9PDRDesEqReKJ
 i7kBAgxQqYKHCAwBZgt9VlsSM1ioLINHF0HRanXZF+xjbPFRgDrtzAwhq8+xrIvAoEyt/Ux3uMd
 kBiX0Y19qcPS1BszTVXQQBvFMxx/Mit+WNPWEsg0TDIrsGmEpftMVDfM5xGXR12eWdV0WhJVQL9
 avabS8S4YuIjJvlkm8g==
X-Proofpoint-ORIG-GUID: WZziZbFa39TopluVUzztI93zzSx6-M-f
X-Proofpoint-GUID: WZziZbFa39TopluVUzztI93zzSx6-M-f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140059


On 8/13/2026 3:10 PM, Krzysztof Kozlowski wrote:
> On Sun, Aug 09, 2026 at 12:57:09PM +0530, Hardeep Sharma wrote:
>> Add the device tree binding and clock/reset IDs for the global clock
>> controller (GCC) on the Qualcomm Kuno SoC so its device trees can
>> describe the GCC block and reference the clocks and resets it provides.
> Almost each of your bindings commit has different style. I would assume
> this you would write once and copy-paste.
>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/clock/qcom,kuno-gcc.yaml   | 56 +++++++++++++
>>   include/dt-bindings/clock/qcom,kuno-gcc.h          | 95 ++++++++++++++++++++++
>>   2 files changed, 151 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml
>> new file mode 100644
>> index 000000000000..ff01ff31c2e2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml
>> @@ -0,0 +1,56 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,kuno-gcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Global Clock & Reset Controller on Kuno
>> +
>> +maintainers:
>> +  - Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> +
>> +description: |
>> +  Qualcomm global clock control module provides the clocks and resets on Kuno.
>> +
>> +  See also: include/dt-bindings/clock/qcom,kuno-gcc.h
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,kuno-gcc
>> +
>> +  clocks:
>> +    items:
>> +      - description: Board XO source
>> +      - description: Board active-only XO source
>> +      - description: Sleep clock source
>> +      - description: PCIe pipe clock source
>> +
>> +  power-domains:
>> +    items:
>> +      - description: CX domain
>> +
>> +required:
>> +  - compatible
>> +  - clocks
> Not a power domain provider? Then it should not be allowed or explain
> oddities in the commit msg.
>
>
>> +
>> +allOf:
>> +  - $ref: qcom,gcc.yaml#
>> +
>> +unevaluatedProperties: false
> Best regards,
> Krzysztof

Thanks for review.

Done in v2 : 
https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/ 


Best Wishes
Hardeep Sharma

