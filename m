Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA80A3E8C66
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 16:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776182733; cv=none; b=Ya1lpX7xadz+KZKSKiLt0tKHZ8uSN8b/fuudfhHae7orTn6CLcSHhbJNLjjqoJFEvZvj80Pf/K5IiPtA/H71EBPsi14uVhO8cl9rYpa1XiSoQa9O/lAJJnn32bN76UWj7yYYKSf5vpaJDbGtejBCOHnoQ9OiMWK4/I7+14lBDyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776182733; c=relaxed/simple;
	bh=2V6ZySHPdHRzBExizGrkeSlzI0Ixh78OOIjCdCF0P9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MyhYdEFWOrRH21+s12L0quodaYLRN9Nj+XVDIc/1lIgBqcxZqD/IpDiNsQ4tXzVGr49gho8ac7RW8ub1vIWyL9Y2+RfkFCerA+YF7g7Xfh3EYonCnENgIffshNN9+O4j5GOWLttHC1BheQzLyEqCS27j1hRvDhIEIQ/Ewr+/RBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i50ww9yK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JGpSvAJQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i50ww9yK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JGpSvAJQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63ECMFoD969085
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 16:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lcFaPzUU3JRpyFd64kaVNpTJ
	6c/J0rr4+Z4SaTLJdtw=; b=i50ww9yKP2DSCstOEaxymwJ0jj28hhamlkU/965j
	xk+Y6/h4trj+1Rkb0YpMT55dVtbuU1gJ1TNYbOOgd3mDaUZbvowY81l7hAUrZLy/
	IP1PkqCkmKVe3PvoxWQ4Jq+lARawwKUH/WXWIXHskEiDkWAhFOqnVyHbAaPcVSC+
	S1gXbnNUW/oEOoAGTtagTKz5+K9raciJ/We0JLn4aqHvr1DndasoCQyvSwsCm1cV
	im+zwI+QQnzVQkyaQCbTi1eO1My/94GlOpzYUXeGoHIyqd40EogDdFbZ777NKj9w
	fYPkGTl3EB7Z4GROL41LRC5uyKl2LIlgTVyBQngtcSab4A==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86v3dje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 16:05:30 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-46ef241b62aso4500425b6e.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776182730; x=1776787530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lcFaPzUU3JRpyFd64kaVNpTJ6c/J0rr4+Z4SaTLJdtw=;
        b=JGpSvAJQET0RopaGuGhRXyfixt31tXQ97vMGaqcxDskhgPHfbll2b7gRCcudrDlACC
         bz49YJWupeNF5sFnpfu5HcBYGIKPX9DyJr2MiuGlbqzrGqA53rdlp0npLf6zB28dfn2m
         CaFZ3mayomH1MzLupP4CTTs+NHvsQZQA5cWfzFda9doX1uZh/gytBHZH+g4OHboD0EVW
         rPSvkeDP1F3ltlHOm+3RWL0+7IQCYOegC+AlxDv5JXfSyKHeqf6I+dt1hTD9j3BjQF9Y
         WQ8fJhNt0uoqnq1T+uAXqLEi3NZkmy3pnyvaFRsOWwFLAaDLPRK4wqODFGITZ/grr9/m
         fdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776182730; x=1776787530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lcFaPzUU3JRpyFd64kaVNpTJ6c/J0rr4+Z4SaTLJdtw=;
        b=Qusb/W2F9KVI/UWsXRmltMvOr6iR9v+KmSRjToYk9D9H6NubZp6YfrCoqdDqSpMfyU
         kIBFDysMJUIzxsn4fkmpJyJd5wgKk+G3yqupEmfLljD+B/FIgTioJ/L980P06iS295X9
         rRD25NICpc5P/pFLPPU1BwnmvNDy2xtzcGlV4pl6l3uKOpl01A5Ac4fKChvH4R9FJw9E
         NUjx4WPzVpJp8ANANwvFw80HYF/zl/+OS9PSyZwefGX3asOLjf9A3J+oEBChzshsSHgg
         ggYdKs+VF76ua+C3q/nkhW3wwdNeW1Le8DtwmImCZs+I9JZyjEDYayjoryPhn6UE/zcS
         qthQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+gktbh7OYcq5+usWHh1YKjzA+O31CMUVpSlGQQ8eePBZh3J0Y8+npj48iMg6711XoykF1nKv4NKSt@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjz6dC9cWTo+hcgxB4aRr4SLv+gkyfR5RFedK32ujM4GLTlnyl
	gp+SDMk0ZAvDTKxgGVPGxFRsNaCPGOszb+pZArrej3ftVn1OEE4iVjkhm+GyxQsM5HCykAxJYXi
	jxjEcUeBqR02hjXsfgCQdYjyeKWQufRy9j8hbBpSDqbBVnxT4BUgbV5qIi502c6Ip
