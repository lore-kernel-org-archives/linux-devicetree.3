Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201BE370D69
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 18:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786558903; cv=none; b=Cxf97NjafLPk7D7YJxfKT3JvuQtrIWxoyZw8wqW7DGH3BIFsBlmQ67msobJjnUWk7yuMJ6y4Km+Yq1pap/zVmIzq2zrbKmROGdY5XcEojphAhQgvJXXuGiV78sMnnhzBL06RnyG0tR+w41G74OAN4JaV2o8os+vFEzEQgzgqZFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786558903; c=relaxed/simple;
	bh=iI9esAdOdZlw1uReZnabVvg5nHlPrIbNW3n2cPWAZXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GxXrMMmAK5El5njd4pSx7KTmDNlsxRVP05qKs5ekdExDLNDRgxf7jQIjNFcM2a8pE9NwhZlL/Cvp9bUbPnFGJQw/7SeCVxwdlioMHKH/ZCQ/4Y/otwjEAoKT66FpKTAwHwoXlMk8mWCXYyY3aqYL4jHF24ESizOjWn6c/hiq9A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=of6jBEj/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jLQykEdw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="of6jBEj/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jLQykEdw"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CI9I6Z919507
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 18:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+LND2pBW8ZOPxUjxOrCRIPueAW7jiZZxzW3Hs+XmLEY=; b=of6jBEj/9M//BZJv
	iVVG9dOOSLGlZULaKtZu0wDId03BF9r/zDUQDjPU0yacJeWSr4m1MjxBpf0zgvHU
	s1ixF4rQaJ5thA/ZczSKcH7qXXLK74I+Qb4QHMtH3T9uDVNGbjsGyc0CJExdvQWz
	KVFDunHCFva+URsqsOAUQCJYHQxjzoNxwvqH/7uBzynDWZyUG6K3DtQfMO7hUjpi
	ENn7ZevD6ZZYrFFT4pCSS5ve9Y+xQxQTYNx4PzJ/BmNjdXLtjncCEGKiJPPrwgKd
	79PYfb5pihBzA/VsJVHoSx80+OZDDl+vtgPtJe208Bdem0VyvBCyU1MyqTB3J/BC
	pVNXlw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0sk41hbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 18:21:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf6acd760cso16897915ad.3
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 11:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786558900; x=1787163700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LND2pBW8ZOPxUjxOrCRIPueAW7jiZZxzW3Hs+XmLEY=;
        b=jLQykEdwMrS3tnI8Y1XeboUe7YkcIshvqQs0COL/PIAy9fgdODDzxWPeHktKwvqdO7
         1a6clEOAyyhqt09PQdVv9/TRaN+lOj0LynmvtcHPTI3353sFKewG0ZNstF6jpFzkYFRN
         uVnmUZwqAxQ1VfHJ7XITkQczsNdOdDLMrgLncWuTIJQXtLJ7ZngLv4jq2l2tReXUnaa6
         qnE/6nro10qwnoMR1KwXEP7Fno9A7ckCXimkrWpr2L5fo21BZ28crkGpkPnr2+E6ayqk
         rUhcamzGJhZhWAJtxNiqEoRU6pUfJugnFPQKJejCVmNM4cgJ6/OvV2mKgyY/LmExiuQo
         trxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786558900; x=1787163700;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LND2pBW8ZOPxUjxOrCRIPueAW7jiZZxzW3Hs+XmLEY=;
        b=UlcFgJQLvlg8TivilnWULySYeABoX2lWBgSKNtU3wT9VvxNuyPhBYrksvDpEQ7cL8V
         25a/cBTm6LJRvQW2Q7hb8/GWYi8wYts51tEZsX7a9hg08HG6oQvLlr0qmWsa7aSDiofJ
         C4CqKQ64Dya3oQ1kPGzx1tuDvZ2G5GsbWRBHGMSX9tovmJva0jkIsYIs49rTfXr7miW8
         snFAq7puGkNGggCMzILM+m4ybk8BQWU2wbqxJ0xmq+Ny3c+1E7gzmH1C+0niOzc+EY0L
         bkdaCHsgOr7Gv0JvGQerTG9yII4Uq2xwKxli39nS0uVBn26eHlc/uZ3SuiDaaOoOKcJA
         lfJA==
