Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795811442;
	b=cZnAgJ8tbkcvfx4uE5MK2VVe/11NU3lkyiMvFqC5QxB1h1lxxnh+6Um+UTfdMVQW5V5w
	 sTHAH9DbgkQ9hOBxsnc68zF5ceyTdqpVwfpqbT02XmkCFLirrTJE2rJr6M8kfyGq+rEcM
	 B/d8Zeh82JBjwgguuNIwynLJvuqYzbchFPsdkBnBTHboWy8t+dQytGcAPHFGsjP/Ncqa6
	 6P2YpLFb/SLUn40bfoqmaQ6/cmcE/8GDmSlBYyy9RzR5le6gu9HZrnfM2vlZIeGOgt4ba
	 IDSXuUwXAdGCoRFveL9PihzPBqmO/mvGTrKGADjsLTGW0aB7x1gogFtfDpmT4ljePxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811442;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Hphn3ZfKORUo3yr9W6IsBbo3W049JwCJrXs91ZHeeMA=;
	b=UjB3lIUyAaic59DnsFMg0HWICF9eCPQUZ09rdXNAf13pkVekznO6KIMYF1FOFvVv1oUw
	 HK9x21pOYpLYWhPqZPyEonnVdeMlBVnJga22c6n8l3bVOIkG0svLgDR56i4GuzvQ/OhRu
	 GxNBp07++IGKbOaK6796i5xVnb0Q0ilOOrTAycr8/lAaBN+1SsXkMzeyJzfkikzBlaUli
	 7N9f65mCo2F7L37y4SGeMzQuDUWwEi+U0BGZf5VRBdXBhCGtyQ7JlN/evlHELzUoJoN30
	 +H0/2D4peusJCbyDcn2Qlhmpx653LtnHi8qFqa21WY32zUMHwa7Vx4m8W43LjxSTxnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kNdXS4/7";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JER9oDJK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C521A606A32F
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 20:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C521A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kNdXS4/7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JER9oDJK
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJAlFV2127624
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 20:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hphn3ZfKORUo3yr9W6IsBbo3
	W049JwCJrXs91ZHeeMA=; b=kNdXS4/7/27Bmjheg0WPfQA0MdTG89+3TYQIrMtP
	KPX1JUzQQodVcJqU8ZuOVICrLCwbfVGxY0KtiAcPltWSjhCKumY4cq0hP/d73q0k
	cAaDuMqGtkCDpD9q+2XFu3dArsBdBFA7IQPBbS8Q5N4es80BriYOYy+nF0xvpSRU
	qJct5pbmkoRU61yfmFWKyHBkw9IKirVLWipywZK7r8utenuJBSa2EG4p6jBJHIK3
	myQwJmE1hSIGngZxKB7kPMV7ZOXPSC5tRhJPSCRfWLM1oQOVwMV2iG7apDEB6TXo
	sRdUM6onL8HQN5XYj9uOEWhDjIhpFS+Nxd2P6Mqr7EzCPA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7e7d0e9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 20:30:40 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67e05bd44faso8620661d50.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:30:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795811440; cv=none;
        d=google.com; s=arc-20260327;
        b=pVNTd36KSjHuoZI5LWDrdhQHSsE5GGZiRxpWQmaLqB01KiGpcLGzzSI+ewrhlwBTB1
         10z8BPfjnT1753VyViJQoXM+LH6luRofl7ujvSurNgCKqVOwZqsDwI0E70ZVJkPMdOdP
         d1FJvqZUBLsbkd6omjbBpPiFftPU1BFTsLbPlc1+My/pI0K/BjL7xEUUsa1a0+/E/YXK
         Je5Mo8rQXTsYVRwmMFG5qh3w+7Nn5yGno4MmpiYutcrolywRP6c0ibwnQsqFz8qk54W5
         AcBga2xJN1DIeOhrM7RIjrs/xx9C2Rd8Y4FqaBI8qNhoAAuadru9S5Lkrpu5WvYSApZT
         15Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Hphn3ZfKORUo3yr9W6IsBbo3W049JwCJrXs91ZHeeMA=;
        fh=O43GsksIWVcxS58IEmwESxuvmPDc0bTJc1mCGKfC474=;
        b=Xw4xxYWLkHmsKsjTPLe7w+UMOUfpLwsLIdBngEV0h2dqUs/zsZ0OfJUX6fwDrK36/e
         UPROZ2tItrSqXKPoQLNORTuR3arsdfgj0g9pB/XKefBUx+MQfDM9LFbzjJ7zXsmTidxE
         U/GNfBZ6J0UbovOI+RRDIcsofiMAiry5VPGWksz4K5HliD92ffHrdv3/2CLxAb26PXbJ
         n75DU/ynXMaglxtIO65JQi3PGPKPsyUMSr5xlZnPWPvAyS3idtJgrAaqSy/WqbdTZqRs
         sD5z9vUurq7U8J885deK9BQqURql1KdR9HH57KMbv1KHoAijQgSjiFJEKx/oL72kz8gA
         9xZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795811440; x=1796416240; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hphn3ZfKORUo3yr9W6IsBbo3W049JwCJrXs91ZHeeMA=;
        b=JER9oDJKrd+p/VOFiEVXJktXs+fCy8ZWlsGHbGQkW3otoDmAHelb2RAQd4Gj3jSxZu
         5gry8Zp2+0y9O3Y9eMz0a989TJ0UjcSZtWF9/5PJlajEhJU4GR5dLdwek3C0ioyFbOGE
         z2Yy3kbvqRKhrw4QUMt3MJcds5lq34NJP3u7LdS0v6OQzf6AdVCRQC/c2uYgIvMjGLxQ
         dBahEFwtT/IYlWRNwTHGPXhoyP52nu3xSSthJQAME/2PjiBuYT5YVUFpkKNrCMp3DTIg
         5v38iOQeYv8H20nLxQRquKDIK3JEgPlDk6iieQp0dZp5WQFa5aFkTul0UBmR3j6o3aOG
         EZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795811440; x=1796416240;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hphn3ZfKORUo3yr9W6IsBbo3W049JwCJrXs91ZHeeMA=;
        b=KFaI65NqCD4TP/p0w7nVdpWD+Ei7RyRZ9AU0rWtORw210u75JTGWg/NF/vOqPOERfC
         EwxBZ4mUZrWsp60/MHmO4bm3uSErJaPL3TG38lTO9z0ka9Kbqan6xZf0/jdrmVpWZWzs
         D2rOYX0uQQnhUxteA634g3Dj7qCELK2StGOg/aJ15dt6wUlLmJiweMpx5Amd7iqDCfSZ
         DPtSVt9Lffq4RAGH3/g/+bO1QE7A8OD2nJ06mfjq0zz5TgeW+mLCgDJfbaDxDCCXsW6N
         2aBqGy+HJ0ldSY10MX2Rr0SGvZ4Kg25uKHoqNDM+eWt+XScpadQXWM6/eXS3DTULYznW
         HBfQ==
