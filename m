Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5EB36167B
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 07:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064740; cv=none; b=rSiUvh3OYDcl0o9JdppohpDEE69+mI280UmnCxws4rDGTG3w1TrJwdx1qd2sHGpXcxFJCc2IZ1Gufg7BV7lbkk483g7a/nei5Txa+7dsqfXmgWiokpPtUxJE/g1JeM/V2JuCjLAJV7kt+HT8fL/0RPV7U8uC26ZudMS2Hy4gcuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064740; c=relaxed/simple;
	bh=AeEZ3V4kpu21LR9TDSeTfuxq1DwK4p4zspQXeevnieM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=coX010OEYLhwLuX+dB38Max5Ze4yQ3rLPCa/pRWO28BEHnZFU6t2s2YRx3InIeEOE/6dJUt8NoCIVt0GzYrp4spOw/xFRKDip2/t5hWQR17pXuHGgSdyUudFWzJQvsJXynu2AG6ziP8QyCfvMEB1AP8GT4/8BFfTlkUXdFpld+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HP15JEf3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jK8Rxy48; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HP15JEf3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jK8Rxy48"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rk7f3123514
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 07:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	curAgBqgY9P3LuxlnnGPaMje0igtmZVB7PIuoHiWYi0=; b=HP15JEf3xmcSjq7O
	DRT4Ij3N9JvvjoSd7/NXAXLCd4dnpXDmNk/1BA/wPy9/sFqvoVPmpj5EyD3si77I
	WOB9bNzuneGls4jp62Ctn5YtMV7ilvwzzTHCuRTmSuq2psSgKvqGHxtkGPEcpeK0
	dpk5sb2/J0OZFZbdDVeitJmD8HZYhOMWHsL5CRPGYU/ALZ+mRP0XNpmRgDmuW+jK
	rAPYVsHlS+taSqAaJ6f9nYrr8YeErCdzTWk1NxSfFoQ9LYOrrEbPrBqTwzWf154F
	kOKC95sUBN3Rvfi46qE6DU8hwV5M7xdq2XdyZ45pAk7rNrFUTTA8guIyVbACrBue
	omUbSw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnpc9jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 07:45:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ca5d2474c7so6346205ad.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 00:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783064737; x=1783669537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=curAgBqgY9P3LuxlnnGPaMje0igtmZVB7PIuoHiWYi0=;
        b=jK8Rxy48CIOtQjLzej0wTUpz8f8vRkBexbeSw8glQud1+PQ6SovK9t/JjEkojSb808
         3WCBM48c3NHjyJhMuGb0uhTKQHvTmS7HcJSO4WsbJediVuaHTtVyAnNiVEP/LTc4sgOp
         JxhGALovp7E2WkGx+FcTZKcBDfR56yQFpTeuscqAFLvzaYOyNeYI6TtM2stAtH/ZVQ5N
         5AhiaZaFiGpyUvDFTp5FNdDs0Qx14QPzFk9gtGy5RsgsfqMho6K8hC68+BlrYP7QKjdA
         8iCLjnJP5y0mq9syDaVpLYXmmzlsR4F92HK/MoGjht8GqXVOUii2tLF2zwHcaOr8Y9qb
         G/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783064737; x=1783669537;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=curAgBqgY9P3LuxlnnGPaMje0igtmZVB7PIuoHiWYi0=;
        b=ipwLAgfmm5gmHRtf9lzDx6hX4pzWrIaUU+UCt+IXGyGGrOdRtlUhJOLwwFhn4PEOfJ
         EwY5wcLnvEYTRkG2WyKTIG/AvPy9vTwdhTp5UgkYFheVHeIQ5TFaoc8jdBrqi6X0uUHO
         uEg0BxeVaJEgUXe+d47ftcUzocNSQuLM0oudvCjn6xLsxPbRqCXvK9FZq81gEYrn5W3l
         B0fob43YL8tIYlZmloqc5GSWyeyk5ZNgR2djG/0iQIWf2LQK7OsJtpIz8shAAmIupi/e
         rVTYgYeGbaWRHr3rHYlKy94fez31L8nJY83KcARq789+6+c6CDt2MrM5Ysd8WGa5LfZm
         chdg==
X-Forwarded-Encrypted: i=1; AHgh+RrAOd0uh+sdyVlHyR7kM+/0tzuYjcIcksta9loxmXf82TNQMGw1vBySbfiLyWhRZshnxi4qtVW8oWYE@vger.kernel.org
X-Gm-Message-State: AOJu0YxITTK3QFG/lWC5TqEtKPIC/mm3TeS6Ok5YjPbG4WT/5rLc1Tw6
	wx61zVcpE4SGszGBiblyFPkwhmu9zDLoELFt7eGD+9StKlW0CP7epYs+gTzWXdypn9damszm+Nu
	M5oOmUmVgMcAnH5fphDQokX6PXjFmOkoNyhqwCEuHlIjSQ1hhO/URiPxTzdw38Xselzxk/s3p
X-Gm-Gg: AfdE7ckFHhMXuejx4n7Z9Na0dtF7zC3oUVCatYGq6ZR004Pc1MC8+8WiQkPwUW0tVwz
	NiQ9yFP7ZZOfBla+izKD8jjU+eIB7Jud+jAqEIiWfNf9x9slH5i1xVxVANF5im8sBMTiecERhrn
	HA5MuTOFxRw8TRKgENcO1jZyobkT2roXBcVips7YmJvOPoHhfg3vUoCizBgvmWVb2VMrZPTqEC+
	aLJB/O6gBij7gFaaWLxtC/RyEde76YwXUbnGOYC3Ae83FKnbD9AKAcJl3vb7JVBs6nwFl3lL/uu
	NHoQYaPQVWwb21xAslSVF2WmD2bVCm5DAWuIC7ZpBo4gcez47geJ5JbI5vDJqNEEXjJT1iW+npN
	ZQGQpAoxs237Pl+b588OciCMobnkKWfu7JlKkS89uNkMrFrND8n/WzxhUUDB3q5/OarZYUzNiNm
	lz2kV3
X-Received: by 2002:a17:903:40c9:b0:2ca:5d9a:ecc6 with SMTP id d9443c01a7336-2ca911de617mr92604695ad.28.1783064737324;
        Fri, 03 Jul 2026 00:45:37 -0700 (PDT)
X-Received: by 2002:a17:903:40c9:b0:2ca:5d9a:ecc6 with SMTP id d9443c01a7336-2ca911de617mr92604455ad.28.1783064736848;
        Fri, 03 Jul 2026 00:45:36 -0700 (PDT)
Received: from [10.133.33.80] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7875d54sm5297395ad.69.2026.07.03.00.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:45:36 -0700 (PDT)
Message-ID: <11fc272e-f30c-4ce2-8f66-0b56902e575d@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 15:45:33 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: qcom: Add compatible for Maili
 SoC
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260628-maili-smmu-v2-1-87448a7678ec@oss.qualcomm.com>
 <20260629070306.E29141F000E9@smtp.kernel.org>
 <080fb007-e441-402e-a384-7cadab2121c5@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <080fb007-e441-402e-a384-7cadab2121c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3MiBTYWx0ZWRfX+znAJCQSmeR5
 F6kUjRhwvZrS5wyjpgVn0ce7bjNzBqgiKHVb6x9DT2t3nrDVNzIW+uJ6RuzaOpmHwACVWbuEvir
 sYXQbONkwS/4QhJIq3trqUna3RHCncI=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a4768a2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=R9zPoKjRjOU5vlgBfkQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3MiBTYWx0ZWRfX32xKtI5NjokG
 g/jan5e23thJAQfjStDsAKlmC5IkfoqEB58aK0xe1iXawe4mWWkmPiSNXJBXQdMj/+GYERDO7To
 zUMziqLZIihd5xr87NPcHxidyYHB9UCWTCtWVkETphXjW6VqOsmaC2qB4aQ7I7LpYTmOIUUwSC7
 Dype+hPUXMB+fqtpkBMyWx/84I/EdbEySdCXIYIf2LOnoC94eRIEza2xb9CpkHKy/ZaVNIxsDsF
 GbyQFvLOtdlQ1zbcaqzVPNyFjEyV/mWLxVGXXBlUdeZ9e58Ag9TwKRLeDukxxhs85g1MeAXw5/h
 iN1QiCqrE+l7WGMu1yizLHt7b20x4nGg48cwLCgPoWszgsVJ7FEnnaMn1XzujEqvi0M8kmq0gLL
 LiltSFk7oT5dJacwcFDVWbbsi5D1ivoRzi/yZyl7pgjawUcoy+/VTzwvOv3r9hNjiw3KCc/d3dn
 S+3L3eDNgHxNNaQtvGw==
X-Proofpoint-ORIG-GUID: j7aZkp2TR9cEDdyLzhKNYHE64HbtDV9G
X-Proofpoint-GUID: j7aZkp2TR9cEDdyLzhKNYHE64HbtDV9G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030072



On 7/3/2026 3:40 PM, Jingyi Wang wrote:
> 
> 
> On 6/29/2026 3:03 PM, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Low] The new compatible string `qcom,maili-smmu-500` was added to the main list but omitted from the `allOf` conditional block that disallows clocks.
>> -- 
>>
>> commit 5d07ecfd0f829393f9b6baedb17d072c42c1deab
>> Author: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>
>> dt-bindings: arm-smmu: qcom: Add compatible for Maili SoC
>> Qualcomm Maili SoC includes apps smmu that implements arm,mmu-500,
>> which is used to translate device-visible virtual addresses to
>> physical addresses. Add compatible for it.
>>
>>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>> index a701dec2fa0a4..c48e9de1a2bd5 100644
>>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>> @@ -39,6 +39,7 @@ properties:
>>>                 - qcom,glymur-smmu-500
>>>                 - qcom,hawi-smmu-500
>>>                 - qcom,kaanapali-smmu-500
>>> +              - qcom,maili-smmu-500
>>                 ^^^^^^^^^^^^^^^^^^^^^^^
>>
>> [Severity: Low]
>> Does the new compatible string also need to be added to the allOf conditional
>> block that disallows clocks?
>>
> 
> No, we should not do that, it will conflict with the following up gpu smmu binding
> that fallbacks to "qcom,adreno-smmu" and requires clock.
> 
> Thanks,
> Jingyi
> 

Just found the commit "dt-bindings: arm-smmu: Constrain clocks for newer Qualcomm variants"
has added the block to disallow clks, will send a new patch to fix this.

Thanks,
Jingyi

>> When qcom,maili-smmu-500 is missing from the conditional block that matches
>> other similar platforms:
>>
>>    - if:
>>        properties:
>>          compatible:
>>            items:
>>              - enum:
>>                  - qcom,eliza-smmu-500
>>                  [ ... ]
>>                  - qcom,kaanapali-smmu-500
>>              - const: qcom,smmu-500
>>              - const: arm,mmu-500
>>      then:
>>        properties:
>>          clock-names: false
>>          clocks: false
>>
>> Device trees defining qcom,maili-smmu-500 that incorrectly include clocks
>> might silently pass schema validation during dt_binding_check.
>>
>>>                 - qcom,milos-smmu-500
>>>                 - qcom,nord-smmu-500
>>>                 - qcom,qcm2290-smmu-500
>>
> 

