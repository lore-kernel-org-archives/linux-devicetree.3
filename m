Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6E6422E2D
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784213210; cv=none; b=MvFR54gmikGLmzagp+HeMlW7Vhy/l3M93+ccFjyaXsH7P9rWa4YqIBmSKa/IFx1DUa0ubRBuV1Ki2hNuUJ1X6n//fNDcAoBb/lL3ZbVgeUDnaFLjxtuyHnNHgfKLIJ4Y0c1FZHFYJEFmEVYHw4qHp9SAzMw2UjriTqRhFE0iNbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784213210; c=relaxed/simple;
	bh=b4PZofv5ZakvpsrCVmS7FDDeAS/fcZxBc65dgSUABDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dpB5lxLpyBbd4CJcs4T60qiqZIPp6l18K0d/3Q1S26yoNNctkCRVEEfFNJNeVxG+WH2dROi3WqnvZpypYZ1fbE/e5/kTr+WxQ7qd7c4iB/qJqvDKuFRp2OThbYze5o/90OJS/5/bVWOX7zh5xBHZIR1cPmVB264DrBcA1yBU6LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJUg1Jne; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQRzDTrW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJUg1Jne";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQRzDTrW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJxaI2838072
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ISakoJPzKPUJBTay4/8sv84QNCBCM/qEUBUmFCduv4A=; b=jJUg1Jne/kQ1q7L0
	Cr5mDXvqh/cJ77F431N5wgHInmNDO0kuq5Ai0cF6HSyUIwO7i8MvO7OApWFv/RFm
	iupysTl72VpH8sJ7L7g73kWE89OG/rzMaqGBekAa6/XtdYSn5JRrrIZ5ybnoFV9H
	83VwTUCKIhZZ1g/LZ8v/m4lWb6QcM+LPifTht83ma3Kr4xAPn2ja3+IlyCQNRRCR
	sbmrhmWxFsiRnNJ57ATnCADBSUuEosJ+ws7d0Sys4W7K+dCvvoo5vLI6WtDnVS91
	8xnWYZ28t6ogt3kJgIEyyiBVXW6TjmRq4sgtx6jq6N9XCPBB3yX3SigOVhQwiDV9
	7Qb83Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feefqmfk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:46:42 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so2851244a12.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 07:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784213202; x=1784818002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ISakoJPzKPUJBTay4/8sv84QNCBCM/qEUBUmFCduv4A=;
        b=DQRzDTrWJZyafsPnzajZkLI8jtJrgadOHg9yNWvWr8JGO++wI4J5LeBaEZh5fajk1d
         7hgJ0qqFa2XUn17lEIe8ZLg9n59b3HWgFaAkfhxRk3D+F+Cq2JM0YqDCuUXYiAVkhnOj
         PX+rU3FErr4yYnKBSW5Biv9Y3g4wP5FG1hsQ7Aef2WXAFW7+nX0M6Vn/RE0BzuxaTCxl
         LUv2ICs30INMYKP5hmoMoK+aTAn5WBVKm5Hm3pKUsX7FFkceiqTChhvTpF+BgzXi+Y4S
         SglW2D4Ixz6AUA6gl1SC+DeuiKnncQ2qeBrSFIhh9SlWuUATQCD39JOpxxhWeA3G6buw
         1x6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784213202; x=1784818002;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ISakoJPzKPUJBTay4/8sv84QNCBCM/qEUBUmFCduv4A=;
        b=ocYnR6ofHZwQ2iUJTSpngwG2PQMHjSiVhXTHsGDswt8BuXnw+N+8M0XRrO8fKvCM6B
         gYvysAyMT4d8vBwJxcVV/s53UrTzzLV6ajX4jMOrnfCiwZliv3GNA8w+ndXM53wOwJ/+
         Wy2Zt9yhw0zJqt/6/GJM36wmPV6r7JhWcgFh56tWELVZTPTdd65n4TbxPldKYA4VHKWe
         WrmFrNuzSdhUVfYKuq4Kt1kk0MBAU1Ram/e2kiv937bxIsvg1vKUnYbePdbV2awMUIni
         RdjQfWmlPXdUVwhiJsyNF8XZhRp+rT2IOzAtNcswhMqA68IgrKtlXTb1brWXIeQcmt4R
         eGAQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNOHgK0UJ6WVJBs1SnPL6sBxJzOeIWJzJPkBLMn2c2Zs06FI9ZN3yVs5wCUAHki7CLScsPLe11M2vw@vger.kernel.org
X-Gm-Message-State: AOJu0YwO9jZFexXHbdrHG34nIg/LutHMQUVcGUgFLF2TgimI1mHGBd4N
	hHNlDWWPGuJ+ww7EAGXEv/MHDQWITUfahzKHHy2yL/hFyD+zX7pSp9GIK7hu1QOQJSDqAAIV79E
	+1dnR7xW4a2UgfzKRFrG1DFBYfmaTp/52B6P08X46OPuQnnE0eRJB981AbJyeaGqD
X-Gm-Gg: AfdE7cnRgyMukeE4S3U57H5EKIvEjq9lYSbSyhYxNYYlPKKubgv27a+DBROMBeFZqJZ
	16U99/5yFukHUAh+EKeS+JuAOJ+Mlt43n7zMIEQPJiE4lEpFR1mm7Oey+zvE1OeK36xpiBpd3LP
	vBCXd5Y2ToWKvkJb4S267znRCBwbS1eeHH2Cao5e4m3EpT7pNeDxsoAvF5TV1RwfB0wLz4CoA/D
	Djwnen48+cEGHp9Syngz3cE9I1F4vyWO0nb2UptTr0ox+UIcmJLH4aytIgSZN48Q6nfo5Fy/CQm
	QaVgbWrptRo+BbAp8+na1B5mSwMWoVLe1XzlJLCBofSnvkYc3UJkZ48CJzZaXcmJqZHGDsMvIA6
	qWWmNWyXs7ZN3ex3KTyg/UAoQvGxv/uw=