X-Forwarded-Encrypted: i=1; AL+hErFB08TAB6iVYsC/8AW5fqghxQN7V/1Z0alHJsaB/ZfSr7Q6DWpRrmz0DGvCZXlsYEPLWJ13KCa8AXZl@vger.kernel.org
X-Gm-Message-State: APuU4Z8Wr9bMRClUjK5YvL2xInvH0yKJiO732dOLTzG7CvK+8zJZchT2
	rAu5A+kJKgk3EzlHskexyOBMXAuUV9DlnnNDfu7DMxTjUtvS+b50bvur6ptR3Du2dEUUefMcSbk
	o1YQTDUeHyHvV3uT3thkBiofkRtgoZnWMdFD6QD4iTJXVIbRb0/J54krcWhzWFAu7NfbPRAGJrG
	slDoZTWteW9/fuMiLUeA5BdwFdsz793n+mVYzktyI=
X-Gm-Gg: AZFdTZeABFJsIFP5/o+hhYUug1ucgkxn6tBZs+6ofxg/D5gBtTVLh0cXgxMF+R4Lkgs
	KmQELggU3opeSAC8+LF2NQBnEqrCU4SPGq7uIvaUDzqrpgB9qtsvSu/DBGXgG5YDuL0HZFDiTmH
	jsbj0cwJD4dYtVY5FOKI5ngme1WJV/7hlnd236xtsYllL93FMbgk/2nvHAZxTPCwFbzz9SrQURy
	0J+qRsBcDCiQX2VsQ==
X-Received: by 2002:a05:690e:440d:b0:67b:ec5a:2075 with SMTP id 956f58d0204a3-67df4446b92mr7114686d50.78.1795811439934;
        Fri, 27 Nov 2026 12:30:39 -0800 (PST)
X-Received: by 2002:a05:690e:440d:b0:67b:ec5a:2075 with SMTP id
 956f58d0204a3-67df4446b92mr7114661d50.78.1795811439276; Fri, 27 Nov 2026
 12:30:39 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-q8b-dts-v4-0-e8e7438f5545@radxa.com> <CAPnEM6aAK8hwJ3EfhzS=gdMPTf+bhVgS-=JAoM+axcHzBQ1CGg@mail.gmail.com>
 <FE7B564926118C33+50565d89-ad83-441b-b85c-cafba0df5546@radxa.com>
