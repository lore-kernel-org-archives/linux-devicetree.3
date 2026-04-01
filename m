Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53A839934A
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 16:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062447; cv=none; b=httUQXSGxFVa58zsTazr54HaXLZ2TJT38+saA5kLQRltvAv/uFTrk6ju77k78DZ9WgZ0dt5FnDI6H671p4Lkb3sL9Jvn9YdxQmDqurdqTpt31iGKIFC4m9MzKJYC/jXt1rnIaQ2l2BdeqUMWLB2Ujz0qA35wHykj0JKFmXoAsMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062447; c=relaxed/simple;
	bh=nCrMZGuEmiO8DntA1wydj9M4MdVS8jMj/QsSsUqzP6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=swLXpiefQ1oGBDtOB864VS8N0Um1Fibrv7b2wAlloq47daEdophcNEOzrnLfGFBgTV9p9fvzpz7ZEkrJ/IT60gUag+R0t7rgryWdGr8Oz+yAvNDr5dXFEe/wfLb670RgK9YNRIxevrrabqiCPKUpQxq1q0n6R0oKbEsbpo3Rm8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DqNeMY2H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JGYCPhDu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DqNeMY2H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JGYCPhDu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631G2OiS2023685
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 16:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+uyp+dYf9ZUf2TcuRQ8zQQWBhSiyCO9WMkrxwM++H0M=; b=DqNeMY2Hy0g0SzVd
	q0RhJyJ8IsatX7Y1YooTAdf3SejcstYVyN0nj3rzSrtA1ZtkC5y25hRo5uSw44Ef
	K75LWW+k1rgBelUfS1pOJXlgWSFH6BKuPtQokmL1m5obzo9LI0YezcsZUnbp/S9/
	vLZ7YPtquiTNTcPZgOPlLaFq1FlTgjV+v5UAuK2aPxSEV6Dfvyec4VHWTY++112Y
	HHhDfRlGQpM1qdYN/iUAcXB16xQDVFXrc9B/tRsprJlGLjNqBsJcVAJFJulGrUqr
	LMZYQ/ZG/SaDwdZ89aMzhCEzBpWor9DWEtDCnsvIbwbeJwWaabg6JR+RJhQyDizW
	lP16MA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96hk05vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 16:54:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b3544bc7bso99694911cf.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 09:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775062444; x=1775667244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+uyp+dYf9ZUf2TcuRQ8zQQWBhSiyCO9WMkrxwM++H0M=;
        b=JGYCPhDukcYXERZhAv6O0epLzLMVRHeZxMi/lRmoecVVw1uv9nNqVRvGuEYkXg88Sg
         QXqH5GJL7WOsx+2qW8f9NjRRsQBwg+p77GjuCxxLvUWe6T+OPKy6Bzha+5FgtLNqLQYF
         ZagdmvZezrO8aOYXCSMNaGJHtjo5cYIpBeXc92RGhG7CkqAFZZZOAfw8l15YuoXpSDqG
         2nceC7FIhkqCO6DYGVjfZC16+i8MhCLFzX3lyBFw2rAzU9oKZWx99AEZWNM1po/xcFAa
         0ZxyPcQX5P3NXzGUzh/NoKXdwD++ABt48vn87o2lS7381FLZxDewOHWo6DQCiXfShJXc
         WTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775062444; x=1775667244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uyp+dYf9ZUf2TcuRQ8zQQWBhSiyCO9WMkrxwM++H0M=;
        b=lEOeYsLsGVJkr399EXPClTKJ+D+bfLVuy3wvE1YB73tbc3VYKzqR1zlTR/mSZrorOt
         Kl7Cc2RwH+1jrkWiW1QG0GI87rF/Fmsa6LMgBnh79q3jRsj16NOaTYRme7lUYtQfNXNt
         ezau4RVcaHleoZV0UL0ddHtehkm7Zw3dKbGKPIGOFauQGbRFITW1guSOAHcECxMRPRn4
         cdpv2sCPMlZJskB/ojojNe+a4XDGDGc/PzGygIcDv/0lScPwewckBT0YvrPm4IHRvLLC
         diTFclw0ayWd/z8fJ3GBu+3x/opMeHUvKMIZMeACmh5aShuyijHMeptCObdLyf9O0MJZ
         8+6w==
X-Forwarded-Encrypted: i=1; AJvYcCV/1fH+LQRC4E2KzfmdBcrp+zwpGQVrJ7sGZg7j3ecKOZfgXm/4noTCztlYv/T5Yoe2b0nCv5AQIHA3@vger.kernel.org
X-Gm-Message-State: AOJu0YwvskBm7gd7IgbXS9lsqYm4kjd0G3DMDzk0A1VNspGbuTbyWc7D
	ebSvEg7VYerfS87OuMsAmArCIDcwVE1HMTFEHlBkLXh1Y42q207scHQUV8iUip2eWzm+MHmksmU
	ChQZ+WytmpgGZz6wwRp8w7dbQPHzJKIsZoiFNxQpLWsSatcccTEytuFIXDhTdiDMP
X-Gm-Gg: ATEYQzwffyq46/uEAb4MQSBxYM8jB6DdxWkVMRO8FpkqwmAD8u1/TizknbypFSqf9cd
	W6/lk6H7uudFqoR981uKbOyB9qMERcWq6F0dmLdJwinKL+BU6QeeHFsN1xO1lYxbU/6XTwMCv/H
	R7gLkAra5vuejms4TBjEoTLSRazoHro0K978uu+KXSEL/hWx+jPLyLlDUswzMbwqndKja/fpx/E
	LAGHixU0dMn441S0G3VQBakZQjFkl8z9WHLWx/WvDX1gIJEpvIY784ECfDNkf7td5dX6aewYpcf
	T1+ovl+z/+nxBBonXVlUFoT0fzmA94B4+evKb//YdUUSz+dwhGJ0O+Ku9w7N4NhEoaEY7UXSA9d
	Ol0qXjTQDP8k4TRNZeKtr3y0CyddCg15ESPqhdNx8pkKC00k8
