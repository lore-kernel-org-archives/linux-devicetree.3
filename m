Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679334399D9
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 18:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784744369; cv=none; b=Gfr3/ed8FS+9L6mHrbarZanvA6ZTJB46VzgoKDJHZ9igUWQuCFpY6nxzXD7u/QiaRGPVjDFxnA4XRpUD24/LHaVuv56gFoT2HsUJllaU3ftcSaWDgfW/XzVcWjiNetaD19M1zST8GGmergyXtLpWKgaEfNiR6WuSz5WMG4YzHw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784744369; c=relaxed/simple;
	bh=h9KLvKhk60wBGwe7X2Kpn4tVz7qaWBCBWsRClzb7DOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UAm+ACwz2139a8ytzvDsXNp1MLHk+RjcqZgcy/nDXBaw1qh2NceREQSUIy1je6AEtuJP6sHe/vpljl08XJ4V1tOmCdTAjJBfgJttC0gQ6Osi7rCDIWg53kJgjQ1TT7N1BpcBRaor6JMHfb+A0Hot+LnBSwMotstJbCTfRobAH4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kFmgGIgy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KGlBuvfj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kFmgGIgy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KGlBuvfj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MHr2xX1385607
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 18:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKbgS0N/CRAlO5dvnweSF5hTUngsf8UTKv2PHTmbOF8=; b=kFmgGIgyTTnu3g4J
	QX/XwcbLHZCQy0lVElgeHDP0QIRCH9tb2meYXOaP05BogeReg+vVJrXOWNJytY7P
	KDNkbYz68jJjFGumx3ekIdQ0176FhyLh7czPCk4iKOEPLzQKr5/6E8rqmqYdmzCp
	bKHpomqBTOlSGIPRzhylXH3rVsSnl3xxc7aYGL9J8WcHeZGuLYxbmmr3HuyEV6va
	4q+NZdw8mJRLzzClol4tPZk6AjyhdWImMC7h3B0pcAG6Cib7n96uZX4zL1AQWNA1
	PDyX1BgInUzk5Ghe+3AsQ8VV7KWdHksy+OkM32dqgs/uuJjzvfwS7xlr6EoP7+Ax
	6lrcWw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjtn2th29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 18:19:27 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso14737491a12.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784744366; x=1785349166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKbgS0N/CRAlO5dvnweSF5hTUngsf8UTKv2PHTmbOF8=;
        b=KGlBuvfjKCr+wEEUs67oZNR6gYqCULfIHngnNMsnZu3QLjdHxTZyNjRS/dWPcQeL2G
         d8CiyOZp+I34Kwb68cMaoLQjxaZbeoA29eRuT0n9szqMPR95+w2/qxjjXEr6hmDAGxnI
         MtvYgQawttUpKyrATgMw+q/d9gFVsPc6LfK6sDgKJjiMHNgCQe8rGjCHe0Eymz042d4R
         +Au5JiQzN/u9LVV8si02q+PfJ6xGhLYfcR2GLH/V2STNWvOB3bkEoAPbzLcgkFfYf/GI
         aFOrEK13INcKvPnxaJkxkqmpsxB+h6aaC28+6RStZcX+RO0XGacABQ2XeChGOzyKfKU9
         35gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784744366; x=1785349166;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKbgS0N/CRAlO5dvnweSF5hTUngsf8UTKv2PHTmbOF8=;
        b=m2AhyMmBu3kreo68e8lrbMwYT3R0ENHDkBO8lrHewduzXxRrhqf3sy2X0PUXrcDnXd
         sL3ltc08e/fpp7ePjfcaJ6oL3OHZ/5pAiZ4d5jCx8hHLdZz/NNBhPCPBytfnBn5mWaf8
         YsyrtOCWsv0pClZ0i+xXrhxDAksbs1rmK2+n4xUteFXS7CHEo1INWTl6g9/At08i0GvK
         MXcFJF6YGC1bI/WTk6UYxUqwScA70BJWQqhWjCHvFc6fFO5Jpp8MRq8mxyh5qZmWJpaa
         XFQVdjkDmak/ktFB8DBwddGw7cyrnZ4Xf109D/VhojeOD9dzFcICC2OKX5eDELk7iR4w
         9gQw==
X-Forwarded-Encrypted: i=1; AHgh+RrZPmrhQUXTO8SYWbVhZtOxpufYYkdGAd0/DCaMsWTbfE3TaNZbPG6cOBcbswoCj4Pe0j9r9MNfH8qP@vger.kernel.org
X-Gm-Message-State: AOJu0YwUyr3xJ8KYkeXMtu8E5tRXnKpbV0u5sMGUJqYekDAlSNN5V3M2
	92Z7wBbhvERdQW4LGX07qNYPF82WqtD6QIyXx16O2kfCWyOlclAxwGNrxBw0PbyrKnpgHSAS0F1
	NJGazmcaAIiKWKjw2EEcY69fr9AZlRasTH0bZfdl3hXGzN9bhWiRdM7lxsAAWQHXm
