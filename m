Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B207022F767
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 18:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776882813; cv=none; b=OK9EysLJyss2ndKLioVWzYGupsUULypuew2Q0MO2Y/8FNLfgQJVo6tynztfw5739Ru2HzlOl1S+OaEtuLMgYEMx5yaykBvDCBkMlc1Z0acluMkJxJNC/rCqkYjLniB6NrzZZ14Aa6yRVaJSgs5E3SqoyhDJQsxv75REHJabSghs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776882813; c=relaxed/simple;
	bh=qw5zJPCqM1SiokhXZUVY1lskCTv68QV8Hsd92bbd1/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKwEupPXLjLa8GgKJkKoUtsU3UPG44r9amHwP79hkk1+gfyCLvRExdVJ8fwR95TIct8etodWo8RT9kXGbP7ZBTawK2zV3FiqgtC03yW1q+SNl0x3EEDFKQVJJlDkv2z6k3vwqQS05DEt4xZF5JD+jIpVs8Ac+F7e2GjXFAsJ4oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TQc3GcRU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oxjw4jFb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQc3GcRU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oxjw4jFb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG3gEF1230210
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 18:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=czzcA6BNC1rAv5ThVag/zxI9
	yOSTqvKDsWkDm3VhBQI=; b=TQc3GcRUB0h2WvhifGEO3INwgLX8Ix5JioNKVRJ3
	ofkiYi538qmDjBB11xLPzPdNXurTUZEhmrvYNDXtwLRcGtTqy707cdxvf4Hcgz8d
	4UDwCFGvD6EreTV6SoOYfLujTL2IiwMj9kyn/546/RPKd1e7pV+ONE+OAdfvUbGQ
	PH4OM4lzA7ngZWmpQreWGbK0zWUAC8BSQtFfcgfEU0j6KLXaiZIURUhocM4H5gdd
	qUdXzqPpZGhFn4fFOkcqVT8ZanxZZeTmvJZyDqojt5zbmeXzZTDYc3hqSvJW5Ka2
	vEhkd/+k4XWl1n2popJwfdGpWGSBztfKq9D0GGyXyIT1dA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h68h7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 18:33:30 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-610478c6ba8so3555343137.2
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 11:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776882810; x=1777487610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=czzcA6BNC1rAv5ThVag/zxI9yOSTqvKDsWkDm3VhBQI=;
        b=Oxjw4jFbHEWwn5+y1vmDlvhF3Z1zbKPmuKMa9C0QfGqjoYQkS85kU+Sv0Znq14FAZP
         4iZOvngaD/TD4NLmHnpPXc4kfPfIaNx3fHgqldfcusneF1D8EyXt/v3PU0G9BovkJaia
         PArNh3IBY8UhZfyRmT1FZ8rqAgIYXiKVgwQW9kI747lb7UWwou067n2mg6Sq3VdCSF4g
         8ur8Bbp07PlSxiMG0OkPvY9dgYCkjJdZl3lHfCHsjNb9Z0+WTni2aWA2MpMBvPlcnX2c
         LwErjcORvFdAs/XSqavHJ2fBH49anhH+KsyJ37iIQ9BZuAwWwwDrmXNGjn4qEr7h2wXc
         mzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776882810; x=1777487610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czzcA6BNC1rAv5ThVag/zxI9yOSTqvKDsWkDm3VhBQI=;
        b=bjkW+QTwglUmBIdP0Ku3UqDWBkmWqv84zy1OSD8GDDVGSX8QYjbNRYFZYvhHL5BDfb
         wLc9J1hrK1tW3ktBcgQZnnUaFpL0OEJlqlfUmBVwpt1H+S14cSVDSpnpX4Xf6pFOU8x1
         PS05kvrKYyd4Zntsm5vxZzyYgd2psDuY/mVo8evI7IJPMRFYXkWAVvhKkMWwx63Ji6HI
         IVBiXiOku2iZaNHrtrZ5psUIBtUA/uV5SxxLI3fMjuWnqKm0I7zpOTxWvehNAR8ABU91
         VA/M42qv9HMecLTxnfTp35fjd9KKmEUMwFObfe8Sqfv+5xp9/HIKot/+9mUAfCjM04sE
         drYg==
X-Forwarded-Encrypted: i=1; AFNElJ/csDFZnGfDltuhhawVaphENg70I9u8RJfJAim3ydAmAP2kXg0fswtgqjRG8b+Q3kwPJ7WUl9rmCAl7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4hF77wuZPQ9Mkm4loYzGe9bZbx/KWAoUYj6qooToSBX3PcvEX
	Uf8yDAuL8n+okrjTHE8sM2OReHwKnNHqRfMMZQbFArwbUQfV2s5O+vCqfoccwK6w8Ap4NXiwd2N
	9YPB0VOf0y2/NzAF4KlKHerGlPwVvs7jJOhv2O2TGcnG7b0mhICTblLJJCfaiVTav
