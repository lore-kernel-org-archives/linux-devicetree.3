Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5875E3CCFD0
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 10:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236842; cv=none; b=XFOBagrrFq7NqcYE7YCFLPz42kPBJHTAnIeG8ddy7iCYs4gt8bdFwZ+Hlh/MDjqtmMeYpFLKg367wN8+U4Q1aC1jNKLNwpeqJqPUkl98Rzzwf7LcROZ5xLdn5bmolPP3Te0U+3qwgOXRM4RBXYtDdoDyylP/Ne4oZqieFf8q4zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236842; c=relaxed/simple;
	bh=+T5+q35cuY+NlFHqqyvjfWN2ynytkYaXlJr0sE2THbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NbWlTk3Bd/kcJ/Rw9CpLz1BSWWztBTxgrTL7KTk29+vZBPqj5Exc51XtPgzfzUA+Y+kUmaxsK22kce/4syRuVQRYkkKdACHcJafiY5uR8A5R5FHHHIpLXvf0eWa4Qfnuzl/PoIIFyWJYu0sznLfmoxIw1yNKBxTcVSzGr5UlVUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oPSKZGx5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DtH0Q3fa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oPSKZGx5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DtH0Q3fa"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485ZkHa2199598
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 10:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l5N3bycfk8K09CTomGGhOd7ne15WBNfddTr96uzcofg=; b=oPSKZGx5tBnbDKsm
	4OE2mQdc2f4NHlzRJJsjHCJOjxHh07cEFC+bFvBUsWRCWP+VH/p0bsWKoVd121gu
	kOnecTshvWo1+RQw1ygQkkGVzvLAfkGZ4KtR0G+tNzfjSxKZc8+i52vbXixFXOP+
	0t+7vRb4u4xmiUhvqPjr6crOQ3qOSIq27lvpsM3VkduGFWxTKs8nEOQA5slSqXtK
	B9ZNsh61Uj9yT7Gj/suKVzoOUZL+XQHlNZhKI9HVbVfopwGx8eSBWC6x6XQ+eSFq
	rRvBC+znikk8zqxPnmMnVU9Df2zZesCj3xDmdv2CIxhFlDeCqpEOpAG84VEtnHtM
	LJZ9bQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e119sjwdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 10:40:40 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-63126f42441so147276137.3
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 03:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778236839; x=1778841639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l5N3bycfk8K09CTomGGhOd7ne15WBNfddTr96uzcofg=;
        b=DtH0Q3faRJoyF/LxeNfyb4NdVYXw2YFBjfovexFVKMh9Iu9v5iStN1As9Lx0VtWXmQ
         SEkkP2h+Vf5DV5jMwGFNr+isV6FpcSHgW/PfT6In6zQLYnRc9VV92wCunLUZAmcp2jm2
         lsPpe/fuaXqhsydtXPZJE8L1z3E2QVGZVTTQaTJUn7K6/VQg0cz+so2LrDVy2Oj4p4nI
         81yaNig84wMyWsN1CfOxvv8advQiq4kEGsKWDy8OX0SAyAA5WYGGBQClklAt2JcJ0UqB
         NGSUwD9owrLzwHRjAD9pzpey72n3NhSYD3/U7MlFBq5TFBZPhG2fYP2f04RZxbBmMIJg
         2+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236839; x=1778841639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5N3bycfk8K09CTomGGhOd7ne15WBNfddTr96uzcofg=;
        b=Rz2Z+E1AwDq1Hg94HOS3aqppMfsms2h5Q6tn4Prn6I+gfcBnDe9ybogcFzpY7IVF2o
         oTwvr/F1V6MwB2prDRgR6bkqZzd1P5plih85g2PvMS+A+TUKRJjzmjPRLjOoAiG0to1/
         pHDrboDjt194Zcdty4TlNAaVxWzqG5jdOw53NF2kYVr+zOdOctHffmSa/NvO88Xavr5k
         O4iXaeRAewfXwt38SpM8xdSacB5Hf3GmJ4EE+QBfY0EvUx4qv9H2u7ySOcEuw9AXwlUp
         S/yxsi39nMfCvc1FtNb/QqzBjnjfOpBPZGEcHynXBPAKbAGshPeI8QGbaWrrtDF6jKoK
         qsKw==
X-Forwarded-Encrypted: i=1; AFNElJ/fI0OGySAn+t2e1CUIy2rqHIxVeV2P/V35Boa7sBxUcDUCCR35crww2kDr+elLc/NJTGoYJ7DhQ4OM@vger.kernel.org
X-Gm-Message-State: AOJu0YxddaaNkbuopJNDWW95eP8WLo3d+pWkUYO0TCV+oBCglL8/CSxB
	gDq1e/gti8Wp0JTkYlyzpo2ndEzHrOrF51y2HSqLsIwEO0fytnj+kMc5852XR+78D29nGp9RVIx
	5bN9qg0aAPSSGne2T2HP3qTG9ObCnATowUmcywV0zPW4tVhUVWOMq2YozMBfuhl3M
