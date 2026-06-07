Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDFE78F2F
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 21:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868848; cv=none; b=YY7ampN7pykhGrVx2ZAE1EZdpeKjJl+jUwee5KohmG4h1lv4+jiGoByqvv85hXQltpzrCcytcM2RcYtLlXjpxft3AiiwUmY6tp/0Xp+RW0Sr98Vgu02OKH+NobrlM3UEIYzZybZgVgsKcpTA0HBgqSzfLZZqOIhYuq0Ks2nErlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868848; c=relaxed/simple;
	bh=o8gh3GBhsqBBq+L5KMKWxrXgCRkn6VkVN4YlzVqZycc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9bP6+X7+dQanISNvxgs/FgtTuVocXcBFLaS3o+VhWibVaujxW0wGM8SG9geo9Ocz084WMjKnYC+v6gMOZyF97Az4jhKsLeAiM86DNo+yrrQ8LulfxhRWkTM/swffFBgNlfgh6CIl73c6xArdpN46Wt+wlnvsIgm4O5dW5Xwi+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ieHjw2JL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ki7SDl+W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ieHjw2JL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ki7SDl+W"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EkUHV399725
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 21:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=51lBbpCYJCXT+JKNHVZsiJOe
	yNd6G5pwkWCrK7BFzFg=; b=ieHjw2JLCF7b2hmy7afqVeegZ8cLsKdSOQiTLBCd
	F0thDaa7HptpA4xF/pWHXIwwIkfyM1PgsHZ0LKX9d4BpeRf/i0KZ6JN/InLS//04
	LeGuET1Uez59k1BQQ8naj5WJKqxnv/UYP7GERUGftsPPR+1fT9yhpoZ8uKTk1p5I
	wvYLR5Wrj3/w0o6URJ6yn7wwQK+rU9ajS3cIZzXMwXYmeIjLmxF7rOWmQOGFQUWV
	FU3TiSggsATXc6dq0VhWpYe3JMfXCxEyLQk3JEymPkBMHXnX/Y2nHZNvK48VkK8J
	duCyP0fM7sQ3Abxi8gb0tO4pzxMfDXFwLobxZDnHwjfZ7g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagrd4wn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 21:47:24 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-59f0ad4461eso6386033e0c.2
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 14:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868844; x=1781473644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=51lBbpCYJCXT+JKNHVZsiJOeyNd6G5pwkWCrK7BFzFg=;
        b=Ki7SDl+WY9MMXq8Okh82O/AsHwRM6wAxSA6uYQ7PkhOAYSTNKoXDD8wjHnSHDNiiX8
         nmlYRBWG/wNJaLxhE/Im35gNhRBbrltckv0HzFHF/5n1zJY/mTAMz5b+IrRFjWEc+gpr
         XjGiH/ouVFCCJ9k2gGh10u2ng1TM1JOuC4EdxUjgdhiFchZIx/rjcJU0ckjGa87pLReE
         wVK6BezoUBSBc/TMreHunHh9oJJINd7wPQLGmljhmxc7QgiA/c1EIThiURtIVeoPABiw
         F+/ei+1qhKPLfdbcSX5R7mrdyodD8FXpvW6QDvIpcLYT8x4p7Xzd/LUPBUeqZXN3+B1Z
         fLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868844; x=1781473644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51lBbpCYJCXT+JKNHVZsiJOeyNd6G5pwkWCrK7BFzFg=;
        b=dL8IZ0I2dGG6u8yNpeGhTxjmM1siYMx8c8j+yesj4TVeLwqVShInk5VIGf0MSjjv6Y
         DuFsoy6TzsaolaeePbgiC0ScUUc5eC0q4KbVRohJDxt3jO0dSQe4AogAy00d0cH4ZoM3
         KzFyob8kii9cVPkR99/LX6sGvLqPzsSrXkwoB/eegA5btbeyXdBgmMM5HVEydniBFp/Y
         nrPz2ijAPOvksZ+EMjGs8FTuBK1Y5j/UXazo8hdIxtBobnpdnEpnVFAlBZ3gL029BnGw
         u9vfEjOyWRuCY7M1AOoHjOtNb1OSyALSlC8kpslUz9lAwT+s3gttowRk61N2GYRypEfS
         kYTg==