X-Gm-Gg: AeBDietEfjXTxJFgKJGX6wubIRkfChjLZb5fvDe8zGg/DRCBuPOM8CHmk/4BxLqOZX9
	IiTPn2QBX2TbYM+EPWz6E9OCFuGbO3SEy2CHFw1LYCizDnGa+69ZNmPy9wTiaWmblkQafiznNAG
	hbLgg1oHwVQrxEgylcDgqzIIJTmA9BDRLSFyxaoSFnn0ZPidjdC1qWiQ9PFtHecP+w8JV0ihrz+
	5IYc/ZqDa4qs6os4JVe/vomTnws2apR90mMTL9KvrKlxF7IyIgG5EZfGE71DCSHmynum6HreMtO
	pCyOh7uN9svZSGUimeiZsvHG7oYbY5ZzKMdwcyzHBczZo10sqZxPKx7PjR3po/4i0ZP/Y+9ekJ8
	Y0QfHDYgZCQO1E8W+HiKljdYxJzPFxGuCNFtccxB0Z7WIUiosmXsnZ+akLbY+v81xaDPf4tJNBM
	U9qnj70NX0pbny8S11s3DFguI7MNdkaq3sRY0jaT2p28hMpA==
X-Received: by 2002:a05:6102:3584:b0:607:a151:819 with SMTP id ada2fe7eead31-616f53a91fdmr11475154137.5.1776882809794;
        Wed, 22 Apr 2026 11:33:29 -0700 (PDT)
X-Received: by 2002:a05:6102:3584:b0:607:a151:819 with SMTP id ada2fe7eead31-616f53a91fdmr11475134137.5.1776882809325;
        Wed, 22 Apr 2026 11:33:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f5035sm38387471fa.4.2026.04.22.11.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 11:33:28 -0700 (PDT)
Date: Wed, 22 Apr 2026 21:33:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH 10/13] clk: qcom: dispcc-sm8750: Add support to control
 MDP clocks using CESTA
Message-ID: <vnil4gbkpenxo5o2a2df2ziuygqyyrzsj2bygqewm7n2rq5kbv@qbntqftfpsky>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-10-eb27d845df9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-10-eb27d845df9c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=f4Z4wuyM c=1 sm=1 tr=0 ts=69e9147a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=kN99BD5UUlLbkdYherwA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE3OSBTYWx0ZWRfX3DduQeHtBhX5
 c4Ec24+kNQSgn9MXTh3cYDSSyIc6JBSS5oYPATSi4vEcbb/VXPL11wRtUykoKiUi1xUf95Lj0G1
 VYlMV0Ag48sVC/llNRlpVi2IZttXWKC6LkKR/pxQYilfsto7cif3rBAUX3klc1LP5QOFDl6597T
 OE0jNNSJOE2jK/nD21oh02togbgp1jUByNHBRdjCZXBxDXkVgT8FPWnfLc6NfbvCwT6AVdYedhW
 kfYrlk9H5o3GIFFpoL7KUKqyMvPSCU4J90YjFPVDucYsK0O5nhscxNwszGsmAGuzuu4GggllTkk
 JBNrVRDiA3I3b4arZp7d4F6XxJ1LBLjyFoEimTARVFEWqg4wVG6wjloOIu5SpjS2BOKMWSt1SUC
 VaSOMf4ZXXwr59jbCetHVLVcoGUuCrHR0g//hvP2nGZyPlSrw3bCYXAv6kRCjv+QutL4vzH8H5R
 7tIxIrxCdkNk9AXJAVg==
X-Proofpoint-GUID: 1abgSxIyjKpXuk791yaXmAO7rnr2HzEG
X-Proofpoint-ORIG-GUID: 1abgSxIyjKpXuk791yaXmAO7rnr2HzEG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220179

