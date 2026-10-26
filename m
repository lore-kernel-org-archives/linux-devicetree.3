Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019261;
	b=DOP4qngYmekXsT+AxhztY61n50P2MgMk21a3YZFdmsVNI6lEW5jzPkdQOmCKNLALFp8w
	 GhxyeeGgRbAFetqiGhqB8xJWJZHV0LM9dXu06MgxVHfOyMWUD63YjQeq73ebiQDUWRMS9
	 Gt/rvkGsm/f0tRAbxTbgCXGkfJsMeD22/3p1nEO50oAIeeBixsLKVvMKTPexqc6RW3fgM
	 AI8OL0nhUFC6ObjEM2jTw1htFyRgRDA3XKUsCuj0qxK2JCtZsdFqZ7SzLr2gT+VldjyCo
	 KnTYDxYq0QWClW55nOihioJYLZh6QPGQzTWBkbp/xyS5HbP9zbOA5F5uU5H8BuCCepg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019261;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VmySdFOUhU4GfW7VaXIDaE33ilLhOAM1Jty56BuWlo4=;
	b=azMPMWylNA5qqE7jZ9ySUb4AhmoAfV2Kj0b4MMOY44Q59oKQ3RkxdPY4NflLmbT/2c06
	 0EZGFl8+j7Ha5dmwcLc6IeJJaGvWKYiBwA5ZErDIKJDfXCcARnIB+uEfpbnyKx+nIYGGC
	 3FWlww3sfHyJQbQcubRXPSP4tgCtJaGTg6Ll0ScgqyLveK1XY642dwJCuz8rkJbYdugIV
	 NfvBiP0YC/NATi4D+nxHGJKQP4O627fDMG6UNzFZXnUx0iCMZGdEOrvOn3AakY5DG8upX
	 y2v/Cn7L4AJsg10alNzHaHsOOjgmTBFaWL+FLKb4i9zkdFjfwE5UYU26YJguV8r4SXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OTHsn4Nj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HIvzaBwk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E41606A31A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29E41606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OTHsn4Nj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HIvzaBwk
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt2U53034264
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VmySdFOUhU4GfW7VaXIDaE33ilLhOAM1Jty56BuWlo4=; b=OTHsn4NjfPTM5Vt9
	xehKmezvMndttd7xwGa/LJNoh2qvOi+61l36Zrc/8PA0N6YDc1mLzaSxIzZscCOG
	DxzKla8lawAlZzpOE1D//DgzLpTdfavmybYvVmN7rGzK50lQGCklIdCUq0XKFhkY
	w+EBoHK3SdbR3sQwwOMQ/p/LPJETxVow4ar+lgdF3iIuunmwKcDq73N17BnEUHXF
	ZwlUCoVZzI7AaA7S+S2VfSBNgzTi/LyguESnZTp5NC1T0HpYgipPF5GY1GHYq70x
	PaXM/U2LH7/g/Rt8LQ8yHe/4XVp9EWAAMk7sDlr8XnR1OQhEdNi9lHmu8qzJP7Ug
	FRADVw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y0g3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:54:19 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98c69820282so35505241.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 05:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793019259; x=1793624059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VmySdFOUhU4GfW7VaXIDaE33ilLhOAM1Jty56BuWlo4=;
        b=HIvzaBwkjxCp9ldTvNgCNrnEgkYlWPxr9KiG6QbBTo8QcYdFln+QG4hCd4KjzsDBUo
         JqSIyenuF9mv1keMt+9gLf1OPSYq76zvur17jo7tZ18ODNhlQxtzotT26LKielwFa9jx
         IewYv6Zf+A2KxU59m/tocbwyZJYKio4UTPdZrVmirHt9MNeNVMRX7bjSwJzF0IxAvQzi
         7RxirAoBrsibLU+Yij5pUyt1mtNkGacD8QJBupTeRCiCU787CyubSGIApgN8Cg9MFGWe
         AnPLOrZVymDEOAmzgsHPqzaWh81omNu89jtUorpXBdPTFnCgaRayUCMwuPHyT1gSZlRy
         mPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019259; x=1793624059;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VmySdFOUhU4GfW7VaXIDaE33ilLhOAM1Jty56BuWlo4=;
        b=UZvKHLq4w671SQ2SLJT5qYJElVjAXMrUc374tQoD4QilDq6Ba1SLIzbUS0/i7PFyqU
         4HU9Zk+zrVi14xVcZzOHbhuBykXJYsMGwgOrBbbrWq1MjZVwNGS/p15HtzpMICVO+oMA
         ZUymT6TfGEAD11f18w47GegMCdUO/YncUcZ339zBqPaVjIzJzJ6c3LwtdNssiidQKg1x
         6AoAwqb95dFUuzhV5h8S2Z+yI/peXztJdl8rR4nsofwQ066bUKuKKhHQB1Nuj0hFg9XL
         5eRFSpI2BeW2Dj/M2pqKxlhRI+RfFzBR4dJvlL/JI5MQa83yRfisv5K6T5pMNjAZmjUi
         gKYA==
