Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7F1398915
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 12:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776429439; cv=none; b=YZskyiO51ylkjJGRhiEv16kJqhWSrzwqhJ35ZbbZzXnvbmZ/tPx+9eVLOuQaHhdLibAICW0Ooys8C2cOmx63SfT4765lSIK66UeWnOkprFzHlxABccW23gtWys8DVMJuy/SsUFYn+oL0bdIj1AAyo23KknFjRE99ARG3DuQPTms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776429439; c=relaxed/simple;
	bh=N35rTkhOKN3ePSz0lSG1W/FT/xQCyJLnN8AHKDEboJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZCQSwQNy0ZN+X+yMbdVXdWjQg+N96jgl/aMaKJ4zkiiqdOmv/o84/McvtJrZoucVm3JZnKBVmoTCUqoyWSDfUSKbIKsCxUa9fIKv49KksfspmKbLR80s6YORjCqyLMeoMyFthtIsqFtjsTW8tp59yrsUn6PTwhEu/U+8/jhkF/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ga3R05o2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jmELN605; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ga3R05o2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jmELN605"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H7AXVG3438217
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 12:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	syN7s3fwKBB2b0e/L5u7fo14eh4La/wkEmwmtd3jb1U=; b=Ga3R05o2+xKIKWml
	x9yiWLHQ6M2INngNQPokLoM8uhOWhJEp88merHbViBOqB10gOI5HtU0xzdj5LLcy
	JDVOBX5EWUdHqA7wrTXsl9Zo21IAcnQ9unz4l27O+jtUgcVFLMrjnfPtXcsinddK
	XKko5bf23ekjFxSkS3517Q8kkFPQARMvE8it/K8ljWNAK9RFoaYCR5dOQAGKqQ/8
	tBytvuO/omYdy9ut+G8E6NdARuCJsfAbS4nIo1CVyMmijowfaBV6uLTOMFx+Otxp
	gELRio8uS+uCDMTFGw89YcrLgYKlstd+ve9FgrP8rYRpFIUoCdXWT4IIrgw2vrTh
	FYwSqg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkg88s8v1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 12:37:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8c183c2eso5635661cf.0
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 05:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776429435; x=1777034235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=syN7s3fwKBB2b0e/L5u7fo14eh4La/wkEmwmtd3jb1U=;
        b=jmELN605ZeZaqjDzEX0P+Y4Nf1XtLUsNNZz+dxImHBPwODTFBme0aciD21Xd9wEMgk
         7gtBy1VBVEK63Ihw2CGbpmtTyogizoJyEyZIu8Dr6gK11bU7X2nGJDedJkKD4vMbsIBH
         56xqd685CXihv5T3wvaye7c3suS6iUBh8U4i3r2r/zoPps6dxCfu7fB/XFxJwcqJBiTc
         R14KxbRVbETLtQT3rvsFH6pm3lu0HqRXMMCtmgG36db9rXi+usYGDUkPp8EjMI0J9vO3
         Zc2ULE8sVzrIPB1xwknNN32vFoGouBtIImCq++7ZiPiux6oWRClcM4k24CeEEHTNxic4
         L04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776429435; x=1777034235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=syN7s3fwKBB2b0e/L5u7fo14eh4La/wkEmwmtd3jb1U=;
        b=O6XX8EMKdifAMBusyTm0iT28N8fXNcIRlmgsoECBfVLHHuhrG9zEL1BSyW4Jjcdr7f
         vhPonuLgoPDCQIX05R7cVo7wU3BKAKXPCyCcKuh7UEM8R1Qobi91wdiO7S8kI40JFYAL
         ky9AHELdqUb17qgKUykS+61T5b5km59ZC/89E63SYAtsg93VwJVb/iWhg87zwZaoyAvz
         PvAyAMq01dndq6vBNJmMYyg+gyzbEJ2qLke0c0KItfbz9ufQ5/ssgSh3AI19pp3gTOPC
         9CUkAgC4Zz87y41CvuB3dcIvXm68EHwA5NcFdA4DvL9clKadqqNIqSUrrb4de7AkE2rN
         wwNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+pzvx2epQze+NlxO+/3UefUO1VUZ8GuWrK5Iy9qQVtwRIeqxmMtFb5Gyqylgo5LrllMQODjRW0Iozo@vger.kernel.org
X-Gm-Message-State: AOJu0YyQTSXajKStJdnHh58b/4Q0emJoaRAtVLGtc7k/Nj5/l7tHl7tD
	FDtfHuRUe5zabsMjlxh+6XsJXKkEgynxfYCLx1NrmT3FMbkpRMQZn6pABx7ru8xVT+zOeJ8XPaK
	g7uAqpkQ3STAz1v3J0xIzxLZky5bmSz90ppTGbAGeeAViBqPyXmPcJ2dcxqqqryhu
