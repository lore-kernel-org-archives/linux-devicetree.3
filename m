Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934AA41A798
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431055; cv=none; b=lQdeOFh5YPTnP82bqwOdBvosyUwK2VGV1RhyPuqavFmiHF8oyhee41jWfy2O0Kh3tFtz+e0GrzVZLCOW7hv2zrOshytlfWOCDDeUVSNl2il0GuvUyzett1wibo1c7C9p87tbx+cqqZuk2vUfm2P0hePFHE8+2u/4g9RBlZ5D8c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431055; c=relaxed/simple;
	bh=el5leOsXCJlNZR7YPIXRPA1IYLaE3ipjFZKIGwggOqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MZgxgrh+XfHCquAZyiK/XZq6EdzMnUoKmODyuPrcq5GDXBUTvaLhGHFQUhFirj8Tc9wMQj6Ypmhhs28q4CfNWh64CqtpSk3zr4rC156WndMTNfbbu75TJw790hlvkrRp6N5hak3WD1ppbF4JJiRiLqjHCpMVAze0kYh/cV/5wPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GfcXhchj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=akQSbGwI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GfcXhchj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="akQSbGwI"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8s383676438
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 13:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oE0NnWoCFLssW5xbg0/SxvH9BdegYqSbZiRxR835SuI=; b=GfcXhchjMTrfztg6
	swTqY3IBC36649bwX3nk/1vaDs6SInN64gRZzQLIVJlrB4rhCyVOlMLSnDmrTpLQ
	y0wBBo4kpvkR6L4evuJzatEx6TM9DaSAhDf3h9GYeZXDIkEWD/pjbmxGa1Bc5U6/
	uMNLHOd3g7MeKSZOu5093En4G9Y0OFe9izLrzY35XM4ZM0X24cZ/fiLzCRDrj+1W
	GeSJZcdmkNKfvXCbTF8HrLtRHleoWtCY7bVBQhFJG3ezdICOr34CQmimcAsbyuAU
	P/oSwmDzYqWiH2MzzgwlnS8wxMVaIuQXoiEZpctWb4BTI0/xXIVM3J8Kh+SD98t0
	hgzQyA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t15a6jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:30:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc88e22f92so54078535ad.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783431053; x=1784035853; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oE0NnWoCFLssW5xbg0/SxvH9BdegYqSbZiRxR835SuI=;
        b=akQSbGwIwgapRG+90nCxXFaO66E2hq53i0VRIfH6aKC97BFY5rAFC036by0X6SkwCc
         pQIu2L4vP53eXqhMLR/gaJw2OfLDHJEKDn1itNajPqR6FaJahUtXMxyIZ1pkS5XNRLM9
         CeUXRbKupofISx32cox58qizoh0pToQmw56+pUMPablFA0dUQtRnzOG+4YRyry4Y30kW
         iod5hXLVb1pPmUtdGe9h1+2FDrOHQ9fh5ZztgPIWdb+zSYkSw6OExl6HI3cgDTQzGoRJ
         jMOIU6Afm0L8m79SLAHSS0qtJ/RDsgYIM/QY9uqveanXRYgTSD1HEglypNbSJupH2sYp
         YBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431053; x=1784035853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oE0NnWoCFLssW5xbg0/SxvH9BdegYqSbZiRxR835SuI=;
        b=Kz6gZkN/oTuIin+FDWwEqbc3duC+gsSq5/5qed7PFJmP/OKX9cjpEfNon5ajGJ6cjL
         vB/BoNJaYxaXq359FXlqdmisrLsL1v5wMEPsm300h8se1srd9hbNpF91F4ZL5uyToyF9
         bGa3oQM66dSWV8v/691SkSyY9FsMl5rUZMON4rj3qX01621zPlqeU4DMBW6EYxZUdtPi
         QFDcV6gB2pE6LHmVHSmwzx7Og9Jc2zfzBA56ivSy+x4QOYvYwfpjgTImcNzhGirmq5nm
         +6TJBnbmKzoe49eV77NZBvBNTtulzUt/6aJ7G0wSMah4GBeSCRS+Tj2obiYUTBkzSH2J
         KUqQ==
X-Forwarded-Encrypted: i=1; AHgh+RpghuogN2ZvmlgKLU5P5byo+fCc/A7OnnsHjBoDDZSrfOXJ1Dy15vwOCmj4pu0NtgQrOLEJM25boMnW@vger.kernel.org
X-Gm-Message-State: AOJu0YzwTC6n/kuN0O0iv1p9Q09g4WlUA4SyYQhqt0Lve9KkDsYQdliA
	YF5r/cXn/Gpjl/+fiDRB/T0U4atNp2XkeoDsOzoi/Ep2OSrOG+ECD/T/Tldkey9KZ4XFA1hRsMW
	T6QPFz9szLdSGM7ZlvsizZfP+ipZj2ZmqYBX4fNEa4YSgEF7Vj/WGtwe2UoHI3SLo
X-Gm-Gg: AfdE7cmXyyzFqQumOW3HU1saKrRNw7TTdvst3lpUUi3iO9MGcMknhZyeSI1bfVKHtQW
	wv+zSq+vyNJAjvRBNSyxXiubua0j+7AlFtNo+yZ+XltDmciBtmEJ89wSnlr6dOI4kooQ7SXXLSB
	CloSw2pgSmgRVCGIDeo/Bay4WZPvuFrRrldOJvOQ/NIgaRwo43qM0qubKqPj0SSclpvnDDkeou7
	B4KxrKO/9eTT4qdJwggUYkn3aTgFVIgIYPVlQPWhQ4EIJn7ZKQPQIx0UMshO89E9/qBPfDEKp+A
	pQt5FR2NJX2mZf8G8yGwtHXte25QZeMiSNcCLMwm0n8tSTFkWhSfKlj9S01AVU4zUkXa0yHtlkW
	EZTULgyFf9N+DrHN6jCgnWFHt+koMKfQ/zU73cL20skM=
