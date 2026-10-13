Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EBD3F23D0
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901442; cv=none; b=C3kaR2AKuCkJ6gVzWt75UrPFmPb3vFTzoaso/xfqCXjPVpm6QR7++PTIEmx6SXGWc09fYckOKMddlLfU9zk/o6gg1eMyqPCFNCU9B/gLdZJEisZBkn+5qxQGkhdcXr2QOgAtapIeBI8ZnbbHV4+e83HC6nFEor8I2NYaRhJOiVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901442; c=relaxed/simple;
	bh=SyE2Z25hzP8HKj4fDJ94fsBx77haZvgbrgT6zrnosF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ppAWEJssxB5HbW9Ao9kx/sc2I2rOlo+XCNRFOtzElTYu+UjjAyLhrpqsIja8Vyacka2zP8hU/XFauLeU6D7Ii/CTfOLMBnW19nM+asAPqrWXjLO+BR9lDknfnxD7P8X1PYX8nXvvwoD+J6AiP4WqgB0VPC4v5slclNzDUVV8f+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WbCqkCaV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VP31E+RW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WbCqkCaV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VP31E+RW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE3wRI1492074
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0nM8qXXdR5YbmFnkFs1b3gqnhsYEi9FrdxzOiNS83ok=; b=WbCqkCaVPtk9UIzR
	KDKCSMaLmcYdP1tdpf5tOpRaO0mn3OH1PnNolvBIODrRshpHOQfeyiC+HAXuuXSb
	NMa9FhyDweL/7ImGGK8oKAqobGVozeO6L87r76PpKW+7iisKT0zS206/mAvQ7DOy
	kyQZdimk5uqwwh/51UT868ZFKMrZOTn4+EN5b/SxxASJqRgF7BfceQ9oa5t9/VIo
	K6LiMfrkkofmAUwth/Rp08/e82hXilLVyHidvYkaRGkAA1aVu9T1JaO9O+qDHZ4F
	XUPdAnjZ67Sz2kIDDaDH8cdmpxJclU/KNn0vRPg4NpQRLKwZ1pGsHfr8ygRY8WOI
	bvlirw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9daqtf6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:24:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e46c120dfso325477385a.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 07:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791901440; x=1792506240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0nM8qXXdR5YbmFnkFs1b3gqnhsYEi9FrdxzOiNS83ok=;
        b=VP31E+RWjjXDpdmtRhXqyS5lIdoqFwygLrAkqc/e+meRskF3iEk3EiCtdksVwRKL6b
         SVFt9JIzmZNR7qWljPagdJZlwaW3HlqWIXGGf5xxk8PW09+oEYBhK+Rvd+GVYkoZLywt
         VJ9KYshbdJhejyfCw/wnIUWZTRdITRVWLaxzAfWP5WAdg2ooqR12BBtxwqyVud8o1O29
         4gyb4dsGS6qaibD/MflADrcMF8VV3ey7Ics79DA1+p0EtJK8g1ogp6WJknuQ71Tvzs1S
         vRKQ3jjpOIWt0xVIs0Dmt/neiRmf026SWrLovOFWyX9tTLwnUOx8TEbOMt/8l9lUAt26
         WXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791901440; x=1792506240;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0nM8qXXdR5YbmFnkFs1b3gqnhsYEi9FrdxzOiNS83ok=;
        b=O6COs6QqH5bct0l/+BfUtNC/8S189jwlPacoO1a931CYVF5Tw77nsf8offQaMI7A/u
         wtmusk+cFw4ZpLTu12Kty+zFAtTaFp9FXiioSOzIN5lx58FdYl0v8BQhlKE8lklbwLgn
         3xaLLAM9WXpdFo2U6wzZwIlEVZwnPPskzB7Ee5AvvSjxalEKAeYPdaoDncRvOSbe/Ln+
         IkQriYwuYYwfGRC847/ZHBIrBgCqAWvrMURgye83EPSPsZDnSac/y9DZ/QBOvot/pnGE
         PENP853mrv8xPhWytDubfu+XoVkZGHMzW7xlJzOMzDoSPZaRcn1ZhrWzdEScF4LxQ2NS
         +6Zg==
X-Forwarded-Encrypted: i=1; AKwUvBzgduQUzsx+ujL7R23sZNvDuoSC3Gd+xgGfryBygvfekdGFRq5+y4T5OH0gBlRGi8gpbsBgLBo4ymPw@vger.kernel.org
X-Gm-Message-State: AFq9FYLCRgsiawPFxRJXMbcM8igKjBTHzhuGWcC9SL/uOab/51InyuvT
	F0KxRW9gwnLVFgH5ndWzXmXWZOGREpW7yTZNd0sh0CPw5jjV47qvi85BNZAXNlePU9khy5v45zX
	CaD5AKkHRh9Zo5oH9xScgLNqvVOxKFzBRaA0wI8Soky9MSunDJxTq8rFtW5DPdZGq
