Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5DF374E5A
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 12:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781872678; cv=none; b=olC9L45+avtj4c94mC2VyQKev5mMg5sT4kGRGqwbKs+LdQwqtAut5uX/AlI/dITLONqbSPfoGkCvz3MmNMLN6uEiNxDx3zHud/f4U8ETBkosOw31ayYqA7yAd5/f8VwdvAaaoJPFP1q1B8P0eVr7qa0/TUa2JA6qCNwFDEbz6ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781872678; c=relaxed/simple;
	bh=s91aBWIbD5YVObth9ob5saZK1S2OG/vt+ArfeoMThIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Svv2NPmPM2kSxuFUjU/Okpe58oGn01f+wDoJdvnBXu8Dlm3cE30hCL7fyaXTyzzPAwv4jlU8RpBhw/EZiDc2zN+VVKB+F2hPbUAq/QNliyWHwiGE3ij0AUrThyWAUVobtjzh2PkemLFKLuh5SLtcMhZv+r1SmUedmn9DRTOHdRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ebjtth9s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kiSap0W7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ebjtth9s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kiSap0W7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7Q8k84184986
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 12:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tH+KT6o+4/EXGYtJ8mk55q/zmuMFzZSdiVFyox+CC2o=; b=Ebjtth9s941BEZx5
	94uCJeh2tCqjIeQZz1ptplBLLg/0C18wtKYH7CNSAv5Y2KS+9HIj/hsNZLDbEnTh
	UWj12zNl8PYpSLYhCkSm01nMWaj7Wrz5a6A2YbKAGhHZu2rjdCgG2NT/M7ZT/WNd
	nNXJniWFlXsobOK6ZXZbDxdzU6p78wpN7sMtux6OfOAC/XR1TEOFT7hq+w1LMSsu
	ATyJ4rrTpbTQtcIz8jKoq1ZXfyClgBQbEoTil+A46vmCm3qo5S4EkiPpcPuUA67Z
	6DHrp13/bOmCMMHDRaX8uiEDjnC31OxgSIACuTBXM9MsKVf0Dt9g5KVp3GA1GIaS
	VkLgcw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp6sb9fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 12:37:55 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7270ec494f6so101052137.3
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 05:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781872675; x=1782477475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tH+KT6o+4/EXGYtJ8mk55q/zmuMFzZSdiVFyox+CC2o=;
        b=kiSap0W7bQ9+E6ISbdEUAnoxVz5Z0cJ4ILlcZsVambwDCZ1BBYmRQFP2eWhP7eFVR/
         t5qz6+x1DlCErasX5xIrnZIAxgfHE19957bPBektb9Ig0dnnTQSFyqhPqCkQKdpKTjdE
         vSO1xpLHwfKbjOJx9ySVG4I8VGtkO6gM1E6WCLH6TbJvPzAj4vM9aEV+W/axIM/GuXrQ
         qJHENtgv/ZF3PGyl5aSd/Rj9owiGyLv/zjv8W7JG48VKHHgWToV2tvo0CM/eJJD7zVZP
         FUGPrMgBK8fXBqWb/zoG+1coKfpjaLtrBWB/pa+2GKjrgg+pfpFRxleqwiJpXqFC/x9l
         cIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781872675; x=1782477475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tH+KT6o+4/EXGYtJ8mk55q/zmuMFzZSdiVFyox+CC2o=;
        b=o0lv3osSLRlXEd4TrBK1BG7NI3se2tibPq3ley7gOTuLvftNGOXykVgTAtKir8g+3d
         SLcqlzFyR0jJymGQKvhCsUUoZdryzFl5ZbX3HEjRm8P9vyQbabKsmrxny9NBRgu8UiYg
         v1UXBHskrqk/t2UDRN0kWVgIuYwbM3goUgpDYfBrfpHFAPP9qTUV1oBDXVLF9FWnNMHv
         b+FWQOFQBYoBvfzCUaH9Ck+/i6mbr33HF0oFd3e9p/cUMD8LEtlNL3/eHsfHhFjglYtQ
         QtfIBO18zfADt/ux285ZSJmJOn+qmTA/WrdVxidE5eizlwvROKIBQSI5UVVamTRDG+x9
         w5Hw==
