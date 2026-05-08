Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444F6421EF0
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 20:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778273682; cv=none; b=R894QO/iI04AFlUy+13FHE+U75y+8HhgRebPIZf3oZ0zadLHp0tDrDhloLUkbu3LqtrDJs0TpyGM6DkjbAxkDTVASkUNyVFCeeECdwymGBWcrQ4ZkQjtI3wI5Gs89N+VTF++mOA4aJpar1PnTT+Bkv3e93TNeZn2J0oU9kR3Tmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778273682; c=relaxed/simple;
	bh=BOgOCU1DCGEF7NHaUgNoeFdwsHJ54+f4OTcah4VG8AY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DP2SLNu0KMFcLdFDwJcwg71HEqshD9BAYE4+zzBKn5hKLdLTfiA1IX8zJwdsPMvc4OAnwq8yijekZyGIAezYLNiL6/cq7Cu/snzg+LB+9tqqgpsGyu3zg1Sffhn+5k6DxriGLBXF3yV+m0xxn8tYUmVMKI58fRUbA/X8YG72PNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bhSkR4Kx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hd9PASf2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bhSkR4Kx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hd9PASf2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G4G4M1093734
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 20:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ca1+F4lE1JEht1erhrHmCCwP
	oszebvQBrxpkX6ymg2M=; b=bhSkR4KxRTsU7oYSM9MHAzbPKX2iWkwQSAAF2RBM
	imbQjacXVzkqSQcbKLQEGKfes8Q6m07KPsOXes3682982VCESkyGPE2rnlyTIiWb
	D5TEZq/xCewh/YRFPOoXZqCOhrQiE0ROh+JOThV4FlC9/4qVB0Vbp3/0vvYUmFNt
	HCtAZon8U4jXlNHJvig3BXITBMC6IxruRL5AobbtO/KTH1F0YzPyEccMx9b0GnMZ
	kKFTgITq5o821xFd1asu2NADfmP5DGZxYSKfAiLazqwE/2RxUorGXrXro0Y7rA0F
	Y69iileG84nL0swyQ5Nw0oL2rpJclcMmyAy1qLPuStp0dw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k1d0y8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 20:54:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50eb8bad331so54459231cf.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 13:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778273676; x=1778878476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ca1+F4lE1JEht1erhrHmCCwPoszebvQBrxpkX6ymg2M=;
        b=hd9PASf2feQICzGOH9rPJcsrHhlR+AoXMQNp0jG6PfU33Nzv9+HwxoeA4TUJMcguMk
         2x4ypFlHHnbOWj2sbeczujwPVuxRbOL1W16E17MeR4glVSr/E3MgO+djL6Z2nTtcHCVO
         XAr9+O4UCiyuWDKr9OAXxnQeGFTdHxKIlNeKsQvOSBXrEZcfcsp0DSdcOKQEINc1O0uk
         UkZozq+4Uk4XGc+19y//xxtaH0Ec6+V+rc5lrsWBzlmAaJ9yyLZcaFxz0Flz4k5aoUZF
         LZKjEr4D038rmkKobVia5f/HMqmfA0YIickWu7s7vwoODS/SQhDnraPCfbdrVFwNlmkC
         9fvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778273676; x=1778878476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ca1+F4lE1JEht1erhrHmCCwPoszebvQBrxpkX6ymg2M=;
        b=UI63UrOtAuCHsOfdFHuCwJ/bSGTb9FKWx8YQZoQ+1307XZ0Zr0g5dGNC9oKuHjSUw4
         ss4O1wAayb7VOJ6lDqP/EqieWdk0nZI4q33/th0GwDTsGPdyP0kgJRdKcJE45rMA+2W2
         iyCLteK88XapSsXi/NHVttiMCx4cYtmQx3gL77q2+CXSyCTPOu/huVaYYMVo73KmxM/U
         BQ/sMV5roZtQK6XUD4F+vVI2zAVMy9co2sCyxn4mYAuamfhBuOV3X1YN9KdcbqQ/8TBA
         BEEQdWuysmlM3u2xlMrmqXfUzN6aRtmxMdWDE/VQmECZ0BfTQPzOnJ/f90U6vP7hisfP
         JPhA==
