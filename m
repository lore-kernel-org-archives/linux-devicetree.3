Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EAA3BB10F
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781609291; cv=none; b=ZpzsIDZbA2VEUNBrL2w3UaT26C/36Gt/FFh2lK5aTbWrKMJa2lv0N7ISyA2E3hevr168iCwBrQ4UYR2J440HMGAHLg7w7nX5qWR6HXojNISKccD7M201yk8QlpB1SjuyQqOVJSi1PCh7lxLGBNwnJsZNQE5BW6B/eAchMpRR/Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781609291; c=relaxed/simple;
	bh=S5DGeSiWBHQERMNc2Ho8UJIoJGYQx8ljeq0erLmXIjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wp5aUT0KAZpObyZOWH+TwmuGVsYnhBXbQaqJ3KcWEe3BvTEj12ALT7Tvng42iUYmB9UGsIobYkUvpK02HGL6sA0KY4xvw9xWcRZ1FvdtCBlD4JiWDsnpvFrB9gRWaU8MZH+lV8JjgOtuPLmgMFBvrEm9ThPQ8T2AlMDA0OhKyso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oHqSze1r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bVr0kYni; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHqSze1r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bVr0kYni"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACIuN3411139
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hoJLZQD2EEa0tSnrFDi3f0vHL8Y+Bwo3kq935KpPr90=; b=oHqSze1rIzdt21dn
	YARjGJ7Ge6GN7U6HVfjZy2vHVJeAxyKgq3FYXWZBAZg/2vNZIniBBBljt8IoXEBE
	ZIUYgwH5fMXt2gqHrdAlAtV8afEj7XF8Ekmio31bTf9M9zAmF41SdpLkoD9lRBm6
	REvG/EFqZNWB3J72tMFwA0x093gJwCkvU5klHskta7YYFkGLgHVhLMBblx5OIKWt
	1V/lismEgC9AhJSWka+SFoj7mRgfyHmez/LGYVT2d06wvNTHogwRDch+WRtXNlQI
	8jG/EHEqwtYVSpKk057nY9ArVkjeP+LcpvY7y9mD62knoPDdejRg4YbNDxlnqDqm
	ZBOM/w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09g9gr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:28:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ccd1c3b9caso16339996d6.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 04:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781609288; x=1782214088; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hoJLZQD2EEa0tSnrFDi3f0vHL8Y+Bwo3kq935KpPr90=;
        b=bVr0kYnittuQ2iNWC3TUXbdE2VXGENT/yBCPZNaZUh+Pue16InM9xKEJlIrRgQcKIo
         fwVXFd0lRvn8Vg6KPpaYe6xnbMRdp7CqxN+pTkF/6yRh2cRwi0LvtxPlNt+pzVcceumC
         p2bJ5sryVjN4OqhTRgyGS/pIJijav6UMpRppyq0CuVZOoGTqdQRrFNcQHPDK3MF5Rmaq
         Sxpsm+IA7ewL4Kx0ZpHh4jSLljHrS3oOwRkXcxmOuRQkdAiIZQqGIDsKt9oye15xre2m
         U0IDPQVgEKBFV4Clrx6hTwxwELEiZ2+mjP5A+6B/qSmGFZBBNvYRbsWq61hys14GX3vM
         m7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781609288; x=1782214088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hoJLZQD2EEa0tSnrFDi3f0vHL8Y+Bwo3kq935KpPr90=;
        b=Ih8jYCwyLvmfrt+rKDvgS4M57tgsFKgoTgaFpPOr13gDDEKq9FJXgRyRCMk57AS8Jy
         UoxEXqpZmyi1/kiq2dMAmmqMOvFWj1ac5RVI1JMOFCBI9xJjvVf8bsVtKAAnr+HIOFUL
         YOtW7xCMDtkVV98VttAmkBuF2kej54QHx16KENE4FSCGnDXQxSdE9bGazwln/k8UIHCr
         81yqeFCxbo1A3Yb3+frFW1gDZN2a7jTNrS1Pe4X0pLLoVgz+j1svWRxWA1LvCJ+rbreA
         qfLvTMgtsVmzm9Y0YdMrFEHnZ01HeayrL5gZ3iboA5dVQqCw68Y35nl7Wh1Ad1vSugQv
         6ApA==
