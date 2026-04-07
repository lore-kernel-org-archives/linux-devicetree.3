Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF903A0B20
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 09:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775553654; cv=none; b=jFxrG802xBN/DlRMcYN3PIaOFLFg0/VQy/QEtANuggJlwzCUdlGNA+ouGJGrL8/qERjyjvAJTnwRQfUa/5Qer7ZoFbZx3ont2mLuNVeIBNJCU5B5qP0pwkHB8Bo64tnohgAo0EJsLjCYWiDRYyD4gEIHUnjwbMEjo+pkaZ1aJhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775553654; c=relaxed/simple;
	bh=pEu16c+A/H6Pg0otjLJ2Tyd8Atc4eYkdXFmf//qek+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OMqlsXP7PayAJaanKZZu6iWIPolrDMaU8UN/i17WDumtzJ4M0N+15bL+JZPev6gS+k9SLakWCX1CpwXZ/B3JFPMxVppb/HwgCr66lw2wywS/c57sqJloYkVeAmkKlw1te92e1/+Z2iO4kWFYIUrMU7FP4tMmjC2UnxdsBx5A3AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H22e6L5s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=duUPGZJf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H22e6L5s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="duUPGZJf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376cir33402379
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 09:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j/ZDRgQ+AUJzZ8v6E4SgrJITD75bOcPxTbFtJLWmbss=; b=H22e6L5sExumZy7s
	6wrGg966cYyONuL80MG6D1iCQDXsfPBIjlUKD01T2csQkhGt2+XNRIRk0AkvDhBb
	qEvbA0XuFDVrwnHdMg6xDwvfjv+OBi2dMlscesVaxD03l1Tl56EQoyHPc2cSwU4n
	h6OYXWVHKMkRtuPZf9y9KzEFkbiAufl9QEMYrMpF63Dc+ZiQZZtPmDRzsK43aBv+
	eSesLZGmGUn5sKxMv8/mdrLWnsdSHkj+cwGhBIUfP98ZvXm+SmPyEYJ4hR7cdAKt
	J2jRWDeVMVDQEuBhr12pZbizlE3UWmo5TrV0ZytzYklSM8Q5WEfLwTvAwIwL/64H
	xIeApg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrht0jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 09:20:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89ed6f0c71aso17207536d6.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 02:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775553651; x=1776158451; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j/ZDRgQ+AUJzZ8v6E4SgrJITD75bOcPxTbFtJLWmbss=;
        b=duUPGZJfmHxQXful4t4tbYigvdYdqKwCg3gEa0wrREso20br3AQKcybSotjeZJWJAa
         qEnYeD7m6amWnJr2Ws4Bf4BynLmHYaMMYvvG4jigWEhEEP1iqYYLmH7YT6A4/C/qqWu6
         xA4GB1wYUj//G+Zk6F5WpAqy+QTZJWinf8+b45wZRytmqwuw72TVePN31UmRPM8h7wiz
         N/wf1S9kUixzZqev+kLUEPrGV7uxT9uzDeBKzUfD9epjCqZNczGnwFkwbO0wV77rDMXy
         vruMMFVJsg/k61BUl+z1y8MTRHZr7/EnqGt0Y1TDUHKyPsvQASzZT9clFQp9+zhUf91C
         mZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775553651; x=1776158451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/ZDRgQ+AUJzZ8v6E4SgrJITD75bOcPxTbFtJLWmbss=;
        b=JeSAfVbNpoFhhlH90Iact9EVXhdudKaOcvAL8nkgJ7zmcKq5MksDHYKhJp+Q2fcJ/Q
         Xb4fYMfbxSOh+PnRwxXo+u1uX/jsdD+Er830BSWaRf3E85gSUaPnDYfm7f9lPrHTtX5u
         1mWKFdp9DzZ3ke+r1J8/sMjE+qoJeElRg9Krl8qbbNtgC33NDnJwO1UsTfDHgO//QY6u
         ze4x76BNpXf+Andw4GUF+3JvaxPR2Mzbgc9AHDQ8qsFZR2J3GE4YOAz+hWLZ7TPJtZ3O
         JBgJqD+0Tasw2G5vU5+fjv9nfqIRAaOpyE25SSaV3AbyqPnvqa5eJzpTlSoKtxtuPGTR
         W05g==
