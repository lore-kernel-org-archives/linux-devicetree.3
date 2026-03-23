Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFFC39A055
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275127; cv=none; b=Yjoq7EhG2ZgXvGaXPHJc67gAT6sMZCNd7+sVw4avocZj5SRmMX28Zo2gI19XcrOnOTZCtjvpZDUd19RO8fmVWaZjQbwa8CM1bv5Ama6Kc4nYaBwnSLrqTKWCRGLEjiy08fyhas9jTYP99JBUM7wdlxd13P7qeNC/i4PgvE2SBzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275127; c=relaxed/simple;
	bh=JXPrCrYEtU6t6DJTVUjGrM6sdrRB9i1o4VuzDG5dTtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=miomDhyQz5jhNExZw3ZXmurLnLRgJWK6w1OWUDxXqyUAiNMnIbAg37qUJ1ajxwZVqphJ8h7fIMG+tm5X4/WGdDCFt5tJivQ1hqvC2IxmhuiGQwTN9E4zBQVuw3mFoyz6sfp6VsVShRevLBux/1ZYEm36VwwwX6o3Caobu4bTjp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SEmV+cxu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLfOKrdH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SEmV+cxu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLfOKrdH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NBgBxZ122534
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3//dudT06+CfcpUc1fDDSk6iswla3WNPtRwdrBzt0U=; b=SEmV+cxuCfhKX+Cv
	NEsbHTC29vlgCG/G7JKBW7ZH0VBQcafwUcSnJ/RtAPHX6g4EYdwQM0HXFJ9xIefB
	Dr/Ma1QWXNgGx0RaxbdiXOVG3UUJDeo5EdxGov9JVjsRwdfa5aujS1VKDmiTCeo5
	tUV4VI2gdoTuFPSDNkyDZLcUE2/FdjfZyEqgMWZIrFf/owbzCmLKYmP+e5RCN5kT
	6bQZQMtKG8yd1e41iOinOp6OQQlsrp63CFDQX7dLYl8zAepn95xPKLCbSqYhz7LG
	Ixf0FP65p+m7x+X6PTCEf/AUs3mdF45Rc4b6a1tdUOiu9nVaYFK0EbBQn1JQuJZL
	OE97xw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vkrh3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:12:05 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ffeafd52e3so307584137.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774275124; x=1774879924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3//dudT06+CfcpUc1fDDSk6iswla3WNPtRwdrBzt0U=;
        b=SLfOKrdH5r63xurz5UJfXzYYAXBUBjOaWoYvEOE9dU8Q/ylmuMT5qr+FFB2TKSeFWg
         TAH86bZ8e5+eFjNhnE9ErC5SMhSW/Fplp2+wqtZUEZuLktgxRFyr1lMAFGLDbKgmPCKJ
         aMIFvOe6tc/3xq8Z6njU8MUGyl0lpvDSIkzQ5rZb81lphJuR4B3CY13Gtf/SJPzZYum+
         aXf/dwrTd6uio3njVwS3ggAn6+0DFEMSNPCoCpY7csclCk+vTnhXDZ0ruHPTGj+L9lZm
         +IEGzpiHpV7IbFXmvIaTcI2v+BkRuLyKMIQ3wXatt/v4BzI6/855NURCw0lb9Qt/bxHP
         iUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774275124; x=1774879924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3//dudT06+CfcpUc1fDDSk6iswla3WNPtRwdrBzt0U=;
        b=GHiRUYPDtrFcmeV0hWBUovFbz+/ijp8bASdKGSozG1fpL4wKehl3dJ9AfGAl7dCcan
         W+0ymx2o26r7hTIGATlHrLfviAR8GzAV0Y9bzF5BvSF5YJFvjwIotz2WamgVkVItKEAE
         m+FX9VnHMhPgGR60v5vOGMGVqANWjeT7M5egNUUCn+Mlu2tY11wpgzdzAK6LMW5E8ZN7
         hejhpvurFo+wUisU6IhU76ByA5CzZRJFInwTuzfmpdopurWHwWqvJoPFu12liQkKsOga
         zZAIiziNbMANaawkQTW2IridqvatYxl/xKGhdk3s3e8796rUGysgfhG7eHJEsz+WG8uh
         +YkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoenE7sFCD1lRyrO6c85NseGL6J0Qy3HJxebJVD39hWyAM//+9jMsTVKovUv3psT4H+9TkykG8RJF6@vger.kernel.org
X-Gm-Message-State: AOJu0YzsKk5L0oFnkfoYz5PcXGA1P7kZm2AFunVw08kzZYGDD7OT3Lmp
	kmYIPt+XeS8arE0NCV6aQNI/CZkEUdwO9OWQpA1qH0HPDtWnxtZ0Pif0Pc0zJQvPsnTFxS7KdAh
	GJ9lnGVX9l0TWUoAu7U0I6fFUa4eObuRrHQGxbCWc7xaHBunQcmDv9RwnLipwJc8I
