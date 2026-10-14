Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F685549386
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988869; cv=none; b=dVvV0n54EeOxSucINBFth2fCRF7yEgmte4NCCxzwiESi0QUeBS6IC3KHzyzbDO1EKU5bAhB0eva+5Z5rUBSY8FSXMkk220bw4SVQpPGYxFrg6C+HDURyuxhEjA1bK8DqKd9vL2cI8uOtFVvzXMcZSVC0eNNx1WXHWkw5vhmd5lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988869; c=relaxed/simple;
	bh=Ec9/hUno1ZFZzQR8bss0/NRU+5O102GhZCMRIqp7HBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VoB4XgNysjQewSBoUM4kuDumHM5EYiFRXgeC9p+A8NDUMiF/cv8QA1GUtQEgG4D8cpYk3k+6QiAF0dhz576FmwcB9KPGP5fAe+GRi1HbiW4OrKjnmd7V1DpSsE9QGxupKCgpUQZerFUxeCG3bIXSJw4zpGT2uxjc6gLcv3MGWR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HYZmXe93; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UTImkear; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HYZmXe93";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UTImkear"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbU0B4108243
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ux0HctdGbOznFj/FPt6E7SCo
	5RvSeqfeFWrCy3PfWf8=; b=HYZmXe93jWeqDh/RKjJ/2n4FvspXLYYxwy/kGdwC
	WZPH5Z+j6uM7ffmv2Zx5XYNm46r7ZhYkos0DwhqSJPCS87UcqawuRSzbYWl+AkDj
	tpnivH7stEJGqXJYBJHBKdu13SV8MF1cBQ8Dkj5X3qabfx7PwTCR/1mZtT9SMPWj
	BtO0Fe2VH6NS3vmLsQl/ssQcwMgnqaFmOqIAgWUpq07RqKNwiJC4wT79RRS1l6Yy
	7vOedm7PKpbwNsNKHIaYgeAVRiWPcDiHPRmwFSD2eZ+nvXHurRHG0QudK4JQLseo
	LmwHCKnXPqpZJ+SlKrz50IRADXBn5qnDaHWZ2ZrlKi++vQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9x49kcmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:41:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbacbb996so680957285a.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791988863; x=1792593663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ux0HctdGbOznFj/FPt6E7SCo5RvSeqfeFWrCy3PfWf8=;
        b=UTImkearRxWS0wMXfgH/QEEkdkcZq0WjPs0aFhZ2kFM0s73MtMTTUh4n2dW/T6gn79
         VXEFD+Cn51kVi4asmkMo8Z3COKo+tZr7oQsScyjbI56/qMrGWe+h2CpSWz6/OHbpNXt8
         WcCkqymhd1YcmIxW5AD0LiaKQ7VJymh0NP7bGR3EBhKMRcvcdbGaRjN73n6/fRrqWFKC
         JgveiE6XmsTjksk8oMnvraR523rDIlMcQlU1msom0N0tFotq1HmsMF4cC1V0x7Rh4s04
         5o5pf4ibpIsv9gqPuBBML/rWm93pORFmXY/KeX8ckcoAUydvmpeaH00Cw5CtMwE4ZAhJ
         WLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988863; x=1792593663;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ux0HctdGbOznFj/FPt6E7SCo5RvSeqfeFWrCy3PfWf8=;
        b=2jIpk8dkbq+W0Eafz2LiMajHq0oHvReyfcSN6WhMzknkE0BgVYnqj04GX4vtJ07OQQ
         82QVgJsGmUPgCqj3DqPvvMb1Imx3mB//qqKHovu/qGtAH8L7K9Yf7uZnQtAMk4t5S++I
         358OxSJFgIxmdf+HQjSgTbKSp6fvn7fU3jh3U5F8C8aiVyCF0eb8X9Tph8k+PSoB3wuV
         +8fvL8HCRf3vChpwTvcqBLJc0hsO1KuzT0UO7+CIMYi3GEFOeIhoARaE/A05rsqPKqnr
         E9rXiNIHW1ew8sjG55fLgAAkpwC32B7uD2AYs4ahRQvObwI4cOPDiu17dNPNBo9tdCHK
         Iwjg==
X-Forwarded-Encrypted: i=1; AKwUvBxOv1WCaYrm+lj3RKgPOZLWSTtRiWjDlcIfT7gSAxrRLS1X7XCfXIkE6tyb3dmqkM2beo4aV4hqVyw9@vger.kernel.org
X-Gm-Message-State: AFq9FYKBBFVeyOjw84/ck8fFcUZgDACBXhAaxIbyHsjS3Gwx1t7pYkhp
	Ae5QO0GRDrjpyd1ry6fXny5NNuTLCT1h5KiOXxxLcBcsesbyto8PR1ktQ4qIEyGYw2uPoLFmgXb
	DvE9fqCM622aTZmsjC4iNE8iktJYkSiC/MOIJIR5+WCBiUwRQdejOQFGPPODxhoTA