X-Forwarded-Encrypted: i=1; AFNElJ+ihUJvf7H23BG3MQFEFNQdOfTFV70OK8Wf+Ul7ph+I5cAYAzm+P+csXnPRI8EKUqfq1ftnn8DyCoRj@vger.kernel.org
X-Gm-Message-State: AOJu0YxyfzIOTJh3deqRmWAIjd72W/XSTU6CMptP4OBT+zEzYRFWDgy/
	QupFJplLikcL8cMOOSfqVTVh45t66tnKRQXDpipkfdJ+jEdAU1I3vXkWJ2f+LAWDKA50LB9n5kk
	coRQtlhBy9eztZZjA/LOWs0N41hxwoIk/4A9xriJSFjONEFrjZOXSmMD4I0k9Xd18
X-Gm-Gg: AeBDiet6kfIsvTCzxe+hcXL5kwVqbL6yR3A4ltrWP34RzVHSJzg/fzMGjSQ+yuDsOBa
	aprW70TSXoqRS06J0sTNZcNA2K1zy5C/txFvxH0FOasXnaw+FEJXDZ0LPkkIrqrPJh9M77ls3B0
	hhUbxQqGc2JGwEEn0HH58zC4GgBt6HIayCLkRsz6czSuNCgxDermL9v+G+NsjnyfCeMqH8auWeL
	dwBxHD6QBW41xfI6B5YiWQbDOregzZtopamY88urwlx5b0UcL7uzoV0apyTarxdmw34JKRdEA4M
	FIrtPK1vLWGZPMi6mgAE02WlRZe8G+WSINtc2RRi42FhCqMm/1hVt0wJJ0d1zlPVtyRL3kNS+SX
	Uc5cU6CdZZTlD2i790lS4kIWl/plo8Vx4+R/j4ai2oLfL1fYumMVOCz975dugqAMNk23rDm7nKb
	TPKXH3YUAR7I7TX/Vy/KOXfaMm6S0Zpt9MTSA=
X-Received: by 2002:a05:622a:4a0a:b0:50b:1e5d:9930 with SMTP id d75a77b69052e-514621df94cmr232901241cf.58.1778273676028;
        Fri, 08 May 2026 13:54:36 -0700 (PDT)
X-Received: by 2002:a05:622a:4a0a:b0:50b:1e5d:9930 with SMTP id d75a77b69052e-514621df94cmr232900731cf.58.1778273675524;
        Fri, 08 May 2026 13:54:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955e14csm794974e87.43.2026.05.08.13.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 13:54:33 -0700 (PDT)
Date: Fri, 8 May 2026 23:54:31 +0300
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
Message-ID: <jqe3ilzqzajuf67hvp7nw6mak36qyqu6dz2oiwtkf6zwiyclln@ydtyd7vkudm4>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-10-7fbb340c5dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509-glymur-v5-10-7fbb340c5dbd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIwNiBTYWx0ZWRfX7AK8912iro9k
 rPVy/V+jfYHwOO8PSq2H6nnQnS+3D/cf6B0Xec58sgWfEU+bCuBlPmopsIFEQIlyQKM8mPM3EgQ
 7z12jX/Zinoc/InVt/Us0sk+EdU4AlSFbWTg90Ok+WzsxnWFXuPYzbUJJ5bDK97LYez7AyWHswg
 cFQNi1c/IMY3xccl1aMrpW9ev6PEA9Yzjj1OFuN4gA5ndDzgA/E1Pk1cJffVIH1gWOfXPNHGuUc
 IS+UAn9AR8MiVeZBMI//dAiMf03UkGwRPeoznSpOwJzAAlCBUhEmWDXPBW24CcCBY3EJcqXrynZ
 yvS0Z5vjHBvUKya4xhdls/jO5rLIbWEnyUsURL6I9YRqUdsF0Kz9KzaW5KtjED3ll/sqXvSS5Qw
 bFi5oP5SAuuQx8wjYZ3emlHeklveDyA9wQjWGe1zO/xjixJJw183ltwfQWfAvHbJ0RAkwG6axON
 6DgE3sFqcQIm0higAVA==
X-Authority-Analysis: v=2.4 cv=GLU41ONK c=1 sm=1 tr=0 ts=69fe4d8d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=yIyO6TP1eFVHxxwC3lwA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: V_zeFEBzZK313gLBQjTogoJ3z89xhV1t
X-Proofpoint-GUID: V_zeFEBzZK313gLBQjTogoJ3z89xhV1t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080206