X-Gm-Gg: ATEYQzyfKnhGCFGf2mqnSef81KE2E5XC/OlgksjBUtLGFfN7sV/moxHGqnf5g6SF1fm
	moIePbN1+uFwCHR1r9NEYuLwrkITbpNfezv8+1+zD1G3CddqNNIFv9ra+ysNY/0Srt32xvu57ys
	07zsYRFV5re3BcJgCUehWAvly1ZEVfaIPfKG1GpXK8B2wGhARe8kdhbJSqu0pOCmKCUVpx/6OXG
	4+Lc3ov5xNJsg8aYKyH/QZebcCKmIkrR++hFtyVZe+e4UtKsfwwX9x99J8xdRNHDJrhOnw4ydSL
	m9DLg7UE/ZjlgRU1FjyLgauDM9PL9ClUNFoLOsLKLB+JPjWzQ44QS+Vexkf8XvrnHU3EdbKJITl
	qfaUL4FyaGacCuSUz9OKNmw5nTVjRNnrU7Fk6O6GcnFLMcgl9D73FfzAHZbtcbNyay5ylENNVeX
	DQ3dw=
X-Received: by 2002:a05:6102:5cd:b0:5ff:c831:b99f with SMTP id ada2fe7eead31-602aea9bf0bmr2055938137.1.1774275124432;
        Mon, 23 Mar 2026 07:12:04 -0700 (PDT)
X-Received: by 2002:a05:6102:5cd:b0:5ff:c831:b99f with SMTP id ada2fe7eead31-602aea9bf0bmr2055906137.1.1774275123819;
        Mon, 23 Mar 2026 07:12:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335de3d7sm506512466b.36.2026.03.23.07.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:12:03 -0700 (PDT)
Message-ID: <7993130c-5de0-439b-9263-69d6f327f5ab@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 15:12:01 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur: add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260318-add-coresight-dt-nodes-for-glymur-v2-1-d76e08f21fa5@oss.qualcomm.com>
 <ef89e328-fda6-43f4-b40c-8834d16e2cfd@oss.qualcomm.com>
 <7972211e-d735-4401-ada9-b83c7b96b612@oss.qualcomm.com>
 <a73af369-b122-43d2-b28f-e97ab33352c9@oss.qualcomm.com>
 <f28fe058-d1b7-4d4f-8751-54117aba95f8@oss.qualcomm.com>
 <acFGhpVWaHZtiyTq@baldur>
 <d8ab2410-8d67-41c2-9a11-384f4a6a8f07@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d8ab2410-8d67-41c2-9a11-384f4a6a8f07@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExMCBTYWx0ZWRfX+pxxxGIE/zOW
 8Is9RFULXsEZ7/Lyvs/OkiZx9zx3+xxkxlhunIHdFts8smPoMsI8LjPz+8eEmgogzZp/KgAH/t2
 yIYAX7XSQK6sMf0Hx4UgIomt/7Wr1VE/i3o4tKfK1zE+zP5OHaadW/HvdOlZ1+9RCdZyppDyhaN
 N5WEOf+yANufqkVFdWjclBRlw2BvQqmbrdaEkl5NsCIIOxbtHnU+cS9tplkKzffMna+7zyEFsaz
 I67DmWYhiNbKjPisGIr8hzwfWvEWLnwpzLy+Ku8zC+L/yuDmRiWCZK73OU7EhS2bhcudM75/7Dz
 IbUAr0yuwgxYwxa8S0vgUHiCpiwfjhnqldynwM1wIewdGnyS3y/9ihqngmC5vNMVKV6IauudwOB
 Kxi0Gl7zMhG/avgmRYMkqAwk+cr/yScCXvefCJ/xVHFjOYHW/c9tDNwer82KeKu9g1y8HbEXP/S
 IAgrJT1rOP4G3Nq25kw==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c14a35 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-Kv4HryMW5DkCN7ewZcA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: 7SjBfEG5AnvTfxv3g2uLEYFdo7VOpoae
X-Proofpoint-ORIG-GUID: 7SjBfEG5AnvTfxv3g2uLEYFdo7VOpoae
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230110

On 3/23/26 3:09 PM, Jie Gan wrote:
> 
> 
> On 3/23/2026 10:03 PM, Bjorn Andersson wrote:
>> On Mon, Mar 23, 2026 at 09:27:41PM +0800, Jie Gan wrote:
>>>
>>>
>>> On 3/23/2026 9:02 PM, Konrad Dybcio wrote:
>>>> On 3/23/26 1:30 PM, Jie Gan wrote:
>>>>>
>>>>>
>>>>> On 3/23/2026 7:05 PM, Konrad Dybcio wrote:
>>>>>> On 3/18/26 12:42 PM, Jie Gan wrote:
>>>>>>> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
>>>>>>> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
>>>>>>> some small subsystems, such as GCC, IPCC, PMU and so on.
>>>>>>>
>>>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>>>> ---
>>>>>>> Changes in V2:
>>>>>>> 1. removed two cti devices due to GFX block is down
>>>>>>
>>>>>> i.e. "because GPU is not yet enabled"?
>>>>>
>>>>> Yeah, these CTI devices have clock issue for enabling due to the GPU block is not yet enabled.
>>>>
>>>> Do they need the GPU to be online, or a clock from GPU_CC, or
>>>> maybe something else?
>>>
>>> We need a specific debug clock inside the GPU block. The debug clock only
>>> can be enabled while GPU is online.
>>
>> What happens once GPU has been delivered, but for some reason is
>> inactive and we try to use this CTI device?
> 
> We will check these devices again once GPU is available. We also will cross check with AOP team if there is a clock enable/disable requirement with the specific debug clock.

+Akhil for awareness, this is probably a solved problem downstream, but
I suppose this may be non-trivial with IFPC at play

Konrad
