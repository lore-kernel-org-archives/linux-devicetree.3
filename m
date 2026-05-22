Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC7B3546EF
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442907; cv=none; b=ERJcimSp1AiDaYbkUZHW7OtK3x0LCXfa2pJs847DSP2aT4Cq1rdkt5Q4bYiX6vuleDKSkidxh0ZFzRMam0AamqlRbuk8bsa4fK1OQYVfF94csWeFHlsv9mFICLIYqgDoSYQUqbCtXsYpxjkIy3g+Ob9GkuUGt1wrLNvXRJkJdt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442907; c=relaxed/simple;
	bh=N1DpwsN8XjPhZiy/REfYe3Txz5NfZfhGG9xVmdZ8NQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iVKhinGHFXE6ZWbdKnn2RjYvUNJp254xR2/8lhIvblwGBrdob26ZRWtgMyiswPTJBJe4U+lQeHzC6qkGf0443+buoBtxIyc6yiVony0lLGwQwyP2MZwR04k72/afohMxKU1juY7DGFFcq8CHK0wGzez1aYOooaoTmlMEoQhS8Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fqNOn+Cm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YTNRoDb+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fqNOn+Cm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YTNRoDb+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8Zh2B3533229
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hDDtStgxWdmz+zI9FXNsfPajHB/12rCB2dYam0qgxvg=; b=fqNOn+CmNoDa+x2M
	I53BbEVkXSowPjPeKLza+XS1rrR7A8Y0xop0aACjwzh3hWAd0qsh2YwRhlygKkuA
	E8qSFKxtOSCtNsKyvVRPC9CUmf2HCDlGMbEAYXAiOD6EUDznPUPP1M/LAksPoc5q
	tXbq1D5xEnXBmaiyTB5erNc5QBqx7oF7ilbL7CxOcg++qNpVTnrGYJl3AZh7QnOp
	JPPU2v75WJOzAIWF8ljFhKeEyMnS+sunR55hPxpMxGdjoaE9Be9lJhngRbhmXR8/
	o7D4w5PSxZemSL3iKQyLP18Mi1ev1CSHtJhUCNQJ1p49N1JURuSKCtJoOO1iEcft
	ubtEHA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea39gvegy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:41:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50f1b94ac9dso27243441cf.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 02:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779442904; x=1780047704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hDDtStgxWdmz+zI9FXNsfPajHB/12rCB2dYam0qgxvg=;
        b=YTNRoDb+ayQ91hwSKtXp9wKUAFXSAbHUY6iV+G9bemKJOo3LHqlduqGdakDWJ+BXKv
         MbhoYhZHHgUJaGFFYYrOFZ1c/TK9BHcYPp7j5Sv2QSh70t35nu3UP3CwX74SvEB5/ANT
         ITTzCPcYw9BxaQ1Vulakvv77dasmsmLTS2ugYM9SsAwh+RWzDb8Nij7nj37C5UEdPTDS
         F2taI/d4OrdNiiiIK2ZuNXmw1yawUtrdedhpdMxOUSs0AtaYOw5lUdQiffw+m5rdf/Cm
         RHbNj/kZ1wSVLap3XTqzP6iUOsylGQQiNRgQCPFMCZVG1WS+DcNdSa1eTZn72StpSx4k
         MkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442904; x=1780047704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hDDtStgxWdmz+zI9FXNsfPajHB/12rCB2dYam0qgxvg=;
        b=fTHpmNsX7yhn1sZL8fqCm1PiWIlj1zxkc+ZnGoaROQ0cV9WClNuVZGWj/gBiodoUI5
         C6x2SMAWyiDgqpui9H5JXBYImyVS1o21eWDg6hOTJcO50XRClvSD4g7cDSvlW2rJ+MAf
         nXB78iHpe/DQLm26+vsht9VWgT6Pz5f41ScAqmIki5Epgw0ik2HceZW+letqIv/ucQPM
         eezAtJoEIKKthreuyocEljSl0m0zQjobeNzUIc45cD+HH+9ZwqiXhf0uuIELEv8LRJSz
         9BTW0qNIKhvm/kMUyZuH1U9tiGVFTM5yKeca3sJtCdp3riUFHEGhxGKXDQz5PZrX8R2B
         kQXw==
X-Forwarded-Encrypted: i=1; AFNElJ8JgC8I8laUygafKcPOxXE9/Dm/Frh/OQtHbWhaCdAaMkJ3xxbZy1QiXxxKEd6ftacySSueIz1aZkAR@vger.kernel.org
X-Gm-Message-State: AOJu0YxxIo+6hA2t1FyNSivp014P1oDubZ1cz+TgUL4z59QfP2oS/mNF
	8UCyRC8P+7bGVYEDN86Cy5zHdgH4tm+ChpuRhynw05LybAmIXX0q0Jxq+EKuHLZ99PH3SdAcMXQ
	etPfKWgDZPUpJYb3ute3NiK+6O6ZGmyNxG2LI0MA7sbJIzFkQHuvbvIIkla8WmyAf