X-Gm-Gg: AR+sD13H8veV/OwPswOn4YPzC/udjarBe73x370kycJaoQApVjzlJBrxOmmU41YHprN
	vznrIqC0MXIA5A1gBQ0Zl2wL+lSxdAlo/NWyN3sBHv5Jan6TUjr2CiA4RKCNeNMrUW3gPf0Sitj
	9lzowK+09a2Mv7poK/3Cfe3Fy/gt1UpTjMzcLB6H4MOPHcmmpVYdGPleG0ICAHEHxJKUBSVg4Aq
	qBT2YgGaEuGmowFBKs8qfNZzKaJ2hB0eFY48BKyQ7mt6UDY1BK/QMlIdfRPHydNQ2DOm4aVwdp4
	drv43q2TRaczK6E53HR9PLaNDlgetz1ChLNClI6A+2fNn52LjZ0qf+Ac1gb9at1XdVhzHMPom9b
	6h577zjM1V3NuqLYSWbDzd7+cINwAJAY5
X-Received: by 2002:a05:6a20:9145:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3c3ad66828fmr26270270637.8.1784744366187;
        Wed, 22 Jul 2026 11:19:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:9145:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3c3ad66828fmr26270228637.8.1784744365633;
        Wed, 22 Jul 2026 11:19:25 -0700 (PDT)
Received: from [192.168.2.3] ([49.204.16.42])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a87e9sm7813501c88.11.2026.07.22.11.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 11:19:25 -0700 (PDT)
Message-ID: <24a0ac2f-792e-4296-949c-047d9ce1c1f3@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 23:49:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] hwmon: Add Qualcomm PMIC BCL driver
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-2-febe2805e17b@oss.qualcomm.com>
 <373bd00e-bfcd-4f6c-b64e-a707af01417c@roeck-us.net>
 <cdc0fb5c-d277-40b4-8b00-c73eb881c062@oss.qualcomm.com>
 <4f2d9c51-1059-489c-a469-562ec52015da@roeck-us.net>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <4f2d9c51-1059-489c-a469-562ec52015da@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE4MCBTYWx0ZWRfXzxelsCDHATCv
 ePs5KS+og18e6c1uLqc5zRRzDn4c10ygGFgXECAkmbTJYXrUYIpfdqJTZKC492v+o2vL2vLNakL
 A1VQDTDrZrBnK7nosK6OyazpgWaWJigqHIAKC/r0O1JaHRNlfNWzgClzQ+8EJvPHElmVL2b4q55
 d9dq6YpNvdvLnkoXWE/xCbVl87VB9LAdJbUl5JZmo9L2ZtI3eJgRKw36uTW7la+Uy9rThHOZJAK
 qDWA9bffl5yb6FdpkNB/uiHcjqRmZwEbOCC5X03ZOv88Jz9r4YbJmoQk6gbkmLXk7G7Lg31ueBy
 C48PfaCYOtiv5l3/08ZXBVHNIFMvEZROTFIHhRUhb6ugIApHald9P0dx7vyC4Vy2SW4l5eE9kKs
 XJ11FXIBCfo8QqgqxSUg/Wj1i4+LmNyp/McRZ0VIA/3fPm8ndsdILqALzLfXMZVMuy874vkj3i3
 0HHGAOOsjCUvtY0Me/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE4MCBTYWx0ZWRfX3HVb9fTPiopq
 x6xQ47RuBFL42qmkF07fmSfDNQVt6hU+kncaF3ZSe0Lenus4IYQ06dag8JvQMzuNvkh0GdgAplt
 340dOSNOxME7fye6Vxzt7FvAAKmFAVc=
X-Proofpoint-GUID: mfRRbJcAVXYx-jNb1ieYzoTV4uK5kRSC
X-Proofpoint-ORIG-GUID: mfRRbJcAVXYx-jNb1ieYzoTV4uK5kRSC
X-Authority-Analysis: v=2.4 cv=T+28ifKQ c=1 sm=1 tr=0 ts=6a6109af cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=BvtW7Q8lqb1UdYndl6lHrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=e4paWlehE--IC7SGyJgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220180

Hi Guenter,

On 7/22/2026 11:16 PM, Guenter Roeck wrote:
> On 7/22/26 10:38, Manaf Meethalavalappu Pallikunhi wrote:
> ...
>>>
>>> I am curious: Why not use static initialization and use the is_visible
>>> function to determine if an attribute is visible or not ?
>>
>> ACK. There is already a comment in v1 suggesting the use of dynamic 
>> allocation based on the available attributes rather than static 
>> initialization. The intent is to avoid having to perform enable flag 
>> checks in multiple places.
>> . >
> 
> You lost me, sorry. There is only a single is_visible function,
> and its intent is exactly to handle situations where some sensors
> are not always available.
> 
> What would be those "multiple places" ?

Understood, thanks for the clarification. I'll revert to static 
attribute initialization in the next revision and use is_visible() to 
control attribute visibility where needed.

> 
>>>  From the earlier exchange I had the impression that there is a large
>>> number of current and voltage channels, but it looks like there is only
>>> one each. That doesn't really warrant or need all this dynamic code
>>
>> Yes, this hardware only supports one or two channels (voltage and 
>> current). What we discussed earlier was that each channel can have up 
>> to three threshold alarms (warning, critical, and emergency). However, 
>> the hwmon framework currently supports only two limit alarms for these 
>> sensor types. I have not added support for the third alarm threshold 
>> in this series to keep the initial driver support aligned with the 
>> existing hwmon capabilities. Once the basic driver support is 
>> accepted, I can queue a follow-up series to add support for the third 
>> limit alarm.
>>
> 
> What does that have to do with attribute visibility ?

I was only clarifying that the channel count has always been small 
(maximum of two channels) and has not changed since v1. The earlier 
discussion was primarily around the limit alarm attributes. That said, 
you're right that this is unrelated to attribute visibility.

Thanks,
Manaf

> 
> Guenter
> 