On Mon, Apr 20, 2026 at 09:59:03PM +0530, Jagadeesh Kona wrote:
> Add support to control the DISPCC MDSS MDP RCG and the associated display
> PLL0 using display CESTA hardware on SM8750 platform. If display CRM is
> enabled, the clock ops of these clocks will be updated by the common code
> before registration to use CRM specific clock ops, allowing these clocks
> to be controlled using display CRM (CESTA Resource Manager) hardware.
> 
> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-sm8750.c | 89 +++++++++++++++++++++++++---------------
>  1 file changed, 56 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
> index ca09da111a50e811481fd862b54d454de024d1c9..328e43b52192702dbbfd1ed65737520acdd4a649 100644
> --- a/drivers/clk/qcom/dispcc-sm8750.c
> +++ b/drivers/clk/qcom/dispcc-sm8750.c
> @@ -71,6 +71,16 @@ enum {
>  	P_SLEEP_CLK,
>  };
>  
> +static struct clk_crm disp_crm = {
> +	.max_perf_ol = 10,
> +	.regs = {
> +		.reg_cfg_rcgr_lut_base = 0xd8,
> +		.reg_l_val_lut_base = 0xdc,
> +		.vcd_offset = 0x268,
> +		.lut_level_offset = 0x28,

Seeing this configuration makes me even more sure. There is no separate
CRM or disp-crm. The CRM resources should be consumed by dispcc.

> +	},
> +};
> +
>  static const struct pll_vco pongo_elu_vco[] = {
>  	{ 38400000, 38400000, 0 },
>  };
> @@ -89,21 +99,22 @@ static struct alpha_pll_config disp_cc_pll0_config = {
>  	.user_ctl_hi_val = 0x00000002,
>  };
>  
> +static struct clk_init_data disp_cc_pll0_init = {
> +	.name = "disp_cc_pll0",
> +	.parent_data = &(const struct clk_parent_data) {
> +		.index = DT_BI_TCXO,
> +	},
> +	.num_parents = 1,
> +	.flags = CLK_GET_RATE_NOCACHE,

Why? It wasn't there beforehand.

> +	.ops = &clk_alpha_pll_taycan_elu_ops,
> +};
> +
>  static struct clk_alpha_pll disp_cc_pll0 = {
>  	.offset = 0x0,
>  	.vco_table = taycan_elu_vco,
>  	.num_vco = ARRAY_SIZE(taycan_elu_vco),
>  	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_ELU],
> -	.clkr = {
> -		.hw.init = &(const struct clk_init_data) {
> -			.name = "disp_cc_pll0",
> -			.parent_data = &(const struct clk_parent_data) {
> -				.index = DT_BI_TCXO,
> -			},
> -			.num_parents = 1,
> -			.ops = &clk_alpha_pll_taycan_elu_ops,
> -		},
> -	},
> +	.clkr.hw.init = &disp_cc_pll0_init,
>  };
>  
>  static struct alpha_pll_config disp_cc_pll1_config = {
> @@ -681,25 +692,25 @@ static const struct freq_tbl ftbl_disp_cc_mdss_mdp_clk_src[] = {
>  	{ }
>  };
>  
> -static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
> -	.cmd_rcgr = 0x8150,
> -	.mnd_width = 0,
> -	.hid_width = 5,
> -	.parent_map = disp_cc_parent_map_9,
> -	.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src,
> -	.clkr.hw.init = &(const struct clk_init_data) {
> -		.name = "disp_cc_mdss_mdp_clk_src",
> -		.parent_data = disp_cc_parent_data_9,
> -		.num_parents = ARRAY_SIZE(disp_cc_parent_data_9),
> -		.flags = CLK_SET_RATE_PARENT,
> -		/*
> -		 * TODO: Downstream does not manage the clock directly, but
> -		 * places votes via new hardware block called "cesta".
> -		 * It is not clear whether such approach should be taken instead
> -		 * of manual control.
> -		 */
> -		.ops = &clk_rcg2_shared_ops,
> +static struct clk_init_data disp_cc_mdss_mdp_clk_src_init = {
> +	.name = "disp_cc_mdss_mdp_clk_src",
> +	.parent_data = disp_cc_parent_data_9,
> +	.num_parents = ARRAY_SIZE(disp_cc_parent_data_9),
> +	.flags = CLK_SET_RATE_PARENT,
> +	.ops = &clk_rcg2_shared_ops,
> +};
> +
> +static struct clk_rcg2_crm disp_cc_mdss_mdp_clk_src = {
> +	.rcg = {
> +		.cmd_rcgr = 0x8150,
> +		.mnd_width = 0,
> +		.hid_width = 5,
> +		.parent_map = disp_cc_parent_map_9,
> +		.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src,
> +		.clkr.hw.init = &disp_cc_mdss_mdp_clk_src_init,
>  	},
> +	.crm_vcd = 1,
> +	.crm = &disp_crm,
>  };
>  
>  static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
> @@ -1562,7 +1573,7 @@ static struct clk_branch disp_cc_mdss_mdp1_clk = {
>  		.hw.init = &(const struct clk_init_data) {
>  			.name = "disp_cc_mdss_mdp1_clk",
>  			.parent_hws = (const struct clk_hw*[]) {
> -				&disp_cc_mdss_mdp_clk_src.clkr.hw,
> +				&disp_cc_mdss_mdp_clk_src.rcg.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1580,7 +1591,7 @@ static struct clk_branch disp_cc_mdss_mdp_clk = {
>  		.hw.init = &(const struct clk_init_data) {
>  			.name = "disp_cc_mdss_mdp_clk",
>  			.parent_hws = (const struct clk_hw*[]) {
> -				&disp_cc_mdss_mdp_clk_src.clkr.hw,
> +				&disp_cc_mdss_mdp_clk_src.rcg.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1598,7 +1609,7 @@ static struct clk_branch disp_cc_mdss_mdp_lut1_clk = {
>  		.hw.init = &(const struct clk_init_data) {
>  			.name = "disp_cc_mdss_mdp_lut1_clk",
>  			.parent_hws = (const struct clk_hw*[]) {
> -				&disp_cc_mdss_mdp_clk_src.clkr.hw,
> +				&disp_cc_mdss_mdp_clk_src.rcg.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1616,7 +1627,7 @@ static struct clk_branch disp_cc_mdss_mdp_lut_clk = {
>  		.hw.init = &(const struct clk_init_data) {
>  			.name = "disp_cc_mdss_mdp_lut_clk",
>  			.parent_hws = (const struct clk_hw*[]) {
> -				&disp_cc_mdss_mdp_clk_src.clkr.hw,
> +				&disp_cc_mdss_mdp_clk_src.rcg.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1844,7 +1855,7 @@ static struct clk_regmap *disp_cc_sm8750_clocks[] = {
>  	[DISP_CC_MDSS_ESC1_CLK_SRC] = &disp_cc_mdss_esc1_clk_src.clkr,
>  	[DISP_CC_MDSS_MDP1_CLK] = &disp_cc_mdss_mdp1_clk.clkr,
>  	[DISP_CC_MDSS_MDP_CLK] = &disp_cc_mdss_mdp_clk.clkr,
> -	[DISP_CC_MDSS_MDP_CLK_SRC] = &disp_cc_mdss_mdp_clk_src.clkr,
> +	[DISP_CC_MDSS_MDP_CLK_SRC] = &disp_cc_mdss_mdp_clk_src.rcg.clkr,
>  	[DISP_CC_MDSS_MDP_LUT1_CLK] = &disp_cc_mdss_mdp_lut1_clk.clkr,
>  	[DISP_CC_MDSS_MDP_LUT_CLK] = &disp_cc_mdss_mdp_lut_clk.clkr,
>  	[DISP_CC_MDSS_NON_GDSC_AHB_CLK] = &disp_cc_mdss_non_gdsc_ahb_clk.clkr,
> @@ -1866,6 +1877,11 @@ static struct clk_regmap *disp_cc_sm8750_clocks[] = {
>  	[DISP_CC_XO_CLK_SRC] = &disp_cc_xo_clk_src.clkr,
>  };
>  
> +static const struct crm_clk_data disp_cc_sm8750_crm_clks[] = {
> +	CRM_CLK_PLL(disp_cc_pll0),
> +	CRM_CLK_RCG_CRMB(disp_cc_mdss_mdp_clk_src),
> +};
> +
>  static const struct qcom_reset_map disp_cc_sm8750_resets[] = {
>  	[DISP_CC_MDSS_CORE_BCR] = { 0x8000 },
>  	[DISP_CC_MDSS_CORE_INT2_BCR] = { 0xa000 },
> @@ -1885,6 +1901,12 @@ static const struct regmap_config disp_cc_sm8750_regmap_config = {
>  	.fast_io = true,
>  };
>  
> +static struct qcom_cc_driver_data disp_cc_sm8750_driver_data = {
> +	.crm = &disp_crm,
> +	.crm_clks = disp_cc_sm8750_crm_clks,
> +	.num_crm_clks = ARRAY_SIZE(disp_cc_sm8750_crm_clks),
> +};
> +
>  static const struct qcom_cc_desc disp_cc_sm8750_desc = {
>  	.config = &disp_cc_sm8750_regmap_config,
>  	.clks = disp_cc_sm8750_clocks,
> @@ -1893,6 +1915,7 @@ static const struct qcom_cc_desc disp_cc_sm8750_desc = {
>  	.num_resets = ARRAY_SIZE(disp_cc_sm8750_resets),
>  	.gdscs = disp_cc_sm8750_gdscs,
>  	.num_gdscs = ARRAY_SIZE(disp_cc_sm8750_gdscs),
> +	.driver_data = &disp_cc_sm8750_driver_data,
>  };
>  
>  static const struct of_device_id disp_cc_sm8750_match_table[] = {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
