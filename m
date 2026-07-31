Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7195C19E968
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 02:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785466099; cv=none; b=XXs/V+0mkmodLgLExMcSXUWvBikBrWRTVc9tZ6l7FO+AZbSHHkjxvaehVCPnjLzNbxaLo1wEnX2/UqWfuY/cF1qXjmd2xvNM91d7S7n9ZrRqvNKD8eEsrlPoH0XUMch8/6O0QM7TE6h1cF2r/77SYzXzhWTAyoWvphLtB3R12T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785466099; c=relaxed/simple;
	bh=ZgwiyRj7FLmHtrjyUzYaLeGUpC30Q31E4oVMlIii8Yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sny6yBoAWm63BJUu9Prdn/M3SNCjSLwSQcFT2LerJLiJ0DaWWHfpy+bGLAy/JrmyQtrrYIkoBsw8m0LGk8MtryGvNjsBjU0np77tBdhjAAg/Hpe0kVCX4SOWHPPfLWZlD3trfTdBmLWbLrSrcnLpl6Px0bhEQ8UEN2obgzcFSBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Glqe1lM9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YtFDfm4p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Glqe1lM9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YtFDfm4p"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V2Mfcr2509275
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 02:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qt/5MatpNOCdKRPB1kLriXHjIY6fXa5r1g6k9xmfSwE=; b=Glqe1lM9Ja8PpnbQ
	ipKc+IlP8oSWM8P6FBi0jplvttBdKkaGqxLhbx7w8wJoahhDm9Fk7eW/wEPGH5tf
	Vlg+6LmKlx3U4B+s47pvSGjm8c0ltwJtPHER883kAUSi0Bjal0Mo0Ipfvqn8jEj9
	hzal9kWvXL0jDibHavPl5FtBK0WdmZoMlK0K3j/LYliIqtVpwDHpa2jsDS5HCalQ
	CqUO5jPyr6b442+EnQUg1P1SAZ1RnuaTpT7GfcBr27RxqTNypWdzlmFHG08kP2zU
	e7lBesF4TkYzOU9TKDDoc0b9pJWck/kqRf7+0yxifGqzydU3oSDCG7nhA89VNflu
	EZpbsg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frjv9r2j1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 02:48:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cacf17c7e0so5817135ad.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 19:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785466096; x=1786070896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qt/5MatpNOCdKRPB1kLriXHjIY6fXa5r1g6k9xmfSwE=;
        b=YtFDfm4pOEzHAxChbrkVklWN4BVEnL5gMPTMWEKTVgfV/PaGCZpYoSduEOzL79ADzH
         AHm4kQ1NN4wF0xbT17RKvoh5tphsDi/3WaUHYPdQI1EATJuupz7oJvn/H7atwoq+CuiH
         gARNRNrn/VXr4KMTEZgSDvu/wq0jKseSnYmWb8BPjLTyK6l708N4Yd1AG6V6dsdmQGnw
         E8MVPxc/RbZCz+MeRxT6GydXJSkEQ8ccKchTii9jwjnl0IoJUQagMuYUiTqk2tBzZYFD
         KSb//b4lOxPBMNHHvrQ4muRkM0i/XYYNiyTC3i2rb3JPG5DV1j8mVIwuPaZYQSDwVWLr
         Utag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785466096; x=1786070896;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qt/5MatpNOCdKRPB1kLriXHjIY6fXa5r1g6k9xmfSwE=;
        b=YXne6YZODE2EXhsUSMshVUy0JZ1tWV2Wu/7COVk6Gq8P37iiQyI/j8gVE5AF1U00FA
         P/VCAxxFYkzV0M7uVXnWxWAOwKkfz7NShM71KHqW4JcS+oAByLc8HDxJU/MRojHZ7DN5
         sSV9x766Jyw8raypqVRhYb11+ArGRO7vqPhCRmRuQZqeCoUtW8vADEBq8XiGw2cxXIYq
         Tl67+UGPmJRbXYoeggAdHruRtVonQq2Zix9zV+jWt/ThfJZaFu4IreynBjk704nM22z8
         szLEbHIpShqeklByUXCIMyAkHZJB5xned548FESofRubtQ849WECUVknbJpBO6z3j0dl
         AzKA==