X-Forwarded-Encrypted: i=1; AFNElJ8ElqqebPds2IVhOJgBarFG5dBhUanPAkJhTucdSKrKKv5qvwLFakkEBWB/i6ruv/kR1zGEckcv2Iu1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0g9VO5sdtaD6f0GupRxNGyxXlPuU8sjZNM0CI6rpXkAFryWAL
	kMdDGrNDV3SN2a5nM2inMGg8iSFZ7artvwqUh/fbYkoz2xvdlWLe6n/kpoi1Kb+sE9+qKdGQaZf
	uGAF96XJ0uLHiwDkPrEDy1Kes9J80/LViTMaAK9t5+QtHDDXRQM6TmiEYgGZNQCg7
X-Gm-Gg: AfdE7cmnWPz7Se5w2b4K4eJrFRskSGqFhNQ9TW3ohZXxEt4mIam7lgFjXtBG0FyMEHt
	ODdNd7I0N9RHS0h6svurCl2EAznGClOW1f0+v/6VhHvDfu8hO7k6uWBhyYcPR3mynmtW93GKQzy
	HV9ksXDUXf2nNwUnEtLUdbxKCwx8t7PB5nwHYMow5ypsNPPIoxOFUVEkdKAaAKUOXmXzFxqEVXj
	qgvICK7qtG4/av3vSqZG4lcd+7M8/HsY0/fByaoMCdI/J0pU+BgDHD/rWQD7IhizkUnaFx3Le/a
	4PHMXWmp9MDs/z2JY5L+PTd0ahTOxLGP4FwX84rHgLGMZb3UnkCFRIkTrKPVNBRbcs1hCfKxd+U
	HeoIU7DaFKkqQoIHU13r7nYU2PVvUEcAhCFM=
X-Received: by 2002:a05:6102:4415:b0:632:509b:e399 with SMTP id ada2fe7eead31-72a03b8d80bmr809962137.3.1781872675109;
        Fri, 19 Jun 2026 05:37:55 -0700 (PDT)
X-Received: by 2002:a05:6102:4415:b0:632:509b:e399 with SMTP id ada2fe7eead31-72a03b8d80bmr809953137.3.1781872674575;
        Fri, 19 Jun 2026 05:37:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a9a1568dcsm84124066b.51.2026.06.19.05.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 05:37:53 -0700 (PDT)
Message-ID: <d1437b71-402c-44ec-a193-8296016575e2@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 14:37:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <514cf213-5778-45e1-8d70-d3fe27991fcc@oss.qualcomm.com>
 <7JNJ4dUNz4ennJ5dkzhfLSuVo72JpfZAbprICPRqlRYnSzVDJw6x3h-1nESd_PK-3us9f1V3qOiLiywsTqP8vQ==@protonmail.internalid>
 <f01c0e22-4e5c-44e7-9ea4-4bc8d53aea2e@linaro.org>
 <29e8491f-20e8-4082-8943-66bee7e3af1d@kernel.org>
 <5ca611b1-0663-4975-bd56-b1343851e5fd@linaro.org>
 <83c12dc5-fcb4-4089-9917-9f0fcc4f940d@linaro.org>
 <1b107aca-a857-4e58-a763-39c82af67747@linaro.org>
 <67b6f6ae-bfca-4afd-adfb-6ec1741105d8@linaro.org>
 <335238ae-c476-40e6-8639-44258fefe988@oss.qualcomm.com>
 <04479989-8aca-46bd-8153-1dd033f1fdd5@oss.qualcomm.com>
 <qt2d2anvwlubaicwhw3rur7u47v4swqbctapcw5qek54f2yzdu@ljd46avkfgy4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <qt2d2anvwlubaicwhw3rur7u47v4swqbctapcw5qek54f2yzdu@ljd46avkfgy4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cPhiiWeFE4adPe8JY2h5Cm17G4iIJnc-
