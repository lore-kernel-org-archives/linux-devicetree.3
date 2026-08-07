Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516823EC812
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786092719; cv=none; b=jMtmhsbQh4EIGsCcQSIxN6HzWGiWJL+f30YRi95pPQwv38TrXy+H3bjRbJAignxOM6IusKvAbm1PEKJKknCy2f0IuUPmI3pldpFczsWVsw5JqrGJAKrwQv8b9jkHWYgfG3VM7hSM0JsBhHaBiiEhRE9/TrdhzT9PpMLx9f9i2Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786092719; c=relaxed/simple;
	bh=e3jsuGhBxHLui+In1zgCjXokCiudyrBbejqq5AfoXV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qNft3gvWpIyueLbHhhk+qd+V0azWuTPJNaRNuvKL1KJvK2dkUA67SgP2vRAAGI1xCU+Dl+WOHnHADSqLZWf06qguuI4cC9xGwINCEnW6wn3xrnXWdTubZQ5M9UnSZpPB/JZx5CkaL5V8XYFkh0MytN4jjrxZaFBsbNI6uOiVqLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I9WTUG2p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UJLgSWNx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I9WTUG2p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UJLgSWNx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6778IogD492960
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 08:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h/Fn9keX05U9JPUaWjJKJl2eCMtAlThD0WpvAOwLFNA=; b=I9WTUG2pZtLI6gYP
	AjKAGqOHFGVxd8/J/H4tdnPnPTqj+nhXLmkwdV3tZ09EiW0zq2sg3v4thubFRfLK
	h6Db1eF/BhT465ZUI7Eh4MT+VxSYkXDFUxyqx5mmNkpk3iNDEfvBHpAHfWlxw16b
	XxrxRNcb+8ylJ2/5yqnGBSzP5VPPksRBJ3D4xFwVrXy39MZt6uKD2Yvvoyu7XkGj
	xpI70IP03TS5qbIsfQiOnEFStFjYw59S/pPEML2ckiXV5rKrA4Hmh+HMur5H0Wt5
	JYU70+FCylGyzr4rX7/xaEfvgH4RKm9kIchqdcktAPWwukjxJRbKCNrk+OBKPyTm
	ZTB+zA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6rb1sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 08:51:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so3982112a91.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 01:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786092714; x=1786697514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/Fn9keX05U9JPUaWjJKJl2eCMtAlThD0WpvAOwLFNA=;
        b=UJLgSWNxFVuA48GqBRfsHwBnNaXG/J1GK3ddkqAtmSR4Umyqeb2ZiZMcprk0O4wqQS
         pr+zsfBnykFMagGEEyl2l9WqHMohNH82fMQ5CA5YSW1FoFvNrSO8yic+PZqAExcL7oBB
         KiTeoj5IOsW5su4KRyRVpYYqQd2DQSXMS35gMuKo8OQ76z/G5qSeX1fvcJ2I3eXj0Yyj
         uLDOS1XlHwHZ5gSn6iRcNLMc8l7OWHaNU+FNe6tI6NR/w5atOlRTanTM1SelCr3i9/5N
         P9vvLVPeTwBsDTzQkrpkoKpg3oRaJPnEVbo0SGmzvq7RWN1yoWD62vJ1wMyj+sAiWj6C
         l7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786092715; x=1786697515;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h/Fn9keX05U9JPUaWjJKJl2eCMtAlThD0WpvAOwLFNA=;
        b=GpdwWKspjqy5rYy66uWQqD7eAtvOfwrY3qv4QFJ6V96aNvvaMSa00T0yzJmr3ifrIA
         Ma1qzzPrF4YVewFTFeJo1cy7LHTxpOegqCxsIAPToLBM4/EeeqkaSoAzYfMuJu2pHNGX
         uBM5qU5OJNwqLbRrsaCcUX5Smv4/eaBZ69mdjbhebQVrSQ8M/sj+CgPZFHSHo0ttsBM+
         6CueJo1GapUlsTLPTlLaYxYe1PtjBEDDiJ0kisaEmWm90QRbEFddg4Jmydga4m6zYFrh
         1ddF/014v5W31I9oUSgbgBTFPcWGyE1dN1yepBq6eBggwst11+Uwgd61k0ppF//CtBLf
         iB3w==
X-Forwarded-Encrypted: i=1; AHgh+RqMQWOW/TywvRbP3HLH14krh9UmEt8du83UeL0sNYubAluzwCLMRYwzHPnYHN3vVeyuEccY7M45Vli3@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbd+xK9621YHnLjDum0xx13ug/o3knnDXDL2Z8MR0jUL6Rqo1c
	LuINl/KZyhKQahnhmc5WLBMFbm2X3L8NbH3jXmoYyaNfoYkwJDiquM3n6tNX2M2puPkbMo7lB2M
	tZIyiOWsP14rtM5bUTuE5OZbNTMAzFTthe5rqdfKGxCmNkGIbodcPPFjqfpzZqBDb
X-Gm-Gg: AR+sD10AgbNoLXdKRpCxOI1Id51b+t6JrFDaM9pRZN0ewvMlYkslLHBJyppPSIk8yKp
	QjTOzIfFQ4Cv8iO/60lsbmq8copUgExPnCL8Tf+3N/IvrI8YSMiNnj/7UG7bWRDjhCQyjg1FLcs
	MNMc+nXQMeFWh35rNK0MYQ1hTJdZZC6u5hIBh1DzI22NAE6u8fkjAa3gR+A4peCVCL58TWQ2y+d
	X/x2SShQ2UMWTLY+DAmVdOsTvKGNQ3pjESfRB7iNVLyuLOrT/+yvQhbcoFB1hnUc5/58i1EJk+0
	GQRurma3VN3s3A0dCpz3FbjH2qA6QzK0wCKzn7uNTAHEd8DxrA5dW9xTvYVHiNgsASM6xcVPH0Q
	WZw7VV/Bl8Oua/eSW5He7/mNvlBPhvaojlq0=