X-Gm-Message-State: AOJu0YysQe6ZNvQo9RfxWSFzuCZuimZk3/EHAJX0GqNy1cTpOV7yGlip
	XpO0VVUNZk1yhjfAD1lYvpWBdhNT6ARM315B0h1BeX/NRGVVh3AoXJDvDDLinUVnTUeI1PDPSm5
	a6OKoq8kHR43NBeDKsbf5c/5Mhn3hiJPLVRl6KBrE4i7ahCPaxfYYjjKt8zUaeDMeLIe2GeiU8U
	o=
X-Gm-Gg: AR+sD11zLz2q5JMXqRs5HzVo9SK+/94Mt+NtM9/NLM35RrKSUK1QzS/U+W2JHcaxxQ3
	CvSFCaCHs33LncRjWbVdcS/RRP1kfxJYCgRh2Fe7zo4ZBNiS4VJmgWUM2Ogoo2n7gDTotNo5Ohz
	1VcHgJ/hMlfwaoEqKoR1mP5870jltU6cwoRzWtkuP9gNOnpeTqIXHiu07daMlX9gmwqIpT8Z8kW
	0b/dJTYcX+X6+07683OgaKWFRUBPB8Ghfo9BtIzIclY4X1gpjMfMb9CqBlydupqCQ1bW7tUB+wI
	9y413dbZTz2tNOeOf+E4wd95Rhgufo25uwsga2wQQepVeBZOn/UYoWl5t0sUD6V3sWl+y+3UJge
	9hMQIuCghFgV6MI0A07gk20r87/LQQWAEvvH+91K7l7IR2StGKEqjzSBefzm32fT78oXJ5vo=
X-Received: by 2002:a17:902:f602:b0:2c0:b6c7:227e with SMTP id d9443c01a7336-2d046d67890mr3472165ad.5.1785466096071;
        Thu, 30 Jul 2026 19:48:16 -0700 (PDT)
X-Received: by 2002:a17:902:f602:b0:2c0:b6c7:227e with SMTP id d9443c01a7336-2d046d67890mr3471975ad.5.1785466095585;
        Thu, 30 Jul 2026 19:48:15 -0700 (PDT)
Received: from [10.133.33.90] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047abcadasm588365ad.51.2026.07.30.19.48.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 19:48:15 -0700 (PDT)
Message-ID: <e6906c57-d17f-475f-89d3-d2e8550735ff@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:48:12 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/7] dt-bindings: arm: Add support for Qualcomm TGU
 trace
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
 <20260730080704.2903540-2-songwei.chai@oss.qualcomm.com>
 <20260730081507.B1F911F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <20260730081507.B1F911F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Iokutr/g c=1 sm=1 tr=0 ts=6a6c0cf1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FA5ksZJBM4DXSn_ndQAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: HTwUEiX0-B5iT7jAeQ8gLqtNsHWUGgbm
