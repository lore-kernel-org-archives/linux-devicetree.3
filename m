Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17974FECE0
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 16:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784279; cv=pass; b=maSJiGYFA++osDpRbPQyR0Z+JC407Nb3R4vXX4rQ+1AQObdhJscUMY4QcU+gk6MI5Bj2H/STrkRatZvSLBvCaeoPpeWbi81JXx1PsqBB9tI/r084XqJb00hrZweYENnBFQFjxLxWAT57damDGxcBHwZSe0uv7sP8+WPsNhSgueY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784279; c=relaxed/simple;
	bh=n9fFaAGplQpnkm7Vf05iAz9kVcqoT3sPQRPD8gh+bT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n1UL2qnZM3CXzo2a7Rn0fvUXAxUqOre/AEFN8897LTFf56OVe2wteaTT1zSpRZTTjcYdMJcdhMPAe3SKwyXHfxIlfJONPR1lyQzB08mdPvbtyVgq/QCuqsR2NXV180w43TP4m1L/ZkIE8A58GQcFhKn5GQ2bGpVHbnX4rR8/dx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L2APh1dR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LfSdMKT9; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L2APh1dR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LfSdMKT9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxwYx3519944
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 16:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q3ippA8C7Iwe5nc7FGsk21TPZKf9tVMwe28Hxh6J4gs=; b=L2APh1dRJOerB4OL
	P1t9c2Y59+gGCoUq2l/4h21nVCaB6uiOsOnQs84z5r2jb5dQA07xYsNnISKluWxn
	7CFAtbAIXKXYSUxMLmfNC7azfgIe7g+Loec7Qk+0fFKu8dqZjJPFQWS4R9Prs2Ar
	W7y8ul3qjh3icyQuf2mIhTzslSdyt9C2IrOvNeK3ShQP7oAccAQojUDmrSmFYkUh
	iIcKFZJjrBKHkqaSn1j2Co2qBk6xUUK6nn6tKiwhEqSZuNSBPS+dQu9DelDXLWj+
	cURjdM0r1AURAAS34VgIi5K6Tr5RQCw6vetpbGX+pRIbWhWMUUsmgJukfZCOm+sI
	Ze7mBw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x27j98p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 16:04:33 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so6670897a12.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 09:04:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790784273; cv=none;
        d=google.com; s=arc-20260327;
        b=W+j5VuCcgsTT3Hq9W106HjKtJd+pitfGtMOisKduVTJYdzzxJIoJ634T/M46zNGXjD
         NAu03+yr3r2WsQZ77CUWXHdKHwhh2FiRjfRG8QZL5zdXPn1t29wJX3GU7Yx/NvskOHBS
         WFK60LuxgX0rqO38LYpmuzeabWpj4V53vAw3Y2QOfZsVCDcl0IsIIHQaGhbVSXsVlIRw
         L4T0koYzYVel0YYbZOPwaJLNMyjBFpdklNG/JbldU72YCUFwLh5YgYDetUqq5Nn7lPm2
         XPAIipHt0XebRKXeu7TM2+P7gS4eX/sNl+v/1nUyXA8IJYC0MDRmIQUncJBNhvVrN1lS
         uBxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q3ippA8C7Iwe5nc7FGsk21TPZKf9tVMwe28Hxh6J4gs=;
        fh=mUF7YMKrLsn1ox6UCtEPIUGUlrxJdq64fWtFWv4COxY=;
        b=GejP25Cyjp7HP8kh/NUiiXQcjq/k/yBgoqj9JwpFX+hIOqjBxrNsdxHDww1TsFm+qh
         dqb1JmWWnYgOj4IEs8CO23RlslAO5TSUctQjLcwPlUjOAzNeJJKIJsMlHsSCpOJg9upA
         8sQEPwA+jN5cFvP/twNbRT5FEsc0OKMQnHIsEnrPx7uS+dQGDLEPFWcDXpQQj1E9iV1u
         qkllU42sQ5SekQALbQo0YHBC31lImDG1Q/dWUHaCZ7XEGpBOTg8/4gvnO0boKaxiAItL
         Jhta4Pk2BjvI5V6ThMb0/qpwHkc0buKk5MkIH9VkHIfUxMWaBJyBQzFyZEhxROnv1Npo
         kwhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790784273; x=1791389073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q3ippA8C7Iwe5nc7FGsk21TPZKf9tVMwe28Hxh6J4gs=;
        b=LfSdMKT9ZGxMN/ojn0NYzhG38Q9/lRTn17jDtyi/AXw+J1vz1GqtkOPM3fMLIq1j3V
         TIBfxeTR5KoIaBbyZp6/USEx8x1GnxkT2+YCzZZ2L9YAYBNHlqcDbhWCf+nBrXOTAPAW
         0mkYWBUmVEEWh5Frns8fCnAcUrFr7LAyN80Qqxhr/tifjd2rnI2S+C7ftbunCwNL6PDk
         zE5xdFwcIGqDYDKfM0vCXrN1vcL0/gEK6fxHWqcDIFUNPJOacx5vftxvH2A/A/Mrxrqp
         vfMt+rsl0aYAZo0c98F9mWOphO15ixgK2CDRKSb3aYuwupVW5s4sSTrZBYa6YaZ9HD2f
         9TvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790784273; x=1791389073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q3ippA8C7Iwe5nc7FGsk21TPZKf9tVMwe28Hxh6J4gs=;
        b=RN2U/Rm5TqvdCj0aQ0tMpQV9AXijrx28VJFPCSIljZrFcTWMY8kOIb/MHkQZoWMry1
         IjNjdKjVPs/wZsbmXMY3T3mxVpIWOZFNUzf3nuMJUs3clbCDdgC/vdiKyD2tBPDpgH0u
         +JmY79wqWcVn5wlyprw1yNK8k9jybC3+RIDI4vC1G4x/f2hNgCUFW5wETfHRFA+beF7j
         Ywm0wvKzAv+iGg7UsFRbboh7MrB3F4khwXcUHFciVBA1pGG5ePxGLDcuN1oQsZsphfeU
         huAYY7pTqu68w0AmcVZOatHoYUyGHE5IvV2gGHWiPfBo87V8b4efxx1KI4dSRQdY6WIf
         qXTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVVZlv1aRpSycdvG8HOW03YzXyVZrGOAyydmKOfp8bGIY2mTmPKwaSBNg0YW0hr+YfwJctmLAJHnul@vger.kernel.org
