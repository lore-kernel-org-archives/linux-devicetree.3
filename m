Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE2D223DE7
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691120; cv=none; b=SndSVfLbuqiiyWzXxsBnWlZuS7cWauUNOQAdioFf4zRx1QOEPJJpLd5Q68FMo+R3Un1u4SzbQ92NGFuANTco5BaNPuphn85Hv1f1LoborYz26XLruZu3pqUEXvjjql1A9KTP7QfBspdmBVMEzWL55exgPLXLDdrBo7Sn1SYzGbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691120; c=relaxed/simple;
	bh=1VuQw9WouRZL3IiouA1QDkIQ+D+qcZ0FPME4Q/xFy7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gpBLY684uxeC5V2hegGTjmRpNf9L4YNAq8O5CsCS9ZdvkrQdcyYpWkC39cHOBeV+TL79CgeH6rxFAqRUq2lRyaryp3KaIBcD8lGIJLX/aVi6LkggMx0IbTPWf8Fnm+uIxGUaJW+k5ZtfJ7TthWznis8ECKHA1aLI4YP2HHHcp+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=csMH9YL1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=efotPJET; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="csMH9YL1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="efotPJET"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD5tVq776079
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xVl/Jh7gTfBZtZj4Op6JOZlxfJk6HcU/wOB6FOt5iGU=; b=csMH9YL1xPyXclnY
	035rjMDTpelcKS+IdC1NgoMML9yhFxPXmGge1+IAltGr3MEOCI4PSLxSnk5MUPlq
	SrYT0gKNHf6PbNZL5pjsaGghZTBGBMkwkmFGhYxqa/5Sb3UX6MjomR8MYALkv8xC
	gfWMS8vyf+hdPhoeJ2AITV2Kt1bnNWmWdLpZBVxZNgHRihXrjlhxpTnKKYABwgby
	kgXRZJQ7vfBDnHT6HRsQmfJ153Tm8IbiG154Ms82oHGfysdeYKegjARPjuHymDHr
	USC7s9f9OLDwN0N8/yRrEa61s3oua8RV8Esu8gRzBYCKKacoHEUmySeSihqjQWlA
	uw4/uA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5dgw9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:45:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0e702df8so9752701cf.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691117; x=1784295917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVl/Jh7gTfBZtZj4Op6JOZlxfJk6HcU/wOB6FOt5iGU=;
        b=efotPJETnaP7BLsH3ZOhFBe3wq5fcKYWAqbpqGT0UK4jLrC/WJ7dsRjvDeVzbXebIz
         2LWU46A+r3RhZfLhMaIFmB7tpkMJNJKjDP2tVlvX7Jwmkc7PZS13MEcBb7nLl8uGuO9L
         ufTQdGEauiJRYYn+2kZmxgMHzqvPXlQ+SGlPssW2kw96Rg2vEAFgAlly3lTgJSQuIpQl
         zy3kqBMlhoT4y2FxwTRr2TdxILiUFfBtP6UVGafheyT1Rw8uT7qiJJ6BgKUOErkonPot
         FrMXzz/jes6Uul2a+s17WhsKa764TS1eAXee+QqSSGSBiZ6CIx+J74z5aE9altcLmPEO
         dIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691117; x=1784295917;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVl/Jh7gTfBZtZj4Op6JOZlxfJk6HcU/wOB6FOt5iGU=;
        b=mIMsanUb2EYUKdVW6IMu4NibJw8HTGHhWCP3B6RMlPuvFs5PlZ8buuCCwPHykH5PRL
         5Loi1SRISVP8B+YeJQ4NCYsLjNa1TmwWsSBH9q8g/sOlDX+CoWFrr++O4NXWCO0j7c3F
         ASjoAHm2HgMTi+mW3gwEPeH5WTKmqjtJPGBUuA9S0zBwUL0bZpMNN/fH26+PvbF1DOOD
         MXBI7ZCCo77Z1RPY+kP0m0SRKsqJQASt6U2zI1wCqS8LDypFGu8z1pdQxcEpw8g8TSML
         YI4RgmBpxrCjvH/znBZpX5CY0br48xe2FpQVdzJWoOQNoXJYHd9fiiZ6bo2/AV8+6Go5
         zMMA==
X-Forwarded-Encrypted: i=1; AHgh+RoAmPDcJ7o8ddaPv9nPUmrIoji75am0InAT6LaOydPPlGuwIaIlcI7UspYYNmUxfwCF1+1ElSilPb70@vger.kernel.org
X-Gm-Message-State: AOJu0YxRjCX+kwOurZx5bB1F5eYvmZekbyC0dWBFtaV9T2qkHCzKSgBe
	SeKHZBty58cn9P99QT93MrbJoSNANDg/eTJcn+H7bhx3tTv+UyA8IPBV3uffM8Cfc6THzrWToQx
	cB16xTBSMS3xMNKtvdiKn+G7Hr81x4mOQRM6CTJ+BgRXSBkABR+5LsRpgXmTE8rSYsae5Hqjh
X-Gm-Gg: AfdE7cm6Mylm9TMj3X/d/GjJlBDwXc/rO3ko5R0pOwQs4vvsuXa6+/FviU/5PGonLWy
	L/pGgP61Ub6r5ptBJJGWvdj2OziV2JwPxHVT3RJftbYet8KP3CsnGm23xUnFJdRhsH75D7vpaSX
	42tCF5+srWzWsGk3pv71XDRTdQ/qc6SBVksexWUW41OfDvnaHXCYgKxEyvetbmUCPMGMIeLhZDd
	vMZdyjlYRdvsUX2q3zXO2f2CpIH7EhfwQrFZboDkzl8jRX5ImWO6vkVJ2tc3RL9sXkaZB7zPjHy
	T+I1DN1ZnPQX9pikgOd+4SprJEmHR6F4MNlq7GYFcmlmKZCbFk9oAz2ip+/lIoBijLX17VuRaD7
	Y0WHbPIbakDf7McQLdGJWQI+SMCRnwM/d+Tys0BH2p1k=