X-Received: by 2002:a17:902:f544:b0:2cc:d807:369c with SMTP id d9443c01a7336-2ccd8073e0cmr11847055ad.45.1783431052538;
        Tue, 07 Jul 2026 06:30:52 -0700 (PDT)
X-Received: by 2002:a17:902:f544:b0:2cc:d807:369c with SMTP id d9443c01a7336-2ccd8073e0cmr11846505ad.45.1783431051916;
        Tue, 07 Jul 2026 06:30:51 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d968sm12072725ad.60.2026.07.07.06.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:30:51 -0700 (PDT)
Message-ID: <5face958-656b-4287-adf6-6dbeeaddf4c8@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 19:00:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: monaco-pmics: Add ADC support
 for PMM8620AU
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260614-adc5_gen3_dt-v2-3-32ec576c5865@oss.qualcomm.com>
 <20260614081546.585941F000E9@smtp.kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260614081546.585941F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yPihlPwiWu_CU_Dfn1oNirdBxiewjdRE
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4cff8d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yq9WwLAiYoGSkMfMoKMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: yPihlPwiWu_CU_Dfn1oNirdBxiewjdRE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX8q85EMWHZzdU
 E/tc4Zb7hia5y9g5u1YafBMZHV+G+VMo5YEJQUvnaLZNHjtoH5Jg4lTCeE4iYbgncEEzw5AskQ3
 /mBSAuI/uOc3p9zl2O/aM07rkUfkRWs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfXzcBc4MiLsgNz
 Bh0T05ogYDm82lE2x6C8o/ah9AuPyhzrH99dF/H5V5GvN0DszQp7K3RcFvaPpXJiKbhdSJY7BoE
 NSYbBTkuXJGVHBPVlqEcmYiCeZLyWoZ3qGbRen6bzysNAZ29in0pgvYbk41nNoVwhyrWLCYhKSv
 sozubkOSqyeeS/VzCDsQa8wEM00wRGq5QjjakNyEsIr9guEBSxyYhLGDN52IamOQpqIlnB8Ozl2
 o3D5zjiKBwjM/Ha84JLFp5GnwZ+ZZnX+4/Af1/mkK6KtIdYdFoIHwvpFyN8owctp6Aj9Euqg4Wb
 jfhcGf7M/MRHb2/iFVGpCDeUMHhD7+QF0kWvawhYPms8J2oTWcCieaNaJOe3UdYdfK4Cm9Uz/K7
 sufk8No/cXCWkR/K1MwDvILT0G5qCpCWsr3w5y57h189T9jO4JSt29vlxP+Cy/c0oTJREXpTTx9
 zBJbnv+EuvBktGB9Vtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070132

On 6/14/2026 1:45 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The ADC interrupt handler `adc5_gen3_isr()` may dereference a NULL pointer `adc->handler` if an interrupt fires before the thermal auxiliary driver has registered its event notifier.
> --
> 
> commit 2afa9a558734cf9fc6ad1120da9026df8390137c
> Author: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> 
> arm64: dts: qcom: monaco-pmics: Add ADC support for PMM8620AU
>     
> This commit adds ADC nodes for PMM8620AU PMIC instances on the Monaco
> platform. It exposes the DIE_TEMP and VPH_PWR channels.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
>> index e990d7367719b..232bcb942b54c 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
> [ ... ]
>> @@ -20,6 +21,27 @@ pmm8620au_0_rtc: rtc@6100 {
>>  			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
>>  		};
>>  
>> +		pmm8620au_0_adc: adc@8000 {
>> +			compatible = "qcom,spmi-adc5-gen3";
>> +			reg = <0x8000>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			interrupts = <0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
> 
> [Severity: High]
> This is a pre-existing issue, but by enabling the qcom,spmi-adc5-gen3
> interrupts here, does this expose a NULL pointer dereference in the
> ADC driver's interrupt handler?
> 
> In drivers/iio/adc/qcom-spmi-adc5-gen3.c:adc5_gen3_isr(), the handler
> checks the device driver state rather than the function pointer:
> 
> 		adev = adc->tm_aux;
> 		if (!adev || !adev->dev.driver) {
> 			dev_err(dev, "adc_tm auxiliary device not initialized\n");
> 			return IRQ_HANDLED;
> 		}
> 
> 		adc->handler(adev);
> 

At present, the auxiliary ADC_TM driver is not present in the code.

The above code block lies within this if check:

    if (tm_status[0] || tm_status[1])

This requires some channels to be configured for TM measurements
and a threshold violation to have happened, which is not possible
if the driver is absent.

Even if the interrupt is somehow triggered for TM violation, since
the driver does not exist, adev->dev.driver will always be NULL,
so execution will enter the error condition and return without reaching
adc->handler.

In the latest patch series for adding the auxiliary ADC_TM driver,
https://lore.kernel.org/all/20260705-gen3_adc_tm-v3-0-ac62f387dbce@oss.qualcomm.com/,
the above logic is removed from adc5_gen3_isr(), so this issue
won't happen.

Thanks,
Jishnu

> If an interrupt fires after the driver core sets adev->dev.driver but
> before the thermal driver calls adc5_gen3_register_tm_event_notifier()
> to set adc->handler, will this result in a kernel panic by dereferencing
> a NULL adc->handler?
> 

