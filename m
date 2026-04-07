Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D094C346E47
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 02:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775528639; cv=none; b=YQYeBAD8vvXqoCOXg3NNLm3yVKDaMn8cFfmud7JVZ0s2DA/y3a1RRSiEATdJbJrDpMcF3aFwPr56VKWdJtIW76nSX0D5rMHf91uJvR+zTyctLGjNHgcmE02U+cnsLMX6uR1CJJAQbMCC8h1J4OSBk0AespwOAGoCoLlT7xV+5f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775528639; c=relaxed/simple;
	bh=OPzVQ8wK7oRE94NWpDt3lDoeRCxcICiSYHbJxWI2KLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WqIhFYo9yQRrIkpb2YusoFpTCV0xbPGoyl43F268Bm7XKuFHixyFxVlvVshC6PeH9SWzAvNH4PhoEoC2AoqcoL8t8WxQTZX1pn/Dwn8R4Fa1tK3CEN+apZ4srCub1hqZ4lsnPbKegOKU8w0qN+X9HnKzTWOd8g8tizl+1DDsTgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wkp5wzwf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YqSvaH4h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wkp5wzwf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YqSvaH4h"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LRZ323404395
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 02:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8+T64C2shkeuX9nGP7xkHlGtnZEAVo6YT0+MuiSjWM4=; b=Wkp5wzwfsLYeTN/S
	OYG9JfM9mtWQwaHUdX4Vb7bX45ku4I6lztTxJQxAnEkmSHxWnuvMtTDE3mYR8CX0
	dl3GdC1AMlYfjkil6mVniB2VBY1elYgGesRLobLjMb8o11MyVdWUbxNSFovRzIR8
	MEaUgWdxZx7al4YKNb+EapD+UyNWvzTUzPjR1x3mHyAbFbEgYot2wLFdXOc+PqHx
	rnpVdPKhayoCb2PuTLflBw+4fe/70GAj7UM9LwSniSaa3hFFXVEXk76vOeI8c1cl
	ZE9CD8vxEPcnJ6G4xsH08JOEwTBqmVpVTwLWf6PZF+/gGj29dLlKZAugKAGQhs7W
	4PEwWQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrhrmuq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 02:23:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b23af7d7e8so128375335ad.0
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 19:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775528635; x=1776133435; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8+T64C2shkeuX9nGP7xkHlGtnZEAVo6YT0+MuiSjWM4=;
        b=YqSvaH4hD3KfQmgzJaHA3teYfIV6Y1f4RnupHetP1Zbjq1+Z7sLwu2dyK0ndV3VC+j
         le6XoWHPFxJrpPdYrPOoQ02B2PKVU0bM9zjFzvsRPZXNzlOoniCJ5ROz52dSxFidTU3t
         5w7PHjR/ep4aDLlNuTevIo4hDW73HGqXz8Bu+E64B1ULfwm1Aon1WnCPfVytheTxzYxM
         9HMAYHzGNWu+L+KbFBuLAX93Vr8WaeizJD4x4YvljvmtZ6J2NmnUhxYs4o7sT04fEbda
         vvU0UBzZbJw6zvo/02AnpVk/hffxEM5duhvWWwmgZG3pM8IxHXydUZEl+uzADCS1TeNB
         xdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775528635; x=1776133435;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+T64C2shkeuX9nGP7xkHlGtnZEAVo6YT0+MuiSjWM4=;
        b=VeO0gq0bCQ7eweA3Te4CKlqQhaJBnoUTXaiQqM6C9MYZWEYJv9nAF/TjrWQNSwUSY4
         A4Yzro8HGuL+A1MseBAJ7QwR9QnfPVjKPtehWT9G80ibgMnPG5LORUMhJOolOAsPMmaY
         7Rki37odcuIjO+6rRTWF49MvSKLK4H/bw1RjphoLMulaW1zQDSE315G0lzMEugFp0/2y
         0NCEVHu/mwo8SDySXQk4/JhGi50P3+Ueuoi1CatffU0xkHM8zKmOv+l9rWlt3utaSx6s
         k+Q1N/DrdTc4PSjr7942bt0Lv+bfQCOoUs+fz8Dw3QNTwPMZXBjEI3z4lcXf4C8UZl5m
         EV+A==
X-Forwarded-Encrypted: i=1; AJvYcCV8Ge6JyTyh3IZ5SY/t6pIQJ0VPzJzxEFuvPu6hEoeA5pN3XvhFTW32n1i8n8wPMWSapVI9HsupZZyU@vger.kernel.org
X-Gm-Message-State: AOJu0YyrkKWVLGTV61sTXgbuX6WHm1usIQT+AoYYqfbyQ+VotRtNZ43j
	T6C/R7qqbwacjv2gYAFDexEhpql23/p/izmRMl9w9yh0serDVMWl29Z+9wDL0pSKkUvkOCtY4Fn
	pIBcrlbs9UJ8rzKS4LoeQdNad8epPc0CKNTlv1wtqvWR4b+RkG/OINfEq20EM+8aC7TC/pdrl