X-Received: by 2002:a05:6a21:6cc4:b0:3bf:e66f:266a with SMTP id adf61e73a8af0-3c110adf3d6mr24918161637.59.1784213201734;
        Thu, 16 Jul 2026 07:46:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:6cc4:b0:3bf:e66f:266a with SMTP id adf61e73a8af0-3c110adf3d6mr24918127637.59.1784213201144;
        Thu, 16 Jul 2026 07:46:41 -0700 (PDT)
Received: from [10.218.16.3] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb259026640sm1872033a12.30.2026.07.16.07.46.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 07:46:40 -0700 (PDT)
Message-ID: <ea6d2f6e-977f-413a-86b9-faf1bc2a8e23@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 20:16:33 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] ASoC: dt-bindings: qcom: add LPASS LPR vote clock
 ID
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260715133243.3170821-1-prasad.kumpatla@oss.qualcomm.com>
 <20260715133243.3170821-2-prasad.kumpatla@oss.qualcomm.com>
 <20260716-powerful-aloof-wombat-5088a1@quoll>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260716-powerful-aloof-wombat-5088a1@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=APNfGQ4N c=1 sm=1 tr=0 ts=6a58eed2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=yUS1d6AIqEqXcYuy1NoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE1MSBTYWx0ZWRfX2KBTaGd4uASf
 +UqgVxxecb1grXcKaOT1UCN5Ozj4EHuoRQzBpvqcFfZErdcIVdd+rAlc4dsfTUC6yH3M/Mznqd0
 OyahlsR7XBKSbeNSXXWrYJmq3DPFqqw=
X-Proofpoint-ORIG-GUID: 6ZAMg5UKSK1s5mQqgNrlZCvfhhA8ea2i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE1MSBTYWx0ZWRfX1wEBL0wfR0lx
 FCuhe9GMQdi3fLpmc6ov1h51qSSrL0j21vCYJBP1KIIG1w+LxKywq9Jp7Mz/hJ1QbiWypfhN01J
 zuyqfER90lFnvmvPaG6X3IbmPROgY7Gwbv2oUDZy6V4CfNDO1iCc3tR5JawhjtU/Q17eP+yQKMk
 aa+v7+5lwShLlAPlgYs3izjH4CJSskKZrlrdadMgHdV8zEJ3y+TJH09xN741Gkkf6/UkHqlZr1w
 cDLT6UKXqeBoRN6KjJJc+AcqxXvnKYHVoiv5e5y/4OT3R5UOmlZOdtMyVNZsbdzdwn2U4iOkNoG
 Zzlqly6IkX1OuG/wahwtJ4dpD8tj5AnA0vnqW+MP32kAHizck/kzeabtYvzm0TPL74JZDO1K4jo
 t3IpWyyDir2NDvWN9vcPvOIsHyaX4HKiQYp+yrnEL9p9+hWQz1By+qsTk4Vlf+N2QF2ruVzeJYf
 LWsflP2bJajCTLEMY6g==
X-Proofpoint-GUID: 6ZAMg5UKSK1s5mQqgNrlZCvfhhA8ea2i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160151


On 7/16/2026 1:31 PM, Krzysztof Kozlowski wrote:
> On Wed, Jul 15, 2026 at 07:02:40PM +0530, Prasad Kumpatla wrote:
>> Add a new clock ID, LPASS_HW_LPR_VOTE, to represent the LPASS low-power
>> resource (LPR) vote through the PRM interface.
>>
>> The LPASS PRM supports a resource voting mechanism to control low-power
>> states via PARAM_ID_RSC_CPU_LPR. Exposing this as a q6prm clock ID allows
>> clients to request the LPR vote using the existing qcom,q6prm clock
>> provider interface.
>>
>> This functionality is required on newer platforms (e.g. Hawi) where LPASS
>> clients need to explicitly manage LPR resource voting via PRM.
>>
>> Also update Q6AFE_MAX_CLK_ID to account for the newly added clock ID.
>>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> ---
>>   include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> index 45850f2d4..06ca2c287 100644
>> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> @@ -236,8 +236,9 @@
>>   #define LPASS_HW_AVTIMER_VOTE		101
>>   #define LPASS_HW_MACRO_VOTE		102
>>   #define LPASS_HW_DCODEC_VOTE		103
>> +#define LPASS_HW_LPR_VOTE		104
>>   
>> -#define Q6AFE_MAX_CLK_ID			104
>> +#define Q6AFE_MAX_CLK_ID			105
> Nope, ABI break. You cannot change that and as stated many times already
> - if you need it, then it is not a binding.

Hi Krzysztof,

Thanks for the review.

LPASS_HW_LPR_VOTE is intended to be consumed via the DT clock
specifier, similar to LPASS_HW_MACRO_VOTE and LPASS_HW_DCODEC_VOTE.
My intention was therefore to add a new DT-visible clock ID.

Regarding the ABI concern, would assigning LPASS_HW_LPR_VOTE from
the currently unused range (for example 100) and keeping
Q6AFE_MAX_CLK_ID unchanged address the issue, or is the concern
that LPASS_HW_LPR_VOTE should not be exposed as a DT binding at all?
If not, could you please advise the appropriate place/example for
defining this CLK ID?

Thanks,
Prasad
>
>
> Best regards,
> Krzysztof
>
