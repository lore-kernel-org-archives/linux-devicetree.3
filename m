Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A6E434E5E
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 16:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442176; cv=none; b=Bqhr8QKmR/m8Ih8fb7LqoHVYMp5cs6fPxczW4t6cjz6FBkaoS1knT4HUebr9ZnwwocaFIAN7CtOjkW3pi88ID/dJGmpZ3XiP90JNiP4PuYN1qQ7Iw7J3IMHMRRBkPYviCskZx0hH32fg8rcSbBAv1us+qAxkMdSzbqvEFxbEZbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442176; c=relaxed/simple;
	bh=jD7vMq40BtjbLgY2tK+JEwoLI6ZCP6ExRZNtAmmlxYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d9tvXha9F4u9I/6HEgCeiuFI3XpcDbSXFgRoauavTTA/mInwzIQa1DOjur9BF50m2mqGljMUukFarjcf5vLmZuRpX8hHt+/3y5Pk1j8FHf04h3wynoQDI3hrCPGMSQdYNG142dNmiwG3qSSQSbdIlkVoLvxUsf2DyHS10fH0IrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V83Lk7Ef; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FxCtv8Rf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V83Lk7Ef";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FxCtv8Rf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FT5t2002241
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 16:36:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rOfu/YSWSoVJ9+8gOLnE9/D8lneB3OTBsZ8QT6Zknbs=; b=V83Lk7EfjAfcIHfd
	bkLPBHZ7XgqzFQ9jyOKPYHyMkGKzP7+6Qr/7y1Y10nxHQOmGEnfiYcdrtZj8vJVe
	huf+LH3EXGxlwQ5Zc6gyIpLVJkcFUXPxNu1Lub0lZrhHU5Incyp/bl7LulZNGj3T
	1adSCkhBFLXP5OqmCWI4hBid86sdntPa/eAK3cAbrPHA5OuiOjKkVbwzloPyitAD
	Br7JeOHWzbXFwR+BUvgbDap8qMW3pwVx4gZLZ9Y3ERe/oNl2kWYD8GydLMJK/bfb
	TTLhMaPXC5iX7SptJ/yL4LOhOzXFNvsXketDXDOrDheXo5ZHJij0XomcMZ3TOSuH
	XJlWpA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0hm02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 16:36:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37e24235ce1so6796253a91.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 09:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783442174; x=1784046974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOfu/YSWSoVJ9+8gOLnE9/D8lneB3OTBsZ8QT6Zknbs=;
        b=FxCtv8Rf8Uekvi4+/jnXVNMxDJq6E+bhmfoiK/LBmEBqQPcuEF4gKhTrQWzNy19KTx
         eu+gopMGpfMo7VlB0IJ9F/9I2FN6fcf2/cxB8ew0NY7z3sGpN9sQASia5lxGreFhizkx
         bb0z1GiXWDl6fY8oCahECnFyzWf/PxEXNVOxJVwCC+fvQ1RbCw5aXdxIAkK/H6pASCq2
         x6O8Q36WiOx3fP1twVisOdhPM9BvrOu1wyosFXII/JTUSjXLDtkOJOPNSiaZGv02jpvr
         /TShSUUZyfaSvymSMOYS8Q7pg/AHzQ/+PrmoCRCnYhS6A1V4lEG0ixZ9YjVqW0Rz4GtM
         alAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442174; x=1784046974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rOfu/YSWSoVJ9+8gOLnE9/D8lneB3OTBsZ8QT6Zknbs=;
        b=gKeqDB8AJM1eBsA59Ss9fawnQa836Qk14xGLxYhFBfMkvPuQ80gnyLMtIEK0vxUTc7
         oIxWURtkcNol2tMxW6xN2lIz0sX4FXJjpLqnEg3dcUhquLLG/HQoSKvvxwhwdIOUjXrb
         HfivCfeUntVH54gKUK2Yv09ykuB6lj/0Lqp9dGFITk6045/orPOGZP666ClOI3uDccjr
         uRR0sKlA+7hu7sTySsL+YizpiHhkOVgsLWiOshs6jrKCHapNqlHgIy+Cir1ex2CHfs6E
         hWD6af8cXUNp7s13AQ3jfBo/1dB9yPQQOrQvYkq5oDwwadh0MMudtCb3Ra2avOepw/qr
         WbkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rroei4zZcYhSEI+HIvGvR3/DB0suttdy3iknYRYod1UrpyPzm0FWV6U/LmSEkB06aE9IrZFPxh+eoJW@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv5axlV8lqXvxYEmV5Z6qjqgcddEaFZlpG5bieBLTp28kO/Ds5
	eLRFOobT4M3DdmgHTVrKxzLYMeRjuEEJdFPRHmle5ey1nrBb/iMJsVDKcsERZYd7HeoUJhQzlfW
	T8vYftmr4b5fGq3qZMO+UGQOSlcswxJTCdMJ/2bkdAOFwVXRS/WxM8MvXTQHh/yql
