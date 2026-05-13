Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167E33E9C19
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778681896; cv=none; b=fMbS4BiRnIplLhrBu/wIyaeMKzBl+bUg2Swzn4Nk/hYKvftmSATqhMNeudwL3gZNLxPgeoeFhnAFbjv/N62it71Ven7KMHAzqx/8n1PShzAghy0prNvDrl4dc/3+D/QHqh055+LV0sxrZ9zK+1vFbCdf3atzK3qb2xxWV0CUx68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778681896; c=relaxed/simple;
	bh=7UvCRgU6NE9Xz1wHDtpVy8gUtqn8OFCmDPYciKp6YWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqjNfC5eQ4fm/lsiPJ/AVuxU3izB8dHTzh7vDue8GlIsJdGGF6MLiRKPD/mYeID0hF2B5qjYBg7sPokxTqwvLaJrCYa8tyQBaXIJhq4LfDGcrHJat2Qtu70Ks9yHUJqqeUBwfi0WXjwhZy7qfxb+EELZnQ7ZPHjIwlJepzqXxEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKysgx5R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HU1xfewc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKysgx5R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HU1xfewc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAKSJp2321468
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5mMcGTAR+YEsc2FAr9AP2GCm
	5DusrJSGJQDZhcplsrc=; b=nKysgx5RzUIvBBqEu3154iGw3McFy6jZatgFIwR5
	3a1zGFuZtVYxMGxh2xo4MtvIizTK4snVEGzOje1BxXecOAeY81Swg7BdxncGGQgv
	LG0qVDAhd9RHH7hX1SzglP9sCcW54vjIWTm1lOaynS37Ruud1HCbwPfdA0dYfM59
	pWaDwGRw+jDBHlXKaEWs3R+b7kf/Oo70kGV9LpaV4aIYNIvBPc+1Jt7l4MZq7yqm
	YZVz70RTiclUe2fpAyPIAzb5M134ZnGTa/1bau8DqvoFh0K7Y7QaBh8g28+Nzdyr
	qwESbIgBXHHa9CPlH/NoGievgVeZP+X9hbvvzuoOoAg7Iw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hguac7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:18:10 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7de75c9be4aso14534011a34.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778681889; x=1779286689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5mMcGTAR+YEsc2FAr9AP2GCm5DusrJSGJQDZhcplsrc=;
        b=HU1xfewcB6a2rJt3ofuJIgoj3ECnmrCafZgHd7lPdpAOOnXoC0f4edF8WVjxLGnnzJ
         NtRNK7F2/CN+NrNLRzCHB9CjiIz/LVKsJtIhRDSg22+1QXrjj1bFqUHukL4lFvpMAYUB
         Kiw07szBpee74l9ly+Tpy564Rhy7sVHXsyq/yeHBraxYU+uf/2ozDovSe4mg5brje4+U
         dm06ESdX5TluHOwpMd7MkpC5/90cHxadWv/Z/5NSjYx8eZgt7opbFthzfHE3VUNdz0L2
         HR1wmoqJ1R1ImI/OMUIDILP9cy8oN3c0+4ANFFAecwUuwsVP+M9O7arPS8prJDhf3gg/
         R4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778681889; x=1779286689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mMcGTAR+YEsc2FAr9AP2GCm5DusrJSGJQDZhcplsrc=;
        b=ace9Iv2ILNYsNeueXg3M71rBQQh+MDhgNPGrOl+J4zPikjPKZY9ZRwcCj1X3s2BdhB
         Kp391C9E8urJy2x7zgUJ39gDnbhH5yCjxKj8LCHK+3Z4M54NcopOJLbR7LxuBvOZ7Id5
         V2u9WhjSAVq3q6hQQZtzlw+BRZzqK8U7ZfYqka35Y6Tl4eBha20u8RwyKDi8BBoBqRtP
         Qim4ay4itixaSkcHk5J1Y4B6z/AB0obusit1vMVEqznq9gAJk5RmX0qtkW0PFYVBfzuv
         +Djb4aehGwsxCs1A5VN0z3fnBpX4r/Qmiz7CC8SPspFS5hdLYVQrqutuxa8pA3HICFXH
         wdvA==
