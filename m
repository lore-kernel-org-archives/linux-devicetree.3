Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4136218E91
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680157; cv=none; b=cT0L5xDYgpu4JF5sMI93iXNUGckSc6P7HWfYoZrke8x+wKTaJYS7hE54Ye0wOjE4Q7fNOIQBzvRf3aGn7M/t8CjDbdPTwARa4RZtnqreF/bONt83p6OS3g/t/gnVNJSn72xj/pA+lVURN3Icj00d5iKT8NZX1yVhxXHbNdvYQq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680157; c=relaxed/simple;
	bh=jRxVsvYK08hJFPCU3r27mn2olm89N9iKJ+Bwl9hLev0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXV9ojWk2sVQDozm3SScm/RdS1SamsMgeLBv/NlwYOAlpKKqQijzO9wr37UchN8DpvEzzfkRoHtuk4p5M8NLo/ao9eskquq/qQH0KUg4ZB7/YGEruQUElcsYx1vgnVAbmwRtQ1dKOU3TDXGfnbUfs2HER+ModMx7W8MNRXEEhbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yazv6n5e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G/pGLdCI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yazv6n5e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G/pGLdCI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DCAr2M2965196
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4HsjvmVEDvo4Axfu4dOFUhmv
	OEIgZDUu9Iaidd4gHf8=; b=Yazv6n5eUZGwUjYncwcA8wT6ufqmJbEx9zFL8ghP
	xZ4cgTkxvbiMtkyY0n3m3+yixndIF1BNlFClOEsh/bwv9pjr1BpgyVSWfzvu3EEG
	0mvl1Ali57IffdSGV764p+ZB29wc8i4dG38AjPKhBYeYnKJEKe8Z90FnN9nd56qR
	z//S2QF0AgdCb/bS+cnbMrkrpXRpIVv3nzzOgqjI6qFEKQUfmGUpV76Hxmhilin+
	qZOwXXohHK0cXOx79V1GHVWKPdmsnk6SawU32+1c0YdflDKihKTLNAitLIRYtl9x
	2giJ7vrYPb/08YCeqbwsxXSMf/1UthJtcDKiiUk1ZPymhQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma59kbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:49:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514a182b90dso52363771cf.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778680153; x=1779284953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4HsjvmVEDvo4Axfu4dOFUhmvOEIgZDUu9Iaidd4gHf8=;
        b=G/pGLdCI6LzrYLF6sDFqjo6vBXzDoJd5DmNIalM+YaafwY7xEkNPGJoD9bB/Dk+Tou
         TUXaynsrG1F+4ZSee8S1KLquV4m83DEatc9x5van/0YhhcS3V/FHG5c6flx3n2l2Z4Mv
         1PTuPwPWCONOkoQWReEBf26hPwmJj9EA3U6WhOjSwKo3O8nFP70dx6s9GNJqoIVIhS8d
         CQv3DH7DvkitlIE6FXtUN3H4G4fikLTytrid+iPuup7geR3p3cT/gTcxgurYBesccRoI
         9GNXnI6V2HsHl/AQuxPiSKaI+TzMFPvNCY+NpvVxcXw0OhW+wcGDq/VbAW3WtGwxKqk4
         kZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680153; x=1779284953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HsjvmVEDvo4Axfu4dOFUhmvOEIgZDUu9Iaidd4gHf8=;
        b=EbyLmAtDwNn9s1CnoI6G+TusGo7DWsgkr5BlRHB/8cpDHCjEtyWYBzDGfb119pnb0L
         hiqV/jzSM1RUiS4H0NWoQXAh2uvSOrmy2IWg0wgN2WcMtnXdNm9mTP0AQn/Wc2ZTK9gL
         6IQhxAlmj9m21NJfff9xhJwD8hB5E66J/zlg8DNJLPtETh+rV4f/zjlL25gmGNvNS/3A
         OOf3l/Y2ylTa0PKGdw71XTMlygSalgU66rfVS1DxQcnaqT12z1hLuCk3ymi76W4ybf0Y
         RMCQFC7ZXfb2BKB3i8z7o1W0dfbkuMQe2e2+roBumfs4FPOI9YBxkfKSXpcS5iuKqLmj
         5Hsw==
