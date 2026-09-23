Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2310521880
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168724; cv=none; b=cqzsjpvVKmeFJhGzzlaPxYDyerrztjMVu5sT+CYqRBosfkFTQB6BNrOydvnkc0ZPAfkrBWBJE8gNim8eaIO2/Xk1YWMxhOEmWnbQL4cO3qibdcmdJ+VTDFM4gDGKoahmBxNhtSARR+gJIeEZRpLMwMb45CCzUbD1DiCf3GSrxyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168724; c=relaxed/simple;
	bh=5JWwbmm/sf9shtpTQDKczj3QCEB9Gx1ej9MKInqgKCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ae0Vl4pPpJJDA1kkQNP0KM6/Z4QeKQbLYxQiynKM92McCWjDUR9G4qAZ/szUm/+liIbl/d01f8pxLjoGzOZVinqjvopdbXV/ltQHrYFJoXfAc+JJR2jv44/NvZDOEKXRJ6VWuF8wjyDs3yIJAXhhzoDq/O7DM1nN3UP9sKXAu6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kh2Y9rMg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lb5b2TDX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kh2Y9rMg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lb5b2TDX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbj0R3028271
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ieaJ3s8Ys6OkOmVj9MU1PHSyb77w8B86NRRI4rsdGCY=; b=kh2Y9rMg1MzLaEaA
	5YmavkJWOssHX4hwEgR7oz71ODR5WgwLMyh4HB2pH11vU9L0lWNonxm2PUK5mlP5
	5GCYL03LQtboAilKRZIwtsZrC8wxT8poEpcAzHEA76jSScl2cwqbDnkTxdMVGL7W
	5jP4hwavIwWDxhGe3pO14ATVB5q8TxFDE6Wv2FI2k9UH8K1wW/lzZUosFsClyQJi
	60lb5M92vRlMnUziyg4NkITUW5Xfel2OGF+gHcsD3N48geBAdhO2tuT/MCs84pDz
	B+t5qjUwgk9tzisA/3Qttk5ZvdOBGJ9mfCEKlUHe1+EdmhafZwHpfUUuXGjiJ46N
	CC2JvQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwarxau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:05:21 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c9f12c82ceso50377e0c.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 06:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790168720; x=1790773520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieaJ3s8Ys6OkOmVj9MU1PHSyb77w8B86NRRI4rsdGCY=;
        b=Lb5b2TDXMiv92alIKnWJgsN98j1xZ9FLZJZan+Nr63Ko4J0E4eloByBAmJ6d9iY41T
         MLfYq0vCcoo24cHz3WMOE+RZueBFQ7XaIYh6K61nkpLRu3jUGXYQ5wGow+EzVpmZR9Ox
         1/Cstg/bD2aH1ooK6va9OXoi//mDDYYO4r/s++o4DUew8QjeYlCoLUN4bbfXbtTDLJcf
         drBWOiC1Zq/P6OcjP47sInkKN4oFaAyEq/xMIXB0qNF87fZvF0Gg02zPHRLahQRwh2Sv
         u+WR/Gi2acBgvSwnXI5WV7Hd6/ZsUtINPA3OuZDPVfejQwZtdV3qZVd9UQ/aXLp94JpE
         Ef2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168720; x=1790773520;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ieaJ3s8Ys6OkOmVj9MU1PHSyb77w8B86NRRI4rsdGCY=;
        b=Ny0nBaxqdUD0wpdqUxtu9JkvFprZ2woQApec3YHIfakVeTBLUgMtBAxh0MW31jtR8t
         Dd39rEKx3t2EcG4uzDxjVVbc1KlUWR09M74LxJYio2SyM4ObxqlPe119JQUTOQ+jXqz6
         xk5VhsaI3cb5MC2rmfECCE3rmI4Q9DIc6ul2PWRGS7fwmCwRH2EomhWA5p/tsyReQhCN
         Pz8auiyrh6YoOh9AXoPFyai+whVIgLqLk42CQ+b4h5gZxRu8fSj44RfkhVaEdoETGvWy
         +3F9JgVZl3R4jLpgK0KOX8Rv1He4K/47V2Cx5d52YabfRcCpz6aKIuQpogx8MvVjqcN3
         5ZQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqmqiOnZBURrKiFxJljmy2hVEFqND6In4/++/MM6o6AKOrztGmWUAKFSkgeUcNonTEuXaVgnt9mbQl@vger.kernel.org
X-Gm-Message-State: AFuF++nPfYtjvKPmAVFwbo4qjAfy98vzbM649KesPmPS29IGgyFNYumI
	gB+3THfbXcIf7UfcyzJkUy/2y4zlNNQjlbtWP1e2cbDwmh3Sj/gF6L4EEN3lQLTLnNYU2RYo/jp
	aBm7vGiAXxRfC0rpXa7oJOc2SiDOEszOfT4STIMVImh06i6TTYYKmc1Ax3qzY3uFx
