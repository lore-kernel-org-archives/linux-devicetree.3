Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF64446831
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787235243; cv=none; b=XVuQwpyeFByuZapUt7pA7qZ6PmLa1OG+sc8qVpKgkqpV80uWUQXjKxK9726EE1lnfK4GCmR3TgGPp5PCnMvPEUdEOKdKVZU3JZc9/3K8TUgYDgfuQpGRV4hoi2701HSEXwvk0QlnYepF66Om5eaVrNjwGSVsK7C/Eh/pdYIFOjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787235243; c=relaxed/simple;
	bh=ge7NAc26Zouy60hxL9/gFyna+mJcO/3xq3mdUNcdssw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lUWapaBG3WCsfBbfodJprjtAGEnJaG78k/0m/h/BnYvG4fULfa0q/WpI3MQNj9ziDH0LrNkL1IMRTd3YsBdaC34Z8VdUrg6mSyDhW/ITUICJLGMGlTkcaLb835Ta7eMMUaczzTuujFx4vPJ2z8Kx4u2FDGJsYmxFnlXJmE4Riqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZsES2lTP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NKbWKKIf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZsES2lTP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NKbWKKIf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7jeh3650468
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ge7NAc26Zouy60hxL9/gFyna+mJcO/3xq3mdUNcdssw=; b=ZsES2lTPPLE/De7V
	vTI0zxRwv9ZzcgsOVJ1wJ/8Idm+WNFET8H5kSoA6jFiFt8Md1igBKGGKPf9xvPvE
	y8P7UR14S0URQp6bulHjj59+Mv1y/5Beh5SZkmPmTHJn716KAy/TKAuMQQKGKFTi
	rluQh5ldP/jbaXIu1z0C01pv9FUiTqr3Zj97rHIDBndEJETuMs/dNpv1H/8YjUQV
	LMuns1PLzIAAn7ecNpqnldGcK/Q4p/HqOuw9iP+7xr+LQ09GjYY8Gyx4j7ahRS6c
	KBVG5Diwc62ZfwjrC4ayVlDLwBGeco2rua1wOpu1LE12Y1K3Rh5bc0Jvr4ufevuu
	ThXU7A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w499m9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:14:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e52306621so246183785a.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787235240; x=1787840040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ge7NAc26Zouy60hxL9/gFyna+mJcO/3xq3mdUNcdssw=;
        b=NKbWKKIf5Q8O0X0nKii8iuotUXoEdrjC4gP2VqXhxnp1JvSnDkQv8ZLTDSsdGH/yB6
         Qb7fOlp3woeDhOR8sE7V6i1er0vnuJrsoXvBZsgHybzhupYAbSO0sObvXATDcC22NE27
         KHevjDmaQYW6ZfDNdy+ix1WNzpjpzP2zN2MmD9lU3X8ho8ekIGGQPgPEaICNQO4oOBzG
         Jthh73GvsjdXuFnieD6cw7CZ2nEnuf8VIq6t46DMGZJALM056eiTewJmO15Bnzlgr8Tf
         mLneDXamBZnW5X4jfYaYj43JXGPnFFMC4+rjAVB2pnJ7HF3QrfVqZf3Spp92WT6U8K4d
         MQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787235240; x=1787840040;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ge7NAc26Zouy60hxL9/gFyna+mJcO/3xq3mdUNcdssw=;
        b=jBORLXzLHKQ8QXALxp0ea9lzfqa3E1vq0Io5uOVweLgVGvCF4MExTXJ1+bpVI/DrTD
         w1fKsGyU4yyCXcyJ98pn5dRIa0NDOMLRUlp0fJfLTGgreYLRR7g6Vs4sx0Qatn7KMMjr
         a9c+2pRrZpSxEg7rW10fSWyd5Kf1f4Q5VdR+rsovde405GHApSTHqf2Zfuv1zvkpCpgl
         GWp6+wfS3PveUe2kuIvp8w8f48sYiKQSpS6pMA3CXYGj/c92vTSc7exuHZaXqsrpVjbV
         aH8+fsnsKdlHDgtFRf/kF+B+sH6GzzV0TcOgN7sjV6JHUQiAk1SYmFO6nnKme8Xv0luV
         rELg==
