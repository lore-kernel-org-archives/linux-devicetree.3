Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF953CEB8A
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 10:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779965657; cv=none; b=qAKwRHHCWjCGWbek9exsa7hx9twLq+d5zYInnYsmHnyMshM/ERw/0nMuINU1Y92FnkM7Umn3WehuwRcpbMXWKyfihwNCU2Su5BWQXn/GtUeUanFSKrmzyrIi61zMMRRUtuXRt3YIuZlk83WRn6qxSaM174JKMbczi9KazyvDNUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779965657; c=relaxed/simple;
	bh=9/6mXFAAhO2tRIOZlhxhLb+vSG/NojXk9g/I4t0WrRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uN+Zbx7+ZvCAcmL2LvpFezhldh50z4o7DaOEDx3xHyVw+hkAWbPUUQ6tHYE6gGGKisJcSa3bp5y15G087KFF6yGF3D7N6rQfgVJWv9Tk3Vy9QJvn7ExOvCOu7Ymd6zMpm004r0CAcXB+3sfhdgND5LB5wB0k20sbsvrS4fKe3yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SCREy35B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WHwbXVdt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SCREy35B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WHwbXVdt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vT2f4031238
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 10:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c7H5I96ycPpsQxz6/8ab0XAK
	628/IR++y87MWPDak78=; b=SCREy35Bj80/2+OiHhJIHsKys92exUs1Iy8E5gvu
	9ybzNZR87KvN0D+n+POE5LHbtddZwSDcNC9jxlRu/YZxGVx4xRZAXIAhlBY0ZkTR
	VebdrD810dHjJFaKXDF5YVN2tiDw5ZARcxWScqiqXLucKvxs2/w2rj+M9kpkuXGq
	xAGGN7hc8fDFw7dhhrCYMbG9tGpWJQAKVfpum3JUao93PigFNUF9vVPAuinAxw7L
	1JpzffroblRJpqg9kt7R36IBhDpJ37Qw/+kpI2iwISiWVljkXR/foaGZIUB9HK+F
	29LMut6d4aJFFYO3EJk7i9yFH0IN6/k8xpHGPQpinfhxJQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y4te31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 10:54:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516d58f74b0so74126761cf.0
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 03:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779965655; x=1780570455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c7H5I96ycPpsQxz6/8ab0XAK628/IR++y87MWPDak78=;
        b=WHwbXVdtZshuJkYT5lFl6x9djA0OSnb7m8XvMqE8RlN5fCa4XNiU7P5lanO6kS1k+3
         ZQjwokenYHc9RpRA4gq+YF6fq2NyR+bVJx1O+LePvmyk+7jASh3no64sPf09DgkIuMuX
         Gyq25NLX+AV5Um9Ot3QBs6a0eo7ctMLvQfUDfUToWa4N3kELfnqIPV/IhsbM3MWgytqF
         ICnGNE4CSNAPdl93W4KDJBqIkfJ1HjvTp+vAPYuPnSLj/7nW2H8uEltCdoyCSzjHx5M7
         g1lx5MUE8e6/Lml0ZUhfCzlDh2uH2AwjdrKm007r/aXcyBnpQPGEgl17IPDUt75saXL3
         UvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779965655; x=1780570455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7H5I96ycPpsQxz6/8ab0XAK628/IR++y87MWPDak78=;
        b=qShGg4BH78d/NtuC0L1slp94epYHuM9TZr2oPrPM0gl7nwE7AtNByrjqkO2F10d+JU
         Zo/ZwGy7f9jIAcCI2Lns2LW8apU4cukV8BXmctlScWs1EGH2rYUJTq8vOGa8ExtZ1+MS
         cFt1CUdEJbgvAxMxaktoCg7Pqbd/Cm8Y5XYskTo2MXuGjPXmZYS/RX/cXEG+B9+MGk4d
         xT0FDp3HEQYw90nzxvFsDkl9Qv9zGi4xeu5UL4eJ4WRiTHOz5gaBEYU1vwaGshDYVxUi
         Wt1hhzu/sDi3k3Pj7L3/6bzFGpt5gMR2KXNpdVjsmG6J4aVTxcSCqbQJvk4FQj32E7NM
         iipg==
X-Forwarded-Encrypted: i=1; AFNElJ9yn0PAViUjciH+KOzpgTjwG5FYHigIVhHH1B8TfmU4b/hfnM2hA/mhZOcF+SSLyEy5jBaocWxHb/7Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0wvSy/I/RGhCadR9A0rWYuggffddnCZCt08HfvCSsLuASzsEC
	sSCtucah8eWD1pbZmcr0UTs31S1/p/wluIWR9Ub0HGvtjlEB38uRi66dHpUc04uUhfyL5+2M6kA
	5NxSxjDk4Xd46YpKV6cqwnVolSS0O9Ype+NC/i5ZE3OgVSc++BvwrWPpdpPkU47z4