X-Forwarded-Encrypted: i=1; AJvYcCUwLjy3lQ0f33lgj+/uY2K2rUnekRax+JCfaTGlfwJp+lWM39poVWRFQ4B8fvkXfAptPEPjJ2puywze@vger.kernel.org
X-Gm-Message-State: AOJu0YxKnAD/wp6Q7SDvJAP2ZnwVcowShqE02gti0GpG+obVl/Rdj5R0
	bLM6uxfKASIsiEpxuZSAVppOE2XnnwxfDLeGnkpGy4j2RBp3o7GKfsNg51M+3oVqtjbAOaqfF9I
	YiK0f+y0lfpeSBcRI7uxp7YKFbrv3aBGOstxenVEi6bKVmvmLvgFGos7y/GzEaZoV
X-Gm-Gg: AeBDiet5ZkB2U1n5Rdbsp25X6xFaWxu4OdWVHyrHlryG0hj9yfCx62S9NHxYtqmqQGe
	MLyYZ9uCbJSTb+E8cyx3aaT2DtLowcYBwipqcCXbZcAoxY1J7MAYsorMsYnF49sZZEL5k/BQzBh
	N4sc4WNe0mpsjSxSB86EHKxj/ZpTlZC0pSxbiiDXitSFE/9qvXC8YVBFyaJlAhdcrCeegTme+GS
	IjtN7Z38F+2nmPjEx2qRdy0q9206jx4jFwsnuChQQ7VVucqerSVLBkg1zV18XjDeRvk0mSMLH7O
	haCxeRtk/5JKd3o2oeFyGlx3F4Yg7cR4wy+pHj6JhkfnLlsPJbaOg52+zaA9IsJc8L7Yr4YUJbz
	KhD0oJcywmwF5Ro42vhTaqeNyCEBQLW2+JOsLMf4lg0xwWpGtzWXSrUPV7O7GSe0OmQ9DdMVcMz
	52UvQ=
X-Received: by 2002:ad4:5def:0:b0:8a2:2cc3:2764 with SMTP id 6a1803df08f44-8a701be043bmr189196106d6.1.1775553651040;
        Tue, 07 Apr 2026 02:20:51 -0700 (PDT)
X-Received: by 2002:ad4:5def:0:b0:8a2:2cc3:2764 with SMTP id 6a1803df08f44-8a701be043bmr189195956d6.1.1775553650606;
        Tue, 07 Apr 2026 02:20:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c971f03sm540365466b.7.2026.04.07.02.20.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 02:20:49 -0700 (PDT)
Message-ID: <3f592ea9-b017-4191-af3c-0ccac54b4aae@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:20:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: Aaron Kling <webgeek1234@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Teguh Sobirin <teguh@sobir.in>
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
 <20260323-ayn-qcs8550-v4-3-33a8ac3d53fa@gmail.com>
 <7d6c2c58-310b-4194-8159-8ea56ed9465b@oss.qualcomm.com>
 <CALHNRZ_tomry+tJh8g2mCZBM1XQcaA7p1ycK03GH1gPQy3geqg@mail.gmail.com>
 <78d7d85e-ecd8-42ca-b59e-b7fbcecf1502@oss.qualcomm.com>
 <fbpk7dm72aiy673r2776pudw2ydpdirr6bu2rwvceour6lgwdx@melipr4mhv5i>
 <CALHNRZ9ZiENcXJn7SKuAoDWoBbuxWuOktBDF7FZob6xFH8A3=A@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CALHNRZ9ZiENcXJn7SKuAoDWoBbuxWuOktBDF7FZob6xFH8A3=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4NiBTYWx0ZWRfX39YxZVkhpod4
 iyK/K+7iC+KJ/5qQK4hEu1Ec4kyxjspQt7gIPQxe1Zw+F+bqyaPHsUoZGhC5E7J2TBsubP88ArB
 awtWX1fWE8tXDZHDbFs1cyIjpReKOs4cN+V4B7LR/ppGyFuF/Pxswq34quPIvG1u0wF+FPCy62P
 8qpeLwINASZGrXJ47wpzrkTuDg51wkOoPVd15aGab9AmcfTjRvv0ke6mbHcZEjdp1gnXmxasP5Z
 1GmkmWVTD0UjTW0aEcXVZavDrSSv+4V9HIhUSecd7VWEqYgcTcj8LPOCYDGVMmvmH0WEyovlAd6
 xvJETP2j44IJ3S5IPvOsid7O4Y6lpficUEM2CAI5yevTAwuaQnwKtlVZ4TNXrNPIBpvm/tnOcRO
 X4AiAVCApy0fEpMj8247vQ6T0r6/sk1Uk8j1snLpTQfTuuBG2HF1TqophHirXwsi/8ckA2JYken
 4b3IPa0/7S4w4ek9h7w==
