Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A2832B10B
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187810; cv=none; b=Opd1HC5a0IB9XNWI69g/0h9ESdNobPiPDJ8SV0VSeehycngyUY4tQmOCswlX+/MOw/GswLzvjBN+FxdislAQSqO3DKDgGCzlWB5EMYapiTj576qAE7sRGo1cBWtTzKmU/i5f2mgvhjFsj11b/iL7708kwSngc5JTuM9eMgmCLis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187810; c=relaxed/simple;
	bh=59a1bqAkNbTTke8UBP+MFLaZilRvk7+htDvhhaKSv9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WW9GsmT4GZVSUG/IpG+OkWbNQrZ1qoX/d0phxaBfNYsLJYZ61xKrTzkV3LXliGEPAnmp12LQWDpjZAr8axBOt9ouVIajkcWRP7+IXLLUVf9DLNI5+IpLPbrqX4DTziE5widzmZotMfhL1XZf2fst+PXhBYRd65rtGSFgfjnr1hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAyjzPjW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DtVGiYRr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAyjzPjW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DtVGiYRr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9Lphs4062966
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c8Rmh7dG3rOXWAKkItGDmmHDLB58CWNuH+BpEhhcO/Y=; b=hAyjzPjWjojtzeDt
	TOYs+UUd/EOFHtMLh4clvmq+5OTdBm1gt9YQ6l2QK5mvZrmZXkVAdVLK4ifPdcql
	eIecm19gQgiEnZVkABvMUARYhHNs54NplzF00/LMoC4we0TXk7UbiP05eFgHYMnZ
	/lD+duA7nTeGNIWTXncXJrfUQ14ql2ziu1G8SixvuC9VqSMMM8aRNen+IGlqMdFD
	5EfmQcb6UmKNSAwvlG4rwjpycmHqQ9Jpat+EN8OHJJnkUwMlqGJkoVtqPZl4Ixk2
	4XM4kOTaIn+5SA73fqheR3whr3mQoasdC3kUeg2Ok5Ssw8AIzDoEF7YAticVZiNd
	vGYmuQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8n5u0bd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:50:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd1dbcccf6so40254945ad.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 03:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779187808; x=1779792608; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c8Rmh7dG3rOXWAKkItGDmmHDLB58CWNuH+BpEhhcO/Y=;
        b=DtVGiYRrcztgXmyBD/15Nafn6I22UasbguaQzlXEi46DMAaGAglW96h9fYhp5KMCbg
         /ifYUygJ8zuMhI66z38G0Sei2FhitUZ0zhopY76U1gPbaInoObG8PTce/ohOPmuJ1alM
         dO6TrHO2VCLgcO3OmkHlavaSn+JM+EiB6UA38JXcCn/UujC2Iabb9Zoo2Ig0TsieyaAg
         PECFW7zXIR5aAN/P73EyMwiW6CxeJ3fVOk/aYN0Es3/gsyfrJvYy5heRCGVfIGMIL3SI
         ktL1dXa7Tfd99XHhKQp7+8bR8s708PtfoncJpkLcBap1gza+9JAOLiiTbioII4e/PADc
         wFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187808; x=1779792608;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8Rmh7dG3rOXWAKkItGDmmHDLB58CWNuH+BpEhhcO/Y=;
        b=IVmOnjncXmesS7CLumLghVirIQccY4UiMH4jJWnEt39EpeJCWcTwlPKytUWQdJWlSk
         hR4SxttOWOc6zPxmTnENEbPixoGFedoC3aNTxaa4E7r4YGvsCISQbqsTTLoZy/3xhIoy
         O/8EZaJkeohoHybHyTosVMk3cKPcGS06wr/7DQGgmmRy+3k231lx2QZ1oke3ZwZ0XRFQ
         3Bl9FWQWQ1YM1vgK58hcujWOQQ5MG2aQgr5GM+awBBp5Rfh8dLES/lPyIJ64KEaUM5sc
         tFnZvUBLCeuo6H6LOb0uXime9aOoPEU6i87auwk/0w7w/n781VMOXuiO8/OmVBbeUYeb
         Qupw==
X-Forwarded-Encrypted: i=1; AFNElJ95sHGIUQvesD7x976K0SWlhwlA+TeMlMrWf2lobCZ/x5DGcZvF4tY8rqyl8phFB/B2A6ahnxpG/+mA@vger.kernel.org
X-Gm-Message-State: AOJu0YyrEN06c8OJH6C2dgnByyjMClf4RL5yqNwntPFE4Lglij3PtnFd
	zMng7e4uA8XcUHxrMe8PofXRkk8pK2R/zHTvryNW4vTl32tSUhIXZ3nf9u718wNvoTuGKp17M1j
	vgBxF0NU66XwO+FBMPGbI2eLgTh8V9rcAihc2yssNoa87YkcQQovXHI0chmmeLg4U
