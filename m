Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990953911A8
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929177; cv=none; b=EvoiXXcAbuYrfL8zuSOeuufR9eEZ9Q4K9Yk5sOmwvoRbqoCAafRcMK+a3Kdwwa6TCyqsLJRXCHCIHdW3RyJYW4Yl87mBORg2LYj50+oJp3URxxjNuXHyinkX5JtE083CvgNlHV8W5cRP3cqu189FVqGlM/Q1OuceApKXLDxC4NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929177; c=relaxed/simple;
	bh=33h9TgXtBd68jPl2HkwHza+nUO8E2LiJsacvUz/rfuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DOfSkYyzpjvOyNraFItts1EMIbsXE6bTPukK0MMMYJCjkBMEQbymg/I8ec4xLO3wAYLCzqlIbXGu0XI+0gIE7m7xq/ZKyGQ8kDwriTRG2tAb56g8Lhjhg9ZV844ygp0rvqS3Lye9T7nRVgUmYkeoFo8pwbPoOPEGSZabhFEvIyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UTq3nK44; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cFTWfXOi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UTq3nK44";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cFTWfXOi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NqcE648581
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:52:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rLbH1VkbJCXGoSZ+uSVdMOzYeAY15F1YaTx2sQeEbys=; b=UTq3nK44NefQGw0C
	eTjdguAOkpJ03yKLwIvaUADv2JPy7/pSOkt0D+whIZ3xUgQvVEw8E9FV7ZL7nPHb
	BRbo0b1dQhLH+P5W6W6CoV3kzB8bvdEjmASiaoj01l3iXP2yXkJVn0AJyH6tdVCb
	16MjSnYosw6TD67KRF5Jh8sAScgp7jWjcN1KDz9uGIeCgd5+sCk4ZrkK3DXKHC6X
	7xAUUbHyyPv24OauqKEAaOYU5BTqGs6M/fkO955KOvo4daiEKiiHOcB9I4vQ+eZk
	z1pkQEzxcCTJ5qzILQG0wGhGy2xaNFg/0mpPyx2qcS5F33Y08nWSOJ1TCw+qUCH2
	VYkSKA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbebr4xwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:52:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a9764f0so47562741cf.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 00:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783929175; x=1784533975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rLbH1VkbJCXGoSZ+uSVdMOzYeAY15F1YaTx2sQeEbys=;
        b=cFTWfXOi4bzt8CtsuUJZKP6mjSouuZONMO3AWgX7jWj/9rSqKuafS5ZgD6MKnMTJGj
         tLL1msqP+39e6HI5Zwv66AconERk/r/u9PekBphqeZXeBnEucrBDo1GqUr2Z/qu5seBP
         gAqKlRseHoKtEgeb7gjBfjssL/d6u9slArq79xrQ86qXymvcl/LMA5AoMfc6kOl1wuMP
         GuiINFmGHwfrz3hkL0yozucJHTNHV1TLbYjd3w7mwLn2/Z/4ir6srnok2eN51eLjAwYZ
         q4olmcaHaspMqsM6tMcvym2dFkmcqInuOQNjv937TXDiC30P8MDV0Ct6oVyA69wROdV9
         GEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783929175; x=1784533975;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rLbH1VkbJCXGoSZ+uSVdMOzYeAY15F1YaTx2sQeEbys=;
        b=QLI+fAwnX8L/iBJpLNwz0l7Nju2DnFk4eR8qR3tp4Bh6Z2DhwkVhKbDqGgYLdZFBvH
         XGJTQXAiwdJ3SYVs/Qso9RNtN1zKPG+gw5bLLW00l6cOK+0vJ6jZef2mr1ormOjo8FfY
         1m+/M/jKdzFg/0JqUoLbxXNr6qqOqUyjSVg070bPM+5i39ZabDxnEJCoFtohpCF6z18l
         7QtgWIF5XQ4QT1ACFurUphraMVkmz8S2FWOvDJzSXn+d2FWrzsdfx0LnvCl8uP7Qeuvl
         1fmJLu99vB5k0YcYBAPr9mP9Qu2D1M/8fzrweY5nHi3YM+IYU/toZOn+vkjEVFu+kGRS
         LxvA==
X-Forwarded-Encrypted: i=1; AHgh+RrQCYzcGuujkXiFblnqf1W+nGBtq7aiTvOnksyXskgKcCTOIphqXwgAGNTA0HoExUfaA7VFuWElrZ19@vger.kernel.org
X-Gm-Message-State: AOJu0YwbrfvNIoG8Te+Z0olokO2rjUc35NVussr4fSmrto0PjZyVYxYg
	XCFPdFT6gABheBU4Y6p9NLIvWZie+7hELAjpLAVSdMSIUQgVRWpfzVgEL15emw28yFCehbfnh0y
	CR7M5euJ4ZHEz1t3sAQR8isNjW4EFh9L3iYf8KO5vjC0S6vYXsbLcSGrwhOaL2NIx