X-Forwarded-Encrypted: i=1; AFNElJ9F9M6oD1c28es9Q9yTh6VklPeb1Ook3dM3j/g5Pw1h1lgzl3FyuHRGCYzT/Rr5WXMPIVJSVj8DaeJX@vger.kernel.org
X-Gm-Message-State: AOJu0YxhMcwKspXUen8Gh28f+q/9+zrFQIZpLJPF4gUchj/cl2v3rg99
	jNMcmkxhdppfujHKqeomruAbk6ig0LOJnZ4yaGdND0NxCUzvWYWRs8c6g6JdaLiZXQtncU/SSd7
	FoutDYToP4yGKUCSDnwYCO31nx9ALqfeh63N74PJqs55MGJPHhzewT7I6Y05x1dtq
X-Gm-Gg: Acq92OGOb7ocGvHI89ABWs7xFYWOwF8j8gyXLWoa3ee4KgBRvY9uINTC1Frnnu9Ds9X
	qwHq+4uSLaPwmMP5WNCHZ14v1lOkYiEhoiqHaA4M5fOUeywAWmsxSaUozjv0XeC+zLaH4ZmEjzV
	vdFGf9DkVqHWNpEAGoduWmSwiPaq8mT3q4NglGjwjkBuz80MPyKbZIP1YrFe9rv3tFX6w16JtYF
	wPsW/qGtltxp7u6s7ZK9eAu9/K36vyxTbW35eC86hvYtaUe2DtY3b59pvGAMt4FF3PbRBl9e0io
	kQSzY5CQCyWEm1xCNiI2lEjWfODU+nTVwSuYVQZj9J/Zak5tmslT+EQ742gMTSGEDujcVosVhHD
	cTbbXTfmbdSAgEuqJKFiGJKwL3F0oA+eYPDnIiGJAa9lYM95Nw9iHF2DPYIjmJ6frdFucf3Yksj
	ZHZWmNJWT58LFii1onRD+5MjH8t6dxQjJE394=
X-Received: by 2002:ac8:7f83:0:b0:50e:6139:492b with SMTP id d75a77b69052e-5162feba35dmr42576621cf.23.1778680153002;
        Wed, 13 May 2026 06:49:13 -0700 (PDT)
X-Received: by 2002:ac8:7f83:0:b0:50e:6139:492b with SMTP id d75a77b69052e-5162feba35dmr42575781cf.23.1778680152434;
        Wed, 13 May 2026 06:49:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f625bd3bsm41952051fa.34.2026.05.13.06.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:49:11 -0700 (PDT)
Date: Wed, 13 May 2026 16:49:08 +0300
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
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 10/14] media: iris: Add power sequence for Glymur
Message-ID: <h2clkcgpr4uki3fq3kbdutsqc2h64hwf2ibtbrnjipilsnhk4u@w7645stdorq7>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-10-7fbb340c5dbd@oss.qualcomm.com>
 <jqe3ilzqzajuf67hvp7nw6mak36qyqu6dz2oiwtkf6zwiyclln@ydtyd7vkudm4>
 <67157e35-8c39-b06b-eb93-602930168f4b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67157e35-8c39-b06b-eb93-602930168f4b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MiBTYWx0ZWRfX4K+NGPVtyO82
 30xr2GyONwBt4recInpCzFvLUBCgP7Dn4dR2mvp19/fPGsTEY1XRyeevOUAjdZOiyBofuNdzKuc
 mA33DsGfqN7edMFgy5wRx+nACS3AhyxXBpXFu6ey0Hrlr2j5VMvC9pbongHiO6UbLtu9y/hamIl
 jg9lGVW2FzY22IxHLIwfWWf0CCeBEbcusRLir4HSbQLeGLy/RfjgAd2Ah54TV3Lc4D5EvAgixT5
 5qg6hQhRaCpSG5XUK53Ycuo7JCmeVjHIF1a6wYljXkLQYQvwJH0bDOJ9dGz5Viz25pGaSzSxsBj
 BBh3enR3a5/M+UNS29ijW4HP7Gm3gjc2ZSLNLqy/R+/StXdJa9v0BM68lCPmosmrCtn1fGP0MxI
 UBPo4ZoMwcHDY3IoN9goS9bRW0BOyrwZ/U0t8VptA7riLy42H7+ZH6A2Fs/7MMioqhPR8E1nMDA
 qU+T2YBpXf5Bn+EsUFg==