X-Proofpoint-ORIG-GUID: cPhiiWeFE4adPe8JY2h5Cm17G4iIJnc-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDExOCBTYWx0ZWRfXyL7LMqElcCB0
 jRKHHkrXYbdfGRVYVFPmepkW+9zv63Mur/WlgJmx/hf1z5fF+HxUaEambiX3NucURx6vdM/rxlp
 uiXsfsFlLu/hWIc4eXx3JjFS0JyvA7XZ4U2NARlgs5E8FmxJp8iV53q3Pv4CtDNmPa37CAn8yNF
 swxcr1mDjIxtrysi/+wsWy7NB/nZS70ur/OvGQwCKLTJOwP2B98uXjbva+Shle0C/VbLKt/ngYm
 x1EHzu8dPlOc5R35kGlT39xmFEj6eB+byOVK1/LjJRfITJ90PF40MHtBazBLn70JHW2aFUBjVQe
 CCiDp+ie1sOJ7HaRwtlcQlJvLk3Ixa7mqM5+G+qgl4wUR5W9bTAPBQ9GmxeZw7g+t6VsSwbN8Dg
 bEHUgqqrA4PwhAwBaBCzcK9yfXSGVpv/a/rsIN5niMuxu2ry3CL8IWShhrem19sQmZl6PRe2iMX
 36mlo0130rIaBFgGD6g==
X-Authority-Analysis: v=2.4 cv=H6LrBeYi c=1 sm=1 tr=0 ts=6a353823 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=xgdi4esuw1k_wJbNTHEA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDExOCBTYWx0ZWRfXynnqvIlu9Fjb
 +GZl30MLSAItISLFAnJROkI5QimRLSc0eyu4SSYjmxC3YXmhjG0q0SbwuqfecJ5+Bd5u8el+sL9
 kDyM4Cwd3FCwQhLjaWCRbB3LnkLlWSw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190118

On 6/10/26 12:30 AM, Dmitry Baryshkov wrote:
> On Tue, Jun 09, 2026 at 12:20:56PM -0700, Vijay Kumar Tumati wrote:
>>
>>
>> On 6/9/2026 6:56 AM, Konrad Dybcio wrote:
>>> On 6/4/26 11:06 AM, Bryan O'Donoghue wrote:
>>>> On 04/06/2026 09:46, Vladimir Zapolskiy wrote:
>>>>> On 6/4/26 03:30, Bryan O'Donoghue wrote:
>>>>>> On 04/06/2026 01:07, Vladimir Zapolskiy wrote:
>>>>>>> On 6/4/26 00:18, Bryan O'Donoghue wrote:
>>>>>>>> On 03/06/2026 21:51, Vladimir Zapolskiy wrote:
>>>>>>>>>> Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
>>>>>>>>> If CSIPHYs are true subdevices under the umbrella CAMSS device and well
>>>>>>>>> described as subnodes, then likely none of power domains are needed
>>> [...]
>>>
>>>>> CCI is not described as a child of CAMSS, here the situation is different.
>>>> CCI probably_should_ be a child of CAMSS given the design we are going for here.
>>> Yes
>> As of now CCI is an independently usable device to configure any I2C slave
>> that is connected to it. If it is to become a child of camss, it should be
>> self contained, as it is now, and camss may have to become a simple-mfd to
>> make the CCI independently probe-able? In which case, we may want to follow
>> the same protocol for all other sub devices like PHY. However, if we do not
>> have any requirement to use CCI independently (who can confirm this?),
> 
> Uno-Q uses CCI as a semi-independent i2c controller. There can be other
> similar designs.

CCI still physically lies within the camera subsystem and needs both the
TOP_GDSC and the AHB/CPAS clocks to be on.

devm_of_platform_populate() will ensure that subdevices will be probed.
simple-mfd is essentially a hack/shortcut to call that function for nodes
which aren't bound to drivers (e.g. because they represent something
without a top-level software interface, which is rarely true and why it
seems to be discouraged)

Konrad