X-Proofpoint-GUID: dwVNKi9ZfDMRHstvgZgA58fzIGlSO16p
X-Authority-Analysis: v=2.4 cv=XPUAjwhE c=1 sm=1 tr=0 ts=69d4cc73 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=pmcFvTqPr6nAQrvBQnMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: dwVNKi9ZfDMRHstvgZgA58fzIGlSO16p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070086

On 4/3/26 12:04 AM, Aaron Kling wrote:
> On Mon, Mar 30, 2026 at 6:32 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Mon, Mar 30, 2026 at 01:00:55PM +0200, Konrad Dybcio wrote:
>>> On 3/27/26 10:26 PM, Aaron Kling wrote:
>>>> On Tue, Mar 24, 2026 at 7:36 AM Konrad Dybcio
>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>>
>>>>> On 3/23/26 5:27 PM, Aaron Kling via B4 Relay wrote:
>>>>>> From: Teguh Sobirin <teguh@sobir.in>
>>>>>>
>>>>>> This contains everything common between the AYN QCS8550 devices. It will
>>>>>> be included by device specific dts'.
>>>>>>
>>>>>> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
>>>>>> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
>>>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> +     sound {
>>>>>> +             compatible = "qcom,sm8550-sndcard", "qcom,sm8450-sndcard";
>>>>>> +             pinctrl-0 = <&lpi_i2s3_active>;
>>>>>> +             pinctrl-names = "default";
>>>>>> +
>>>>>> +             model = "AYN-Odin2";
>>>>>
>>>>> Is this enough of a distinction? Do you need to make any changes to the
>>>>> one with a HDMI bridge to get HDMI audio?
>>>>
>>>> After this quesstion, I tried to verify hdmi and am unable to even get
>>>> the connector to come up. The lt8912b driver complains that the
>>>> connector doesn't support edid read.
>>
>> Looking at the driver, please drop lt8912_bridge_edid_read(),
>> lt8912_bridge_detect() and lt->bridge.ops assignment. Those bits are
>> lame and useless.
>>
>>> Which per the current connector
>>>> node is correct, none of the devices list a ddc node. I am trying to
>>>> investigate this further, but vendor source release unfortunately
>>>> appears to be missing pieces related to this. And no other current
>>>> qcom device uses this bridge to take a guess at which controller the
>>>> ddc is on.
>>>
>>> Go through the I2C buses that are enabled on the vendor kernel and try
>>> inspecting them with toos like i2cdetect
>>
>> I'd second this suggestion. The chip doesn't support EDID reading, so it
>> is (hopefully) handled via some existing bus. Does downstream handle
>> EDID / HDMI at all?
> 
> I have been unable to get the stock OS to display anything on hdmi at
> all. The downstream kernel reports the head as DSI, and is hardcoded
> to a 1920x1080 mode in the kernel dt. We have been unable to find any
> kernel handling of this bridge at all for downstream, in the source
> release or the prebuilt kernel shipped with the stock OS. Best I can
> tell, they just hardcode the one mode and nothing else will work.
> There are reports of hdmi audio working, though; which I'm not sure
> how if the bridge has no kernel driver at all.
> 
> All i2c nodes used by downstream are already enabled. And when an hdmi
> cable is plugged in, I never see the ddc address, 0x50 if I understand
> correctly, show up on any of them. I tried enabling other i2c nodes to
> check if anything shows up on them, but that causes kernel panics
> during boot and without uart, I can't see why.
> 
> This all seems rather broken, perhaps by odm design. Given this state,
> should I just drop all references to hdmi and leave a comment in the
> dts where the bridge should be to explain why?

That's definitely better than describing (for all we know) broken hw

We can always come back to that if a fix is found

Konrad