X-Gm-Gg: AYBFou24tFv/VdHQ3JMqPguP4xtwrpIdSrUv3YJl5mMSMiGTeKzXm3txZxiDTCWyrou
	J1Ttgvky52YIXmh1F1k7KdWDvd3bVvjmcbYU9O9rs+yWbqR/Z67lrthk/RFedKqP45BAK/KvcwU
	xSyJbZTHR2RUDl4oJmhbOWb9vEsUCEqocGqM9UE2DfKyPdLSJT8ui1PQalDGLMoh7g0S5yz4cgh
	TBPOk4/kewQnt0z08YI45sCA3MmHwZ3pxYUEI5dXJkLtZBUtw1tdvr0L9iTVTf9nPIGUATq6EgU
	1sDA2rRzh3OLqMYqT7henVjAcxmT4AgCWxOWvbqN3SBKaIypMgmXagwjZJRKG/wrzD72Nz0MPla
	g8eYOOdkvJfIgnKYBI6wD6mBd1qvKQX7as9PSPb8SXkhVi/CViYxicfo2UoQdCktvTcoRDfcRX5
	T0czQMW/yXkv5n
X-Received: by 2002:a05:620a:1726:b0:93e:7ec5:1832 with SMTP id af79cd13be357-93ebd1dff54mr2679985185a.23.1791988862661;
        Wed, 14 Oct 2026 07:41:02 -0700 (PDT)
X-Received: by 2002:a05:620a:1726:b0:93e:7ec5:1832 with SMTP id af79cd13be357-93ebd1dff54mr2679980385a.23.1791988862076;
        Wed, 14 Oct 2026 07:41:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9e4c55247sm22236841fa.17.2026.10.14.07.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:41:00 -0700 (PDT)
Date: Wed, 14 Oct 2026 17:40:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH DNM RFC 14/16] clk: qcom: Enable clk-dvfs on SM8650
Message-ID: <rfcbfy5z45w43ju2qjslrcnxfbhqbcx5fr5bii2icewm5ggihu@lsooj5mc7mpk>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-14-3041b788e9f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-14-3041b788e9f7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YJcKWhGx c=1 sm=1 tr=0 ts=6acf947f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=PMMxHlK0yRAWYTSW-usA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1OCBTYWx0ZWRfX46slcjS1oNJP
 iLy+glwDQOUN8sUE4r/+/7oBPRHherCJNuKUWsAnt0iDPNQbiA2OZlYd8DQzOJT9kWsHQzKCWas
 pzVlnyf47b4DPVReF2G8jJHpzlGpmGY5AnzUyepOY+oiHvp4VKeHR0SFBkOoYIdQ5QZjsVICVOc
 1MSfl85djaJ7QUsl66dFUN/M4ieCny3bF1zhWaXwWlqQ251xyPhHAAZPcbtFX1jNQVfUjvSaI3o
 TcjmC6CU1l2HmB/8BpZSA1lnZPKn6rPNgXE3OL0dEouEr3wGKctqz2/NrVUZK9a52tkIDSkh4P6
 nolKhck4t/bObPWYUh9vHP0+viMnmhJQHtIiwvV4bzvS4jFqGtT0CGKN1fxH9Qr6zjsrXhXUHiv
 qwtALbGoVFHVRZ+kbhH8JgCuEzG56UjRO6xis1gBPcuzSiMtu4yRlIN5K2HAWmE0J24cH1A8Y3w
 1vqh4MvJakBVm1bVYIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1OCBTYWx0ZWRfX8m3QZepGPWVT
 DhhzvHEFFkm/K0fNrsZhT3xce2/MmJRax/5FTpp1IXXfFh8iLxT/qm0GEzwY+2lAus3SyQp5ayq
 WUZm8K4rvuZWjD7LIlNYrPyVEWiHJdg=
X-Proofpoint-GUID: 3mFIZKs36wfRRT5JV-8uTEl2-EWyAjNV
X-Proofpoint-ORIG-GUID: 3mFIZKs36wfRRT5JV-8uTEl2-EWyAjNV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140058

