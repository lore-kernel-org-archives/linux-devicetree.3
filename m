Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4C447D938
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 15:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017980; cv=none; b=O7KMSIkg8ACL4ZQGNLfO2PGDX4QT+kLHK+yfI1L/7F6bmd2AN7ahYb6DEsJaBaxDye42y7SxteP6tSKaUqQLjAxjf05N9fV2cOh3a4qC2au2Z/4AHT1IUztHj+8bKMLmPPrmADIofRO4WKD2U+VKbNYzq6d2P1F+UwXNS/3lo2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017980; c=relaxed/simple;
	bh=82rPiIP0YAvXOj5cPODTD5NH26/JVRVCRNihB4/5Qlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JmEvBOqCbHwSBQK6OhxxbPQi0prfEWH8lZxSH/qnnndLC0ih+70lRVtp+zV79TrA8lTSaxb95s5gfjWVD3q2qrQs6tHWvfY+g1twtQDmFyPipaAE05IeJ3Eqoi/9as4uNFvnygJkzPTdvHnxQUD7lonjIvp2GdL5YpEWK1ShJAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQsVtw5g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fy7hf1i1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQsVtw5g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fy7hf1i1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClGJW2251543
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 15:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mhOnrD0Ngw0/aZVLSpJGyyv3d0d7bAPed3nnx96ANaY=; b=CQsVtw5g95+5D2dA
	hKo2dx1+w5pfI9J68sboglEg4VakcxYgph2dDRff6Arufpcbd3B3PLJjZsrR2J0D
	7E1lR8GU5YEnB1Q4l2Q48+6WAsyO/htAZYYvKqES/RCWHQMq3133zab/4K8ATR5M
	qJJgqsvhxgnjPWj1QMQx/088Vum6PuFOyTkkCwcJOXDMg6d4XMxbQYTpbS2DIU+7
	BrP1YI5nBhDgHgpPcbiKGYMCgB4VB/vOM7Qt/5nh3ENLGXsMEyTOw08EGmMzNArk
	csdKjuqgWNu+YAA1GlhdQlpD+G/2YpSXlW0DoHGxnEHwdjJ22C60ltenCZPU2/+A
	yrJ6lQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqgj3c8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 15:12:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91550f68e7cso148577385a.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 08:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781017975; x=1781622775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mhOnrD0Ngw0/aZVLSpJGyyv3d0d7bAPed3nnx96ANaY=;
        b=fy7hf1i1pmYqRp1HAq/QcNzpQX1eUb+ffBAAYB9SIzoSqJXkg7v0NKBDpB9IqAonlj
         JeuWLUYTQJXwIV/4eiu41ACvW95DdJ11rQePFzlMzG0yBFT1N4IbgLS0F6As8u51BJNX
         XzBH4ZQA+Em/lkUWuv2xjdgeKOGCHxPJ8xaTJHhVvr1Khr9JAai+cj0Aa9kMFken+NiD
         +70xLanCce1F1MfLM31TGWK5DYvja1BKKO3Zuczt0kqMIFjZxy2VUlUZw9QBdR/TA2QS
         Xv/dznzPxnRIHM24/kfrdWInBfhyNqfKdrxE30owoEX0ht7VBkQxxl+GxE34kjFbZgzq
         Wraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017975; x=1781622775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mhOnrD0Ngw0/aZVLSpJGyyv3d0d7bAPed3nnx96ANaY=;
        b=Yg3qyPORv6Qg+PVvMvtquLVzWO46ch053OvbQDGtf1imtmC4kssGOp7DOB8HY4Lej3
         aVcyq7+zAlWMLunickbIsKxMgXCDRFKuiTp2uHiHwbctDo5Sg1FpG9NEfeWQJsEo3erV
         UboyDrllssWPG+ABtEE6PTY+fJjA6jG3CCGlq/w79UKMevuTnhqN7IFpcA86RfYcfPku
         g7AEQNzNuWzoRZSYvehWZlEbuP2aod3TKcPWPN18kSTQpy9MBdacdqF3uf2fV79dN7nU
         AfM7c2HNNJsfSa0NT95YjIXH53bniTwGsUZ4Kx3B0LhQpGUFXOI0kDfHc0lWmrAWhLP2
         tajg==
X-Forwarded-Encrypted: i=1; AFNElJ/2fdfPxuewfgWvBwNBHGm9c37F+NvE7DIHwEtQzfswc8BguqkUxa87YYR9HqQ/QlIDDTwglsx1y5Vv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8rtcKO2dOX+5u8Hs03ANeIBPkWbhqSGI7xFSDIcy79918JKSC
	LYKcIBW9wHtk8ORhP0dOjkbxgbgWL8qcL7V4vqYEZbuIQk1OiKWvCLkElJp9YNMuhYD9D56KZpT
	5jBRhQoin1fFoE4T2oisFDy2hI4leUeXNa9I75pxLaJExIuUxAx+5bgcpDOjRgvwD