X-Forwarded-Encrypted: i=1; AFNElJ+wXpTYajrZm3XZ5TNgkGbW8xHXZUtwsg5Yq6YshQ0X8pASdhfm+FIWQoUQ4aFPfXanvH2MHr9yd0EW@vger.kernel.org
X-Gm-Message-State: AOJu0YyA5UozNM57wVyjGb6TEjqhQc/+JxjWlUMKtbnu005x24VExcR1
	zhp6NQz+1TSJZlFjpuV6SWrRUGW3BuBRs5N8EnmspI/msse46Q0Mc9ffyHDYkTINmVilZ6YnyGY
	0VVIhKA07WDZ3Fzr7qDS2LVmlW2QmTxqe6939knPHZ9v1GxWh+exd6VF2JguYEgWs
X-Gm-Gg: Acq92OEmuR8rB3GrBa2AMHMpCguKqGRFmEkO6P/DaTnP1L0IUamIDMa/E8mDpGOoYh5
	JnIYE4zSo0ECVTdwFqe7AZ6jCoAQb7ibZw0k2yPSL7azbW6IeLFMNhJbQjj5xo7H8hr8fvFvxhZ
	34fBNEIaZ2rnxoDcXP8Dpucr2n/3MQg/m4s7KJewuiN0VqCypnmSCCthmaSYC2BBFAjKNfJJ++6
	wfrt3+zpTZOfyyE9LUgNII1fkodxReCv9UvCmFzwU7OcgqqTlCLYboeSqlW2199MzI9Ni0QTp/A
	m+Q7CNpkPGu6jGGE2BL8H15zEf9RFTtwFJ3zVIHwv+Sm4vOTtK5SvTDBaZLFXEvHU9vOBAlGjJi
	rJt0RX/zcI26uiSjIxITkhaKQwGWF4hk0MVSez41Y94cVthOI/poybR8LS1ZumCrh06Ij2wVoKN
	Mthvbgj3LUo/lhrvPETY+Ojz531G451w/xPHk=
X-Received: by 2002:a05:6830:3692:b0:7dc:d28a:3d2a with SMTP id 46e09a7af769-7e3da449eadmr2190767a34.15.1778681889501;
        Wed, 13 May 2026 07:18:09 -0700 (PDT)
X-Received: by 2002:a05:6830:3692:b0:7dc:d28a:3d2a with SMTP id 46e09a7af769-7e3da449eadmr2190727a34.15.1778681889054;
        Wed, 13 May 2026 07:18:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660b6sm4096651e87.62.2026.05.13.07.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:18:07 -0700 (PDT)
Date: Wed, 13 May 2026 17:18:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
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
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 08/14] media: iris: Rename clock and power domain
 macros to use vcodec prefix
Message-ID: <qvbtzbrjcdbsu37gb4h4cqqmann5tygbzpwurx73hhgrome2a2@3mf3oz5i2e7v>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-8-7fbb340c5dbd@oss.qualcomm.com>
 <6hr42ins65rf6ftdmme5lok6ham67piz3343kdwxaff2acktcz@oipdhket32og>
 <4eef8b17-47b5-e8f0-4a44-87fdf1d69d18@oss.qualcomm.com>
 <cyjxjidbe4qpeb5pwv6u5yqwhldqffenzgp6z4irgxkloturt6@buswzuou2w7z>
 <8541d1e8-9ad9-489b-9c00-b7a92ce0a13a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8541d1e8-9ad9-489b-9c00-b7a92ce0a13a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a048822 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=fE9t8tTNEnyIwWf7O9AA:9 a=CjuIK1q_8ugA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: bvVXoAg8jinSDvSGN3iVavTAqP20Ti_y
X-Proofpoint-ORIG-GUID: bvVXoAg8jinSDvSGN3iVavTAqP20Ti_y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfXykX9tIn/xwXX
 5ivNTGQnnpo4fjw0Jw2u2iRPh6Dr+rKm4UvPrzSSsrA2haJDk0zMAfMfzykrpho2lf9gCyFuJ2W
 DM8vATBzLMbIvefAFMCuAopBuIaUS/geclPTtbZ3m3SILGYqDbd8cnGSiGM0vCeK2JSmVtYSE5F
 UOsQvYDg8LLujVDQ5NSrBoUWcxyZrO4cKSPMEW08/X8TMGXavDsrbd/WlImkLFUQfttjLtxS7Ef
 /qaX/5iWwx5a8CkgTVXmGCgwp5YiQIpqd3gEVNG55mqcdqgFCEYZaBo03hV8rv2oLifRAr2RSPB
 HQDlSZDeIoUtBzeCTy8B74iTx6xnBOPIMTi1ejZukMwRRNlleBCXo7LIMsrnE1hPXW7POquzQhQ
 HOEodhWNIVyeCpjd3TvGLWX0sZtSiCLGyvi95VZayrVOV0i2rmAwnzOWPKXpT/ti/QMprf/ikG5
 JpVqg/iASyr/CmIenqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130147