X-Forwarded-Encrypted: i=1; AFNElJ/TrDRqia5CWaOcKpQ36Jt708zxjZc5ZdRWJ2VmGaIJdKDUsEIBqIDwkFuOUaGH1YK4jjuZTtotDMmm@vger.kernel.org
X-Gm-Message-State: AOJu0YzRDZYO0jLWraILyds+NbFzvm9MPI4E6x/iIxRzT4eYGE7Hf3ys
	XDDKySoRBhxVRfdezQ25ld4dFD7hxA2PKtPG5uKTkKOshRrRxuxIrkcI6110NSD0PpEiThjPfx1
	J+OUvsscOIotQ5uMIZbbevzPWL4t0GJWQmou92c6JGgOtlZbNfbADKYmGmtUxd9+g
X-Gm-Gg: Acq92OGlUbwX9A2wPglLR/gPFft9U6euFoUgr5c5R0lnMl3G9IXE9tkmVIghOG6oxts
	R+XZRVqhZrgMQIodrgYkPj46B3OYVgkwfnWXcxP/t3G6Ih1MRwYN3oXmTam0dSSqmsTyXvyVUEU
	cx8ZHpGi/VpPKJb1liejFw4BzpMTKErW9OHMfbloJRLlfptlu9hxE7CQDjThOeLI2t6SVPiIK/g
	Q83UPohkwBpfSrce/lP7aBDv6W3MlrMz52l3fl2X6DKl0FL1wSGCw0hVSqiiTo0Kv6Iz7JQ2Mfi
	E+UHHgp05WyW8sCbSzrON3fqnyZW/y24qYRkVDxpy/mDyRHW0+6vCzHJrk938hMFo4zZhHvVsKn
	vhhq66WraGW9MTjZ+eIMPO4Q8L4URG2GkxF3b+hgiqVvBtQ==
X-Received: by 2002:a05:620a:40d1:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-9161bca6345mr1744420585a.4.1781609288150;
        Tue, 16 Jun 2026 04:28:08 -0700 (PDT)
X-Received: by 2002:a05:620a:40d1:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-9161bca6345mr1744416685a.4.1781609287724;
        Tue, 16 Jun 2026 04:28:07 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb522167dsm628573766b.25.2026.06.16.04.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:28:06 -0700 (PDT)
Message-ID: <d6da3d13-a8a7-4dbf-b89d-06a1fbe41260@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:28:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: arm: qcom: Add Lenovo Yoga Slim 7x Gen11
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, rob.clark@oss.qualcomm.com,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-2-57c70c23d0d6@oss.qualcomm.com>
 <7a330941-8715-4523-9f39-10b57586c69d@kernel.org>
 <CACSVV03J7Y4-ADRNE+4qArqsWvQZ3qmTc04r7vmY64s0qDYFkw@mail.gmail.com>
 <799fea04-e7d0-4184-b9ae-4cebfdac38d5@kernel.org>
 <841a54ff-6287-48d2-a513-a7442d624ab6@oss.qualcomm.com>
 <uieb6ukjokwnppc5zfr6bjychqsnpikwmiy7j7dmt2kgk7k4zi@2stv37ijv36o>
 <ac191a18-bcb4-4fa5-a179-b72a6ac928cb@kernel.org>
 <20260612160519.GA1118842-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260612160519.GA1118842-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDExNyBTYWx0ZWRfX934dd3kcgb3i
 r5h53F4OZjvwQL8vYIupinzy6b4XyZRyOvin2Aue54YsfKulZoNX5gV+r6hUEWNnA8yR53J0lci
 Fy796IKanhDLpvcz/eHJbQdEd1Gal6WGrm/E7xGFRdkfZbXIsDXkX3G0xwngVE0+0A6gB8RZph3
 JAUhHB8Z4teQe9bWbtxIJs7V0vUDjXELBSOIA5PQoMWL+/q/aorYEURHZkRM5wiFWDC8BwCCzqZ
 pUuNzmG4cyVHTSS9t/5eoisI5Z9nmYMbmo1GVoIsZ4wxdLlcMaNx3pqGGsLLlyQ0quzY6XKHgOi
 Sji0p3IXgvWgPQij8CIcbp86rbwSqyGAVKqrDcUu19Oqy9ZsV3m6YknkK8EPmTwG9Aq9DVigVhd
 ZUQZW98pWIL3CdsBq2ZOhELyJX/uPd+lp7aSa+conR3I2CIlY8NvMEavAq65J3navQdCN9+twkA
 AOxdZlGjV4fzy93nzCg==