On Sat, May 09, 2026 at 12:29:59AM +0530, Vishnu Reddy wrote:
> Glymur has a secondary video codec core (vcodec1), equivalent to the
> primary core (vcodec0), but with independent power domains, clocks,
> and reset lines. Reuse the existing code wherever possible and add
> power sequence for vcodec1.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |   4 +
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 141 ++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>  .../platform/qcom/iris/iris_vpu_register_defines.h |  10 ++
>  4 files changed, 154 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 7d59e6364e9d..8995136ad29e 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -61,6 +61,9 @@ enum platform_clk_type {
>  	IRIS_VPP0_HW_CLK,
>  	IRIS_VPP1_HW_CLK,
>  	IRIS_APV_HW_CLK,
> +	IRIS_AXI_VCODEC1_CLK,
> +	IRIS_VCODEC1_CLK,
> +	IRIS_VCODEC1_FREERUN_CLK,

I think I have asked the same question while reviewing some other code.
When seeing such enums my expectation would be that the set of clocks is
more or less generic, while the platform specifics should be
encapsulated in platform-specific code. Instead these lists keep on
growing to accomodate platform details.

Can we stop that tradition? Adding a peculiarity of the platform should
not require touching of the generic code.

>  };
>  
>  struct platform_clk_data {
> @@ -210,6 +213,7 @@ enum platform_pm_domain_type {
>  	IRIS_VPP0_HW_POWER_DOMAIN,
>  	IRIS_VPP1_HW_POWER_DOMAIN,
>  	IRIS_APV_HW_POWER_DOMAIN,
> +	IRIS_VCODEC1_POWER_DOMAIN,
>  };
>  
>  struct platform_pd_data {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 13fbb21c2182..ff90c375e805 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -22,9 +22,19 @@ static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
>  	u32 value, pwr_status;
>  
>  	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
> -	pwr_status = value & BIT(1);
> +	pwr_status = value & VCODEC0_POWER_STATUS;
>  
> -	return pwr_status ? false : true;
> +	return !pwr_status;
> +}
> +
> +static bool iris_vpu36_hw1_power_collapsed(struct iris_core *core)
> +{
> +	u32 value, pwr_status;
> +
> +	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
> +	pwr_status = value & VCODEC1_POWER_STATUS;
> +
> +	return !pwr_status;

Add core as an argument to the function instead of c&p'ing it.

>  }
>  
>  static void iris_vpu3_power_off_hardware(struct iris_core *core)
> @@ -254,6 +264,124 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
>  	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>  }
>  
> +static int iris_vpu36_power_on_hw1(struct iris_core *core)

Hmmm... And if 3.7 gets 4 cores, will we have 4 copies of the function?

