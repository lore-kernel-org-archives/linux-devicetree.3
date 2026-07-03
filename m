Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5FB369D40
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 07:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064439; cv=none; b=moC2O0NdHyRLopnwnvk+1BbuS9pxnojWntQV+vXjuF/y5xOU3rxYardZXFEdkZSDMqJ4+KFTNT/Q6f30oKsqvHNEczKdyMcmwYQsxDWg3+3VEW+W47D0EbCJtyt3IBl+NLDudkn/URm46skTy2Quwq9C9WCClnEDFZLwAnyDLI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064439; c=relaxed/simple;
	bh=M7na0t4nNmsWcWw8gALyPoBT0+6yZi9dTf+T9WdIh84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q0R1JdeOMSa0BOU8qfXHkNBHtuGfCaARw7JEoeYulu/OCo7dvNRgJ4InSEZSGG3L16b5q0VJfm7sOZLCVvx0e5ryAenYveuEdvo69USfatOh14Oz2IHLatyshXNS7qAxKpW9C7aARL96APFApamfRdLNlC2WsILf/K7UMK5gKxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I1kmviXm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aIPInoUW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I1kmviXm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aIPInoUW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rhfg3147314
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 07:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahWXncPWGfiDGqR+LWTOu8pR2UuYY74gbbZD9oX3OsQ=; b=I1kmviXm+WTo8yo0
	ANpXEkYrcYIEnYtZxRlagsBzRO+nGos3SyPFyhpSPVO1Lfkwyn8o186NPeJjuQgC
	nmmMhqBVmibdXoee7SOuQzPdUjxVKKL7S6tZjdecpWjvIhFFsJ2f0wPcAF1j5oiu
	1ScAc8zBVskCSIsvKteqX2Ko27V3K+ht3amzH16TaCJ/tPj4FJH46BZ8wCe18uat
	PuTUwczla/Cz2bI5VWNhGuVcy+4SDTTl2DYmLaTIxXTicXtpNqAztXYSu9t7z4jz
	8ZZClM+B2wUFq2FWXDDgWTXjZSn144ma2teZy6nvACUnuZn1SfjVsUe3YvuwAvp5
	o4HHjQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvww3va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 07:40:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fccad2b01so1196169a91.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 00:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783064437; x=1783669237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ahWXncPWGfiDGqR+LWTOu8pR2UuYY74gbbZD9oX3OsQ=;
        b=aIPInoUWkaGOuElU6hgVGhap4qvX0nNgXPye6papxFiiB6B/kBRjbzHoTh/x1VmQMu
         PFpvyR39OFzbhYLW97ruDlydQZMp+CQUHsKmivHaSZi85ur3CZmb47ww1jBhKJjFGq81
         f/192G94sDGxpeB4FnLWHyoR6nbGHiCNjjmHzYCCPNlKDNjqrcY9HgWJ6zLFo3CdfOuX
         tH+lCJuO5YwjYICMdwAxDWmLHIL7P38EUdR5m5/eIUCmFxP6ILd9e0RoniEIrww/0jnR
         dB+DIeyFFzncPOr5SAurykzMaUhPpWkRw3CBxfodDKy2JGL4c4b/s5iavhsxEWu339fm
         P6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783064437; x=1783669237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahWXncPWGfiDGqR+LWTOu8pR2UuYY74gbbZD9oX3OsQ=;
        b=QVToa33JHX2FzrWdHuRudvdK7PAVWLav5pnSWxpPs6bkFx3Zq6igcV00VnrnyH65Jt
         b0T+lBvojOeYxBtQPSpFTE2uJnzFxt5PeU0KL2GmNiuSl+sjdrhGFar9oWGltnHv9tF4
         9TZ9eUIi375hG5cffxh6H8ftzVdl5OM9gYGPAzGOjlT3JpO6tcH21CC1+Os18HV+/wZP
         rY2+wziDDTyN1aFyGtoPNzy4p/w+1VjayXmV/6Duvu5gWo2xN/ORpYm2lzVAQbF/rHbe
         IxLL1XeqbZHo/54Bx7BsJJcWMbCHIkvaTT+P+6w9qiL6PtR5+ZVVsVAyBzx017zOz5Wx
         3SLA==
X-Forwarded-Encrypted: i=1; AHgh+RoD7SBBPEyPTH2xWIzmAMW7w1IEM3TaHJz2PBg6qxXAeVclUUHAqZPMnckDnL9WnHvQwPrD3B3SXdBu@vger.kernel.org
X-Gm-Message-State: AOJu0YwJM6sTYLkwrspp+QhhCbTMiYDKFIANDvXOvWRGj6lCeTmJu+7k
	0TDg/g+LPvrtB86yNWyLLTVL0BOAi5ikc609U+Uo6yCJkkhA+rk0VONNTGFDsAmb2RESEFp1ZTD
	otRoETJFCEWRZfDuKhCbp4qQOIp6R0/9rDjxVLVPs274jySmupzLIMNaaQWIK7ucZC3b5tkx5
