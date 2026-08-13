Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857BF384232
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 05:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786599868; cv=none; b=JaaxBpLoyqTfZbPeKI80ncfnDs8hU+49mLTI2+Css0vRNRReqb9D1Lh5jSH3fVTeuewotwZD1Tf/Fi0E/4n1B5UZHqUT9TOyygP+Ly4sRM1z5bu9Vsb/PpL36tjrrurtCYbv9IAaFxHmV7LboxTHUW+CJLmJRVHs8h9rJEllStw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786599868; c=relaxed/simple;
	bh=g6oJg/Wix5fascMvaALiT0Zn7yvaBsHIpgvDAU+lOaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DfQbQy68ZFsCmukhXRuI25puomfX6SHfqpKVEa8L5jnjujRkstn2AcehKnz3DBOeJJeiRDyDQMaeJY6my2+Lm54kEUDRWQ+ZS6dyYHT6MPheoFXJjvNd64DkIUzN9aGBwDQfcVE5vP4MH9x/5zk1/zLYWpzYFqECirvYGl3x+kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=em/HfRHY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gXHRylJY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="em/HfRHY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gXHRylJY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5g14m1875131
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 05:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cj98xFQ+WF1yTj5Go1S0ghUi9J/j7bnJYnZpCsgWlbQ=; b=em/HfRHYYzOUT71/
	mII2sG+G+jMJV+B4nPQV+6/aOIUMpPlnAkhbi1EHZ94zHAb2caWQcyuGVwIfoxgA
	siNeM7F1Lzx04L3NFNnxaoZ5O7VnmUgefZu+Tz+3CpvblpMxnW7Fl6W5L5pdqPeH
	NASzGtyCvris5nBvSh5/lLBzTwHr3Kprb/ASZFgyZxIqEcct8dwjgIm/lqBFL08B
	DTVOyN3k/Q2nAa0PGVOUW+dEqdlpAIqnY7eVPnaRiUNqYA142q12qVs12pzh2sVy
	Ok9t8EKiA7iE40U4zldGBcwvVrG8mqc8j6wV6HqpVasflzjEpdY5jjJvwUnhegB/
	sl8/xg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0wt8tc3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 05:44:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc88e22f92so8996455ad.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 22:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786599866; x=1787204666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cj98xFQ+WF1yTj5Go1S0ghUi9J/j7bnJYnZpCsgWlbQ=;
        b=gXHRylJYFzhm97ZF4Y07ynsxYzB4iySFCfbSfqtXKgJI9aREjtQwhFScg9R9E+Jlvy
         vMLkMwVwOjYx9lkaiOSTUuHLKvUo+/+oFgeMl1XIu7tp0YtC2NpvPuHiV2PMXZTzMrRn
         JqS7qNKs60+lQwsgQx2K5RU41kWiqP5IwZ306weAH3CMHSPfEikCEGyecSrv2+CUZHu/
         PImMQc9XJ5C6T/O6lC7Y3ocwa0dGjXjRcfq7xJFC5hhwSLhvqxoqe65hlhp1M7IJkNti
         j2BlZRQ2vza3D6w9uBeNWJSD6KXs6wONMjyGmc4Ax8ZoE0/Ux+5tA2dQYslu6nywDFu0
         3ZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786599866; x=1787204666;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cj98xFQ+WF1yTj5Go1S0ghUi9J/j7bnJYnZpCsgWlbQ=;
        b=IHriUBb61ZUbPKNe/BUlOsvJKOhKQyW5n4a4m17txz6cizhSisyxBPjiFWxLtaFu0G
         5AJ9Cviuy701BonOlzk4F5hifXSuiruycmfCkO3PMtXJEpTJ3NkfnwBwl53I4LSW5g7M
         F5oB1JLgBDbUxhEG6K6kH8wcO6HN7Dac3HoHKhBsGLXczHQlsahnqjx6sG1/j2ddyXNy
         fbVUpIuv0gnd2Koeg0L0bGgXzRW6yss9rwEGeUhb1iYdWio8HgHUYu55WZ8Kpog9lc68
         KnZiw93g0do89L43Br/+BIewKuR2RTNaAuUV5my1fg4nCNf/YteMHDfnU4GyhrIXsYyR
         nspg==
X-Forwarded-Encrypted: i=1; AHgh+RqRau/kbGDCJ6YhNUr/SoBOTO4myxLARbY2evL5XBpxNZ8GQcjT41HJsqXDoqV+zs0O98nK3/qDgXvb@vger.kernel.org
X-Gm-Message-State: AOJu0YwjYHPzUQcaMdAHUHPJMhE97JmjeGTlqLnSjtVk5gPqy/PuFu9F
	zwp9xk9qJlZzdyh0Ypl1xFxw6AAF4fHMD47wcMm4MF9wMCPtWmJIJDImuIWyxsztBQVDDqy03Rh
	GYa37eFH+17urIzxtkWL3Q2vdsvkYSu4uDitUWBgk3j673mRKejIOGlHSVwk+/Uyc