> +{
> +	int ret;
> +
> +	ret = iris_enable_power_domains(core, IRIS_VCODEC1_POWER_DOMAIN);
> +	if (ret)
> +		return ret;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_AXI_VCODEC1_CLK);
> +	if (ret)
> +		goto err_disable_hw1_power;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_VCODEC1_FREERUN_CLK);
> +	if (ret)
> +		goto err_disable_axi1_clk;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_VCODEC1_CLK);
> +	if (ret)
> +		goto err_disable_hw1_free_clk;
> +
> +	return 0;
> +
> +err_disable_hw1_free_clk:
> +	iris_disable_unprepare_clock(core, IRIS_VCODEC1_FREERUN_CLK);
> +err_disable_axi1_clk:
> +	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC1_CLK);
> +err_disable_hw1_power:
> +	iris_disable_power_domains(core, IRIS_VCODEC1_POWER_DOMAIN);
> +
> +	return ret;
> +}
> +
> +static int iris_vpu36_power_on_hw(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = iris_vpu35_power_on_hw(core);
> +	if (ret)
> +		return ret;
> +
> +	ret = iris_vpu36_power_on_hw1(core);
> +	if (ret)
> +		goto err_power_off_hw;
> +
> +	return 0;
> +
> +err_power_off_hw:
> +	iris_vpu35_power_off_hw(core);
> +
> +	return ret;
> +}
> +
> +static void iris_vpu36_power_off_hw1(struct iris_core *core)
> +{
> +	u32 value, i;
> +	int ret;
> +
> +	if (iris_vpu36_hw1_power_collapsed(core))
> +		goto disable_power;
> +
> +	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
> +	if (value)
> +		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
> +
> +	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
> +		ret = readl_poll_timeout(core->reg_base + VCODEC1_SS_IDLE_STATUSN + 4 * i,
> +					 value, value & DMA_NOC_IDLE, 2000, 20000);
> +		if (ret)
> +			goto disable_power;
> +	}
> +
> +	writel(REQ_VCODEC1_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
> +				 value, value & NOC_LPI_VCODEC1_STATUS_DONE, 2000, 20000);
> +	if (ret)
> +		goto disable_power;
> +
> +	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +	writel(VCODEC1_BRIDGE_SW_RESET | VCODEC1_BRIDGE_HW_RESET_DISABLE, core->reg_base +
> +	       CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +	writel(VCODEC1_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +
> +disable_power:
> +	iris_genpd_set_hwmode(core, IRIS_VCODEC1_POWER_DOMAIN, false);
> +	iris_disable_unprepare_clock(core, IRIS_VCODEC1_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_VCODEC1_FREERUN_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC1_CLK);
> +	iris_disable_power_domains(core, IRIS_VCODEC1_POWER_DOMAIN);
> +}
> +
> +static void iris_vpu36_power_off_hw(struct iris_core *core)
> +{
> +	iris_vpu35_power_off_hw(core);
> +	iris_vpu36_power_off_hw1(core);
> +}
> +
> +static int iris_vpu36_set_hwmode(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = iris_genpd_set_hwmode(core, IRIS_VCODEC_POWER_DOMAIN, true);
> +	if (ret)
> +		return ret;
> +
> +	ret = iris_genpd_set_hwmode(core, IRIS_VCODEC1_POWER_DOMAIN, true);
> +	if (ret)
> +		goto error_disable_vcodec_hwmode;
> +
> +	return 0;
> +
> +error_disable_vcodec_hwmode:
> +	iris_genpd_set_hwmode(core, IRIS_VCODEC_POWER_DOMAIN, false);
> +
> +	return ret;
> +}
> +
>  const struct vpu_ops iris_vpu3_ops = {
>  	.power_off_hw = iris_vpu3_power_off_hardware,
>  	.power_on_hw = iris_vpu_power_on_hw,
> @@ -281,3 +409,12 @@ const struct vpu_ops iris_vpu35_ops = {
>  	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>  	.set_hwmode = iris_vpu_set_hwmode,
>  };
> +
> +const struct vpu_ops iris_vpu36_ops = {
> +	.power_off_hw = iris_vpu36_power_off_hw,
> +	.power_on_hw = iris_vpu36_power_on_hw,
> +	.power_off_controller = iris_vpu35_vpu4x_power_off_controller,
> +	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
> +	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
> +	.set_hwmode = iris_vpu36_set_hwmode,
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index dee3b1349c5e..bee8ae9b4308 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -12,6 +12,7 @@ extern const struct vpu_ops iris_vpu2_ops;
>  extern const struct vpu_ops iris_vpu3_ops;
>  extern const struct vpu_ops iris_vpu33_ops;
>  extern const struct vpu_ops iris_vpu35_ops;
> +extern const struct vpu_ops iris_vpu36_ops;
>  extern const struct vpu_ops iris_vpu4x_ops;
>  
>  struct vpu_ops {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> index 72168b9ffa73..e67d98b8c91e 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> @@ -7,6 +7,7 @@
>  #define __IRIS_VPU_REGISTER_DEFINES_H__
>  
>  #define VCODEC_BASE_OFFS			0x00000000
> +#define VCODEC1_BASE_OFFS			0x00040000
>  #define AON_MVP_NOC_RESET			0x0001F000
>  #define CPU_BASE_OFFS				0x000A0000
>  #define WRAPPER_BASE_OFFS			0x000B0000
> @@ -14,6 +15,8 @@
>  #define AON_BASE_OFFS				0x000E0000
>  
>  #define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
> +#define VCODEC1_SS_IDLE_STATUSN			(VCODEC1_BASE_OFFS + 0x70)
> +#define DMA_NOC_IDLE				BIT(22)
>  
>  #define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
>  #define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
> @@ -35,6 +38,8 @@
>  #define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
>  #define CORE_BRIDGE_SW_RESET			BIT(0)
>  #define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
> +#define VCODEC1_BRIDGE_SW_RESET			BIT(2)
> +#define VCODEC1_BRIDGE_HW_RESET_DISABLE		BIT(3)
>  
>  #define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
>  #define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
> @@ -52,14 +57,19 @@
>  #define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
>  #define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
>  #define REQ_POWER_DOWN_PREP			BIT(0)
> +#define REQ_VCODEC1_POWER_DOWN_PREP		BIT(1)
>  
>  #define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
>  #define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
>  #define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
>  #define NOC_LPI_STATUS_ACTIVE			BIT(2) /* Indicates the NOC is active */
> +#define NOC_LPI_VCODEC1_STATUS_DONE		BIT(8)
>  
>  #define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
>  #define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
> +#define VCODEC0_POWER_STATUS			BIT(1)
> +#define VCODEC1_POWER_STATUS			BIT(4)
> +
>  #define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
>  #define CORE_CLK_RUN				0x0
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