X-Forwarded-Encrypted: i=1; AHgh+RpggDeTU5Eqb9WIgPkXu/UK0e+r6JPa3YqI1vPSn2E/EeFTByq8ECh9znSq1+2WrqCM+1yYlKldrmdj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8QWRN4I2ciReDcXFyIzuWOIImG61NUZmIpTZjGMNQkElW3VZ7
	5qpiC4chxX2ZUJX1finB6Ak9wTTTncQEPJF+B+MmNrL8dcF+j4mIw5No7y6u8+nSkq71w5r42Py
	eGhmWONIRCCLBfJFr2G6XI+ftlRoMONR1tf0GU43SoiT0IvyMVt0UN9R9QhftyrTA
X-Gm-Gg: AR+sD104A+G/2J2tVW7G44eyWkiZSemNVIuZ3F98Sh9n1COqvMxP579jmU1kwgI5IMR
	rYMTorU1Hqo7hKDNblGEmz0c98tcRQ0TrS7eA36Y8VhmOQF2+8HgI6yegLSTCEq0Ll4gw4ib+5z
	vc9VwChBmHCc8CXlJWA3uBQpbvRRo5NFc35KaAkoYzTCEnLaQ7Iep7e8V8WBLt65l+zGnhutV0j
	IOhBrBFohzaQmfNGOw6PwQTycnomxkrNYqZ6Ga98il9N4iJPuV5bLNfHJqgxfjNxwvxIh5PYL9j
	nkwq1obyfgOGhh0g4t/ifiKTB6KuX79+aPJa4PbAvHiNP66ofTl6Ip+HnDjdZORNsbe2grQ2v0x
	T523wjIEKZagwtFgdDgV07kk/H3at
X-Received: by 2002:a05:620a:4142:b0:936:a407:98bb with SMTP id af79cd13be357-9371e2034d5mr1107437885a.9.1787235240056;
        Thu, 20 Aug 2026 07:14:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4142:b0:936:a407:98bb with SMTP id af79cd13be357-9371e2034d5mr1107430685a.9.1787235239623;
        Thu, 20 Aug 2026 07:13:59 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2459198cf2sm75328666b.40.2026.08.20.07.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 07:13:58 -0700 (PDT)
Message-ID: <609b191e-a670-42c0-94e0-22def353c84b@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 16:13:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: exynos850: Add GPU/Mali Bifrost node
To: Thomas Turner <tturner@lineageos.org>, semen.protsenko@linaro.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        peter.griffin@linaro.org, alim.akhtar@samsung.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <20260820133556.76300-1-tturner@lineageos.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260820133556.76300-1-tturner@lineageos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDEwNiBTYWx0ZWRfX+c5WACArqtr0
 fibVKrfAmoecTmQuNheRHEu6W5fXD3tGzkD3vuanpwUZXg/QJBFsMw828kWS4g7fsbfqM9m44Yp
 URs6XubsmqxXdE2gZy6kXoVDRkwLsWo=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a870ba9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=IKBKkaEKMstryUwTzDIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: FVzgmV3TGFeNNwiKYszhDPigA3671I4Z
X-Proofpoint-GUID: FVzgmV3TGFeNNwiKYszhDPigA3671I4Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDEwNiBTYWx0ZWRfX1FcTbJdSIIB/
 Zol3/WjApuH/MyORNkYo6m7dt0oOWgHP+gaujxrkRzKHGWmiM8m8RY1/wTzESVTt/YATNLBEa8W
 BCRfgn9HEi440CW+OoULXbM9J+K+rJXZqfbD7wnnH/TceK2kRRUspIy7siw+3kVUqyQS51A910w
 ATwP9S2YuXihgVQNJQBnT0wePuLK1kOomDYY7DXf0/a+SPjLsEaXij3nXk/NxU5xFPdCHRs198T
 yBbaFj/oZz5Ess/wE6zhmlUjK6uaoRATzHeaGMiW5gkpOhedLef2HxAA6EIO366jVMBsyIsbMR4
 9lv/j9Yuvm+5jhe2a0PugTvSgCktrTTXzedcHtrxw1V0nfdWkTgSx6gw52utO1eNYpckL4XFIVE
 YXHqt6IqKcUUS4rCbYxOsGUVi7rLdK1oqB6jGZXIFiH5eK+rQdVHqa0xAUiL2NpnRbYlI1ZPRks
 jQ+DEhOUt6nU5I9dU1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200106

On 20/08/2026 15:35, Thomas Turner wrote:
> This can provide basic GPU functionality for the Exynos850 platform.
> Tested on the SM-A217F device. Does not provide support for temperature

How? The node is disabled.

Please respond to actual comments you received before.

Also, you need to version your patches correctly. This is v2. You also
need changelog under ---.

Best regards,
Krzysztof