X-Gm-Gg: AeBDiev0+nmKnyHeS05cDTeVpW19pfQdWnM/P0iTQWysSAibokFH1Z+XdvTXKJmXurl
	Yg4NGpu4ILJhCFjPmKRTHFNqwwVchtQvqyRYwKEDZ+KfzHQAlr1c+x7zV3qOdA4MovWbaWjBibx
	4WJt6RfkRqZXEcUNvppgJYfNHmuD7E9d6iQWbRR33VSx+yYsIwNaSpDA72u91nsForUzRnEgK2P
	DoJyIqCIpNWdvATFocAiFRwAh9ekawJi5XEPAlyu0kmULzsec01xy7Piy/Yf+cxiBr66kn0M+3D
	oBVN5itSVg96LIsKrTSqDdSwI754U3RSTahX/txZS/P80imi8F1hTiyAXZW4t5qEyW3ElDGKqXJ
	QAGd6NrOi+wkd5Qj9Rgf6DnUNUCsVHg4mF16OiDWxteFyHGRIqHZXyhINppglPQs9zepDP+C+s0
	IWa3oZTPoYc7AVtg==
X-Received: by 2002:a05:622a:5c13:b0:501:5260:51e9 with SMTP id d75a77b69052e-50e36c65be4mr24028031cf.7.1776429434889;
        Fri, 17 Apr 2026 05:37:14 -0700 (PDT)
X-Received: by 2002:a05:622a:5c13:b0:501:5260:51e9 with SMTP id d75a77b69052e-50e36c65be4mr24027521cf.7.1776429434320;
        Fri, 17 Apr 2026 05:37:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4512115d6sm52459666b.7.2026.04.17.05.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 05:37:13 -0700 (PDT)
Message-ID: <54ab414e-a33e-4cdb-a125-5a980ea7e851@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 14:37:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: use refgen regulator for DSI
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260228125431.23098-1-mitltlatltl@gmail.com>
 <awrfjdwsf4gyyg2s6ppw4jfmpzp5s2aavosmspsp26oqccco7y@csij6bpnfpu7>
 <CAH2e8h7W8Tng4v9Da9c7xg-oczHgNcMvz0OF6A27L9m+Pw7iZA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h7W8Tng4v9Da9c7xg-oczHgNcMvz0OF6A27L9m+Pw7iZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Nyqpiik1ESqfQDVM1g48Tv6kcPYlTK1L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDEyMyBTYWx0ZWRfX0G6vGGlCmI5/
 z5zbj6riKfVEJnuw1aFX9aVkV8505T8Pg4mifrjkGbrewEwsDuO/t6dtX4+DbhL5yM7KIDkFkns
 4XyVGz0xxiGJglc75loUqhMAixzEyJhHkWwRSWo/jH7BNoXtJ8DiUQEMi6o+Bw8eiZVRF21JgsD
 Gu9vqmbzDBF/eMObwtEPzXpvNFhtaH24qQj7vHYVNt2s7Og+S8MkWAHWMpx9wzi45/S1bUMmzs2
 uvUf3nBZ0OxH9+1fdMdL8u2HT3Ctc2a4A3M3k2GUHV1vHQXFX8np0ToeeejO1RzWrIeKiyrID6m
 XCnHJQTF2eY2iUMHrCto+gATbjTLn4Us5C1kQ8vwSIPxjprsznQDF6q2+Qh5zWSsvihZeuBIAzu
 HKwNDsqt/hZbFpXD3+QP6NRj464QEOxNwSiSzqRYMi8Ob/VrlpU6vV7ayzCeP9qxO6NUudiVOcC
 gMHBLpy8TXN4fvi5i0w==
X-Authority-Analysis: v=2.4 cv=X+Fi7mTe c=1 sm=1 tr=0 ts=69e2297b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=IGz76sYE0BYaplGTJ5AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Nyqpiik1ESqfQDVM1g48Tv6kcPYlTK1L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170123

On 4/17/26 2:23 PM, Pengyu Luo wrote:
> On Sat, Feb 28, 2026 at 9:13 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Sat, Feb 28, 2026 at 08:54:30PM +0800, Pengyu Luo wrote:
>>> Use it for the DSI controllers, since DSI nodes have been added.
>>>
>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>> ---
>>> This patch depends on the below series:
>>> https://lore.kernel.org/linux-arm-msm/20260228101907.18043-1-mitltlatltl@gmail.com/
>>
>> Why was it not squashed into that series? I'd assume that DSI nodes are
>> incomplete and are working "by luck" without the refgen supplies.
>>
> 
> Today, I did a casual read. I found the register(0x8900000 + 0x80) to
> enable refgen is always 0 on windows. The refgen driver may be not
> compatible with sc8280xp or the DT configuration is wrong.

The Linux driver casts a software vote. Most newer SoCs should have
a separate hw line between the PHYs and the REFGEN regulator to take
care of it automatically.

Even if a little unnecessary, this won't hurt

I *think* base+0xc & BIT(3) should tell you whether the power is
actually flowing at a given moment

Konrad