X-Gm-Gg: AfdE7cmZiBW9lO2QlgFYD/hbVyCrCpFZ730R8+JLnS4SasvfvHUajVDVQk7S2JoJg/c
	1zh+OKCV3dD8sBaWOinuebrdmT6yaduAHrqcHd/I4EPe6X6Z6cYYxOAwt38L3PcE/Vi1K9UOECT
	jVWumFtwEhkpsRNKbbDPA5OHwwid7Cxq128nauPw7bwb7WYGqQwwq7JE36AQZfLEYk2Dzw9OwyH
	aiMNemHeSR8dfE1WGFpbOhTQ0bzGk90YjiUuLOE2p8HL6sCDB7eL0nebNqI3y5ExwlFFbBkO2B0
	E6v57kT7f0021XPdGFXvB5EfdAar3vfCrUIAK7fEmztxDWXQY+aX8/HZUZTVMfit8OrlKaB5TLc
	EC0+McE/sD+4ILW4a1qzFCccFAysfffFibwqLtHOhcDQrq3Ezq3WOXfrDoAt16qENo/dzCNasoO
	D6X/BB
X-Received: by 2002:a17:90b:534e:b0:366:52fe:e749 with SMTP id 98e67ed59e1d1-380ba84bbadmr9770728a91.5.1783064436827;
        Fri, 03 Jul 2026 00:40:36 -0700 (PDT)
X-Received: by 2002:a17:90b:534e:b0:366:52fe:e749 with SMTP id 98e67ed59e1d1-380ba84bbadmr9770689a91.5.1783064436245;
        Fri, 03 Jul 2026 00:40:36 -0700 (PDT)
Received: from [10.133.33.80] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127ae6e2bsm579618a91.2.2026.07.03.00.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:40:35 -0700 (PDT)
Message-ID: <080fb007-e441-402e-a384-7cadab2121c5@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 15:40:33 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: qcom: Add compatible for Maili
 SoC
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260628-maili-smmu-v2-1-87448a7678ec@oss.qualcomm.com>
 <20260629070306.E29141F000E9@smtp.kernel.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260629070306.E29141F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5iPjMUdlba8mwX8Yw-cLKwJzhsbChl7a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3MSBTYWx0ZWRfX2hfaCgWX7ke/
 Omm0/n5leAnYjuDTxVAFTPp+71tzGl+tl5a8ttMV1t65YUJ03NhZVp4jLzkmY7OeJZoSS9cTx8b
 zTSQ/nB7i3T6BFPBYPJZ0T6hdvQcg2Wt8OCtGmH0qSXiMEG+o0nKjlBm2MqqA32sXDpEyL8GHaS
 +9mUiamgrrQxzbOA6nFe+cjogW74WMPg8abSjkAA4s18Dadsz+7cwSN3mHexeOyrBVQ6jTqMLgs
 MsAdNZAYfhWADXxy/t2CpLXSrutxMrMVd1DZY0qqwOzaNCn7+Gea5/Fs91nJ26WMy0Lryu9lIO1
 H9VniUbU4wptNcLptLUfJf99tjbu5/2+ZEUAYOGUDxRMeL0mJ8RucaThRyC+AlNKMvxzWL5/TRy
 yCUjk8Si/Y8ml53hCpSV03ZPz3WR2Q7Hbl9pVdnu1WnlfhuI0ArW8B03wViWoo2ZhYYgKARFLuh
 dTbCPO6y1I3ntKqf0mw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3MSBTYWx0ZWRfX4BPqOuXzxS0+
 Va2mcOlSJ4DgHqT9gck7gznsOAynwlac9fm7ekgsqDXEJNo1646EKb5/bRSlxwWSrON00q7Wb+2
 Hk++XyBxd6PqamwozBWlTpxqmW6qvTc=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a476775 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2SfD81yUdUcrJK8MhtQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 5iPjMUdlba8mwX8Yw-cLKwJzhsbChl7a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030071



On 6/29/2026 3:03 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The new compatible string `qcom,maili-smmu-500` was added to the main list but omitted from the `allOf` conditional block that disallows clocks.
> --
> 
> commit 5d07ecfd0f829393f9b6baedb17d072c42c1deab
> Author: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 
> dt-bindings: arm-smmu: qcom: Add compatible for Maili SoC
>      
> Qualcomm Maili SoC includes apps smmu that implements arm,mmu-500,
> which is used to translate device-visible virtual addresses to
> physical addresses. Add compatible for it.
> 
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index a701dec2fa0a4..c48e9de1a2bd5 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -39,6 +39,7 @@ properties:
>>                 - qcom,glymur-smmu-500
>>                 - qcom,hawi-smmu-500
>>                 - qcom,kaanapali-smmu-500
>> +              - qcom,maili-smmu-500
>                 ^^^^^^^^^^^^^^^^^^^^^^^
> 
> [Severity: Low]
> Does the new compatible string also need to be added to the allOf conditional
> block that disallows clocks?
> 

No, we should not do that, it will conflict with the following up gpu smmu binding
that fallbacks to "qcom,adreno-smmu" and requires clock.

Thanks,
Jingyi

> When qcom,maili-smmu-500 is missing from the conditional block that matches
> other similar platforms:
> 
>    - if:
>        properties:
>          compatible:
>            items:
>              - enum:
>                  - qcom,eliza-smmu-500
>                  [ ... ]
>                  - qcom,kaanapali-smmu-500
>              - const: qcom,smmu-500
>              - const: arm,mmu-500
>      then:
>        properties:
>          clock-names: false
>          clocks: false
> 
> Device trees defining qcom,maili-smmu-500 that incorrectly include clocks
> might silently pass schema validation during dt_binding_check.
> 
>>                 - qcom,milos-smmu-500
>>                 - qcom,nord-smmu-500
>>                 - qcom,qcm2290-smmu-500
> 