On Wed, May 13, 2026 at 07:40:23PM +0530, Vikash Garodia wrote:
> 
> On 5/13/2026 7:17 PM, Dmitry Baryshkov wrote:
> > On Sat, May 09, 2026 at 10:37:20PM +0530, Vishnu Reddy wrote:
> > > 
> > > On 5/9/2026 1:52 AM, Dmitry Baryshkov wrote:
> > > > On Sat, May 09, 2026 at 12:29:57AM +0530, Vishnu Reddy wrote:
> > > > > The current clock and power domain enum names are too generic. Rename
> > > > > them with a vcodec prefix to make the names more meaningful and to easily
> > > > > accommodate vcodec1 enums for the secondary core for glymur platform.
> > > > > 
> > > > > No functional changes intended.
> > > > > 
> > > > > Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > > > ---
> > > > >   .../platform/qcom/iris/iris_platform_common.h      | 12 ++++----
> > > > >   .../media/platform/qcom/iris/iris_platform_gen1.c  |  6 ++--
> > > > >   .../media/platform/qcom/iris/iris_platform_gen2.c  |  6 ++--
> > > > >   .../platform/qcom/iris/iris_platform_sc7280.h      | 10 +++----
> > > > >   .../platform/qcom/iris/iris_platform_sm8750.h      | 12 ++++----
> > > > >   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 21 +++++++-------
> > > > >   drivers/media/platform/qcom/iris/iris_vpu4x.c      | 30 +++++++++++---------
> > > > >   drivers/media/platform/qcom/iris/iris_vpu_common.c | 33 +++++++++++-----------
> > > > >   8 files changed, 67 insertions(+), 63 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > > > > index 55ff6137d9a9..30e9d4d288c6 100644
> > > > > --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> > > > > +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > > > > @@ -49,14 +49,14 @@ extern const struct iris_platform_data sm8650_data;
> > > > >   extern const struct iris_platform_data sm8750_data;
> > > > >   enum platform_clk_type {
> > > > > -	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
> > > > > +	IRIS_AXI_VCODEC_CLK,
> > > > >   	IRIS_CTRL_CLK,
> > > > >   	IRIS_AHB_CLK,
> > > > > -	IRIS_HW_CLK,
> > > > > -	IRIS_HW_AHB_CLK,
> > > > > -	IRIS_AXI1_CLK,
> > > > > +	IRIS_VCODEC_CLK,
> > > > > +	IRIS_VCODEC_AHB_CLK,
> > > > > +	IRIS_AXI_CTRL_CLK,
> > > > Why AXI_CTRL is better than AXI1?
> > > 
> > > Glymur has 3 AXI clocks: axi_vcodec0, axi_ctrl, and axi_vcodec1. Using
> > > positional names like AXI0/AXI1/AXI2 doesn't convey their purpose, whereas
> > > naming them as AXI_VCODEC_CLK, AXI_CTRL_CLK makes the intent clearer,
> > > especially when platforms differ in the number of AXI clocks they expose.
> > 
> > => commit message
> > 
> > > 
> > > > 
> > > > >   	IRIS_CTRL_FREERUN_CLK,
> > > > > -	IRIS_HW_FREERUN_CLK,
> > > > > +	IRIS_VCODEC_FREERUN_CLK,
> > > > Can we at least group them too?
> > > > 
> > > > >   	IRIS_BSE_HW_CLK,
> > > > Is BSE a core or a codec clock?
> 
> IRIS_VCODEC_BSE_CLK would be more appropriate here.
> 
> Core and vcodec (video codec), it refers to the main processing block and
> are referred interchangeably. BSE and VPP are the sub blocks inside the
> core/vcodec block.

Thanks!

> > 
> > Unanswered
> > 
> > > > 
> > > > >   	IRIS_VPP0_HW_CLK,
> > > > >   	IRIS_VPP1_HW_CLK,
> > > > > @@ -206,7 +206,7 @@ struct icc_vote_data {
> > > > >   enum platform_pm_domain_type {
> > > > >   	IRIS_CTRL_POWER_DOMAIN,
> > > > > -	IRIS_HW_POWER_DOMAIN,
> > > > > +	IRIS_VCODEC_POWER_DOMAIN,
> > > > >   	IRIS_VPP0_HW_POWER_DOMAIN,
> > > > >   	IRIS_VPP1_HW_POWER_DOMAIN,
> > > > >   	IRIS_APV_HW_POWER_DOMAIN,
> > 
> 

-- 
With best wishes
Dmitry