In-Reply-To: <FE7B564926118C33+50565d89-ad83-441b-b85c-cafba0df5546@radxa.com>
From: Chris Obbard <chris.obbard@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 20:30:28 +0000
X-Gm-Features: Aa3M54rOA0nGZYSsdhumtFBM_XfbHqu3BlAs81Bv2P-Z0wUA71uwNq6De_uad1M
Message-ID: <CAPnEM6YXXVJ==OXinyZyGBfKS4iX=N+eMJRGZframsnfAeTtjA@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] arm64: dts: qcom: Add support for Radxa Dragon Q8B
To: sophon@radxa.com
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
        dragon@radxa.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniele Briguglio <hello@superkali.me>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: YBk-mEj673QNC0NhWTMx_d0HVOeAJ1ri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX6qoj4GnDcMPC
 QC1FrM3xnBDUfaTqXwM5tzSVfeFvquI8EuTViz4+z6b7pNPpUKduUwxVDso8uUTHbmEvcTQnSFx
 C0CuRCdzUwn4ToYaUAKY8xxGCnrvYcSEJQP3ZFhoP4dnMYYqtaQvKZp9GZuBVXupMSPuczN0Weh
 tsW0HkAL7crOiwtUIehTTRUBknBei3XbuBbf/9ALoW4yQ0j1ln7Xgwhfq82IQh7EDV4WZQuLI8s
 0ROlckeT2BM40UJwlyuP5LGaKu6AE2ar0u/HjvVYdzMOKXNthkKoy0xQadHy2+zHMnPvDni5B7F
 n2/zMPZlaQnjqDBd6dyk8UztMWpJc9klvydWk+5MovTnFzzicjRr+UGiHS7FaYMo9K1UJeCgKev
 zxHsJQZmGiTLqKz7Nuqo5hMHnfB/r9itKWubNzXGqxlUFsGm58p6CUE2yiHClorSCzt1nqUw3sN
 y49AsL9IZF0a5/8a7DQ==
X-Proofpoint-ORIG-GUID: YBk-mEj673QNC0NhWTMx_d0HVOeAJ1ri
X-Authority-Analysis: v=2.4 cv=cJh1IVeN c=1 sm=1 tr=0 ts=6b09e871 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=ksxQWNrZAAAA:8 a=NEAV23lmAAAA:8
 a=05-C0eYiNmMOl18pgPwA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX8JbI42USRGPW
 Oqapkxn2eQofneRfUmspZc0P1YkNKSDbF5f3U66Y0G4oFZ075dF6bQ3amMe1oiE1Snw4fJ8GDcz
 XcLzlVSGCSq2vgHUHhvQhlCm9GMyMJ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270081

Hey,

On Fri, 27 Nov 2026 at 02:43, Xilin Wu <sophon@radxa.com> wrote:
... snip ...

> Hi Chris,
>
> Thanks for testing the series.
>
> For issue 1, the Iris init failure and SMMU fault might be related to
> one or both of these patches missing from the tree you tested: HFI Gen2
> support for VPU2 4-pipe platforms [1] and the missing Iris IOMMU stream
> ID on SC8280XP [2].

The two linked patches solve the first issue!


> For issue 2, I'm not sure what's causing the hang during the password
> change.

The second issue was quickly uncovered after adding UART - it was the
SError you mentioned
in the cover locking up the device - which of course
https://lore.kernel.org/linux-arm-msm/20261127-pci-of-disabled-bridges-v1-0-3bedcbe51cda@radxa.com/
fixes.


> For reference, this is the Linux 7.3.x branch we're planning to use in
> production [3]. It still carries quite a few patches that aren't in
> mainline yet, both for stability and to fill in missing functionality.
> It may be useful to compare it with your for-next build.


Thanks for the quick advice - you'll see some T-b tags shortly !



Cheers!


Chris

>
> [1]
> https://lore.kernel.org/r/20260915-sc8280xp-hfi-gen2-v2-1-c52075bc284a@radxa.com
> [2]
> https://lore.kernel.org/r/20261030-sc8280xp-iris-iommu-v1-1-1e3fb8562b3d@radxa.com
> [3] https://github.com/strongtz/linux-radxa-qcom/tree/linux-7.3.6
>
> --
> Best regards,
> Xilin Wu <sophon@radxa.com>