X-Forwarded-Encrypted: i=1; AFNElJ/4GCio2Sfo8WQQUR7/IPMcTo6sK97InW1sPwETjac6c58haKwgT1OfDP1RgcWkz/w68EQk/jLvW59E@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6be/EdA3++I6CEv+m4Q/L08MFGaZ1zofzm05bLKKnf5BfMaM6
	JqPVnl+cKueRaKQ7fDMSN/UrTt8VVGdiv+l/bqxiZR67VRzJDRJeb3Jt+h2vp+/WScVnV7hR1pN
	I0lplbOj18CHdUAZkVM3b2GxTBCOX2pPOKAKy3cvwuNAZZLebmyyV/0yjT1VxNKtP
X-Gm-Gg: Acq92OFOeV+M9z6+RZ3+xxXjpCOkz+YjrayJb8LcKRATiXVuzed2nrtlvtyM4Jcttvl
	06GRSkbx9NLeOYVAF8IlWd/pZkC2yJ9Bcm3JXCJS2YcQ6ZnhmHHjmEUKQLUnOVLA8g/SlG1p5SV
	NLuS4GI5c5VnYMNDBJGu8x/YN1oax1fspCl7wRER80aWPYmlE1mZ81L+JC6RrG0/c2qYfkk/jH6
	NSX4K4bAwkxFeYa3ismv0CZ9lNth90z+H/uQ2jDT/YzOtJw5UMafMUX1Q54BnmA0gl0Mi2RIkQg
	u7tHDIhUxR0MPAsF9FOPKwrDerH8gQLDcTX9IMT9G0tWhtq4Z27ndIxZltBIL3Frgkmmec+lLeg
	jnDcBoH17j+2dSv/tS9q3lTY5ffoe2awlrIaQd349yBSkJxwB/r+w4so7own9H68ffA5WL8FCBx
	L/kX39/rtoYoGPpEyMeL16ooKQ+WlaBQ9Gr+2ry204hi16Gw==
X-Received: by 2002:a05:6122:3d12:b0:588:2fc:f169 with SMTP id 71dfb90a1353d-5ac53c970c2mr6805017e0c.13.1780868843846;
        Sun, 07 Jun 2026 14:47:23 -0700 (PDT)
X-Received: by 2002:a05:6122:3d12:b0:588:2fc:f169 with SMTP id 71dfb90a1353d-5ac53c970c2mr6805004e0c.13.1780868843454;
        Sun, 07 Jun 2026 14:47:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed659sm3341110e87.12.2026.06.07.14.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:47:22 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:47:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 07/12] media: iris: Add power sequence for glymur
Message-ID: <g5fpxwtlajz4p6gn55pjtgb2czjkbjyjlii2zkznle6lbtdgzb@zsiafc57gaco>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
 <20260603-glymur-v7-7-afaa55d11fe0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-glymur-v7-7-afaa55d11fe0@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxOSBTYWx0ZWRfX8zFeeFgjUI0F
 7ixm8MdE0BfSxMuwtqG9rStPy0r/lo76giG87pV/UNXB1zOPU0ZhsTp3uUk7Wd9TlWl2ISs7qP/
 FbxFnIONh3cH5QNCU63LSMdbUoV83h44BSVlwejMtSgWTOhVbVqo+D7SkdGHVODdBpg50sUtR6u
 yB3ANxT3U5M27Cd4o+2XW3iY9gdihBJUgsQPREdE633nWtFvvVcNGFRQ4GnXHPX59/MNvJ9SH7z
 8/dqAj4ZBfq7ERNdPQlBbMqy9sD3PCqj8ivEFtJ0QpnQ9wDbjeQk6w2h6SYcc62W6jj+p+9uybP
 pzNSVkDO/f+iY0g3sbEPS9Pk7M5MgXXdYwWDFrsTxUypVTy4bOlWF2WzIjTiNbk8Z3Fj034MXla
 hs6EN4y4QLodgJnU8oZiPDtvccGPBQ8miJjQ4Fhg0OmEirk6qlvlT2Yh5WESRQbGwZUCqfD85XK
 4xDpoGgTATKs0XrJdhA==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a25e6ec cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=xfsqrxKm7_4DSI4w90sA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: rA3ZeAnqqdREA5LZQL4syzbe_ORMgoTk
X-Proofpoint-GUID: rA3ZeAnqqdREA5LZQL4syzbe_ORMgoTk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070219