X-Gm-Gg: Acq92OEDPNrsdsnLIpvZ7KBy5X4paerbaDC3x0cGO7+5k7UQClFwHWq9VUGV4uPHV3F
	+NsCBYaAgPUfzwWJv159nIbIYo9aexcEMFJj45kNrSyiLOYIc+FoYUIv3HN23L6ruDrRaWfVJbC
	eap8jWMP3kgkj8BpFYLFjDwRlvmZF8CmExwn+SufE4nCj2uI+oP7nmzjpIGIC8rcg3ohPbp5UUt
	SdYISStRqN8UOHwQ5iuML4EuKTPNtrclAsP5wuLCPzSSjc1Z6kRCKkN+zLv0/nHQuaYRQNeJd7X
	i5w3mpld5QJQvg03JOXC3IFg53iVOK5ID30Ayf8HJiz0Zm9OgyQhXx1Y3DsmAn01ZWvmGm/K1LG
	qDRyoa5sXn5Oo6Ca4YI/WC1mOn6OaooLZxCFcB/9Grtnjug==
X-Received: by 2002:a05:622a:a6cd:b0:50f:a53b:9cf with SMTP id d75a77b69052e-516d429c741mr22271141cf.1.1779442904104;
        Fri, 22 May 2026 02:41:44 -0700 (PDT)
X-Received: by 2002:a05:622a:a6cd:b0:50f:a53b:9cf with SMTP id d75a77b69052e-516d429c741mr22270971cf.1.1779442903741;
        Fri, 22 May 2026 02:41:43 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688baf1e20asm456782a12.15.2026.05.22.02.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:41:42 -0700 (PDT)
Message-ID: <9a999b51-8131-4032-82c3-72d7eccbd222@oss.qualcomm.com>
Date: Fri, 22 May 2026 11:41:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 0/7] Add support for Adreno 810 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
 <3dc009dc-8f36-4735-b849-d952fb626cf4@oss.qualcomm.com>
 <3vzdlxnee4w6mur5qiyk2rhewlugswxarhevv7l4zo47qnnqah@45oxl7rjqawv>
 <01b424f6-6617-442a-a77f-9b7a8472c447@oss.qualcomm.com>
 <191d66ef-7d36-41e0-b29f-1ddd47812b75@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <191d66ef-7d36-41e0-b29f-1ddd47812b75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yr8/gYYX c=1 sm=1 tr=0 ts=6a1024d9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=umUCZPTDblNGZq28zJcA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: k_IALBlKqrROjkoiFNCjH_mKIQhP2cA8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5NiBTYWx0ZWRfX3eM/7NyJDcWV
 a+goz8Q0UO9Xmr+e82IDikKg5V0qE3W0ap+S9jc/eUUYh+ymaNoJdtjtqhQygKqG18iycojBJeE
 QaHCHBEiPo1rjxyJOHCP2pYR0X6hwL/nWiMLwJNIIYyAL9a+ecGTb4Skc537Tu5svcntjIKLXbC
 0duIfDg1+YDDreDypieGlD/982JmOA/vm4Z5+v0VUkqDpWFR9zhnF+7qfQSCavuZidUU8Ql4AiS
 BWxD3fy/C89fDkVtITzqwkPy2J3HrzMWSvzwWB9bUbit4VfexwlIxAwJ0+CgbFX0Ha0dwqY/MJ/
 RyUDUJ0L8YWzZxxCoKTMGak2qpc9oY3Ckpkuqhd73zzwJRkzj3gO9VA/snL36L95TUODu25O54p
 9MykzsC4joXriWYJSXQdtzYjNuS6BvpEIgKNyoX6/E50c1Z3E2n+p/NlxyM8zXo7Ra/HSpqxI5Z
 Sn/K+2tE5aBfwlUV7AQ==
X-Proofpoint-GUID: k_IALBlKqrROjkoiFNCjH_mKIQhP2cA8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220096

On 5/22/26 11:39 AM, Konrad Dybcio wrote:
> On 5/20/26 9:38 PM, Akhil P Oommen wrote:
>> On 5/17/2026 11:54 PM, Dmitry Baryshkov wrote:
>>> On Sat, May 16, 2026 at 03:52:08AM +0530, Akhil P Oommen wrote:
>>>> On 5/15/2026 10:38 AM, Alexander Koskovich wrote:
>>>>> Adreno 810 is present in the Milos SoC and is the first GPU to be released in
>>>>> the A8x family.
>>>>>
>>>>> This series is marked as RFC because it depends on a few other in review
>>>>> series, GPU GX GDSC handling [1], QFPROM efuse for Milos [2], and devicetree
>>>>> support for Glymur [3] (for a8xx RSCC offset fix and X2-185 bindings change).
>>>>>
>>>>> Also depends on the GXCLKCTL block for Milos [4], but this is no longer in
>>>>> review and has been applied.
>>>>>
>>>>> [1]: https://lore.kernel.org/linux-arm-msm/20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com
>>>>> [2]: https://lore.kernel.org/linux-arm-msm/20260331-milos-qfprom-v1-0-36017cc642db@pm.me
>>>>> [3]: https://lore.kernel.org/linux-arm-msm/20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com
>>>>> [4]: https://lore.kernel.org/linux-arm-msm/20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com
>>>>>
>>>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>>>
>>>> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>
>>>> For the rest of the patches that doesn't have my R-b tag in this series.
>>>
>>> Unfortunately patchwork doesn't capture tags from the responses to the
>>> cover letter. I'd kindly ask to spam the list with individual r-b's.
>>>
>>>
>>
>> There will be another rev to remove the RFC tag which will hopefully
>> have my R-b tag. ;)
> 
> Do we have a resolution on whether the proposed fuse values
> are OK for this platform?

Ref:

https://lore.kernel.org/all/oka0Q911ixJLZzAbfWBx54dOmxbQAre36QqHUX4iDZoH3TE5jD-IqTAHspti6B8kfpLQ-OTnuWjFdXtsqJM-CUC8G9R3x_9vFI--LnpppiA=@pm.me/

Konrad
