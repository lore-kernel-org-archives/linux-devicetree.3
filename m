Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD0B32D0D4
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779042310; cv=none; b=JZIO4kEPoLIC8wZCL7D1kFLvWVrKen0OOoxvo8PDkqhmMLrkApakgc4+Qt6xMlBTlS2tbCsKLgOhN5OHXb26k29jr0AGC6zPearFqfKzfOiZQUPcR9aPKCA2cTEA20ARGe1PnTgIJkxhbgEzfIdbLGx2MEV+2lXKyhj3PPVCAE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779042310; c=relaxed/simple;
	bh=xd7bKJvPyxcfeZWMNzTRmO9hUL1yTJv0uUp7r2PJ8gM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dO86jILVXIyUClq6k7kmxnP4GNdP+gcwTYeK+Gem1beG1UhbRKr8i4gNQUykq8EtwuivyrUYwatjvzHEOfbSnZicd/UCpmysfx3v+968kTwwxxIGgHPskWJ2yD5JkPmqXXuo9ffRsG2LebEDmTRR4qIIvLaMXospR96qu/hkVsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULyN4gfd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U9wn+VSG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULyN4gfd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U9wn+VSG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HFv63O2884311
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CJ/DYyyYxpPY+jYmMita7FBJ
	M3UjJXpu/BoZnJFwMm4=; b=ULyN4gfdwQT/eHimmWBPyIxAJ4vRX2BhSEUMlUlU
	+uvDD0WorsyOileAHG6/9e9pTlExjSuJufl/KPGPSMVHab4upFBPYJgFH39Btpny
	FBy+ZP8F53EqCyjd+NNI6D7qhgem9fy6oQMUYf2NrFysTY8P61s3D0+iAgcetvdF
	wvgmS51IM9wWhCmgaI91vPTWzaBdYrt1TFH1je+CieORsbQIagYqQHugC9dQghSl
	Mh8XD8EO5Mq/tqfymmyJbGSNt9CpONQ7OIJR5nsn2TNZJpxEpLe+PWq3lgFEqF+2
	PW8RnD/FZgi2pRRbCY5aiP7Ye77woo+04dPx+Z89am6mCg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7u96v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:25:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-515224a8aa0so77683311cf.0
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 11:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779042306; x=1779647106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CJ/DYyyYxpPY+jYmMita7FBJM3UjJXpu/BoZnJFwMm4=;
        b=U9wn+VSGxefrrvFWQA6+/y8748i1ddCs8WkjWwQ4dGl7Xo6VdQmu/B1dVe9opDfYrB
         SI9TM2IIXG1XewfJ6KHLEXL7xZy+IQES388kmIGOPv2Itb+VHtRLof2qD1h3pkAjFIfb
         UsQ+iy18Jo5P2/O4kn9v/LesvJX0gV5E9Pza0q3C3TEvP/jLZaXdVJCEyWEDw6PaCZXP
         HSDiAxiLQ/ZeMqrsPct2BbnjJ5YevT0ifmsw6+h8lqxx2AGfubCEJ1yuVdIP2tdukKKg
         h98U+gY3MqmpO/C+4AAgp9OE5DGIwewNf+n4ow9Ise36gVAUURpf76/MLnrvBLaQb5Wl
         i53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779042306; x=1779647106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJ/DYyyYxpPY+jYmMita7FBJM3UjJXpu/BoZnJFwMm4=;
        b=hqq5NfywZu1FPbe5vVHJTzCd7QEgcy4pQinqKVS06OLEo0UglY/VsiHrVv/Wk6sEIO
         IBhy0kqq3WEub97NWlyXJlWNF65mnXHC7E/5qzCa5p0Nkt0rpBVlVtr50wcAjmPSFnjJ
         PhyeS8/8bDcx2SpWOKck5rwfW7irSHenSExYldugKXlQn77fH5EMyhYfzWzzuSXeW+jg
         y6J99/8rgYXMS7wYYWQjc4CHZet6+hP4+6UkFcbAHh4GyV9Lxi74hz7duIzqV1n3BFQQ
         y20H02lg1PyAb8IjTSQz6VvYwR3Cvu5647wEf7u/XUWtvqgfoFBbloDymUjv1TtvmwHP
         KqNg==
X-Forwarded-Encrypted: i=1; AFNElJ9kScyRdMYyucnAKrUmdSrMX9JXxaLQ2vQ1Wynzic21C8N8CMhiBozkKSDy4iCQ68fCSksmWcebnpvl@vger.kernel.org
X-Gm-Message-State: AOJu0YwWgVZs43u6bg+w8sWXFctPLVoTaFp0xMTYoGBlNOur8aVsezfT
	Y5MMu0a5gppXzr6IQNfSKMpoTdQYjtrCeDZAX4zoSHDaCFuBcuSxQV6g++lwpUTdBPojxt+xIwy
	gCHG5VUlRVBWQbB6qVp1jXOzRyy2EAdR7oNcNa0SLKpD182qbG7ZxpVRcV5P0pS+w
