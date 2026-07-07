Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F1A3947B8
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 09:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416296; cv=none; b=ggbj4M66gxL7smGKUE0gWDL63P37rbqrguh9n3pzIkrIE2vewpCagXfjrdUo10SvkQBXhaHd4EaItGGCwhsTAT71Rt2K6Fkp4ns6WInxzWdfA8pSBhfpwXbKjSlwdTIJhiGJop3KV1NfJGQQUU6siZSd+QnYfFuuZ+WNPPIsahQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416296; c=relaxed/simple;
	bh=PiAuRzSrVirETb4Q+BzGnIPv2Qe3sql6vwSfUHtf+LY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C0rLfv/7JQeWAO/FHiqn9Jz0h86LYm+6yMLRJWEOBBbLPMMcJxjV9a4DSbRBphH7zUENVad/UMDBXf1s8UazzcWKplA/BzCvbOUgTFFnuWON8JiAqSPpsgt7HY99Ar4FkykA6KdNboZjEstjX3//RioBPUns47SgGCgGttjY5Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jc469BuK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ia1IV/Cp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jc469BuK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ia1IV/Cp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678Dc6L3076590
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 09:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJJ9VNaQeNwXUw6b8nu2XuRz2oRtDJiBhPVRNK4TA9w=; b=jc469BuKXnRZ1rtO
	x4pnOasOJKO0SJMmI4FlsKicl0htYcIdlNlYQ+OVGt1f4QVNTbj5AkyqlbZsDgl+
	xjlopIg3v/Kf5BLrMrkqEMNrj7uO+XH1RjHXadz31UXHoflx55oVrNJ5LrYW23WU
	iPtpi92Ds4eEW9hP5TIoVAtZA21fXGcX23P17TwVBQA8T/Y76UNhBMGtRo8PJPtZ
	D9V2J4jK4YGlV5tRCFiwy5zrvuHtNnaig2FDlf+NdfQ8fwmtxvRHmeTkWp+lb70J
	AI8PS6/w1wdaoMAbOHvAIZcEOAlmhdE9xka4P9U23L/GOa2KAGWLQ8/Qfrr7EgmW
	r04jFQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun0hf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 09:24:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c069f73e4so12841011cf.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 02:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783416293; x=1784021093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJJ9VNaQeNwXUw6b8nu2XuRz2oRtDJiBhPVRNK4TA9w=;
        b=Ia1IV/Cp54L/zrFFbWavVePFv3GdsFcUEUZUyV3HUxfJ3zATY8kuAKHyRaceKZwNFY
         sTtIVvbYzFC6sk2YNK7iV9xjdDrvHk8d7dg6SX/PtBJlZ+7uRi7YVC12soWGChxWZswW
         bA614m+sLFsa49Huw0/a+TNvBYDz+m72HopIsEC6+n1D10Oko3mc7Zm8tD7O0fMOJkZ6
         drbwWFIi2wQUYSzM9m/tzhi7hkye6MW27tgzLcgde46qqxWS+iUOUChK2G7M5i6wiaij
         I+oPQcMnl/VseNmx8vqX0zo9dEsp+LhzKunqKPdOgZrT+4cR47kS8vqccRRUKSQ6LQef
         vhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783416293; x=1784021093;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CJJ9VNaQeNwXUw6b8nu2XuRz2oRtDJiBhPVRNK4TA9w=;
        b=OxbHGGl2sOLRmDkKjnu35O6bUU8xjZLcdGLO9NhvrJ0iGy/OJCMIOpQrXTcaXpQ4dy
         0klcXdXcy6VKIOEQawYkxavM2EpGGrCZu6lG7GGjMp8krBVgULiWSNZS0ng2cOinAxc4
         FcsOX1pCO0IKwWuAXR+QU0vJOh2f5X2FsrUcjgvVfvNGxJbTj6abStkMr7gnoPJ+7rob
         +CBkEoRH6etfT3hxNqq+q97ddIk6i1AIKhCuLRXDK6+GVVLkuLHWsqHr3eWJgZR3krog
         zPd2aNnvIsnTwAsGyWpgiAyK2tlfPJtvRs085+f7mATNRtcBRMU4DnLoEL+6iVLlkumv
         +l9Q==
X-Forwarded-Encrypted: i=1; AHgh+RphOxVGJXR5FD7rnh8a7JtVh4V11Oj3kaWBhGsNgN2l591+DMAmRAwVWszrYpceR0N3i2AtfvZz0k0g@vger.kernel.org
X-Gm-Message-State: AOJu0Yx31hxeXie652zaxwgqCbjt9DpOH0FE0elxGveF9lbxRST7Q697
	uNPqNLEHSwAfS9y41Z1L5fpp07Dmtl7lpepzTV45WwmFBNtCWnRpzfOVnY+v3DhGtjdj6g10lWQ
	JUapJYCxHFDQt0xpCycHGo4za2IsKwFu6ZAnREDZxu6EQ+DRzkgi+zav2K3LJ0wf6