X-Forwarded-Encrypted: i=1; AHgh+RoOf+vdvqvpbJPVK+7tJGWnl7COzt/vmdq+nrkmpwLhcXUOEMObBuCYmNRUaKO0ezdNpuUqnOO7i3yL@vger.kernel.org
X-Gm-Message-State: AOJu0YxAUL9Ydcf7t1h+N0sjyPLaSnWhXlVxBp3qInvBP0fhIUFNgKLw
	vFw2sWYB4Mtkc1FNn4QkE3/xnzWcRcPsgxRcQ0yrLF4g+JoaMraD7F4ngFie0kVRohSPKOMSNOB
	p/vp8QYp0Oit/9sx2Mcu72NLj2jAiUSlrzH2k+MR5ClKkwc9RPoarrs0u806Fud15MyYXVOw3
X-Gm-Gg: AR+sD10iLM05slGMsaTYygu2RKJakcbbUgpu04VWLdBBNPRYJtMrktfXuEARqcmAgDQ
	0ELynUbh3/e6NhrL5osLxP2OlyQt0DKtFeJFpFWfX7y1MVVax6JiNQdtHRiSswnp4Mr5S8N/H0M
	DDVtH9//FRUiW7V35hlvxvxYNg1sqhICTh5NOwpKay9fL75c0omi8J6b+/0p7mtDNuiV/X6bgRs
	3ObVpF4rXqPKcS6Pyyc22jK50v+Y3zugqr+rwekhpmxzVs14kNCr+khJg95yaASO7jWjO37bfSY
	/zzjHoCHl7ULqftzU0ry7G7XnHPyVM3pQ+MVT0t30R4JeUUrlxBBK5sRWzY3t+e47bm1uaAZ52R
	j8uzYsjC02mGSSvuI9U3A60uFqjObG+ghhg==
X-Received: by 2002:a17:903:40d1:b0:2c7:ebfb:618f with SMTP id d9443c01a7336-2d34556662bmr88759365ad.14.1786558900415;
        Wed, 12 Aug 2026 11:21:40 -0700 (PDT)
X-Received: by 2002:a17:903:40d1:b0:2c7:ebfb:618f with SMTP id d9443c01a7336-2d34556662bmr88758575ad.14.1786558899929;
        Wed, 12 Aug 2026 11:21:39 -0700 (PDT)