X-Gm-Gg: Acq92OHFgFuwdBmLHZ1G10df7cJjYLsWFrEnRL7kgjMQ4xB8mf8+COM/z+TbRPN/Vhn
	eyvzn+tnCGJzY1MOcT/tjDDgxwIZKD1X/WNzOPAvMBsGDv0HsJm2BYM3gAPzDuc0mbNXCJl/0W0
	ZCGnPwaJT5RbJEuDDxOP8yp3OtLkZEy8M1Syvog/TMe/sSgDUtGizHRCvuxH2aethY9SV9fyvIS
	xBg35ESB7nIvAOwPachjPbBy34X7gNEw78LsLFIpBztMbY2aI93KqifnIL3nFmFGdjQNEU92USJ
	8EmDAbUVVoN4j2cIOjpJqYmujkgKvi/yzCrCOJ7/BC7bv1GN1zkgK/whpA6yTRanVEoyzTpPK3E
	z3KrBdGWe0g9e6cEPrEJtcRtmKIV+bm4rhKxfxL24V4lp0Jy7t9qqmeTyS4UM8/FiBdtTq3pLdc
	RpKUCLD4J7H2QQqkOgAOnfPwwxDPXrptJbdPM=
X-Received: by 2002:a05:622a:4c85:b0:50d:66b6:1564 with SMTP id d75a77b69052e-51659fe9204mr166199841cf.14.1779042305748;
        Sun, 17 May 2026 11:25:05 -0700 (PDT)
X-Received: by 2002:a05:622a:4c85:b0:50d:66b6:1564 with SMTP id d75a77b69052e-51659fe9204mr166199091cf.14.1779042304753;
        Sun, 17 May 2026 11:25:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c797sm2819287e87.8.2026.05.17.11.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:25:02 -0700 (PDT)
Date: Sun, 17 May 2026 21:24:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC v6 0/7] Add support for Adreno 810 GPU
Message-ID: <3vzdlxnee4w6mur5qiyk2rhewlugswxarhevv7l4zo47qnnqah@45oxl7rjqawv>
References: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
 <3dc009dc-8f36-4735-b849-d952fb626cf4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dc009dc-8f36-4735-b849-d952fb626cf4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5OCBTYWx0ZWRfXw540SdFJbAz/
 78ZWeU98iOr3dwOacJDCDblScSBQJO1Hc0d2dHTRxk3sUosOQGc0phnn+xVgSWg/KRxF4XW4Yep
 cD7tzCE0HgceOjpMgw29r8NEYRdGoHqi0cVb+WkLa6o9tu27F75LVm/N3BSJB5xkzBZ2bbruVSg
 blz89eNFvfAcmGm5pOs90qW6Tbe8CFpiBwWGjWI77MzndFf1Zl7ow8aSNz4BVYbNGdrJzO2aTg6
 Fo1KzmKpFlm/ulPR1R8rUbeL+zZE0QUQb+z3AwMnZl20zv0FdBpTfnAymrcST8YXFeGaAiE2BNs
 EMIds3TCZiTj7lGB9dd9ytjnGsRjVMECHT7BxRybEXDfu4Cas4dgEAXOyg/IQ3BogpJhrf9p0Uk
 LezC1WyptvPSxJcIpvDjKQvac075FX3HhQiLi5RB66aA9EbbSsJQypGpfMrRt2ceo5YbipfmitW
 jDzNauhOcOzKXQKArAg==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a0a0802 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=lCdzeb2fhCkI5a50WhkA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 7v6Bf5UTECUkyGJ0tKljD8XndqoIT6Tf
X-Proofpoint-GUID: 7v6Bf5UTECUkyGJ0tKljD8XndqoIT6Tf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170198

On Sat, May 16, 2026 at 03:52:08AM +0530, Akhil P Oommen wrote:
> On 5/15/2026 10:38 AM, Alexander Koskovich wrote:
> > Adreno 810 is present in the Milos SoC and is the first GPU to be released in
> > the A8x family.
> > 
> > This series is marked as RFC because it depends on a few other in review
> > series, GPU GX GDSC handling [1], QFPROM efuse for Milos [2], and devicetree
> > support for Glymur [3] (for a8xx RSCC offset fix and X2-185 bindings change).
> > 
> > Also depends on the GXCLKCTL block for Milos [4], but this is no longer in
> > review and has been applied.
> > 
> > [1]: https://lore.kernel.org/linux-arm-msm/20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com
> > [2]: https://lore.kernel.org/linux-arm-msm/20260331-milos-qfprom-v1-0-36017cc642db@pm.me
> > [3]: https://lore.kernel.org/linux-arm-msm/20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com
> > [4]: https://lore.kernel.org/linux-arm-msm/20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com
> > 
> > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> 
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> For the rest of the patches that doesn't have my R-b tag in this series.

Unfortunately patchwork doesn't capture tags from the responses to the
cover letter. I'd kindly ask to spam the list with individual r-b's.


-- 
With best wishes
Dmitry