X-Gm-Gg: AfdE7cmD8znlzn+HTONf86BOO0h7vHME/YonAiid5n16ifO8YC/JDeZ6KgsOXaziL/K
	Pq22BtdxPK4Qg13G6QlFjNTRMFsD3ZbByfQudQ4w+UW+vD8QPVk3d4yqzxgWmaJpwaGMDA5oyeJ
	WKMe5ixws7dlFkCf0VRDuqdjWxLyBItFMeJ0SqclDntSlYZGP8INzApVgvsRsyf9sDcjIBdh1nQ
	Xc5zez+Yly3Cafxr9mBwqJMzw8jrAj0MBKOzDoQtBaORnKccO+EtoItD39+1+yXVjgxNqU76jrA
	kqbAmiBqeEy8kDg9e+XX55e/1Z5j2BpEHZKbpdYXKSb29uN55PQw+Svklc5DHEcv7R7S3VhkRbd
	7d83ZtgKn9cb1/XCfsXrbSHISG3Kn0AzQz+8=
X-Received: by 2002:ac8:59c2:0:b0:51b:ff1a:3d80 with SMTP id d75a77b69052e-51c79ed7d5dmr19016111cf.7.1783416293517;
        Tue, 07 Jul 2026 02:24:53 -0700 (PDT)
X-Received: by 2002:ac8:59c2:0:b0:51b:ff1a:3d80 with SMTP id d75a77b69052e-51c79ed7d5dmr19015851cf.7.1783416293140;
        Tue, 07 Jul 2026 02:24:53 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb482f7sm91703866b.59.2026.07.07.02.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 02:24:52 -0700 (PDT)
Message-ID: <8a09875d-af5f-438b-b947-bc2b61219b70@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:24:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
 <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
 <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX3OiWMbRmoFdM
 hxtv6aUMDnIy3yqNcXyk+2R5SARBRfYOTEwmYp8OR5o9hKNvNXZ2MksP3c3v49REae4AUQX+xQF
 jNDy7cmIXB0UhAWiefAQS4tRqOMO9z0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX5AD67ZB6fjOs
 FjvdGk3fm+xrRRlUjCS+bOk/Dm0uHuY6gsvk5+XvVWPpYJE7O2FmuTmN1p5sns+yQWJG7zZPThC
 uDh9zWE8jTjiyaxRx5HfbDHew5yMtFgmqnW6oNnCcxxZ1MxhoF3ypFFxTCY5LeL1eevRZg+ehNW
 AhoVUTVBsBP/5O1vmZYdxlK7L8D6up830nT/xYnRqydAW5e4mSWVHMEHLNHjys/jDIB1ovvWiMJ
 DIQ+oR23YPFB3HCbxIatNgbAFlli8p9bNHgHh0P2yelu+qG5srwAoFi9NbGB4tahsdZpLLENBw5
 RQeukXSywxAhuc3B4S8+Cnay4HoXtVNneQLyq6e9EkAtJaloOuoASouJLUOQdWcB74Olq5ye/F/
 H6KZI5RBmXjB6YOFJMDaYd1KuV6hCigHnDUg5G2umd9BoOeYFkqf5pMqMjsXH9hGHhBYTBy018c
 N8m4uJLKHYGShvZBQeg==
X-Proofpoint-GUID: V2PLoc19reNfzMhVUbRgORZHmXGpaZMp
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4cc5e6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=ZbAgfBTtTtZkgMFo8CMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: V2PLoc19reNfzMhVUbRgORZHmXGpaZMp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070090

On 7/6/26 3:37 PM, Bryan O'Donoghue wrote:
> On 06/07/2026 14:02, Vladimir Zapolskiy wrote:
>>>>
>>>> Why? The common power domain and interconnects have already been
>>>> described as resources of the parent CAMSS device, there is no need
>>>> to duplicate descriptions in every child device tree node of CAMSS.
>>>
>>> CSID, IFE etc are not parents of the JPEG encoder.

This is either a strawman argument or a misinterpretation of what
is being argued.

>>>
>>> The idea is to make all of these peers, eventually. Not particular block
>>> owns the TITAN_TOP_GDSC - the entire CAMSS block is a collapsible block.
>>>
>>
>> The statement provides the same information as before, e.g. it's found here:
>>
>> https://lore.kernel.org/linux-media/fbc018f5- c025-4747-85f2-53b45b0f0496@nxsw.ie/
>>
>>      There's no functional linkage between CAMSS/IFE and JPEG - they are
>>      peers within the CAMSS power-island.
>>
>> Thus "the CAMSS power-island" exists, and it got its hardware description
>> as the CAMSS top device tree node, and TITAN_TOP_GDSC power domain is
>> a natural resource of all devices on "CAMSS power-island",
> 
> Vlad honestly, TITAN_TOP_GDSC is provided to the CAMSS island - all of the nodes within it depend on that and it is _external_ to the block.
> 
> There is a CSID MUX on some SOC other than that I'll restate it again, I'm not sure why you won't accept it.
> 
> There is no dependency between JPEG and IFE, one is _not_ subordinate to the other and trying to find ways to invalidate that statement runs counter to the facts.

They are all subordinate to CAMSS_TOP - Vlad indeed said they are
peers (i.e. there's no co-dependence between them specifically, but
their parent is shared).

You can't use any of these IP blocks if you don't first power up
TOP because of the physical layout.

This is exactly identical to the MDSS case.
I was hoping this was clear after N other similar threads.

Konrad