X-Proofpoint-ORIG-GUID: m0sesNvOEY4EFg-WglyFkBY0Uh9xMJTr
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a04815a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=7I-VUM3uW_oGyASaGJ0A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: m0sesNvOEY4EFg-WglyFkBY0Uh9xMJTr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130142

On Mon, May 11, 2026 at 09:42:01PM +0530, Vishnu Reddy wrote:
> 
> On 5/9/2026 2:24 AM, Dmitry Baryshkov wrote:
> > On Sat, May 09, 2026 at 12:29:59AM +0530, Vishnu Reddy wrote:
> >> Glymur has a secondary video codec core (vcodec1), equivalent to the
> >> primary core (vcodec0), but with independent power domains, clocks,
> >> and reset lines. Reuse the existing code wherever possible and add
> >> power sequence for vcodec1.
> >>
> >> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >> ---
> >>  .../platform/qcom/iris/iris_platform_common.h      |   4 +
> >>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 141 ++++++++++++++++++++-
> >>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
> >>  .../platform/qcom/iris/iris_vpu_register_defines.h |  10 ++
> >>  4 files changed, 154 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >> index 7d59e6364e9d..8995136ad29e 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> >> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >> @@ -61,6 +61,9 @@ enum platform_clk_type {
> >>  	IRIS_VPP0_HW_CLK,
> >>  	IRIS_VPP1_HW_CLK,
> >>  	IRIS_APV_HW_CLK,
> >> +	IRIS_AXI_VCODEC1_CLK,
> >> +	IRIS_VCODEC1_CLK,
> >> +	IRIS_VCODEC1_FREERUN_CLK,
> > I think I have asked the same question while reviewing some other code.
> > When seeing such enums my expectation would be that the set of clocks is
> > more or less generic, while the platform specifics should be
> > encapsulated in platform-specific code. Instead these lists keep on
> > growing to accomodate platform details.
> >
> > Can we stop that tradition? Adding a peculiarity of the platform should
> > not require touching of the generic code.
> >
> >>  };
> >>  
> >>  struct platform_clk_data {
> >> @@ -210,6 +213,7 @@ enum platform_pm_domain_type {
> >>  	IRIS_VPP0_HW_POWER_DOMAIN,
> >>  	IRIS_VPP1_HW_POWER_DOMAIN,
> >>  	IRIS_APV_HW_POWER_DOMAIN,
> >> +	IRIS_VCODEC1_POWER_DOMAIN,
> >>  };
> >>  
> >>  struct platform_pd_data {
> >> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> >> index 13fbb21c2182..ff90c375e805 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> >> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> >> @@ -22,9 +22,19 @@ static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
> >>  	u32 value, pwr_status;
> >>  
> >>  	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
> >> -	pwr_status = value & BIT(1);
> >> +	pwr_status = value & VCODEC0_POWER_STATUS;
> >>  
> >> -	return pwr_status ? false : true;
> >> +	return !pwr_status;
> >> +}
> >> +
> >> +static bool iris_vpu36_hw1_power_collapsed(struct iris_core *core)
> >> +{
> >> +	u32 value, pwr_status;
> >> +
> >> +	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
> >> +	pwr_status = value & VCODEC1_POWER_STATUS;
> >> +
> >> +	return !pwr_status;
> > Add core as an argument to the function instead of c&p'ing it.
> 
> Ack, will pass the vcodecx_power_status bit to this function.

u32 core, please.

> 
> >>  }
> >>  
> >>  static void iris_vpu3_power_off_hardware(struct iris_core *core)
> >> @@ -254,6 +264,124 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
> >>  	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
> >>  }
> >>  
> >> +static int iris_vpu36_power_on_hw1(struct iris_core *core)
> > Hmmm... And if 3.7 gets 4 cores, will we have 4 copies of the function?
> 
> As of now, none of the near upcoming targets introduce a significantly higher
> number of cores. If that changes in the future, we can revisit and optimize it
> then.

Okay....

-- 
With best wishes
Dmitry