X-Received: by 2002:a05:622a:410d:b0:51c:135a:5b49 with SMTP id d75a77b69052e-51c8b2ae5aamr123570421cf.4.1783691117153;
        Fri, 10 Jul 2026 06:45:17 -0700 (PDT)
X-Received: by 2002:a05:622a:410d:b0:51c:135a:5b49 with SMTP id d75a77b69052e-51c8b2ae5aamr123569891cf.4.1783691116554;
        Fri, 10 Jul 2026 06:45:16 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ada023acsm617631166b.54.2026.07.10.06.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:45:15 -0700 (PDT)
Message-ID: <56a7da52-8190-491f-bef2-f9c95bfc551d@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 16:45:14 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <8a09875d-af5f-438b-b947-bc2b61219b70@oss.qualcomm.com>
 <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
 <d0768c15-453f-4d3f-8110-886a5c697b02@oss.qualcomm.com>
 <d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org>
 <VoXmpDKdgY_XxAvO5tkDze4jpmMzSuKTmIISTejJsbIO_FIO1JFfUBlaPkNdb14E95zf_qwtDB6myQ2wdRCh1Q==@protonmail.internalid>
 <8fc1ddfd-0f77-4b67-b9bd-33fbd60e2046@oss.qualcomm.com>
 <54ad9b8a-7596-4bc7-a1c3-7230cca21360@kernel.org>
 <wbjec4qhzkpvdfnrvffk7tjmlvli5q2jiuzdp2iqt2cbf2uat7@usg2mizurxpp>
 <29bbcc9d-a0b5-4966-a195-1702ed514a4a@oss.qualcomm.com>
 <d5r3arZtREpnddaOGPStdRSGdwUSHDS3j61ersC0nD69JffwlclsJISjUblw4n6UwjjCVh1YKGOZhMLJCC9fWw==@protonmail.internalid>
 <l5fz64drffgrep57hj7kwc7v2drbg6kdkw4f7wxrmxf2kjjhsv@pcyyjtzi7jlc>
 <4d533d52-4de2-4a6e-af54-ac9052ff4506@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <4d533d52-4de2-4a6e-af54-ac9052ff4506@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX0hcMPFb3BYbq
 qMOR7ZTU9Lo9QHBccu3cYaBGjw8HNeSnhuotdSgRDisNZA527CJMiZWBM4Ry8F32aS+VvOhHl5/
 fkqFZYWCAgpqPCffSeRuPe6g6vxThuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX0yohp9lLu9yj
 X0B/3Ykd2RFpz4K54w1evS9NqL6HQ7pHIZj47gxym3uXovuzpPCaEGAr62ppeaLAVoFH0VJVLuk
 fhPYrEZrLf+2TyWYVHc51pAQt70VuF1Jo69B4wEex6wlPFpO+74ZRNiBS/XRgFdZESNMopxxDTx
 QXf7KAlDeDfFd0ekvYSQFc0yT/1VMk9Hwh8V6sLH9IQJMyCksszUTS+rzFE++BUQwBnjrKWSWOV
 iyAfPfovAZIJDItoZJfadpvtFph82JPazMqREyhysPYqwZOwLSItwWCsGIaWPbsDfe1GeKVx2mn
 ulrkeJoSp2S20Tl+Z9aN4t3ixU9i68rEGHn10Gt7gGbM6emd0fe3trCdmJHPv0LcPNJPeHXO9ZO
 c65MO6twO8mgnz6g1pSErH9SCfPXypryKQLFsX1NuR+vtjWrPaRdPSVyFcWnEGsV36a7RCZiCxO
 z3QiRrXOl5efPWUp1Iw==
X-Proofpoint-GUID: YJ64eUQ6XQq-p8r2cJz977WoeVwpBc9f
X-Proofpoint-ORIG-GUID: YJ64eUQ6XQq-p8r2cJz977WoeVwpBc9f
X-Authority-Analysis: v=2.4 cv=M/x97Sws c=1 sm=1 tr=0 ts=6a50f76e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=hP-s5Dj4EI8GOsY46QcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100136

On 7/10/2026 4:28 PM, Bryan O'Donoghue wrote:
> On 10/07/2026 13:28, Dmitry Baryshkov wrote:
>>> Quite frankly, I don't consider the existing (meganode) description
>>> any valid, and would vote to rip it the second a replacement is
>>> available. But once, not N times.
>> Rip without providing backwards compatibility?
>>
>> One of the options would be to follow the 'venus/iris' approach: land
>> new set of component drivers, which target new platforms and provide
>> minimal support for one old platform (maybe via autoapplied DT overlay
>> or other similar techniques). Then continue migrating and phasing out
>> camss driver for old platforms, while adding support for new blocks in
>> the new set of drivers and ripping support from the camss driver after
>> some migration time.
> 
> If you want to fund it - I accept BTC, ETH, $, € and upstream bragging 
> rights as valid forms of payment.
> 
> ;)
> 
> ---
> bod
I can give it a try (I've done this before), but I'd appreciate slightly 
friendlier comments. :)