X-Gm-Gg: AfdE7ckjJylwm0v79qpd7hDTIHzOdv/YGjX+1/Zd2mF+yFKFLec7BFpDuNHWCMyY4Km
	xi0vCzvmRw0pA7ec9x5YG8f7m0ACdA2HqRU18WAOmWhM8o3CIqmEi4C3R2L1mhvZdmF6A9DGmCa
	nNOXAd2GhYjWzNZerM96PaHNK7STJNJ6SAdr101leXWx6PFI+31BRc4Lum+XasgtCoJVnZlTyTf
	fBndtiNwWEN4nUYFfZcUw9xJvO1pceFJpoPM0myKzIg8Ci0XPYwly4ujkOrY+lAzIjQtI5VAKJR
	qqXn1AEQ72YzWaa6w/Bgex2lRyxfRjPIKc+sVu6WnIg0HaTfupOv/bqDaDSOBCG9oHt7kZyYb+N
	cip3zcHF1z9hYGPxw/tIwZ5fMx3ORvPar5J93OCIyojM=
X-Received: by 2002:ac8:5f0a:0:b0:51c:1132:c80d with SMTP id d75a77b69052e-51cbf1ecad3mr81897621cf.28.1783929175137;
        Mon, 13 Jul 2026 00:52:55 -0700 (PDT)
X-Received: by 2002:ac8:5f0a:0:b0:51c:1132:c80d with SMTP id d75a77b69052e-51cbf1ecad3mr81897541cf.28.1783929174774;
        Mon, 13 Jul 2026 00:52:54 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb488desm960961466b.63.2026.07.13.00.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:52:54 -0700 (PDT)
Message-ID: <9da6be10-cec7-4582-b259-97fd4b9f7997@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 10:52:52 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] This series adds support for the Qualcomm JPEG
 V4L2 mem2mem encoder.
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, bod@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
 <364a79bf-e424-4237-ab13-18e38299ecec@oss.qualcomm.com>
 <c9006b67-aa43-41d3-8b13-f20dd2e544c6@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <c9006b67-aa43-41d3-8b13-f20dd2e544c6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4MCBTYWx0ZWRfX61LYauSvTdf7
 hYCz+mbugeK9dBmj8GkprgRl5YoyErObNNr59E/V1hGqz5nAdcKo5c5F7KX/LPn/2M6VUpaMZEg
 2zCXf5SIM38s5Mk5wIZawqn9cefkxoc=
X-Authority-Analysis: v=2.4 cv=OK8XGyaB c=1 sm=1 tr=0 ts=6a549958 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=k8JpAAtuEXT-_s9VV8sA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ueOTO74ejt0f-8CVdEID3XLKMLhlh1HW
X-Proofpoint-ORIG-GUID: ueOTO74ejt0f-8CVdEID3XLKMLhlh1HW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4MCBTYWx0ZWRfX0xcG9ApG/zrs
 SdZASQpRvE8ATD3bIT9R+/XLDQwquYRssHffcgeOpBBhhG8Obj9hao7fQXSuRfdr/NNlblEMdpK
 H3dySZEZnnyP6RxL7fsmCNoq4P9dw4ky05AUAeta3AkClzLR2c/x6rV7IDvw3UuH8rnmwLiVCRK
 3Y5tdjcL8XLmlmxRSrNz4M436E1VyxiwZVan76aWaIY/wLGw9O64cH3ccYAPLediD0IPkwTnQSZ
 Vyw3TA17DUbMYVXYdxKkztAmMEfTYxZYy+Cd6NopaVrlWbnT/p9+Ze2RXamwqJsDPY/aVTDkhZk
 j38m60hcJ8myROkaQpYoIJDPUs6cNVLcgiaytA/pNmDougf03n/XvXNzYOZOrOL04cS+TzdrASP
 nTnS8w9BIDcwPT/8rj+cRkon4A5ZfoNbCvLBIYiWFKDwlOj9sQKopHsfBct2WuIX4cTZ7ztXy2B
 acMfyehPh6PztT6kJwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130080

On 6/25/2026 4:53 PM, Krzysztof Kozlowski wrote:
> On 25/06/2026 15:43, Atanas Filipov wrote:
>> On 6/12/2026 10:44 PM, Atanas Filipov wrote:
>>>    19 files changed, 5067 insertions(+)
>>>    create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/Kconfig
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/Makefile
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.c
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.h
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h
>>>
>>>
>>> base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
>>
>> Hi all,
>>
>> Thank you for the review. v2 has been sent and addresses all comments:
>>
>> https://lore.kernel.org/linux-media/20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com/T/#t
>>
> 
> Problem is that is not true. You did not address all comments. You did
> not reply to them and you did not implement them. I just checked FIRST
> comment and stopped there.
> 
> Best regards,
> Krzysztof
You are correct, I apologize. v2 was sent prematurely without properly
addressing your feedback. Per-comment responses have been sent inline
to your v1 comments. v5 will address all remaining items.

Best regards,
Atanas