X-Gm-Message-State: AFuF++n6YZQQIfLJMFgmF4s2dPI39z+VnKO8zpcMmnYnhuUjjz1LMqfb
	TcmEAh2CmHOJhNBUZ+cC1ShniGBAqZA/3SEkZpqDbvW81UOkvw5aJ7IZ4Xyaw/9gQy0Bm0DTonm
	i+tffP8J76ho/3o3G3FI9NhcQrgiK6BhrAvshAROFMOgSi4MrT7WoIDPhnTeJqd98ROjCxuCZ4t
	MgNme+hymSz5GuwnL+Sc4qoHtw9cb+Q97xb7/9CDI=
X-Gm-Gg: AYBFou2W9/2zh/o9O+OYL1QayfDKVb8EOwsq8bIDG1c22ENPhO5bkpRKRyGx3reCjz5
	Y1QyAIp5qo4r12By8yeuZCJrW0bwx+1nybYoPHHxguYqUz36BFve2xwcVbkrmbUX/jqx58k68s4
	r4314K21m7qK+XGbAmQ1H65sdeHjLwfr/X9u7rcPIxDqAWPZG0mI4uaSRiIQ==
X-Received: by 2002:a05:6a21:4cca:b0:3dd:a197:edea with SMTP id adf61e73a8af0-3de9e8b7c77mr1829498637.57.1790784272533;
        Wed, 30 Sep 2026 09:04:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cca:b0:3dd:a197:edea with SMTP id
 adf61e73a8af0-3de9e8b7c77mr1829465637.57.1790784272140; Wed, 30 Sep 2026
 09:04:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927151016.186493-1-pmazzini@gmail.com> <20260927151016.186493-9-pmazzini@gmail.com>
In-Reply-To: <20260927151016.186493-9-pmazzini@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 18:04:19 +0200
X-Gm-Features: AclHuK9W8iKpxeLaY0dvpEbGt-kGPjsZMSlSCjzDyfjFsqRteSj3h5zChvT9XB4
Message-ID: <CAPx+jO9aML0ABRF=j36s1HfPu405L18X6VyzppyQv_N10JPf1A@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] dt-bindings: mmc: sun4i-a10-mmc: add Allwinner B288
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
        Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulfh@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfXz3OOUT6rMTZ1
 XDlqRPFn45FsrjUq9wTjSpzHKe9z2hXaRgKpFzyIX6DlbGL84djW/uyfHbSelRI4AC+LPX58QQa
 P230DOdRR4ctqrwEL0y7g8HBuZJpTj4=
X-Proofpoint-GUID: rbUmPY6JXtye3k286CBOAVQZCT-P9pTu
X-Authority-Analysis: v=2.4 cv=W9GtxhWk c=1 sm=1 tr=0 ts=6abd3311 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8 a=kqsBenvbzo-VylAG1WUA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX+hBFekkMq6dG
 dkAOOOWMsxlP0Hb8woTMrfsUKiqu2YRBvGewZg6WuA8s/BlS8Mv/mHLEFhgrKtk/6ipt1dp0aLW
 mh0WP24QKCjv/o76X2Gs7vN1gmzlRvfcbTyBaA1tUajuCQvO8hrdDHwndqoomE9KqY1dNaUAUTf
 b5Zc7z4nl9cRX1iaEsNK4/yYjrOMHV04TDRLZ/joc8V2trjGFSY1AMP6ooKWKQSYKRM5Zd2OHAl
 V6wksmZiKTDE3Ya6dQ56+WRyfG/uljgH9GYfWuFlCsFFB6kcL6KryEUnKz7D8Xs+0XGbHAlRV3k
 IYEnCPaKaYQ50fdlEXHjnXR0MfZPCnfKIQNgB8Sp2jk/ULkfhp07tiPSPJpYvk5jyEpDPZrv4Kt
 RqUcf1D2g6X08198Nqa6PmU+qMaXxlVZrXLZANwv8OxABZ8u4oFYKWgDMnMIjYV2NAFsJbvwfLv
 hNQsBN4d1Zh2pe128/Q==
X-Proofpoint-ORIG-GUID: rbUmPY6JXtye3k286CBOAVQZCT-P9pTu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300064

On Sun, Sep 27, 2026 at 5:12=E2=80=AFPM Pablo Mazzini <pmazzini@gmail.com> =
wrote:
>
> Add the MMC and eMMC compatibles.
>
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml        | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mm=
c.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> index 9e9610bb1eda..c2ec7151dccf 100644
> --- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> @@ -32,10 +32,12 @@ properties:
>        - items:
>            - enum:
>                - allwinner,sun8i-a83t-mmc
> +              - allwinner,sun8i-b288-mmc
>                - allwinner,suniv-f1c100s-mmc
>            - const: allwinner,sun7i-a20-mmc
>        - items:
>            - enum:
> +              - allwinner,sun8i-b288-emmc
>                - allwinner,sun8i-r40-emmc
>                - allwinner,sun50i-h5-emmc
>                - allwinner,sun50i-h6-emmc
> --
> 2.53.0
>