X-Gm-Gg: Acq92OHeZuu2j8FV3y4p5pB7XXHrRtTX/POMjshcq6QNsYqjeTcZ2HsNUfRH938NlaP
	Z800xq56EPyEjf6ydj2QidM16XRfVokVQhJv1slrqxrpWCJ6FvAMxkCtAErtkB2EJQPUfUFL63m
	boQcsxyRQnjCn8BbHZuyZqlibMPalrh69uwUm/npV4P1f23VB5HHAeONtndJ4AKZGd3ncUZk8ck
	yv2bipkxIS6UcxjsboSDNUk+dXP7Jg3MzdmyF+6b/R9DLaWSSD3NgFKCxFveWriYHrfLZ4iW3fi
	UiD7I1sNlUgrAAICjNenj6GS+pB6TYGb3fdTzcNEx3W9YFU8g35pC6LJX8GDVu3JmU9MK3hUWgu
	FZb4+zfwEV659p8D+NihN9ZfmxG1EryXhtm30gFXXNL5qdTtYmn9JtV1Y
X-Received: by 2002:a05:620a:4042:b0:915:8055:3f9f with SMTP id af79cd13be357-915a9daea76mr2004996385a.6.1781017973344;
        Tue, 09 Jun 2026 08:12:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4042:b0:915:8055:3f9f with SMTP id af79cd13be357-915a9daea76mr2004987585a.6.1781017972545;
        Tue, 09 Jun 2026 08:12:52 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6914f3b583bsm4849171a12.29.2026.06.09.08.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 08:12:51 -0700 (PDT)
Message-ID: <cca7e305-bdf0-4ddb-b299-aa25a183e229@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 17:12:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: ipq5018: Correct CMN PLL reference
 clock rate
To: george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>
References: <20260521-ipq5018-cmn-pll-rate-fix-v2-1-04b28a92e0f2@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260521-ipq5018-cmn-pll-rate-fix-v2-1-04b28a92e0f2@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0NCBTYWx0ZWRfX9dwhvblCozzL
 aQG/RF/vjVmcOyJlkT2hFHhQWkLJtD0Evqkoet/plafkU6dXzgV2nSDUw/A7QREVeJPIwJcHb/C
 VHIdK2kmjN/zw6kUga7gFzjQi6iJMnDTVBsOXuUEdiL6lbLn94QCX+LFrO9HLxysgR1Rl1uFLMv
 cFYqMNPKycg8k/NVyYumJnsdbZyQrM9H6jjbfOa/KTtebXtsLttpvBHpo6PoF4LP+wQJUyes2GM
 pG0QRn8iqDGk1CiztdubOqp2EH9EUY+mYS9vSCMvFKya/lvqtO87eyqZUv/4JhvUeOlSInJJJTs
 eghmytfoT5qGtl2okToIPjC8oYfHlU6w8P/v6rZmY1t1W7JSlnmlFgKmIirw+CPg/68rn6a9etG
 lWRxTsfQ/XpXL0Xws4eROM6CzJG0Dq+b07Hs+ODNbKwjOOFObqA1NETZ0AILezABIdh1etzZZHW
 5YZd2XoeaWNYMBy8rGA==
X-Proofpoint-ORIG-GUID: gjzhBqb9WqHybWpySafvoFQgScBTm-rF
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a282d77 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=uMLbdMa3B9XRMCKcfW0A:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: gjzhBqb9WqHybWpySafvoFQgScBTm-rF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090144

On 5/21/26 9:55 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The correct CMN PLL reference clock rate for IPQ5018 is 4.8 GHz.
> 
> The CMN PLL driver did not account for the ref clock divider which is 2
> for IPQ5018. Therefore, the computed rate was twice the actual output.
> 
> With the driver now accounting for the CMN PLL reference clock
> divider (commit: 88c543fff756), set the correct reference clock rate.
> 
> Fixes: c006b249c544 ("arm64: dts: ipq5018: Add CMN PLL node")
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
> Changes in v2:
> - Removed line break in commit message between Fixes and SOB tags
> - Link to v1: https://patch.msgid.link/20260519-ipq5018-cmn-pll-rate-fix-v1-1-3c83a173c27f@outlook.com
> ---

I have no reference for this, but I trust you.. maybe +Kathiravan
could double-check

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