X-Gm-Gg: AR+sD10xqkD2VpKWmf3gkUOQjOrHDn3mx/j4qxc9LN9VQEFZTvjfWTem1xO5Q/9mzDM
	/MhsZDP1wLNH9nDKwU4nIGacnkaNyfejev8vLkJ79JkuR9cU4aOid2jJxAFhxnw8ldidigAep64
	NSoUKkcWFZCFMsJzJABsrc7fhUzOM+zDt+slsm8aqKBH5xu6ir41aoPepCQ+Fbegl/ZE4ceYs9n
	3qlt36uB21JsCFHfuU+qaxO9xstzJhHV4oWgHdnl+l4LdgwoeZDc63VOe9LtfrFue7f9MtmDRf5
	ik9CJTOklnueGCGlgGRutC1EP+wEDI5Q64TdXVWCQsUDsjMQpW7RCSl0VrL8vzThd23Ihn4mYBj
	iwaG8RFTn4yYq3IfRR3D++O49XGB2o5K4q3d0VZ5kS4G71RK+uXAEZHPkxiZ2+IbSWbtQLjIL1S
	hV0w4VEClVNy7imfhaJiGFZagFeA==
X-Received: by 2002:a17:902:e5c9:b0:2cf:906c:7d1 with SMTP id d9443c01a7336-2d37ebc4a76mr36501765ad.20.1786599865981;
        Wed, 12 Aug 2026 22:44:25 -0700 (PDT)
X-Received: by 2002:a17:902:e5c9:b0:2cf:906c:7d1 with SMTP id d9443c01a7336-2d37ebc4a76mr36501315ad.20.1786599865289;
        Wed, 12 Aug 2026 22:44:25 -0700 (PDT)
Received: from [10.79.117.11] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c48042fsm4358025ad.55.2026.08.12.22.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 22:44:24 -0700 (PDT)
Message-ID: <c9460884-b09b-4227-9f81-8774259f984c@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 11:14:19 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Mark USB controllers
 dma-coherent
To: Greg Ociepka <greg@ferrisoft.com>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260812154014.123315-1-greg@ferrisoft.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260812154014.123315-1-greg@ferrisoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YLqvDxGx c=1 sm=1 tr=0 ts=6a7d59ba cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=a8UEx8NLAAAA:8 a=i1Pha25J8sJlEzR877YA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=-yeuc7zBjbfZT8aiaP-D:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDAzNyBTYWx0ZWRfX+Epmv/DW759S
 DM4MOwVIOuk5WGg6xnZiNoHUtWkAuwmzp4QPdENTgnXfgcgFafPjDe7lGn0C1vuq8zDE4kz9wA8
 /O3M6QWcKAG1+6hEzmwHyF8EH/u6gHke5yHPUjH6zXT3gOldlRdByYf+D1dKfaKt35CgrDhWYji
 2ZM4AkZdB7bQpHNf/QWk31QT489NQ1eNwPueGhSp+ssAysV+m/uzbmjJp3VQe22hOaQurkbv1i2
 S5nrYRGhMGV0Cad6X1QXhYOE3yL9BaYPIyGG6ufVLc2pdjjZbCAXEek9cF11MYadKyeUu7D/7it
 h9xbjRHXMxSNipSEkKJKa3JoZxQmrwnPYGZzjK4QCanMTRcPiIhbwYE7wr4LC/0d22TlMf9dJ+W
 6bir3MPmqD72WNxELFMppwm03bDdAZ5Zs3gasEB0iYc11ZFFP5tFfDbPosIuVzCCDxnzt4SObFc
 AUI1rD11sFmREZpBwTg==
X-Proofpoint-ORIG-GUID: iAyF67FW2lC0051AfOlsRxhFUnUhrrYz
X-Proofpoint-GUID: iAyF67FW2lC0051AfOlsRxhFUnUhrrYz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDAzNyBTYWx0ZWRfX3j0w0uiA1poU
 Se+Ubzwri1HDjUA3qLA35Qe6dg/v8kkvfgg5HPHfxeUvWIXwJ+Lb853GmPKdaUz8rD5D4lcleIT
 PrHRKtTvRdRKLeOq8SkT4urh+dV4uMo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130037



On 8/12/2026 9:10 PM, Greg Ociepka wrote:
> All five USB controller nodes on Glymur (usb_0, usb_1, usb_2, usb_hs,
> usb_mp) are missing the dma-coherent property, which Hamoa carries on
> all of its USB controllers. Krishna Kurapati confirmed the Glymur USB
> controllers are dma-coherent [1].
> 
> Without the property the kernel treats USB DMA buffers as non-coherent
> and performs cache maintenance on every transfer, which coherent
> hardware makes redundant.
> 
> Follow-up to the clock/power/bandwidth votes patch [2], kept separate
> so the already-reviewed patch stands as is.
> 
> Tested on an Asus Zenbook A16 (UX3607OA): all controllers enumerate
> their devices as before and a 64 MiB write plus two O_DIRECT
> read-backs over USB mass storage produce identical checksums.
> 
> [1] https://lore.kernel.org/linux-arm-msm/f92cc91e-6e5c-4375-aaa6-f079a165f4b5@oss.qualcomm.com/
> [2] https://lore.kernel.org/linux-arm-msm/20260812083522.774711-1-greg@ferrisoft.com/
> 
> Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
> Signed-off-by: Greg Ociepka <greg@ferrisoft.com>
> Assisted-by: Claude:fable-5
Reviewed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