X-Gm-Gg: Acq92OHwTlxTOjd3sLbx6eLzjJJWfvtxP14pMwtsXzPIzztE/rN+SCAkXSOr4I34qnr
	ZD2zS9zLk+NnMQwJ09nt3wQsXqm0ftZ1YyHnOQa9r9ZX7I4EHa+o3IejI0Hcpt/PO0GC/otjrDr
	y/URpp9XnwzEHpambUt4jja45RNBfuqSKmTI9MxyriIAfo4mX9syB3NEhjtzv/YmLGdpVJUBwGA
	jKtGeGeTDKhDInbBdFWdqLEH7dJhRJg7rBvFc396NnLQ7av3khaHNYWy6g8U/uTAnVcosZYlD6R
	GfA+CgCZSMQSUsvZosTcoIKW917QHFc3IOGCeEjrFGgsvoSc7m2utOAIsQQGttpEDwDzcICXahY
	ql3Rjzs6jK1eCVP6NHvIT1C3IK2E83OUDUtXBLYHNQ55jYdpgvBXe+nKzSVEXyo9NME7ZIT3gHo
	YaYGA2lWky0OI9Kg==
X-Received: by 2002:a67:f50a:0:b0:631:3ccc:42df with SMTP id ada2fe7eead31-6313ccc5619mr248413137.3.1778236839579;
        Fri, 08 May 2026 03:40:39 -0700 (PDT)
X-Received: by 2002:a67:f50a:0:b0:631:3ccc:42df with SMTP id ada2fe7eead31-6313ccc5619mr248405137.3.1778236839170;
        Fri, 08 May 2026 03:40:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac435a7d8sm62577866b.51.2026.05.08.03.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:40:38 -0700 (PDT)
Message-ID: <ba499581-9cc3-43ba-8b28-6f984d2493c9@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:40:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] firmware: qcom: scm: Add minidump SRAM support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
 <20260507080727.3227367-4-mukesh.ojha@oss.qualcomm.com>
 <3m2bwess4zw3hw2qlkwnmhtclk6ofinxekxfqz5otw65hd6d6q@lfcknrfkacy5>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3m2bwess4zw3hw2qlkwnmhtclk6ofinxekxfqz5otw65hd6d6q@lfcknrfkacy5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExMCBTYWx0ZWRfXyd7FzAsIKxA3
 ZL8fe8+iS21AJf8b15DCNW4JlGvCREQt4XE+GSFAkRPTQpiV7gDIoDDyumHRJ/jKM4yk0TL1oBn
 yH2iADIvRgaYw1YPMUesax1pvCFZfmUJGssYaymqc0Yvkp9AW1qr5TmCg6CVdN8jIhKhyyC06P+
 rLjFgswqgTQz3giuF+yf52EH/li8LutznEybhC+jUSRqKLsHA8S9zNaL+i1b08VvFfgPYOdUECx
 rYADw2mjk7DsgHpyBckSm/caGUTK5k/Aah26bqgMgmuaxpld+UGc/Hv+/zDGjsR1Y0C7vQHMO6E
 cwiZ5SENPDjKsk572+7e04QUgliXJepjhXX3oYHG7269UgqS5ROzGRADLjOwk2v+7jMcRl2p9CN
 H27Z094Ya5EonGt8pxLBb5OGoKXCunX5mv7oll7/D78zJ73W2Pardo8Ol68oDkm9JRTagjtod+B
 zQLZlGojs0nsoVud/+A==
X-Proofpoint-ORIG-GUID: GGUCHZSdDmgkNZ1sELIaVYBQ47cpehSp
X-Proofpoint-GUID: GGUCHZSdDmgkNZ1sELIaVYBQ47cpehSp
X-Authority-Analysis: v=2.4 cv=Dd4nbPtW c=1 sm=1 tr=0 ts=69fdbda8 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=9V3Mjwdm6-WKsCrvSMUA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080110

On 5/7/26 3:50 PM, Dmitry Baryshkov wrote:
> On Thu, May 07, 2026 at 01:37:19PM +0530, Mukesh Ojha wrote:
>> On most Qualcomm SoCs where minidump is supported, a word in always-on
>> SRAM is shared between the kernel and boot firmware. Before DDR is
>> initialised on the warm reset following a crash, firmware reads this
>> word to decide if minidump is enabled and collect a minidump and where
>> to deliver it (USB upload to a host, or save to local storage).
>>
>> The SRAM region is described by a 'sram'/'sram-names' phandle pair on
>> the SCM DT node. If the property is absent the feature is silently
>> disabled, keeping existing SoCs unaffected.
>>
>> Expose a 'minidump_dest' module parameter (default: usb) so the user can
>> select the destination. Only the string names "usb" or "storage" are
>> accepted; an invalid value is rejected with -EINVAL. Changing the
>> destination while minidump mode is already active updates SRAM immediately.
>>
>> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>> ---


>> +	if (of_property_match_string(np, "sram-names", "minidump") < 0)
>> +		return 0;
> 
> Do you actually need sram-names? Just to verify that it has one string?

I requested that, because SCM is a very generic node and index-based
lookups would age like fine milk

Konrad