X-Proofpoint-ORIG-GUID: HTwUEiX0-B5iT7jAeQ8gLqtNsHWUGgbm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAxNSBTYWx0ZWRfX9pbI/ZYJWn06
 pXBcJk9xXl9qfFs1Ymfg6vAXLTa+qdakwtpOclgYfCCZzVQa1eRy5XFtKxxkKiLA19U4anlWJsM
 +Tp91K3m5ChAwlyhFXWIQzLUnD7qv2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAxNSBTYWx0ZWRfXyC10zx3n1Xy2
 LNj0JQba7jTIQNntFD4wNuVTlLkkrpm4lVcGX242zuhq2igs2ph8KJq6oDB7R/sN7jv3qeu8Dta
 Nm1Ja8zXrRZz8kExq2dhHgB24r0b0FMUweSJPC3AzqDZWENZ1Tk77GKxK7Yo7k5HEXNHHRg/NAE
 HjDrkKN4c9feVIqeOUlt9WWdp6/1P9xIjgFFcwTnMKhhoJVdisrs9rIfG5pjoAurZIjYfk6Yqs/
 vKV7/Zc04Njkt7B/ghfFYHs7UlaHq7U1q+THx/wWxzazBAVoYuigAD6A75IqmJPAgbKGJCmqjNy
 VKUYQKsiUlmIhAeYKzVPSmZVVZHg/qE6YG2lHiDa1AD6FSLBs1JC5QRBMan61oFQCxJHxx0FqTM
 hGCn/YtjFiFRrwRF8Z24TYYuNjueS1LMU260u1tGxOg4PUUTycks72Vf0QoZvkuYo9T8et84psJ
 H7ZJW9SExDTULVqmWNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310015


On 7/30/2026 4:15 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The binding schema omits the `interrupts` property despite the hardware description explicitly stating it can generate interrupts.

Clarification：

The current driver/DTS does not actually use an interrupt line (it only 
uses CTI trigger outputs), so there is no need for the binding to define 
an |interrupts| property.

> - [Low] The schema claims `arm,primecell` compatibility but uses `additionalProperties: false` without referencing the standard Primecell schema, incorrectly blocking valid Primecell properties.
> --

Clarification:

 1. I checked the format of the |arm,coresight-*.yaml| files under
    |Documentation/devicetree/bindings/arm/| and found that they all
    claim |arm,primecell| compatibility, yet none of them reference
    |/schemas/arm/primecell.yaml|.
 2. In actual DTS files, properties defined by the PrimeCell schema,
    such as |arm,primecell-periphid|, do not normally appear. Therefore,
    referencing |/schemas/arm/primecell.yaml| is not mandatory.

>
> --- Patch [1]: [PATCH v16 1/7] dt-bindings: arm: Add support for Qualcomm TGU trace ---
> commit 1cb0b1557ad8efca643aa36dee2d1b84f9c415b0
> Author: Songwei Chai <songwei.chai@oss.qualcomm.com>
>
> dt-bindings: arm: Add support for Qualcomm TGU trace
>
> This commit introduces the device tree binding schema for the Qualcomm
> Trigger Generation Unit (TGU). The TGU monitors signals to identify issues
> and can generate a trigger into the CTI or interrupts to processors.
>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
>> new file mode 100644
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
> [ ... ]
>> +description: |
>> +  The Trigger Generation Unit (TGU) is a Data Engine which can be utilized
>> +  to sense a plurality of signals and create a trigger into the CTI or
>> +  generate interrupts to processors. The TGU is like the trigger circuit
> [ ... ]
>> +  preprogrammed state/sequence and then produce a trigger or interrupt.
> [ ... ]
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: qcom,tgu
>> +      - const: arm,primecell
> [Severity: Low]
> Since this device claims arm,primecell compatibility, shouldn't there be a
> schema reference to /schemas/arm/primecell.yaml# included to properly
> inherit standard PrimeCell properties?
>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: apb_pclk
> [Severity: Medium]
> The description above mentions the hardware can "produce a trigger or
> interrupt", but an interrupts property is missing from this list.
>
> Will device trees that legitimately specify the hardware's interrupt line
> fail schema validation when additionalProperties: false is enforced below?
>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +
>> +additionalProperties: false
> [Severity: Low]
> Because arm,primecell compatibility is claimed, should this use
> unevaluatedProperties: false instead?
>
> Using additionalProperties: false without inheriting the PrimeCell schema
> will block valid inherited properties like arm,primecell-periphid from
> being used in the device tree without validation errors.
>