X-Gm-Gg: AYBFou3m44SgZjKnibPOacOFwAl5ocZZD4UemMj1HTElRgRQ3mDXLaqqqQajarxkzqG
	kV2URv5tH/J7bVcAygxMfNinF84M/Kyt7VVQEySN1Zxijhhvlf+5KZlveppwba99k6AovTlM3TX
	+398OVPk4n+nKlgqyvZjqn7klhUVAdUGpOACH4PwZHShNV6hozlQXe5ZRMxw8QZ2tzjsaUGGiUR
	VLW+LzRLRxtwC+Xh/F6iQ5XgnhSutQphGRt8VSGVfu+h+ZgTZEXsefCAc2rrm/pd0pViOZGOZlF
	W62APbm0nzr7KYuaK9hl69NTbYDM//368OTLtijX/OBBXNHYLnCg46gspLsHgMafuRqZHeJj9yE
	z0KndQlCR6zaqCOKuhNPqSA==
X-Received: by 2002:a05:6102:688b:b0:7ae:545d:f97c with SMTP id ada2fe7eead31-7ae545dfcdfmr383252137.3.1790168720471;
        Wed, 23 Sep 2026 06:05:20 -0700 (PDT)
X-Received: by 2002:a05:6102:688b:b0:7ae:545d:f97c with SMTP id ada2fe7eead31-7ae545dfcdfmr383203137.3.1790168719825;
        Wed, 23 Sep 2026 06:05:19 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae62dabcsm115831566b.31.2026.09.23.06.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:05:19 -0700 (PDT)
Message-ID: <f71f148e-bbcb-4999-9669-4975fc989c0a@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:05:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 6/6] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: David Heidelberg <david@ixit.cz>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
 <c5773a71-e7f0-44ae-8418-1e00de16d08f@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c5773a71-e7f0-44ae-8418-1e00de16d08f@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MiBTYWx0ZWRfX+v3rOTtUgA/E
 O62QpECxxDviwdisLkhRuS7xB36CBf+uZ50mJiM4+bE49nZSehotitLjP9UoAVls/WbRehbCbwv
 O3t7hYs0fPmFK/UoNJt/G/Q33DmreiDNtUtBc8QchGoSSIuzQxy86QR55SoKHblQP1H+7hJu+yH
 J45raKcz6ok6gH1FVeAy27LWV8YLXGKFLY6ogGG9M2ERmognInZ777r7YeLB0AiCUQc2kmJM1WA
 ImBK7Vnjij5CGv20j4845VSjv/GFVQf4BTC7R4krgib3M7kl7oDqJVPB1o6Eacem8DG14+h31LK
 K0+n7jfiV0bBJsl4Uwp1bhqhUtoBQz65d1ShmgHslHerWldRnWewMmw+ZlqA8/+KN7pCU2dQaAz
 /6vjPzI4SzjpddEFVCEIj/7NbRhi0Qa0EM9XRk6bpDAo4RLBmIky8QIfGPDLoxcqcHLGVXPw6HB
 AqaR+gf/GMDxy+ejuHQ==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3ce91 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=-N33akl6Kve4PNw8qKgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: KM_50M5uPeIitIKFrPBar_xesD5BLFAR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MiBTYWx0ZWRfX4ioKUAWR1P1+
 aAnhzOLJ0vJBDYrU8V0xSM3UD1pgX6omBuc3c8Wa0fgqq9WIrg/Wy4z1BQYZV7SVlUi3n/OoA8I
 k0ONraCbgH13QgytPCsye1xlCd3qNUM=
X-Proofpoint-ORIG-GUID: KM_50M5uPeIitIKFrPBar_xesD5BLFAR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230052

On 9/3/26 7:24 PM, David Heidelberg wrote:
> On 05/07/2026 22:06, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> Introduce support for sound card and wire two CS35L36 audio codecs for
>> top and bottom speakers.
>>
>> Inspired by commit from Joel Selvaraj.
>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
> 
> [...]
> 
>> +&sound {
>> +    compatible = "qcom,sdm845-sndcard";
>> +    model = "Google Pixel 3";
> I see some new nodes using such as
> 
> SC8280XP-MICROSOFT-SURFACE-PRO-9-5G
> sc7280-wcd938x-max98360a-1mic
> HUAWEI-PAK_AL09-M1040
> 
> is there is a preferred syntax?
> 
> I would go for blueline which translates into google-blueline profile.

Looking at

https://github.com/alsa-project/alsa-ucm-conf/tree/master/ucm2/Qualcomm/

I see it's generally SOCNAME-VENDORBOARD-FOOBAR

Konrad
