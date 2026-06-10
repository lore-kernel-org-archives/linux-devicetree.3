Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7ED3ED10F
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098314; cv=none; b=QdXev5VHBkeGWPIiCvbVEqZytjXSWdtNuEfn2JK7SOuPafhnGR+5XiKSlbP6bJLbDuAAueCHCFgmvfFRL6J3X/gYjqgSlpJkB8NE44d2YgpekfpHC53qBJQJ+nou9PwJnsaWbv3cp0Mg+zHmOOtR6ZzxV802DWfDjNoIykAHegY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098314; c=relaxed/simple;
	bh=IKjF3NcjCHpUA9fLpGIEglNQEzLYSsm5AlOr/umqTDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=comVdgrbIWn/MveqyNVgkmAdjt6WPWdADXbstBkCL/dHaWFYc2agYIfwre5Pilobaz+OM+wNqVltNzrRHGmkZ/E8Kw+5SmIgWRIjfGDQf4wyLRIub81ml20gb4j5xww5ylZyVswx0NpijW2r1MYqYp54D6qs5qWgMejPeImQIgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICR/aSus; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E2KraJi1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICR/aSus";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E2KraJi1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCBpr1472544
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wg9PboEwMxlYPdtB2q8pTY18DjjWx3Pqn276RgTauZY=; b=ICR/aSuslL6b0sMB
	uRfP3A/2hEcK1Nc8h28i4AOggzIaDORne+4X59pQW1/S0tRJ4OUBcER0whl/unCG
	+vhfTOavxKRsjfwy1YdMLKhP+hTxHTXWB7Bf/SCm3TAgt95Es1zyd6pXaVBAWYku
	eb3EuSnl90V/KM9KFUXMCYU7BJEnpDusCsvWxP2NDBEgagLY4TQnGU0iTMY9t6ep
	eiGq2LDoWVfeRYQx5/tjEHX0wG47STekL9AjIQDDebDi0IB/E9ByFVqeeMP3oXhn
	WZsnrQsIsDZm+ls2899gfwSY3fmtue86Oo0rSiT/in50zSoTjOy6ftca83uQLSst
	v9EsFw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kda211-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:31:44 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4865626337fso6151627b6e.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098304; x=1781703104; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wg9PboEwMxlYPdtB2q8pTY18DjjWx3Pqn276RgTauZY=;
        b=E2KraJi1ttiH3AIfRTB2OciUeyyj28ClM25xceTdl1GdmHZ5hIz+VOZW+yxzDnxz8t
         GICbPyJWq+x1Px6sEBMtIZ7ILLGuSG0kcpyCEQ+XqWa0nxJ4hl1YJM1JqpAc4QT1QYn5
         eVXqoqQd6ABDmBW16i4uObkZCqTfvEkAj2Ksdm21L+/vGoD/+jTQxZBWZLmvEBXCRpz7
         1j0ZnWsElhR+f5PR9NatWB3a2McN7mZ00tTcJ86lg34BxfTFGelXkHtDAxPy4TsBUh1F
         TCBUHJb3jHNFIzYmrPNHrVacpUDYkTen0aVowNTlrpWzLQc2DDCBxZjOIi3OT73WkP24
         SR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098304; x=1781703104;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wg9PboEwMxlYPdtB2q8pTY18DjjWx3Pqn276RgTauZY=;
        b=YHjI8YAXj/6N/Sfg5aew4/slYu2INuTPKszf7YswKEt0mAEdM5H7pfSopykUCJbkk4
         HJJlGV44WTTN5WQigX98z/i8s78YXW3asHaRnHoilmE77qT40uGNJOhbmk+sbV4PKDKo
         wQ8gVFZrLfYMrl3vm1x6a+SGEIDtVpSsUL5EI2IEjeTmEmaP4hQK9Y8JquaW8YxuYCOr
         +Q9E7Zff2ciccm1GIpiWgps44m5ndiWC9rPPxTUWIB4g8P3C4hLDp946/Y7ndVm92jKe
         CBz9Ws7rbQ7avzYUsy/0K5h5RWu/l/W53hly7y6bJbip2gNW7EfZnX+un1Sa26q5TsLH
         m1vw==
X-Forwarded-Encrypted: i=1; AFNElJ9GLVclSAInjmGwZ/S/+qehrc78pBE+tNNSFCEnqCJy2N2bpixXka2b8bF52OjGde8rRE1XQ4v4KFuo@vger.kernel.org
X-Gm-Message-State: AOJu0YyCyns0u6vtaEQi6Np7UmNEm7mT/+J9D8t9uDZvQfF19bYoK2ii
	fYYQuuivm3fAotwb0RCo7l3bskmKJNqhSZVysvZLiB5ffdK00EgRIzuD61axfzfMktAHItgd1jg
	X4JPJNO7yhGq8qj79DkfN2hBuQyXMNPQ2YK2jmYtRjqDPVNVvWBMLDiX0DNVcAX2T
X-Gm-Gg: Acq92OEEaxOEbYG6THMEfArlkWe6hb6iPW3eIKQ/Vce20ZqJPVRIGvLbsT0goW4op5p
	V9cGfx3zyoDd9i675j0gzPvU53XOlLqUsR7oPESY6reH4g7Q1NmvmbhoGw7EZIJ03Rt2/pviB9a
	Z8JejE2pXLv/M7mzrY3+53pL/Aq3r5aVN79wUqIcQYmjt4bHvnmzgNU93hBtaoGwJfsmVvKr2C6
	k6SAzf8bEtkmGF+uC1R14+PSD8Yfx+TNAuRPAHCEFn22zRezgf3M5FkNbFfBWRO4EINyfFw7WMD
	cqrv8SJH77eQVs3lTAXv3OzWAMP26LGLLQFN/LFHuxgf9FtyWWI2vMDWRFzz4+7Hi1s3tjYBvZO
	uMV4F4HGQckYTl4/76Q3im1xVORFWLBxqG2+UlGAO1Dw=