X-Forwarded-Encrypted: i=1; AKwUvBwGzgI5BVf5qZlTt0DoJ8uEM85pYGNTJO9CnzhlJ8eyd4AKDx8zZs5Iw9T7EE6xawoN+Yjb24SErot9@vger.kernel.org
X-Gm-Message-State: AFq9FYI5S6RZtdN68SfLBtdp+f6bEiQ26RKqFBESa9iMqH4sjm7kEtZ4
	R1GKfrnzfcK5QSoiUFZBWvKJA7geh87oqBqs233lj49v0giwsNayDpJM1p9gpxx2vEMOry/WSZm
	G53uD3u+7GEB53KtQgOmhlqTG8B0MLH9V1cSDEJWCYyZswzFCiokFkNSUx7cVIm8i
X-Gm-Gg: AYBFou3NhYlNcvpFSs5VeH75YJYlSZMjBnrx0KcfsrFp+i6soUfOHk10GVAYxLkFN8k
	aaYCm8dgnaH/85gt3AoFk+MWeFyUwIl16PnKJ/K0+wa/sMtRuSwz04bNFyD+hPo4J9Hnvt8Tr8Z
	XsPpCG7NTqMJnxZCHq67z2o/aTx1BUL4jz7EOEEfo0iodhixmRTo5Fz5fp9OeqZERuVY3Um9zXD
	eYTWV5dbxfK1uMkoxRsbJbp2F5wpaGBlEGCaO0TKvr9ufGHUvzJ8moX+uGXL7hMJJ/0sz7K1A9s
	v+kEfEb8wdvrnRxP/i5AgMZsP/LOWg9GHVGNT7MN462OeNcpjwCyMd02PoPT6cvEDy6pCfU3vdc
	hI6m2HPEkZuZBPb7FHlYlww==
X-Received: by 2002:ac5:c00f:0:10b0:5ea:e18b:16a8 with SMTP id 71dfb90a1353d-5ec22ec8268mr1732296e0c.0.1793019259318;
        Mon, 26 Oct 2026 05:54:19 -0700 (PDT)
X-Received: by 2002:ac5:c00f:0:10b0:5ea:e18b:16a8 with SMTP id 71dfb90a1353d-5ec22ec8268mr1732281e0c.0.1793019258872;
        Mon, 26 Oct 2026 05:54:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7abf6asm313722366b.81.2026.10.26.05.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:54:17 -0700 (PDT)
Message-ID: <d26e1458-f506-4ce4-8734-ba1da012c91c@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:54:16 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>
References: <20261024-sm7125-samsung-v5-1-5a602ab00626@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-sm7125-samsung-v5-1-5a602ab00626@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MSBTYWx0ZWRfX8ttAsK/IhcEA
 HxmLGgIvkud0zYGta+oIKOCtRJHvEFn4LcTBiwQO7RjiyDnRZOd4pRuSc//ubZU9GyQKhTaVdqn
 OgNzD/HeL7aBynM1iRCSUO2FhT46LWM=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf4d7b cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3IpUgaB4rvrcq5R6IkAA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MSBTYWx0ZWRfX9GUhrJBv2+nj
 pMHCEHPv4SWuDELsdvc+cdq4vobnkieKsaDwSO0j/7H8Y9UeiDDdfxo3bSIg2lB080KwXyvyDcy
 goyJNvU9QXESrrLS4aoE/JY5tEqFGBIHQueEBEGz9Hho3N+h/2owFquxjSv5ZG4CiHVLKfZ+4Yt
 0+UrJ5d2D2yteJeBawnM2C0N9wwVMQwa5jfuybro1hK07h6b/hMUYDcTjB2NImymroFjzUdY3km
 LSLFvPQOPLNMNVBQhmnOP4d51W/lM459uD8ClljwOcTpbghcDeIGCqeDl873lqFNBeoVq/casrd
 kXRsi7bO1QaaG9+TNUmQdHlvhL126tLZE5HZS58MSqKa49+eyw5+8Hn/Izglxcbo8O1kpNN1T28
 5cjkAcv+Ee74gyfZjikp1gcyyC0C4YtuxtADaPCHPP08U9Jub+29KTZMjROV61ID65g2R7gFHN4
 KPPmOLef+s/PPJhNdIA==
X-Proofpoint-GUID: kNIBNaV-izi6C2VJFU1tjp-mxVLvThoP
X-Proofpoint-ORIG-GUID: kNIBNaV-izi6C2VJFU1tjp-mxVLvThoP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260051

On 10/24/26 11:21 AM, Erikas Bitovtas wrote:
> Samsung Galaxy A52/A72 are devices released on atoll (SM7125) platform
> in 2021. Add initial device tree for SM7125 Samsung platform with
> support for:

[...]

> +		vdd_cx_wlan:
> +		vreg_l9a_0p8: ldo9 {

The first label here is unused

[...]

> +		};
> +
> +
> +		vreg_l4c_1p8: ldo4 {

Stray double \n above

otherwise lgtm

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