Received: from [192.168.1.15] ([106.222.235.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c24a371sm537155ad.28.2026.08.12.11.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 11:21:39 -0700 (PDT)
Message-ID: <f52bbc62-9e6a-4e8b-a3f5-500ea26a18a4@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 23:51:34 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: Add Qualcomm I2C target
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260802-i2c-qcom-slave-v2-0-27653118fa75@oss.qualcomm.com>
 <20260802-i2c-qcom-slave-v2-1-27653118fa75@oss.qualcomm.com>
 <20260804-airborne-impala-of-proficiency-a9a8d9@quoll>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <20260804-airborne-impala-of-proficiency-a9a8d9@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Q_4Cuwx3oBNkgyGypEnFXa2kvqjRbbLP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE0NyBTYWx0ZWRfX3VfIIzZzJkV+
 tpVv2mt4vFT+QuqnjdDs8zhg6SLINQwDJAfQFHZy0G8fwdUWDBVyTPWkZCm2pZomdlMmKbT/9pb
 Were9oGXuaCvBqkdku8oj4EHgLDLdE3OHOaga0mZOdau6MdY23fR4a5nGwnk6Zq/7Dk/EywwPnu
 S7XU+K026v4BJxlZY7vFfeXVdcj2ENohRIzP00mIB3y9ZbxmYfrjceTiCkK6xis1udiavXJ2k5n
 Kr0D2OrZRW3mEO0/UPnAJR5HTVWmXGivnyqBYkgOm/SF+oQXSv7gKt3tsVcJj6K2ZSUyUoRuapF
 udnR5fzOao1ZSJvqlABd0SgR0Vvswxiz9D+UpSGXnLdQbzIWxjZJYQj9Utv+29hYMo0LiPu3Olr
 mxC+3Z8IN2Y+1xy5pI6LaVDWrdWdUkqNzzth3Z+MM4831jvnH0twZbVtXlKRMAAJI++aD2OFXvg
 NylldWUHXHEK0G/5laQ==
X-Authority-Analysis: v=2.4 cv=E8n9Y6dl c=1 sm=1 tr=0 ts=6a7cb9b5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=NH2SoAXOXKK5768fTBPIkg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=RP_QtRrjLn2U0etmI9oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE0NyBTYWx0ZWRfX8Ip/dSgninYB
 x0Ly2PVBlnlgX0PBn2ronYJ7GmWTxCIbRFczdkm12LqX5XwgrI2Xs41yHhnOK6idkrqNtdCJ6PO
 FNdS3Lg2ZKsVw8AzaRt/IWy6bB6QYGk=
X-Proofpoint-ORIG-GUID: Q_4Cuwx3oBNkgyGypEnFXa2kvqjRbbLP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120147



On 8/4/2026 1:14 PM, Krzysztof Kozlowski wrote:
> On Sun, Aug 02, 2026 at 06:43:30PM +0530, Viken Dadhaniya wrote:
>> QDU1000 and related Qualcomm SoCs include a dedicated I2C target
>> controller that operates exclusively in target mode. It is a distinct
>> IP from the Qualcomm I2C master controllers (GENI, QUP) with a
>> different register interface, so it requires its own binding.
>>
>> Document the MMIO region, interrupt, XO and AHB clocks, interconnect
>> path, and optional pinctrl states for the controller.
>>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/i2c/qcom,i2c-target.yaml   | 84 ++++++++++++++++++++++
> 
> Filename must match compatible.

Sure, will update it.

> 
>>  1 file changed, 84 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-target.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-target.yaml
>> new file mode 100644
>> index 000000000000..1e34e874cc4c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-target.yaml
>> @@ -0,0 +1,84 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/i2c/qcom,i2c-target.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm I2C Target Controller
>> +
>> +maintainers:
>> +  - Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>> +  - Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> +
>> +description:
>> +  Dedicated hardware IP found on Qualcomm SoCs that operates exclusively
>> +  as an I2C target (slave) device on the bus. Supports FIFO (PIO) mode
>> +  for data transfer.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,qdu1000-i2c-target
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: XO reference clock
>> +      - description: AHB bus clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: xo
>> +      - const: ahb
>> +
>> +  interconnects:
>> +    maxItems: 1
>> +
>> +  interconnect-names:
>> +    const: i2c
> 
> Pretty useless name, drop the interconnect-names.

Sure. will remove it.

> 
>> +
>> +  pinctrl-0: true
>> +  pinctrl-1: true
>> +
>> +  pinctrl-names:
>> +    items:
>> +      - const: default
>> +      - const: sleep
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - interconnects
>> +  - interconnect-names
>> +
>> +allOf:
>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> 
> This wasn't here before. Is this a controller or a target? Now I am
> confused.

It is a target. Wrong ref, will remove it.
> 
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/qcom,qdu1000-gcc.h>
>> +    #include <dt-bindings/interconnect/qcom,qdu1000-rpmh.h>
>> +
>> +    i2c@88ca000 {
>> +        compatible = "qcom,qdu1000-i2c-target";
>> +        reg = <0x88ca000 0x64>;
>> +        clocks = <&gcc GCC_SM_BUS_XO_CLK>, <&gcc GCC_SM_BUS_AHB_CLK>;
>> +        clock-names = "xo", "ahb";
>> +        interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
> 
> How is this valid?
> 
> What sort of children the target has? What does it do with these
> children?

This controller is an I2C target only — it has no DT children. Will
remove those lines.

> 
>> +        interconnect-names = "i2c";
>> +        interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SMBUS_CFG 0>;
>> +    };
>> +...
>>
>> -- 
>> 2.34.1
>>

