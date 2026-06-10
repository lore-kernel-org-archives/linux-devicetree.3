Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891E833F5AC
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 03:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781061032; cv=none; b=iIk7xEvPhkeA75eY0ovFncnadOJv2xDfeBbL6UPeseQq74cnKOx1NZl90IysQ3ZNDXalLh51UwC7tjCAiWkPQMsq3rePBeunoJ9rM7/Irn9u5snr0Sm10VncAb2XaAviy8ttqhaRg7ZTdC6B6ffaUnFZo6Kv4hhagjtD5+gW7gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781061032; c=relaxed/simple;
	bh=634BnfYsa7PCxiyercmqvt7DGN4XvxrpkhGybRKzMJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OmZjF+CkIwPPjeO2Sqi9LNEifE1ujrls2/GQB75AktYBK/GqXy2BXsFGOfRjIDAG6wIVFILrnwLc89qdzwfKk6BWkDeh+wwQlbciWsV45A16eX660OVpNljImie6UWVDy1WbZf0+SDuMdTG2NXM/IfYz3zRs1anjJSTGscFE0Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AZvpFaZG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NXIoYoMw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AZvpFaZG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NXIoYoMw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2eeQu240984
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 03:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9+eFqPsmWaRwlbi0tjndZiwSh3Muv16DZxWChbiNGE4=; b=AZvpFaZGKas/vkxw
	ZaoEYCJF8siap+SM0o3/kr5OMrlfcn2dvsKGv5CkFidMhRfpeTLBKqos0pfEwbVe
	IeAtQoIUuxdUWgF8K4wz6mS8T2RPJthooo03MP59p1jzA+oSoD0NH5urlL+hwmq9
	a63ZaqQud3LAlazUoBPsxaoB9RA7LG1APnf4B6fAlkALAZVwYgwS335EpVEH3Vph
	6lNHv8dFHKO7UxRDV7Cy3t3PcnQq4MkjfvqL6DEmBSmaCJBmQ2NZHhYaUl7e0EGq
	wmjVLGVmuVkHB0De/nDsafPZfKH7xZWgfgMtuZ6hnOYMqWM2bTREJgHiE9oeNXxZ
	iMX07w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epukerysk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 03:10:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36b982ec338so7213200a91.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 20:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781061029; x=1781665829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9+eFqPsmWaRwlbi0tjndZiwSh3Muv16DZxWChbiNGE4=;
        b=NXIoYoMwoYkcyqMb77urlpJcynZELEA4/QzxnN9qWGF8xJ+cBthdd/YhEOV312nR+C
         cIa32NLD8vEQBlIHtx1gy2nCkrpTOT8pCsD2iMXN36+tqmv2tKO+8n3ar/823YTNPhiw
         1HD+O0/A/fdTkH34KSRSoVhk449m2xl4HizkvOUaCbKpLe2VJZYKXBZSJDq5/S/jVuDY
         h9pUMFoARmsAheOcdTy+he9183HTUYphWdc8AqSlu1l6GkJiw7CBn8pcNEjxdR44GbbL
         pF2lMKdJDezAZxFgQISiyW5urBtgH7I9TuW52e9Se+4JVFcM8I66uj90gz4ubeOOW4j7
         nMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781061029; x=1781665829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+eFqPsmWaRwlbi0tjndZiwSh3Muv16DZxWChbiNGE4=;
        b=CmGgQHkNPk+msrY+itSnxMdkAkN2K9CeRzim/I4T2wHoEbZQwju+rx/lezLSg178j/
         hJAXfvo66jhvIErfCaEZDgaTl7zffGmF0PrTQ9iqDtcPqT5T3VxJyMpXbr8PjQUrxzX5
         wgvdRr9jwbapHn9+C16aQTdyzGYLR2UQ1gnqBFbNMKr+S/RanaPYBsloh5cryyLRYZnP
         qpapeDCqcxPeJ2VF9QDS6U+RIKOKR6f6nTuAl8sjk7gNdXpu4Tzf6/sUT0SV1s/shcBb
         7X5W78GuGACar3NEUI0RGUtmeVbZVPET3L9QtytkfSOE3DPbq8HV60pO62lz0vHNU8E7
         Cj1Q==
X-Forwarded-Encrypted: i=1; AFNElJ9X27h410xOL+anShCyYgZc5wBbLiMFCHQsU0J8iGqMABSnlheVI3DkWIJKEAOM8oE4PvlhI7cuxIQH@vger.kernel.org
X-Gm-Message-State: AOJu0YwmWstJbiN9V54L7v1HvP1HrvkdahZQMERsTRlNcl22ZcV8w7bp
	hE5TAGkOhPQp4AitNT+of7hYjdka4YuK9I8nun7d+698aIJXOaF2DzEk9Ct5/oH9BopBdeGG4Z2
	HiyJTf6rqgukdLBOl//l3om2Hh7rDAzGRCdHbRekAa8AMvqhiKWTRaV9pEKQ716Gr