X-Gm-Gg: AeBDieu/QtVye0XHuJ5zDlwHHxt1VQF+sbJkcLvdzk1qPd35usBruL/WlgS1xulaKOs
	0+uJHTwP89V7SNIMAUtCGQ4IY0ts0Ki+g+p5TfrCh80GU7Xzo3Cn0INPfucnqaSl42eXdoHsgaR
	pZETehcc+Tk6z9clb3alokwyevF69WzUtrA2oC50Wgtx3cPyJC/3DbdkBCVZDbGm79VR8EPx4qZ
	c1kQuEF07UgkGp1r0KFC7tr6vuAQKPR3QpvcLz0cmNp0yMsVqDblXjc/9ntnm1LG9jxmEC4yrnZ
	YGNIp1h5vF5gVQpUVMAYhOcV/ewcVKn7fZDTvOcCZXIxashNms/rOmpCrBUtSwZo7EqL6DW1It5
	ghX62rUC8EBHxyBRyhJfC0bgWaR7eQGtVIp8Z4RHja7XZ5S4MjWt3FfM6gipgCFg+uoHId14hLJ
	rxv1TLPAcFyZHv9eZzAHey/dFzlwG65W57VM5FaVtAj6ZM3Q==
X-Received: by 2002:a05:6808:5293:b0:468:2a6:e32c with SMTP id 5614622812f47-4789e42ba5amr8309029b6e.10.1776182729642;
        Tue, 14 Apr 2026 09:05:29 -0700 (PDT)
X-Received: by 2002:a05:6808:5293:b0:468:2a6:e32c with SMTP id 5614622812f47-4789e42ba5amr8308983b6e.10.1776182729110;
        Tue, 14 Apr 2026 09:05:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495417cesm31696761fa.25.2026.04.14.09.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 09:05:27 -0700 (PDT)
Date: Tue, 14 Apr 2026 19:05:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 10/11] media: iris: Add platform data for glymur
Message-ID: <zieokmtef7z4sqle7dgy4rv7t3egcgzji5fwrogc7pz4sz4msa@gthghxow3gkf>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-10-7d3d1cf57b16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-glymur-v1-10-7d3d1cf57b16@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE1MSBTYWx0ZWRfX5LcFusaHOPz6
 VuxFBrFYca7gixkHQ1ITbQcWtNJ2IHIxbIqmBvDqc569+Xv24vz11aWkE4/kwlPERs2mb/sukyN
 SisOTR26A4lgpj33YVlhs+85JQmkOg92wvFgvUxvVOmtRZiwWfbCH6KtS7W1inxcAwrZ//Pf2ys
 G0hmZITzIhbFjl9xQhH+tPShvg93zeQwdY7Y/PCvE1eFeAVS4x6HnsTmxjwtJj2JUceU6CSO+9T
 VfHgDbWRD+NgsqOCgpRvIz6avJNU7nYms32DkpmVtH9CzOA5bxUIhZoBdgM7xzqpWWJfS/FGfUJ
 P4Owz5RnE4ezMRDFGpUhQkeOvJeVF+42SRuHsmHcbIN7euhsGRXdo4aayQcqpOQVPkhbrp/3E4S
 2VYimThpx7VsA+SqwnX7FnyXCRjS5Rb4n7624cH+vmWUm/xJqs99ncsmxXQEBRG+8yh85FBEw1z
 jQH/hQDeTIWMekY5tvg==
X-Proofpoint-ORIG-GUID: lWF-2412BjVJN5zBxTmdYfTS3Cc1uI4C
X-Authority-Analysis: v=2.4 cv=Iowutr/g c=1 sm=1 tr=0 ts=69de65ca cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=oXV8KV19mW2mcFdeBS4A:9 a=CjuIK1q_8ugA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: lWF-2412BjVJN5zBxTmdYfTS3Cc1uI4C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140151