X-Received: by 2002:a05:6808:f88:b0:479:ed26:fbc9 with SMTP id 5614622812f47-4868df001efmr14620734b6e.32.1781098303586;
        Wed, 10 Jun 2026 06:31:43 -0700 (PDT)
X-Received: by 2002:a05:6808:f88:b0:479:ed26:fbc9 with SMTP id 5614622812f47-4868df001efmr14620647b6e.32.1781098302891;
        Wed, 10 Jun 2026 06:31:42 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3e5a00sm557977595e9.15.2026.06.10.06.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:31:41 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:31:40 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, rob.clark@oss.qualcomm.com,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: arm: qcom: Add Lenovo Yoga Slim 7x Gen11
Message-ID: <uieb6ukjokwnppc5zfr6bjychqsnpikwmiy7j7dmt2kgk7k4zi@2stv37ijv36o>
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-2-57c70c23d0d6@oss.qualcomm.com>
 <7a330941-8715-4523-9f39-10b57586c69d@kernel.org>
 <CACSVV03J7Y4-ADRNE+4qArqsWvQZ3qmTc04r7vmY64s0qDYFkw@mail.gmail.com>
 <799fea04-e7d0-4184-b9ae-4cebfdac38d5@kernel.org>
 <841a54ff-6287-48d2-a513-a7442d624ab6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <841a54ff-6287-48d2-a513-a7442d624ab6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a296740 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=8k6WQxmsAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8xXDVyUwim6Fg5z79ZYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: EcVhPrWDbk1sCKR1GhU8x7S3oj4Sz7Vq
X-Proofpoint-ORIG-GUID: EcVhPrWDbk1sCKR1GhU8x7S3oj4Sz7Vq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyOSBTYWx0ZWRfXw1yAv0m/ThqK
 JesSdZQz1iN1kCLcAI67QA/CRVymkbPfs21hoZW0vVjIX1xSPCVEti5XoW1nMrAtA/aAEUNoRd5
 zHkWQ2MATjBZt7WUEOgwWhZGoioYoSWTJWrkYsCDsdRu/R6E8X/e9GufiKvuVIChmIqBSJQu4mR
 V6SJRjr9RswSpnJhzrt2skqen+vybybvdzoublM9aSUEVPGyBbZk5XqagxGBdmfOpHTbNGS1Jd5
 iqJSYucsXdoXbLq38sKgexnTbS+DYoHfVUpoSGPLZ2Xl/hIvmntHlbW7qOYsKw6Pf80rsShWX3i
 qI6REEm7yoSzauh/9eNTmDNoHOjmouaLZ0XX/I9NZ18CMTXm8ukA+MN6K7+2k6jf2LaBvxWCYPw
 MJhcaMh2Kof+dndx/spPsfxNDK2rR1WyG/OfmMoVfMLetBm30RarFEo763BCMMxeg5Ql3knl/mq
 m5xEab4zA/vdgsJykdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100129

On 26-06-10 14:12:30, Konrad Dybcio wrote:
> On 6/4/26 5:18 PM, Krzysztof Kozlowski wrote:
> > On 04/06/2026 17:13, Rob Clark wrote:
> >> On Thu, Jun 4, 2026 at 8:09 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>>
> >>> On 04/06/2026 10:06, Konrad Dybcio wrote:
> >>>> The Yoga Slim 7x Gen11 is a Snapdragon X2 Elite-based 14" laptop from
> >>>> Lenovo, featuring an OLED touch panel. Add a compatible for it.
> >>>>
> >>>> According to the spec page [1], there  also exist other variations
> >>>> (based on the Mahua SoC and/or with a different type of display panel),
> >>>> but those are to be described separately
> >>>>
> >>>> [1] https://psref.lenovo.com/Product/Yoga_Slim_7_14Q8Y11?tab=spec
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>> ---
> >>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
> >>>>  1 file changed, 1 insertion(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>> index 50cc18a6ec5eddaf48542b85387c2d430cd4721a..fca3d180489d4cd3eb2726a722f15febe44f03ad 100644
> >>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>> @@ -68,6 +68,7 @@ properties:
> >>>>
> >>>>        - items:
> >>>>            - enum:
> >>>> +              - lenovo,yoga-slim7x-gen11
> >>>
> >>> I imagine you might want different panel variants, just like T14s has
> >>> LCD and OLED?
> >>
> >> I expect this will be the case.
> > 
> > Then better to prepare for this now, otherwise later you need to change
> > bindings. If unsure what other variants are, then at least make this
> > compatible panel-specific, e.g. lenovo,yoga-slim7x-gen11-oled-foo-bar.
> 
> I took another look at psref [1] and there's only OLED SKUs (today?).
> There are however, two different resolutions available and both can be
> touch/notouch.

If the other SKU doesn't have touch, then you might as well mark now this
one with touch suffix or something like that.

> 
> I don't know what this will entail - if the panels are both samsung, I
> would guesstimate the same driver works for them (and Doug was against
> adding new compatibles [2]).
> 
> There's also different SoCs (which will need another #include in DT to
> override, sorta like hamoa and purwa models; they seem not to be
> available in the store rn, but I'd assume it's fine to just rely on the
> SoC strings in the compatible chain to differentiate them.

I think this can be reworked later on, as long as the dtb name stays the
same.
