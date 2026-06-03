Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A90E344025
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 09:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477966; cv=none; b=qwJHXVCII1Ft0ma4hB0FDm1dQ2Qx3xfIedOGSWlOY4MFKf8wlFv91ElkMkjF+PHJl19DLF2wqnJbcu738PDyy8bTQlRG5HW7vthrhWpHRJJgSFOfbGPpRuh3ryifX7BvjCdcMzttxP967BfQKF1MLPqeK2OjC3qztsFPG1oZ08w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477966; c=relaxed/simple;
	bh=YDmrMYtOA9h84SfI/2Rj0H4mkFELJAZ09YI6hSdkz3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=djgyMtbFAUnIyGhVopv0/bktuzqApNIGr5gj3rLWW5geJ8QKtJKkrOBqS4YxjcOhfyGMv+3bTQ+UtsPHJri5Q8uDHT7YI6szdyZGcTcI1g6dcX7zzOliesloBWtYd5uDxVNDuSUKvnL3AehUO8vH6gAH/67aLqnnWMX/2HshuWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=axDQKNke; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dbJ17yAW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="axDQKNke";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dbJ17yAW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65396BTj781033
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 09:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uxxv4mx/K31P2VO+fJkAKBqGk8xS3svkE3+WCEgOau8=; b=axDQKNke0wH10lxZ
	FdcZ+yAYtal3Jj/MyWfS+Av1bEfPRq52W/q23gpL6vzz27LSHa1SQ77wY9Mx4/uh
	Oce1UACZ5IZkMqSN7na+uVIYll6+lr5p0p6specT1E30WIthnFZNxWKFankADtTo
	m7ByIQNQJunNRHL3orf49G9i6wRuFfA07s1s+8TNptI7Y/V/i080l500V+iVeWRG
	sTqqb4og7/oTuDAKsDwZyGgvg16ABQllOigIYTcv2tjOojHyuzopVJztj0df5cwj
	CL2dQ0GiMx1cJD12XL23Xypou7DUi5VCj0E15lWffjTN11s/m8gAJMbGZbM9stES
	Y1pGPw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejhbb011h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 09:12:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso3133546a91.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 02:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780477963; x=1781082763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uxxv4mx/K31P2VO+fJkAKBqGk8xS3svkE3+WCEgOau8=;
        b=dbJ17yAWY29t2dcDhQrwPDiZOw0LGrlQm4Th5tU5S8L9Q7yhz5gUc6ez95IU0TY0Nm
         GoDkVqV900Xhzssg7G2lXKpnXDw17rH0Zr0PMBfGZivchB6sLqBvj7hmE6qnVPMyVVSP
         /jGAiQR9pBXiNWGwz8RHG1v9eYh+qfOyGsYKMitKvv6JTtuVGhCekKm0UUoQzYgj2HRu
         EJZTI7ilb3f+wMfd4hGVd7tvk0rrQ6huTKhhHBeiwnyRGOfEVQCM5JwCf9JlRiGm04KJ
         8LxJ0ImbTLXnD4p/fJUTv9FEo73p7sZDwKvEG8ugz1BXEvBPBCoNuaI+ze9OPHmfC0VT
         4sTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780477963; x=1781082763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uxxv4mx/K31P2VO+fJkAKBqGk8xS3svkE3+WCEgOau8=;
        b=MsqlVnSQoYBr/PxGjhLoPrJtD9qe05fEr0sheA01c6mNYuD94/KkxLa/1gcz3/8UuL
         XTIVjVuQ23jkluxbyW6CeZfCW7EIsaYA3EViKrevFpanl5BjNWRa7lBq7q8reuzvkClZ
         Ri3ZR/7G42OIHeRnSxnXt9pnmcBqUr8Xu4TwNs7hXDn5j2K+yajo4Y5q0QVQlRsQYKz5
         jC+GDesdluQaAQRDq9CTzHs3U7MdzsFIB3apKCQZnDjXpSOiEMsqqs2Fna2iljCLKI/h
         as7RH1eXhjNnEsHZVcF1NXvKetcU2QpL+q442fctAJ75J222xzSJDCaGdVFEtwiJqdwC
         RNmA==
X-Forwarded-Encrypted: i=1; AFNElJ8HaLFPzUgZGr/yjxQtf/dd1U8GJXO9SG9Z5jCo0w+jcWGjg0zrTx+MHWq9HalFqVWZWyMHysQ+wOh2@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw2PnaZqvJChGzp5/0leCQv/OELIF3EYWSzmZJrcNerpa6caK2
	EiHfy082vM96Zp6yenS7JHobgCjd6Rk2qY7FZbhgfjRkz/S7ybREJGlEM8IFO6kJ/sWnLKBI46r
	wTGzHmmpVjJAlqmPON6EytwozuT9Cw2Lskp7dazkWGTK1vh1K3H21gIfuSw3XCEwBpT29z+D8