X-Received: by 2002:a05:622a:7290:b0:509:aa4:49f0 with SMTP id d75a77b69052e-50d3bd3b45dmr39681351cf.50.1775062444069;
        Wed, 01 Apr 2026 09:54:04 -0700 (PDT)
X-Received: by 2002:a05:622a:7290:b0:509:aa4:49f0 with SMTP id d75a77b69052e-50d3bd3b45dmr39681091cf.50.1775062443589;
        Wed, 01 Apr 2026 09:54:03 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b9c3cec6c31sm6168766b.37.2026.04.01.09.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 09:54:02 -0700 (PDT)
Message-ID: <6be87f21-1da0-412a-8662-ef05ca32f3c4@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 16:54:00 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/13] ASoC: qcom: q6dsp: Add Senary MI2S audio
 interface support
To: Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com
References: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260330082105.278055-9-srinivas.kandagatla@oss.qualcomm.com>
 <38eb807e-8467-4d7b-9094-3007d0ba9c89@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <38eb807e-8467-4d7b-9094-3007d0ba9c89@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDE1OCBTYWx0ZWRfXw847VGNBao6p
 WANH21lIL//EWUDmwKWIhZA9n3AFsWTkt1yGSYAoTNugk7WpB2dU2Bbf0WP1lZ8F2M6gIa9PlaW
 hHf9lFbFCebqWQ+PRScBObYsZW23ebI64oM5zdipycfyXzL4qFn5UaTSrJCYLODYOiS+jrbpvLr
 zP9ySB5tuzG0lPbiyD/LVrYYLpFCx+EwC0fZGBaGXmi0E4UoHjhzBvE2mfkSypYoykyg5euv6p2
 bmKr1c34npcuwMYGQmHTDNS5NxJs76nLhDYNJfNiomNqhgUrcAHrrWaiJyMgBcehJhyktzwxJqZ
 3K/j7cas1+HX44uVM7HHHmNk5WCwz+mgVjKux/8xwbcj0Bjhr/9YoSRJ5AuAZZ7C9Kfb287Bh/z
 p1EtyIzX+tDjjqODX9t8JRdXb4Y2apqg3kclyiI0GL+PnLwmZRkOTD5E50S6U4doZzsAT3VdY/X
 jqIJAV/sG1HiX/fiRZw==
X-Proofpoint-GUID: gZoEpZ7cFzSuv0RQP9ZeZ2q0ztCASadB
X-Proofpoint-ORIG-GUID: gZoEpZ7cFzSuv0RQP9ZeZ2q0ztCASadB
X-Authority-Analysis: v=2.4 cv=e9ULiKp/ c=1 sm=1 tr=0 ts=69cd4dac cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=OW1hUYqCZhJZeNE_EJMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010158



On 4/1/26 11:25 AM, Mark Brown wrote:
> On Mon, Mar 30, 2026 at 08:21:00AM +0000, Srinivas Kandagatla wrote:
>> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>
>> Introduces support for the Senary MI2S audio interface in the Qualcomm
>> q6dsp. Add new AFE port IDs for Senary MI2S RX and TX and include the
>> necessary mappings in the port configuration  to allow audio routing
>> over the Senary MI2S interface.
> 
> This breaks the build:
Yep,
[PATCH v8 09/13] ASoC: qcom: common: validate cpu dai id during parsing

re-ordering these two patches, should fix the issue.

Sorry about this, Is it fine if I send this reorder in v9?

--srini


> 
> In file included from /build/stage/linux/include/dt-bindings/sound/qcom,q6afe.h:7,
>                  from /build/stage/linux/sound/soc/qcom/qdsp6/q6afe.c:5:
> /build/stage/linux/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h:153:33: error: array index in initializer exceeds array bounds
>   153 | #define SENARY_MI2S_RX          147
>       |                                 ^~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6afe.c:723:10: note: in expansion of macro ‘SENARY_MI2S_RX’
>   723 |         [SENARY_MI2S_RX]  =  { AFE_PORT_ID_SENARY_MI2S_RX,
>       |          ^~~~~~~~~~~~~~
> /build/stage/linux/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h:153:33: note: (near initialization for ‘port_maps’)
>   153 | #define SENARY_MI2S_RX          147
>       |                                 ^~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6afe.c:723:10: note: in expansion of macro ‘SENARY_MI2S_RX’
>   723 |         [SENARY_MI2S_RX]  =  { AFE_PORT_ID_SENARY_MI2S_RX,
>       |          ^~~~~~~~~~~~~~
> /build/stage/linux/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h:154:33: error: array index in initializer exceeds array bounds
>   154 | #define SENARY_MI2S_TX          148
>       |                                 ^~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6afe.c:725:10: note: in expansion of macro ‘SENARY_MI2S_TX’
>   725 |         [SENARY_MI2S_TX] =   { AFE_PORT_ID_SENARY_MI2S_TX,
>       |          ^~~~~~~~~~~~~~
> /build/stage/linux/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h:154:33: note: (near initialization for ‘port_maps’)
>   154 | #define SENARY_MI2S_TX          148
>       |                                 ^~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6afe.c:725:10: note: in expansion of macro ‘SENARY_MI2S_TX’
>   725 |         [SENARY_MI2S_TX] =   { AFE_PORT_ID_SENARY_MI2S_TX,
>       |          ^~~~~~~~~~~~~~
> 