On Wed, Oct 14, 2026 at 02:19:14PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Make use of the clock-dvfs infrastructure and fill in the power
> requirements for SM8650's clocks to ensure the hardware can operate in
> accordance with the specification.
> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> This commit is a DNM since some of the affected drivers are shared
> between multiple platforms, this will be properly reworked if we agree
> on merging the clk-DVFS infra.
> ---
>  drivers/clk/qcom/camcc-sm8650.c             | 282 ++++++++++++++++++++++++
>  drivers/clk/qcom/dispcc-sm8550.c            | 328 ++++++++++++++++++++++++----
>  drivers/clk/qcom/gcc-sm8650.c               | 261 ++++++++++++++++++++++
>  drivers/clk/qcom/gpucc-sm8650.c             | 101 ++++++++-
>  drivers/clk/qcom/videocc-sm8550.c           | 135 ++++++++++--
>  include/dt-bindings/clock/qcom,sm8650-gcc.h |   2 +
>  6 files changed, 1041 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sm8650.c b/drivers/clk/qcom/camcc-sm8650.c
> index 3aad816ed233..188649368564 100644
> --- a/drivers/clk/qcom/camcc-sm8650.c
> +++ b/drivers/clk/qcom/camcc-sm8650.c
> @@ -6,12 +6,15 @@
>  #include <linux/clk-provider.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm.h>
>  #include <linux/regmap.h>
>  
>  #include <dt-bindings/clock/qcom,sm8650-camcc.h>
> +#include <dt-bindings/power/qcom,rpmhpd.h>

I've commented to the cover letter. For me it feels like the layering
violation.

>  
>  #include "clk-alpha-pll.h"
>  #include "clk-branch.h"
> +#include "clk-dvfs.h"
>  #include "clk-rcg.h"
>  #include "clk-regmap.h"
>  #include "common.h"
> @@ -46,6 +49,110 @@ enum {
>  	P_SLEEP_CLK,
>  };
>  
> +/*
> + * Downstream uses CRM/CESTA for PLL3-7/10 and the CAMNOC AXI RT, CPHY RX,
> + * CSID, IFE0-2 and SFE0-2 RCGs. Until upstream supports that path, manage
> + * their rail requirements through clock-owned DVFS.
> + */
> +enum {
> +	DT_PMDOMAIN_MMCX,
> +	DT_PMDOMAIN_MXC,
> +	DT_PMDOMAIN_MX,
> +};
> +
> +static const struct qcom_clk_dvfs_data cam_cc_pll0_dvfs = {
> +	.pd_indices = (const unsigned int[]) { DT_PMDOMAIN_MXC },
> +	.num_pd_indices = 1,
> +	.rates = (const struct qcom_clk_dvfs_rate[]) {
> +		{ 615000000, RPMH_REGULATOR_LEVEL_LOW_SVS_D1 },
> +		{ 1100000000, RPMH_REGULATOR_LEVEL_SVS },
> +		{ 1600000000, RPMH_REGULATOR_LEVEL_SVS_L1 },
> +		{ 2000000000, RPMH_REGULATOR_LEVEL_NOM },
> +		{ 2100000000, RPMH_REGULATOR_LEVEL_TURBO_L1 },
> +	},
> +	.num_rates = 5,
> +};
> +
> +static const struct qcom_clk_dvfs_data cam_cc_camnoc_axi_rt_clk_src_dvfs = {
> +	.pd_indices = (const unsigned int[]) { DT_PMDOMAIN_MMCX, DT_PMDOMAIN_MXC },
> +	.num_pd_indices = 2,
> +	.rates = (const struct qcom_clk_dvfs_rate[]) {
> +		{ 300000000, RPMH_REGULATOR_LEVEL_LOW_SVS },
> +		{ 400000000, RPMH_REGULATOR_LEVEL_SVS },

And does it actually have the same vote on both MMCX and MXC? I'd need
to check the clock tree.

> +	},
> +	.num_rates = 2,
> +};
> +
> +static const struct qcom_clk_dvfs_data cam_cc_cci_0_clk_src_dvfs = {
> +	.pd_indices = (const unsigned int[]) { DT_PMDOMAIN_MMCX },
> +	.num_pd_indices = 1,
> +	.rates = (const struct qcom_clk_dvfs_rate[]) {
> +		{ 37500000, RPMH_REGULATOR_LEVEL_LOW_SVS },
> +	},
> +	.num_rates = 1,
> +};
> +
> +static const struct qcom_clk_dvfs_data cam_cc_cphy_rx_clk_src_dvfs = {
> +	.pd_indices = (const unsigned int[]) {
> +		DT_PMDOMAIN_MMCX, DT_PMDOMAIN_MX, DT_PMDOMAIN_MXC,

Three domains... If we want to have three votes, we really need to have
three votes in the .rates array. But then it starts to feel like an OPP
table.

> +	},
> +	.num_pd_indices = 3,
> +	.rates = (const struct qcom_clk_dvfs_rate[]) {
> +		{ 400000000, RPMH_REGULATOR_LEVEL_LOW_SVS },
> +		{ 480000000, RPMH_REGULATOR_LEVEL_SVS },
> +	},
> +	.num_rates = 2,
> +};
> +

-- 
With best wishes
Dmitry