On Wed, Jun 03, 2026 at 07:48:45PM +0530, Vishnu Reddy wrote:
> Glymur platform has two video codec cores: vcodec0 and vcodec1.
> 
> Both cores share a common clock source (video_cc_mvs0_clk_src) and the
> same power rails. The clock dividers between the source and the branch
> clocks are fixed. So when both cores are running, the source clock always
> runs at the highest frequency requested by either core.
> 
> Since both cores share the same power rails, the power corner cannot be
> voted independently. Scaling one core's power corner up or down would
> directly affect the other, leading to under or over-voting.
> 
> For these reasons, both cores should voted the clock and power rail must
> be based on the workload of both cores.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 111 ++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>  .../platform/qcom/iris/iris_vpu_register_defines.h |  10 ++
>  3 files changed, 117 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 7cda94601555..f07eaf4b3be2 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -17,14 +17,14 @@
>  #define NOC_HALT				BIT(0)
>  #define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
>  
> -static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
> +static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core, u32 pwr_status_bit)
>  {
>  	u32 value, pwr_status;
>  
>  	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
> -	pwr_status = value & BIT(1);
> +	pwr_status = value & pwr_status_bit;
>  
> -	return pwr_status ? false : true;
> +	return !pwr_status;
>  }
>  
>  static void iris_vpu3_power_off_hardware(struct iris_core *core)
> @@ -32,7 +32,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>  	u32 reg_val = 0, value, i;
>  	int ret;
>  
> -	if (iris_vpu3x_hw_power_collapsed(core))
> +	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
>  		goto disable_power;
>  
>  	dev_err(core->dev, "video hw is power on\n");
> @@ -78,7 +78,7 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
>  	u32 count = 0;
>  	int ret;
>  
> -	if (iris_vpu3x_hw_power_collapsed(core))
> +	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
>  		goto disable_power;
>  
>  	dev_err(core->dev, "video hw is power on\n");
> @@ -221,6 +221,98 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
>  	iris_vpu33_power_off_hardware(core);
>  }
>  
> +static void iris_vpu36_power_off_vcodec(struct iris_core *core, u32 core_id)
> +{
> +	u32 value, i;
> +	int ret;
> +
> +	if (iris_vpu3x_hw_power_collapsed(core,
> +					  core_id ? VCODEC1_POWER_STATUS : VCODEC0_POWER_STATUS))
> +		goto disable_power;
> +
> +	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
> +	if (value)
> +		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
> +
> +	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
> +		ret = readl_poll_timeout(core->reg_base + (core_id ? VCODEC1_SS_IDLE_STATUSN :
> +					 VCODEC_SS_IDLE_STATUSN) + 4 * i, value,
> +					 value & DMA_NOC_IDLE, 2000, 20000);

Unreadable. Extract register addresses to separate variables.

> +		if (ret)
> +			goto disable_power;
> +	}
> +
> +	writel(core_id ? REQ_VCODEC1_POWER_DOWN_PREP : REQ_POWER_DOWN_PREP,
> +	       core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS, value,
> +				 value & (core_id ? NOC_LPI_VCODEC1_STATUS_DONE :
> +				 NOC_LPI_STATUS_DONE), 2000, 20000);
> +	if (ret)
> +		goto disable_power;
> +
> +	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +	writel((core_id ? VCODEC1_BRIDGE_SW_RESET | VCODEC1_BRIDGE_HW_RESET_DISABLE :
> +	       CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE),
> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +	writel(core_id ? VCODEC1_BRIDGE_HW_RESET_DISABLE : CORE_BRIDGE_HW_RESET_DISABLE,
> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +
> +disable_power:
> +	dev_pm_genpd_set_hwmode(core->vcodec[core_id].dev, false);
> +	iris_disable_power_domain_and_clocks(core, &core->vcodec[core_id]);
> +}
> +
> +static void iris_vpu36_power_off_hw(struct iris_core *core)
> +{
> +	u32 num_cores = max(core->iris_platform_data->num_cores, 1);

Can we trust the patch authors that VPU3.6 hardware data will have at
least 1 core?

> +	int i;
> +
> +	for (i = 0; i < num_cores; i++)
> +		iris_vpu36_power_off_vcodec(core, i);
> +}
> +
>  #define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
>  #define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)

Lowercase hex.

>  #define REQ_POWER_DOWN_PREP			BIT(0)
> +#define REQ_VCODEC1_POWER_DOWN_PREP		BIT(1)
>  

-- 
With best wishes
Dmitry