X-Gm-Gg: AYBFou0Qd2rO6UT2vd54bh9Ur/YuKfNmCcqRVRT+7gKhKBuoxvuonaz7ZfcoRiZ6vW0
	YDa+6CBuRFYkor5yikezQoidESmFEE6dKMOL4k7yek2AtIFU03cDxJ5LeGyztIbA99NEkB2TLw6
	cQ72rT1wzRfKIM9GpaW2xVj3KdHVNercVt9J9ijxyzaejXU/5f/Mmk+uUAzN70IfROusZ7b4jMb
	Xb05Dspz5PRjni4kHOgj1EtjVhVm+EylIGK4f3CFIWkuR5ptFIDNI4FmW4jFLCKShqG1U7ON2we
	57wOWta0aleh6vbsQvKP/acz+f4ymsJWJFYtwEcOXTPQro3Iek0ueyqm5q4eV5m6iNLMrlFyrt7
	Dz5z6rvyfhY+JjUPX
X-Received: by 2002:a05:620a:6081:b0:93a:1fa7:1afb with SMTP id af79cd13be357-93ebd24d180mr2046718385a.42.1791901439864;
        Tue, 13 Oct 2026 07:23:59 -0700 (PDT)
X-Received: by 2002:a05:620a:6081:b0:93a:1fa7:1afb with SMTP id af79cd13be357-93ebd24d180mr2046711485a.42.1791901438883;
        Tue, 13 Oct 2026 07:23:58 -0700 (PDT)
Received: from [192.168.10.46] ([37.167.4.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab48a7sm5417001f8f.24.2026.10.13.07.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:23:57 -0700 (PDT)
Message-ID: <5cf4bf60-00c1-4aa3-b264-aafba8af19bf@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:23:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] thermal: samsung: Add support for Google GS101 TMU
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <8142519a-0062-4f0f-b978-980e049f99c1@oss.qualcomm.com>
 <8796cfa1-5ae0-41fd-b3f2-c6b588157b12@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <8796cfa1-5ae0-41fd-b3f2-c6b588157b12@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8OMe2a5Sa8ae7a8QRA53sPfHRc5FgjgK
X-Authority-Analysis: v=2.4 cv=FZuiV5+6 c=1 sm=1 tr=0 ts=6ace3f00 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Pwpi88Ktxb2v7RWwfB9ReQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=4bmiNBAiDDOXaXc57RkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1NyBTYWx0ZWRfXzB6r2TSs0fHP
 Oyy5w0xhFWZoBnRe5RHfnungNxAIJoATz0GFk5k5hUFiWEqUCI0iL98u3XuPzR7uEZPJoSWyXK7
 yyw6puUCzEsKM32aSlH4Eth2FCUM3R8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1NyBTYWx0ZWRfX9x3/4VhF6snl
 M/reS7If5imWBJrXNI+edCha/RucWJlDGMZd6UPKDegasAXTVhNcnoRWIO/4aj/AHgKf60Vab1m
 avpasnrEdYAfk8vheRloaDatuEaP6I0MX/l9U7R4VQCkGo88D1iEX3ygI14C+ONTiRupa6Ss3Ro
 LWfLoMerPxPFZy2ML9c92Tz6B/v3iie9Km7JRh7dWGJnbP7EvLmVIDwJTYhDV9Ztpg5WFdrjvKo
 hd+AeKB/EMEQ6pTCqnHDao71AEZPwIF3MeyAxu0pYFQgYwj8WWYnCOizfXbKr6hSJXVsXlDz8BC
 J3wfsOCZoJdmYv2YiWX/QWcX/OGAHeEBuBbayEUxvN8hILz/ODhDYqWESyJu3D8CAftUgeac7iZ
 G74hgNQ3OzgZ58S19UaZ41kyMbz5rAHTzd2pu5ojCw4f43FI3WX9wa2IykavniYv6p1bVkWfzO0
 +E3BbuPQOyyyr8bNCyA==
X-Proofpoint-ORIG-GUID: 8OMe2a5Sa8ae7a8QRA53sPfHRc5FgjgK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130057

On 10/13/26 16:01, Krzysztof Kozlowski wrote:
> On 13/10/2026 15:33, Daniel Lezcano wrote:
>> Hi Tudor,
>>
>> I noticed I picked up your series without notifying you
>>
>> However, I did not pay attention but picked also the dts files.
>>
>> Shall I drop them ? (AFAICS there is one comment) and let you handle
>> them separately ?
> 
> Were they reviewed? I think no, so that's another reason not to take
> DTS. Anyway, it must not go via driver subsystem, so please drop.
Yep, I agree, I'll drop them and keep the driver specific changes

Thanks