X-Gm-Gg: Acq92OEFW5lQQoMViprTUg2vmcax79Daz1oBh/FsMfXfSsHzHPh807LnBWj+h2ISixi
	SuPzdwRxKGTL7LsvjCnNaGQlfde+cCiu/pHFuS92psQVrOwwYO0E681ekTh/mCTtyUvFwsOwiUo
	J+LLKls63GxkmBGCP4ECxSDnY8ttVX/GwhXJtR3DwPveCoAUUW4a57MTfWuD5onXIl/c/JhkBc1
	8IsoGSfFT0kfSWxIcgEcdZPEZD0O04mnSWqmKFxm1ue7caLixfgWn6IQIiQ8FX5SOxKvkCBRuc9
	9FEFt8PjqPHnC9k3wcrLSlQRrrypO7ycQfj7MXkq11Y2MGX4zc3qdgakyjSQpseJZ2Q0jpKKy1D
	xGeJbhmu1uzcfH+1UyxWQAmOcc70gAZ3V7UrKRGahtOmodeU+M/do8TkrQcZdqyKjWnFwV7a0QJ
	na7NTG48ZF3pQy1lCLClPtvw==
X-Received: by 2002:a17:90b:3909:b0:36b:bb66:fbd0 with SMTP id 98e67ed59e1d1-370ee33d069mr22550842a91.4.1781061029351;
        Tue, 09 Jun 2026 20:10:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3909:b0:36b:bb66:fbd0 with SMTP id 98e67ed59e1d1-370ee33d069mr22550806a91.4.1781061028859;
        Tue, 09 Jun 2026 20:10:28 -0700 (PDT)
Received: from [10.133.33.189] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37624a8e7c4sm908882a91.13.2026.06.09.20.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 20:10:28 -0700 (PDT)
Message-ID: <91117dd7-91e1-4c1a-934e-1b6717698377@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:10:23 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: ipq5018: Correct CMN PLL reference
 clock rate
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260521-ipq5018-cmn-pll-rate-fix-v2-1-04b28a92e0f2@outlook.com>
 <cca7e305-bdf0-4ddb-b299-aa25a183e229@oss.qualcomm.com>
 <9ab1340d-72bb-48df-8784-a584a37b5c76@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <9ab1340d-72bb-48df-8784-a584a37b5c76@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDAyNyBTYWx0ZWRfX9LUxrWbICEzD
 tMhZcx1I8Ivh0Zvd3EqunRUh8Nf6qFy3HxPiqkWnPSPBGWZa8wbtD6syrv5iBVc5PZB4oS+x2ef
 oFpKsCDNn0txuDQPRUxM2TWlY+hCf2zKN9ju7Gw97jBUqqhX+NkbJ8eLFSp4jktI+3oZ3G5aGXj
 p1LXmhSQ9oZ+Q9zhxlFFSQvco8/c1od1ywjwmmYQsakfTG99maJxNkhLj9+G2jB4NA/sugBF4ty
 pI23Yj5QQqgoHEXUSy0/2B1+rmN1CEsqj+rUF+eQR8RZwBudUgIZKiKOTSnyEUkUpPfXouTRdqh
 YDwDi4Y8x1gJ/d0DH140lIeDB/1IlZjhVMF+58DZjaMjc/pu49bUE5kjVDFJzWie3ewtkHElL7j
 yqJ6I/5XIUxexAGspbEnuSWWQ7N96PrxeurzpuzCrVGxb4R1ibNOoT0vQTTjDKYMGDeCaY4a5iw
 bkXQHhnc7hv0xolzOmQ==
X-Proofpoint-ORIG-GUID: nHfWuupBsFUC1-QPCEFzYad_7hIlJAXn
X-Proofpoint-GUID: nHfWuupBsFUC1-QPCEFzYad_7hIlJAXn
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a28d5a6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=DmDlxQa2pT8N5fOTvVMA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1011 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100027



On 6/10/2026 12:59 AM, Kathiravan Thirumoorthy wrote:
> 
> On 6/9/2026 8:42 PM, Konrad Dybcio wrote:
>> On 5/21/26 9:55 AM, George Moussalem via B4 Relay wrote:
>>> From: George Moussalem <george.moussalem@outlook.com>
>>>
>>> The correct CMN PLL reference clock rate for IPQ5018 is 4.8 GHz.
>>>
>>> The CMN PLL driver did not account for the ref clock divider which is 2
>>> for IPQ5018. Therefore, the computed rate was twice the actual output.
>>>
>>> With the driver now accounting for the CMN PLL reference clock
>>> divider (commit: 88c543fff756), set the correct reference clock rate.
>>>
>>> Fixes: c006b249c544 ("arm64: dts: ipq5018: Add CMN PLL node")
>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>> ---
>>> Changes in v2:
>>> - Removed line break in commit message between Fixes and SOB tags
>>> - Link to v1: https://patch.msgid.link/20260519-ipq5018-cmn-pll-rate-
>>> fix-v1-1-3c83a173c27f@outlook.com
>>> ---
>> I have no reference for this, but I trust you.. maybe +Kathiravan
>> could double-check
> 
> Thanks Konrad. As per the HW doc and the commit 88c543fff756 ("clk:
> qcom: cmnpll: Account for reference clock divider"), default ref clock
> divider is 1 in IPQ5018.
> 
> @Jie, Can you help here?
> 

Hello Konrad, Kathiravan,
As confirmed on the IPQ5018 RDP board, the ref clock divider is set to 2.

>>
>> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Konrad