X-Gm-Gg: AeBDiesVbSktRiAYmaY0vzwFzUJFwa2CrCN2AQl69DZy08aiLpN4iJyZ2/QAlJcZuum
	2CJYTnmCTuZ0i36HzNoACY/bzJQNRi9DKA8H111dopNOXli9Ftbncfvt/euM4siOb/k75cRy473
	L1siDMfxnhZe1ucdud5A5yTzOIe6+/w6oVEGirHTTvpcKmUGocm13e2y0D60u2zj/MRNmaGaRnr
	1/S6BiGyGt3bP8PWsVKGFg6Wo/nalvTI5WseBmtBChX3W56Y19Ziy26fEMcIqIwFCE+kCXdI3d0
	DDPG0/KonNpbcG1sqMjcgsqQjPTcikTSp2NRDAZiOGL150sfmVFSdYY2u0+ocjLHy+tyZ9z3pfu
	Ap6Ynk/kbIlTWvuq4851SBb7mz4M3pTw+HBGeFPaClLbwXDGuhvcB
X-Received: by 2002:a17:902:e845:b0:2b2:6df1:1108 with SMTP id d9443c01a7336-2b281867961mr157965655ad.15.1775528635544;
        Mon, 06 Apr 2026 19:23:55 -0700 (PDT)
X-Received: by 2002:a17:902:e845:b0:2b2:6df1:1108 with SMTP id d9443c01a7336-2b281867961mr157965345ad.15.1775528635108;
        Mon, 06 Apr 2026 19:23:55 -0700 (PDT)
Received: from [10.231.195.112] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27473583dsm153140155ad.9.2026.04.06.19.23.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 19:23:54 -0700 (PDT)
Message-ID: <09fb6efd-646b-4d0d-a0f3-9f6ce4b38442@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 10:23:49 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 0/6] wifi: ath12k: Enable IPQ5424 AHB WiFi
 device
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>,
        Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>
References: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
 <5a606f7d-6665-4b0c-bbbe-32538b2315b6@oss.qualcomm.com>
 <95face24-deaf-47c4-935d-0b48b5141371@kernel.org>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <95face24-deaf-47c4-935d-0b48b5141371@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAyMSBTYWx0ZWRfX5L3xFoCBWl1p
 rEVheotML3TNrvPuhs4GqxC1COY9QZGNWfVMjiDboudtPtt8gjOFPTokp/1KH0aF0szOWL9t1G0
 OUDeVaGsJuUekpKKI9n94YX7GXg4AnntyvBGyr/ejh/yFoHzSRO8ckB7+gtTttmnGtnEjoskuDj
 6Nosg3/9FyMjigQT02de4Mpt+OuTdcHITQ4xbrMesPdimD/In4zNW4UAdDv9nSi5FNEtgBEdnsy
 iEZMhyd6FeY/Q5nQGeTekAQwbViHqkLjJaKxZor/6ST/UUf4z9rRIzbAcdyy4AiA7Q0pBub4ahb
 KC4LzJ4tJIYj6PEhqySZBisYjiFNpq/nJ4P9kr3tMZtca15WMdUGcnE2KJlxU/Pj9Enzidw30R1
 EA6ZavbSxCgkRQiOybIqZZpkgEizntx8C1YQnYI3OY3jovUYna7+08xaA5/xQRkxZc1jrRsBjxk
 2vkapXsxSjisddg58iA==
X-Proofpoint-GUID: pNgn_2XnMe6-z31RVRI8OI-1txX0xTfK
X-Authority-Analysis: v=2.4 cv=XPUAjwhE c=1 sm=1 tr=0 ts=69d46abc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=eL9f3Vq-dHuaEv9KJUoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: pNgn_2XnMe6-z31RVRI8OI-1txX0xTfK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070021



On 4/4/2026 1:23 PM, Krzysztof Kozlowski wrote:
> On 03/04/2026 11:13, Baochen Qiang wrote:
>>>
>>>  .../bindings/net/wireless/qcom,ipq5332-wifi.yaml   |  1 +
>>>  drivers/net/wireless/ath/ath12k/ahb.c              | 36 +++++----
>>>  drivers/net/wireless/ath/ath12k/ahb.h              |  1 +
>>>  drivers/net/wireless/ath/ath12k/ce.h               | 13 ++-
>>>  drivers/net/wireless/ath/ath12k/core.h             |  1 +
>>>  drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  8 ++
>>>  drivers/net/wireless/ath/ath12k/wifi7/hal.c        |  7 ++
>>>  drivers/net/wireless/ath/ath12k/wifi7/hal.h        |  3 +
>>>  .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    | 88 ++++++++++++++++++++
>>>  .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |  1 +
>>>  drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 93 +++++++++++++++++++++-
>>>  11 files changed, 231 insertions(+), 21 deletions(-)
>>> ---
>>> base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c
>>> change-id: 20260331-ath12k-ipq5424-cddb63a46a97
>>>
>>
>> only nit in patch 2/6, so for patches 2-6/6:
>>
>> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> 
> It does not work like this. Replying to cover letter causes that all
> patches will get it. Provide detailed review and response to each email
> in such case.

Got it, thank you!

> 
> Best regards,
> Krzysztof