On Tue, Apr 14, 2026 at 10:30:06AM +0530, Vishnu Reddy wrote:
> Add glymur platform data by reusing most of the SM8550 definitions.
> Move configuration that differs in a per-SoC platform specific data.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |   1 +
>  .../platform/qcom/iris/iris_platform_common.h      |   1 +
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 100 +++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_glymur.c      |  93 +++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_glymur.h      |  17 ++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>  6 files changed, 216 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 6f4052b98491..677513c7c045 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -11,6 +11,7 @@ qcom-iris-objs += iris_buffer.o \
>               iris_hfi_gen2_response.o \
>               iris_hfi_queue.o \
>               iris_platform_gen2.o \
> +             iris_platform_glymur.o \
>               iris_power.o \
>               iris_probe.o \
>               iris_resources.o \
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index aeb70f54be10..a279ea462ee6 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -41,6 +41,7 @@ enum pipe_type {
>  	PIPE_4 = 4,
>  };
>  
> +extern const struct iris_platform_data glymur_data;
>  extern const struct iris_platform_data qcs8300_data;
>  extern const struct iris_platform_data sc7280_data;
>  extern const struct iris_platform_data sm8250_data;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 47c6b650f0b4..fa2115092be8 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -12,6 +12,7 @@
>  #include "iris_vpu_buffer.h"
>  #include "iris_vpu_common.h"
>  
> +#include "iris_platform_glymur.h"
>  #include "iris_platform_qcs8300.h"
>  #include "iris_platform_sm8650.h"
>  #include "iris_platform_sm8750.h"
> @@ -921,6 +922,105 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
>  	BUF_SCRATCH_2,
>  };
>  
> +const struct iris_platform_data glymur_data = {

If you add a platform-specific file, then move the data to the file too.

Also, please use iris_something prefix for all your visible symbols.

> +	.get_instance = iris_hfi_gen2_get_instance,
> +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> +	.vpu_ops = &iris_vpu36_ops,
> +	.set_preset_registers = iris_set_sm8550_preset_registers,
> +	.init_cb_devs = glymur_init_cb_devs,
> +	.deinit_cb_devs = glymur_deinit_cb_devs,
> +	.icc_tbl = sm8550_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
> +	.clk_rst_tbl = glymur_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(glymur_clk_reset_table),
> +	.bw_tbl_dec = sm8550_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> +	.pmdomain_tbl = glymur_pmdomain_table,
> +	.pmdomain_tbl_size = ARRAY_SIZE(glymur_pmdomain_table),
> +	.opp_pd_tbl = sm8550_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
> +	.clk_tbl = glymur_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(glymur_clk_table),
> +	.opp_clk_tbl = glymur_opp_clk_table,
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xffe00000 - 1,
> +	.fwname = "qcom/vpu/vpu36_p4_s7.mbn",
> +	.pas_id = IRIS_PAS_ID,
> +	.dual_core = true,
> +	.inst_iris_fmts = platform_fmts_sm8550_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
> +	.inst_caps = &platform_inst_cap_sm8550,
> +	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
> +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
> +	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
> +	.tz_cp_config_data = tz_cp_config_glymur,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_glymur),
> +	.core_arch = VIDEO_ARCH_LX,
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.ubwc_config = &ubwc_config_sm8550,
> +	.num_vpp_pipe = 4,
> +	.max_session_count = 16,
> +	.max_core_mbpf = NUM_MBS_8K * 2,
> +	.max_core_mbps = ((8192 * 4320) / 256) * 60,
> +	.dec_input_config_params_default =
> +		sm8550_vdec_input_config_params_default,
> +	.dec_input_config_params_default_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
> +	.dec_input_config_params_hevc =
> +		sm8550_vdec_input_config_param_hevc,
> +	.dec_input_config_params_hevc_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
> +	.dec_input_config_params_vp9 =
> +		sm8550_vdec_input_config_param_vp9,
> +	.dec_input_config_params_vp9_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
> +	.dec_input_config_params_av1 =
> +		sm8550_vdec_input_config_param_av1,
> +	.dec_input_config_params_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
> +	.dec_output_config_params =
> +		sm8550_vdec_output_config_params,
> +	.dec_output_config_params_size =
> +		ARRAY_SIZE(sm8550_vdec_output_config_params),
> +
> +	.enc_input_config_params =
> +		sm8550_venc_input_config_params,
> +	.enc_input_config_params_size =
> +		ARRAY_SIZE(sm8550_venc_input_config_params),
> +	.enc_output_config_params =
> +		sm8550_venc_output_config_params,
> +	.enc_output_config_params_size =
> +		ARRAY_SIZE(sm8550_venc_output_config_params),
> +
> +	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
> +	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
> +	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
> +	.dec_output_prop_avc_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
> +	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
> +	.dec_output_prop_hevc_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
> +	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
> +	.dec_output_prop_vp9_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
> +	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
> +	.dec_output_prop_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
> +
> +	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
> +	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
> +
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
> +	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
> +	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
> +};
> +
>  const struct iris_platform_data sm8550_data = {
>  	.get_instance = iris_hfi_gen2_get_instance,
>  	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.c b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
> new file mode 100644
> index 000000000000..64b150db9f73
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
> @@ -0,0 +1,93 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <dt-bindings/media/qcom,glymur-iris.h>
> +#include "iris_core.h"
> +#include "iris_platform_common.h"
> +#include "iris_platform_glymur.h"
> +
> +#define VIDEO_REGION_SECURE_FW_REGION_ID	0
> +#define VIDEO_REGION_VM0_SECURE_NP_ID		1
> +#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5

These are not glymur-specific, are they?

> +
> +const struct platform_clk_data glymur_clk_table[] = {
> +	{IRIS_AXI_VCODEC_CLK,		"iface"			},
> +	{IRIS_CTRL_CLK,			"core"			},
> +	{IRIS_VCODEC_CLK,		"vcodec0_core"		},
> +	{IRIS_AXI_CTRL_CLK,		"iface_ctrl"		},
> +	{IRIS_CTRL_FREERUN_CLK,		"core_freerun"		},
> +	{IRIS_VCODEC_FREERUN_CLK,	"vcodec0_core_freerun"	},
> +	{IRIS_AXI_VCODEC1_CLK,		"iface1"		},
> +	{IRIS_VCODEC1_CLK,		"vcodec1_core"		},
> +	{IRIS_VCODEC1_FREERUN_CLK,	"vcodec1_core_freerun"	},
> +};
> +
> +const char * const glymur_clk_reset_table[] = {
> +	"bus0",
> +	"bus_ctrl",
> +	"core",
> +	"vcodec0_core",
> +	"bus1",
> +	"vcodec1_core",
> +};
> +
> +const char * const glymur_opp_clk_table[] = {
> +	"vcodec0_core",
> +	"vcodec1_core",
> +	"core",
> +	NULL,
> +};
> +
> +const char * const glymur_pmdomain_table[] = {
> +	"venus",
> +	"vcodec0",
> +	"vcodec1",
> +};
> +
> +const struct tz_cp_config tz_cp_config_glymur[] = {
> +	{
> +		.cp_start = VIDEO_REGION_SECURE_FW_REGION_ID,
> +		.cp_size = 0,
> +		.cp_nonpixel_start = 0,
> +		.cp_nonpixel_size = 0x1000000,
> +	},
> +	{
> +		.cp_start = VIDEO_REGION_VM0_SECURE_NP_ID,
> +		.cp_size = 0,
> +		.cp_nonpixel_start = 0x1000000,
> +		.cp_nonpixel_size = 0x24800000,
> +	},
> +	{
> +		.cp_start = VIDEO_REGION_VM0_NONSECURE_NP_ID,
> +		.cp_size = 0,
> +		.cp_nonpixel_start = 0x25800000,
> +		.cp_nonpixel_size = 0xda600000,
> +	},
> +};
> +
> +int glymur_init_cb_devs(struct iris_core *core)
> +{
> +	const u32 f_id = IRIS_FIRMWARE;
> +	struct device *dev;
> +
> +	dev = iris_create_cb_dev(core, "iris_firmware", &f_id);
> +	if (IS_ERR(dev))
> +		return PTR_ERR(dev);
> +
> +	if (device_iommu_mapped(dev))
> +		core->dev_fw = dev;
> +	else
> +		device_unregister(dev);
> +
> +	return 0;
> +}
> +
> +void glymur_deinit_cb_devs(struct iris_core *core)
> +{
> +	if (core->dev_fw)
> +		device_unregister(core->dev_fw);
> +
> +	core->dev_fw = NULL;

Why do you need to set it to NULL?

> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.h b/drivers/media/platform/qcom/iris/iris_platform_glymur.h
> new file mode 100644
> index 000000000000..03c83922f0d9
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef __IRIS_PLATFORM_GLYMUR_H__
> +#define __IRIS_PLATFORM_GLYMUR_H__
> +
> +extern const struct platform_clk_data glymur_clk_table[9];
> +extern const char * const glymur_clk_reset_table[6];
> +extern const char * const glymur_opp_clk_table[4];
> +extern const char * const glymur_pmdomain_table[3];
> +extern const struct tz_cp_config tz_cp_config_glymur[3];
> +int glymur_init_cb_devs(struct iris_core *core);
> +void glymur_deinit_cb_devs(struct iris_core *core);
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 34751912f871..53869d9113d5 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -369,6 +369,10 @@ static const struct dev_pm_ops iris_pm_ops = {
>  };
>  
>  static const struct of_device_id iris_dt_match[] = {
> +	{
> +		.compatible = "qcom,glymur-iris",
> +		.data = &glymur_data,
> +	},
>  	{
>  		.compatible = "qcom,qcs8300-iris",
>  		.data = &qcs8300_data,
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