X-Gm-Gg: Acq92OEsXUPyoH8byJ3Gt6CpLZAh5Tl4bemKlFxHb6wMHmRzXrAY4qMaMSAxmB8EyUK
	NKaOJ8iFExmfpl4NUlC9x58PbtYmrrqyrBq5cl9N7un/foyd2QtqSZVUw9F1Vq4D3rUCgUH7jBX
	2F+8eO8htLZrQG3xtC38earLtm/jmKKuJ6SdY40LwQ2Lo0I1geXsT7bnZV0NMcZiuKjpetQM/HP
	bDSWmmCLFLc0CsZQleJhckSd+Qfh0RFfPZ0cSwq6UsJaR02TqbdpKsuSx8WHIhpD4dFVzgdfWC7
	q5eVKdTxDY88RLHd10ufIyMRzjRysQ2pxieP77KVK/K8SiDGpDP8KJPRyRUFvWCT0+6FAAGt5KS
	KJep1jIDInh7Y+KJlwNlINuphJy+YNP7GbDjlQ6kdWozBUlKt6B5gWTXRRpn/lYq2IMEp7wreXE
	KX
X-Received: by 2002:a17:90b:180d:b0:36b:9798:4f6a with SMTP id 98e67ed59e1d1-36e30e1463emr2622047a91.10.1780477963036;
        Wed, 03 Jun 2026 02:12:43 -0700 (PDT)
X-Received: by 2002:a17:90b:180d:b0:36b:9798:4f6a with SMTP id 98e67ed59e1d1-36e30e1463emr2622022a91.10.1780477962441;
        Wed, 03 Jun 2026 02:12:42 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e0a276ef2sm2446369a91.11.2026.06.03.02.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 02:12:41 -0700 (PDT)
Message-ID: <650c1e77-b46c-4474-9c22-49256fe45479@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 14:42:38 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] regulator: qcom-refgen: add support for the IPQ9650
 SoC
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260602-ipq9650_refgen-v1-2-55e2afa5ff64@oss.qualcomm.com>
 <20260602093827.6C04B1F00893@smtp.kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260602093827.6C04B1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iQ0vzR4Cn7v968evdARBKgYZvyvpN2uK
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a1ff00b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jqUvXgUuF1ok3IJxvasA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: iQ0vzR4Cn7v968evdARBKgYZvyvpN2uK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA4OCBTYWx0ZWRfXz0j2eWirBnId
 g6502hWK5uRkp8rXrqKqfCBMs6sTNaTp7GUNSlTHQiws6Jzc9HP3C2wrNBMA51Hu1VBGEN/iQ6Y
 xWm+DTYivN91HH/0FD1YC53WqltqSF8+Npc/exZQHhTygPYmrO9cW0r7iEPoIGiIfjc3/iNy65S
 XQ3BCC9z1sNAHS2gmwxwEaTpX5GqQFMIFRpj6AMzrJvT8jCsMKAznqpcPjC8dwQ/KhZEoqhO3vJ
 wODSEXONejej2rj459oGCMRKCWjechN1SvyFTUl1zDd7kHMsIhNmCUzAFaoGrekCvtBfoO8z4kX
 gPpPKJ/GR2VHyqfArWg0xQMsQRf4/srOoGKGtF95pZoC8qDgZXNDEgU8T9PB7oYaUDe5pk8Z+4e
 vLsJFJywcmZJ242SDOXTvNJ/dc5CxYPql7RcoDC/qSW0kEAmeFJ4MaKauolE5xHAbI0IqAdrufe
 iidFHXLxw37SCcyhN6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030088


On 6/2/2026 3:08 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Silent failure when DT clock properties are missing for a device requiring clocks.
> --
>
> commit 526ede5fae05c2893929b211a8654512286f1196
> Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>
> regulator: qcom-refgen: add support for the IPQ9650 SoC
>
> This commit adds support for the IPQ9650 SoC to the qcom-refgen regulator
> driver. Unlike other SoCs, the IPQ9650 requires its clocks to be explicitly
> enabled to properly bring up the dependent PHYs. The regulator is also correctly
> marked as REGULATOR_CURRENT based on the hardware design.
>
>> diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
>> --- a/drivers/regulator/qcom-refgen-regulator.c
>> +++ b/drivers/regulator/qcom-refgen-regulator.c
> [ ... ]
>> @@ -106,10 +177,23 @@ static int qcom_refgen_probe(struct platform_device *pdev)
>>   	struct regmap *regmap;
>>   	void __iomem *base;
>>   
>> -	rdesc = of_device_get_match_data(dev);
>> -	if (!rdesc)
>> +	data = of_device_get_match_data(dev);
>> +	if (!data)
>>   		return -ENODATA;
>>   
>> +	if (data->has_clocks) {
>> +		drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> +		if (!drvdata)
>> +			return -ENOMEM;
>> +
>> +		drvdata->num_clks = devm_clk_bulk_get_all(dev, &drvdata->clks);
>> +		if (drvdata->num_clks < 0)
> [Severity: Medium]
> Should this check also handle the case where devm_clk_bulk_get_all() returns 0?
>
> If the device tree is missing the expected clock properties,
> devm_clk_bulk_get_all() will return 0. The current check allows 0 to pass
> as a success, which could allow the probe to silently succeed without having
> any clocks available.

This validation should be performed by the DT schema and the drivers 
should just get all the clocks from DT. So, I think we can skip this 
report. Please let me know if I'm wrong.

>
> Since the IPQ9650 explicitly requires these clocks to bring up the PHYs
> properly, could this cause a silent failure downstream when the unpowered
> REFGEN block is accessed?
>
>> +			return dev_err_probe(dev, drvdata->num_clks,
>> +					     "failed to get clocks\n");
>> +	}
>> +