X-Received: by 2002:a17:90b:2dc1:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-3903c535d79mr24674569a91.5.1786092714529;
        Fri, 07 Aug 2026 01:51:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2dc1:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-3903c535d79mr24674501a91.5.1786092714010;
        Fri, 07 Aug 2026 01:51:54 -0700 (PDT)
Received: from [192.168.0.173] ([183.83.142.146])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8a9220sm5754464eec.7.2026.08.07.01.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 01:51:53 -0700 (PDT)
Message-ID: <3b0d07fa-6251-423a-9a1f-ceaf5cb2eb4a@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 14:21:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/22] dt-bindings: media: qcom,venus-common: Allow IOVA
 reservation memory-region
To: sashiko-reviews@lists.linux.dev
Cc: media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-1-3996f67e33f9@oss.qualcomm.com>
 <20260807084913.384D81F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260807084913.384D81F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2NiBTYWx0ZWRfX10eqtGw3i7e1
 13Wnvnh0a6GzTcF3e0U3XrZbAOf3iZMWLZhXNbSPosg603Jsf8BWzV5KFSMs1iyASDFjg8P7yny
 AAlE2e/NK+zQzFmXOMOsfiAa/TAtsiV27tfq055TxF2VKlebhi0Ru48gCruRn8yDR1PEsqczsQk
 vM/MVeG3a1pQfVFJ8poo4jAPSt9GDuSv24/b7I0WBuecbbV+yhtKwEbid8+RehpTVzBzLPfOIVS
 y38LLzf3DxCc/5X6ztCl3rlyypMODPsKArwPRpUM2WoxL2wICVkGL9jCNIn0Av/NSt5Q9DGpz96
 S+qTtMOyySrNB6HA/r1glLPgkh4dApadMsf7XjUj7q4O0i17QHl3iyTLBDhgsRb5XxDuq++fQA0
 cpzEkoz+gJgpyXRvk4dUUi/ofy1k5T2ChWbmL6Hwi4YgOPyzSUJFMiApBQA/Kp9slnlaTAh46tz
 L5RlMspp5ydst1Bq9pw==
X-Authority-Analysis: v=2.4 cv=HPXz0Itv c=1 sm=1 tr=0 ts=6a759cab cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=eVbXwf39F0J6/s7D6zfB/A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ypr4sf9bQseyws4CTX4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: ocyo6lesrU6YTqpoBaoHh6gOAbBEHGnX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2NiBTYWx0ZWRfX+hTgq9wXoveq
 RAR+06VdOvcK0uAF6ISKLON6a1FQeSVdp7auko6KOO3hmjHUcUrGCfiefzfdcJlnXbdQV5BKd+2
 530lga63sQpGn1J3us0ZU+pP8nzOpxw=
X-Proofpoint-GUID: ocyo6lesrU6YTqpoBaoHh6gOAbBEHGnX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070066



On 8/7/2026 2:19 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The patch updates `qcom,venus-common.yaml` to permit a second `memory-region` phandle for an IOMMU IOVA reservation, but fails to remove a stale `maxItems: 1` constraint from `qcom,sc7180-venus.yaml`. This prevents SC7180 devices from successfully validating if they supply the newly permitted second region.

patch #3 in this series incorporates this comment.

> --
> 
> --- Patch [1]: [PATCH 01/22] dt-bindings: media: qcom,venus-common: Allow IOVA reservation memory-region ---
> commit 44e20424e211e02ef9914abe4592c185ad0d75ac
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> dt-bindings: media: qcom,venus-common: Allow IOVA reservation memory-region
> 
> Non-pixel stream IDs should not allocate IOVA space from the 0 to 600MB
> restricted region, as this region is reserved exclusively for secure
> non-pixel.
> 
> In addition to the firmware-loaded codec carveout, platforms need to
> declare an IOMMU IOVA reservation (a reserved-memory node with
> iommu-addresses) to keep DMA away from restricted IOVA range.
> 
> Permit a second memory-region phandle for this purpose, and describe the
> meaning of each entry so the ordering is unambiguous.
> 
>> diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
>> index 59a3fde846d21..0be2f9119e782 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
>> @@ -37,7 +37,10 @@ properties:
>>       maxItems: 20
>>   
>>     memory-region:
>> -    maxItems: 1
>> +    minItems: 1
>> +    items:
>> +      - description: Firmware-loaded codec carveout
>> +      - description: IOMMU IOVA reservation region
> 
> [Severity: Medium]
> Since this patch expands the common schema to allow two memory-region items,
> should the local constraints in related variant schemas also be updated?
> 
> For example, the local constraint in qcom,sc7180-venus.yaml restricts the
> items to 1:
> 
> Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml:properties.memory-region {
>      ...
>    memory-region:
>      maxItems: 1
>      ...
> }
> 
> Because dt-schema evaluates a logical AND between local constraints and
> the included $ref schemas, won't SC7180 device trees fail dt_binding_check
> validation if they declare the newly permitted IOVA reservation region?
> 
>>   
>>     power-domains:
>>       minItems: 1
> 