X-Proofpoint-ORIG-GUID: K9RMG-PS12LzWD6sUoxvmYxygMOBQbaw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDExNyBTYWx0ZWRfXyWaz6Ww8ZkRI
 XW2ZRSm/7nI28spnU+4w38lwnjXy1xbyGwXGNwikXZxjvGVgjqOrG9nYbQaojoW2whW7Ja9P/OD
 USD6E5aLLDs3TsyrdtpC+GeBETmSVKY=
X-Authority-Analysis: v=2.4 cv=DLa/JSNb c=1 sm=1 tr=0 ts=6a313348 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Kc-3O7wfv0iHM2_tCFYA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: K9RMG-PS12LzWD6sUoxvmYxygMOBQbaw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160117

On 6/12/26 6:05 PM, Rob Herring wrote:
> On Thu, Jun 11, 2026 at 03:48:15PM +0200, Krzysztof Kozlowski wrote:
>> On 10/06/2026 15:31, Abel Vesa wrote:
>>>>>>>> @@ -68,6 +68,7 @@ properties:
>>>>>>>>
>>>>>>>>        - items:
>>>>>>>>            - enum:
>>>>>>>> +              - lenovo,yoga-slim7x-gen11
>>>>>>>
>>>>>>> I imagine you might want different panel variants, just like T14s has
>>>>>>> LCD and OLED?
>>>>>>
>>>>>> I expect this will be the case.
>>>>>
>>>>> Then better to prepare for this now, otherwise later you need to change
>>>>> bindings. If unsure what other variants are, then at least make this
>>>>> compatible panel-specific, e.g. lenovo,yoga-slim7x-gen11-oled-foo-bar.
>>>>
>>>> I took another look at psref [1] and there's only OLED SKUs (today?).
>>>> There are however, two different resolutions available and both can be
>>>> touch/notouch.
>>>
>>> If the other SKU doesn't have touch, then you might as well mark now this
>>> one with touch suffix or something like that.
>>
>>
>> If you decide not to have any changes (new compatibles), then at least
>> please document the above reasoning in commit msg.
> 
> If the difference is just the panel or touch, then isn't that captured 
> by the panel and/or touch nodes?

We already have a couple of DTs for laptops where the touchscreen may
be there or not, with the additional hid-over-i2c node defined
unconditionally and it works out fine

For the panel, it depends.. If it's another "Samsung ATNA"-class panel
(which I would guess is the case, but can't know for sure), and there's
no other changes, then it would work too.

I opened the build configurator on the Lenovo website and I can order
both kinds of panels with both kinds of SoCs (X2 Plus / Elite)

> OTOH, if it's different firmware builds and generally treated as 2 
> different devices, then different top-level compatible is probably fine.

I unfortunately don't know the answer to that question.. 

They all carry the same model number on the website, it seems

Should we go forward with an optimistic, single compatible for the known
variant ("lenovo,yoga-slim7x-gen11", "qcom,glymur") then?

Konrad