X-Gm-Gg: Acq92OEvFOZ4pNxo87m7V9Q7mTXcNI1BAE5R4Vl/HQpTs/TQBzsrNsv9DD1fq0/j7/k
	ciVHkcVG4tx/S/nmfZhv8iidSth+pdDu0hwgFVscRBq53MVaAOV7ELg5pmHHsjPBhltRask5AlH
	aC4XJXCzLR3xHxfJVC9MwK4BoqD5CpZNI+8twJLt5k/H8bfSQPz+IgMDLFfQL5CIxTKy2H6/X4j
	MQZQzpYfemi5sFnoQJ9j5dMejSex9MAwDGBZCsc7n9WARp1cWTz84Hn/esMFVhDeTNF/qCArMDp
	ngUJhdRmk0XZC28ueryjxAMoWqxsRTXAsK6B+ym6745st+IQIy4IHOAnsKVxPAy2DHohP3uFU0C
	nS3uigLA6t/coLAOR1CTGf+D7XLpwO29pwKWwALTh54wR3gdqcBHgM/kTmYQsdQ/y9xKAenQX0T
	KGWyqaMX9dYtVNfBCX5PmMKgaBdaDQ4f+5SK5SzEl0Kq6DHw==
X-Received: by 2002:ac8:5d51:0:b0:516:e031:9343 with SMTP id d75a77b69052e-516e0319e2fmr321609911cf.11.1779965654779;
        Thu, 28 May 2026 03:54:14 -0700 (PDT)
X-Received: by 2002:ac8:5d51:0:b0:516:e031:9343 with SMTP id d75a77b69052e-516e0319e2fmr321609681cf.11.1779965654303;
        Thu, 28 May 2026 03:54:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa4623be9asm1834795e87.0.2026.05.28.03.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:54:13 -0700 (PDT)
Date: Thu, 28 May 2026 13:54:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v6 00/14] media: iris: Add support for glymur platform
Message-ID: <kunwuij4ntmh2hwxdrfwlpiza7kbcwtdlty2cai3xlxybkn2er@7wmo5irzum44>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDExMCBTYWx0ZWRfX9QGCUtgNxrVc
 k9+coer+6ODDikxphx53biWyodKn0Llt76R/qqdXTtBEQsFV3kqoKeXiD4UpB8vnPsE/bLRCeOv
 dv+34zjEKcQ8ICUDcgNEGvg9Cm5IgSAfFxu6oIP/A50lj0L3a9w4KzONUbsUD0bQk2DTZq0+TUB
 KS0Nh4z9EDDEy/owQKLG7OtI1uKoGYuJk5IAip4Tq5+iGmsoX6m+ErukBMqAI/GkVM2hIJi+LBu
 Hcuq8pYLb2jAO5ldQC91uzpnF36nPjRQmJeaC64vcCmoi8zfTuy1hiclavWxr+t+WmYDKbLwT6Q
 mrLGu8/IVsBAx7aRzn9cvNQki4rQR/Hqx96IXl6PuXfxp947UabiKrgLjoRi1EGv4AXTPSOUYDa
 Om3xZ1wBssBPIDgTvfR7Kb7qpFNn28DetkB5dVqGQwUP6089Fckd3E6BsJgyhxwip/IGoqLJ0ge
 RUgePL1uPxORMfd5Y+A==
X-Authority-Analysis: v=2.4 cv=feidDUQF c=1 sm=1 tr=0 ts=6a181ed7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=0MEm6Huftf8yFbl4pBYA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: FhHsolaYTvNqwwCgjevIVE0ARxv5XMA5
X-Proofpoint-ORIG-GUID: FhHsolaYTvNqwwCgjevIVE0ARxv5XMA5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280110

On Fri, May 15, 2026 at 04:51:15PM +0530, Vishnu Reddy wrote:
> Glymur is a new generation video codec that supports dual hardware cores
> along with additional power domains and clocks.
> 
> This series adds platform specific support in the iris driver to handle
> the extra cores, power domains, and clock requirements introduced by
> glymur. Add support for firmware loading through context bank firmware
> device.
> 
> Dependencies and merge strategy:
> 
> Patch[1-2]: IOMMU maintainer need to apply and provide an immutable tag
> which can merged into media tree.

[...]

> Vikash Garodia (2):
>       media: iris: Add iris vpu bus support
>       iommu: Add iris-vpu-bus to iommu_buses
> 

Robin, Will, do we stand a chance of getting these two patches in 7.2?
Or should we use some other approach?

-- 
With best wishes
Dmitry