X-Gm-Gg: AfdE7cksPZZGxHAJGnxkUSjrHGUmlE5qLZ2KtIl0D4kOB5qR/TnEq+STMIYakmV2p7G
	KfE0Zl1YV3uyRklF9L0l4YxZNtdt9NDTl5M3vCfHUTk5CSFMFGS9hxzrTmXsMumvhbaDUyMbBqN
	EGDyLSEotmdwbNNdUZHErOXI05eaf8np3qVNwsD1x7VqOFArZe4isFG3SBqA7gyuA1iazNU/dZP
	ySnjaWX41AHSd9vYe9r2Sf2qxca2nnGW6x4mxl5Ykze54a3a4qlKcJvU1OSG0Vpegwu8t4yJ9G9
	4kEh09v4mGMW88AXHuaHeFBZjWBbX2nJZHLHMVl8ME5XN3HLm0gCx/iXntfoNF2XryzHeR5zhr9
	5sGeCg6L9IdZ9Zf6NWKb8CTYaIJJ/QK9q8lmFlTyKew==
X-Received: by 2002:a17:90b:4ec5:b0:37e:1609:b304 with SMTP id 98e67ed59e1d1-38756801500mr5684097a91.1.1783442174007;
        Tue, 07 Jul 2026 09:36:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4ec5:b0:37e:1609:b304 with SMTP id 98e67ed59e1d1-38756801500mr5684047a91.1.1783442173406;
        Tue, 07 Jul 2026 09:36:13 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.234.127])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118389d9bcsm2524489eec.20.2026.07.07.09.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 09:36:12 -0700 (PDT)
Message-ID: <97b205e8-5ab7-4205-b1dc-cbcb0497987d@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 22:06:05 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/11] arm64: dts: qcom: shikra: Add
 gpio-reserved-ranges to tlmm
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Anurag Pateriya <apateriy@qti.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
 <20260702-shikra-dt-m1-v5-11-f911ac92720c@oss.qualcomm.com>
 <9c1aab59-14b2-4811-b778-8e96645bd65b@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <9c1aab59-14b2-4811-b778-8e96645bd65b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MBREdICyEakOPVJofw5XBuueZ0mPqfXH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfX7JEE8vzylNw8
 DfE+CKyRlxSEHjtzU+/YgTr4lkXqF2if/rP+jwa2U96zclCHFMPJV3Q2lwyC03nPkb7IXl42KeP
 SsemUGNUxRI37QRpi70DofEtmFsf5FM=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4d2afe cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fIivk1FRtaL8gRNK6azaIA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=TqdALn-mf9RdMn6JgEsA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: MBREdICyEakOPVJofw5XBuueZ0mPqfXH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfX1xq8JVgxBwg0
 ssfPcUmG1Dkze0syOJS89mrQfajDtH0Mm6eVjo/J9uDmXBjyMNocx3RgCjdpqBidMg0drMMTlxf
 jStrK183jJsupnOoCdA74M1V/Hzg+9DBmCvBZVVotslnj5/J3Xi3FRKPPT1LKM53eDcN2O9MBhd
 3zWiiFq1dSkPNRx/gVWb3I5eRfQ7qvBQAt1VtGhCNe7+cczA+f+VOpiWcO6VyHhu+wZCvOeTsdv
 hh7g38FyUiglSJhkNfzhijAxl8+G1+9uxtiSuBd8jBRBAKaW/srwWNRSGngz4vt4nu56SZYPpOB
 sNcuJZ/kEhmAfvB8V6pqa7uh/qpPz7kO3v2IghJM58WgAi/sB8pi7fQdIZTMKU0q9PcKCAKB3IT
 L1Yk8bgt9FIAiwmbNXExYUp+KHuZ/dkDjchmzdM/bF6lVX/Fo+zQ0DGiLgMU01L8D0tptyEhXd3
 B4tNWXVga2FGH2ktliQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070162

On 7/2/2026 4:25 PM, Konrad Dybcio wrote:
> On 7/2/26 11:50 AM, Komal Bajaj wrote:
>> Add gpio-reserved-ranges property to the tlmm node for all three
>> Shikra EVK variants (CQM, CQS, IQS) to mark GPIOs used by the
>> SoC internally and not available for general use.
> These are generally added to prevent non-secure access upon TLMM
> probe, i.e. the board won't boot if some of them are not protected.
>
> I assume the proposed set contains both ones that are _absolutely
> forbidden_ for Linux to touch, but also ones that are dedicated to
> some specific purpose that Linux _shouldn't_ touch.

Yes, some GPIOs are reserved for secure-world use and are therefore not 
accessible from the non-secure world.
I will update the commit message accordingly.

>
> Please add comments, like in glymur-crd.dtsi:
>
>          gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
>                                 <10 2>, /* OOB UART */
>                                 <44 4>; /* Security SPI (TPM) */
>
> explaining what these pins are.

Sure, will add this info.

Thanks
Komal

>
> If any of them are boot-critical, squash this into the introductory
> change
>
> Konrad