X-Gm-Gg: Acq92OG/h77E5LsQ3+LIis66OHyKUY6bFnwgS0CDDy40XsFHK6PmMrg40F+vKpYHowa
	5ikeT7Y+25ErCQ0lP71j+896Z/HSo8BAic6S5i5bNdTExY0hnUsvHHEVOmdpCBTYgSK5x7ZJYX1
	s4xerkxeZcOM6jzX8FDsFgZLMCb/sSOYf7oZF6mq190JOwzH8eJud0NZo5DDL/E9VSmz6OY+FZ8
	OXvES4zbFTYM1L6HzKIL5n1SwBXyCSnbVI+FazFRHA00P6VnR6Rg7hD/OYX90NgGSHPtimz6I3h
	7GSKiQyLbqvbmmRP11t1KtwrSYgS+zjkpHRUxuB+qoXKsPA3cQCfn+aNPs6Kj2Q7Akx8RoNxqfS
	Wm3qVXaUYsDZL9h2IC2T5zmhRsvFB2Ekm5i3F14eier9XMZ8dL6I=
X-Received: by 2002:a17:903:f8d:b0:2bd:49ce:d240 with SMTP id d9443c01a7336-2bd7e7e3ca0mr207297255ad.5.1779187807707;
        Tue, 19 May 2026 03:50:07 -0700 (PDT)
X-Received: by 2002:a17:903:f8d:b0:2bd:49ce:d240 with SMTP id d9443c01a7336-2bd7e7e3ca0mr207296935ad.5.1779187807266;
        Tue, 19 May 2026 03:50:07 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f2dcsm180876345ad.13.2026.05.19.03.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 03:50:06 -0700 (PDT)
Message-ID: <fbe2df11-d662-4df8-9059-a64e90634ac5@oss.qualcomm.com>
Date: Tue, 19 May 2026 16:20:01 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Nord ICE
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260519063505.883379-1-shengchao.guo@oss.qualcomm.com>
 <20260519063505.883379-5-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260519063505.883379-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MfBcfZ/f c=1 sm=1 tr=0 ts=6a0c4060 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9SpUgLBwT_rzJ8k7LZ0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: dM7hR-ghfC1abTNyLOpRF5B0D8JEHNXw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNiBTYWx0ZWRfXzVt4hMp9Y7wQ
 1oKg9f9phGIgHfY+fq9FDwGvAcFaQikZSY3uC7b1U504cYOtdo7LHfkVFcs7bv+6OpQz9tXpf5y
 76wm8gO5kzV3kuAErb+zH/vN4XWkkxOq0NLQo0FeEHoxe+A2M6uzDaxDLEfleq2+LGQ7EXbxgkl
 x+SlFXX+/+zAafJpyNwjGtbNnWhdHX3i5/Smll2yO99nwDVCZycAS33kpN3FgNbhc2RNXJu3YLU
 YZaGugmnkH3GilAt4vWuR8Bs/gOv8yo3zyfLNPCDnmru0nQf/bBx0n8JIBEzrLPw/mc07mUCHnW
 dIJI22koJLqzNxhrROXlKv4+MZvQaX2s352GaqWY063+3nS2VE69KvgpySRM7feGTAjjggMQIwG
 fAdJmVCxBLQg1XcEU1HXBMWFjXBb30tRkxAJPnZYwUe1WD3wB1z9vMIDcnPbytChNwa65Vo5acG
 UDtA/cne/5Z61ZZ3Baw==
X-Proofpoint-ORIG-GUID: dM7hR-ghfC1abTNyLOpRF5B0D8JEHNXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190106



On 5/19/2026 12:05 PM, Shawn Guo wrote:
> Document Inline Crypto Engine (ICE) on Qualcomm Nord SoC.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> index ccb6b8dd8e11..c497528826a4 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> @@ -16,6 +16,7 @@ properties:
>            - qcom,eliza-inline-crypto-engine
>            - qcom,kaanapali-inline-crypto-engine
>            - qcom,milos-inline-crypto-engine
> +          - qcom,nord-inline-crypto-engine
>            - qcom,qcs8300-inline-crypto-engine
>            - qcom,sa8775p-inline-crypto-engine
>            - qcom,sc7180-inline-crypto-engine
> @@ -62,6 +63,7 @@ allOf:
>              enum:
>                - qcom,eliza-inline-crypto-engine
>                - qcom,milos-inline-crypto-engine
> +              - qcom,nord-inline-crypto-engine

Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal

>  
>      then:
>        required:

