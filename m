Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BCD3D8138
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 11:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780054457; cv=none; b=XOHwseqIKMAPoLM5o7SKqc1oZCqIFzImofXpoMbl7TbmKzGwiBIlEyUWiFKaPjzfhwtka0/6+me2To3yW3KbK7Bc6EoND2lR1nlyxRgqdkVQdNQvLBZhfmq7oXVRyaYpi11jkwDX/IF6i6zGslAa74L1IeqXDwYz8xI0yA9PV+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780054457; c=relaxed/simple;
	bh=ZLPBMkFaWQOcS42XIaoCEvFlqGqW9sf/J88rRpBUGDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cB9JeZVtbRKwAoVdbV1f847dnVvw03oQbsSsYIwudLQA3SlcdkwkKSCWcer6jWtdy+gkFE+jEYaz1GODdRWOa67CvTpj6Ks1UKM/PrUgbM4ml67H39JskmyfU3OYwNSU7VrjXPlkjPmTYPR/d9NIqfSFUCbeHGmmTYnczUQB3Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aYLdsyqa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JTO3dYAh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aYLdsyqa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JTO3dYAh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T5KNKZ1248208
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 11:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jV+HQUofjwb1asCfK4DqsXWe
	6MEjKMB4yFb1D6Vb1iE=; b=aYLdsyqawUvFj1pFHVi7SIis0Aav3RXebT4Zg4uU
	P0HAOokl7QEkJGFRPjTJXtGw4qaeD+z8xoVEE3kdouoe5CGtHkg+4+oX3uwaNwIs
	YNCyNNamYJixTxNGpunFRucaIjOk1DkFwzp4Ob7XP940tFuuBC751NaMQIvDJ0fN
	xSQnAJui4s92vTVE9eRYZMf4PWvGg+0h6sfc8qvA7NYs8AQJvWLDve/XkHFedgAI
	1aRBSj4AxjhGao/NNdB+g6lDKfEv9ZnsF7UXfPyRaHqQ69oixvz3arNdF2HPKUPf
	who/HHWqNpe0NiNqNYuRkBGmLgPApPWUgc6r7KtcMZ/Zbw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef4jj1gqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 11:34:14 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c47a07f324so4449137.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 04:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780054453; x=1780659253; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jV+HQUofjwb1asCfK4DqsXWe6MEjKMB4yFb1D6Vb1iE=;
        b=JTO3dYAhRrLITDXGD9EWa6iugunqW4Yov+XsAJXe/PpoDmjmMV6pvjKlStdEr/XZkG
         qvys/s0fRfrOEoPMP/x3kjNJ0BOwt8duWo5ZV48/aXBUrdMndGPKub2liPZ2Hc92LfTc
         eywY/1lamjtANfaNeNWmaJgV5QjhNv8TO2UEuvFKbfmYBa4JLCGETMdq/qgNXH+k9uJl
         5j47pccIuPxU/PXvm7fklfKKMTdEQqaun1RQ+SICVDbHcIcme3YZQbdBYQf6Hv05nr5n
         Alo6It/VJu6TCvNyCl26mYd7Rat/kKH6ZihYVaP9AwNN5KsI8W0RTxRqXWo/EU3NDPOh
         mQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780054453; x=1780659253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jV+HQUofjwb1asCfK4DqsXWe6MEjKMB4yFb1D6Vb1iE=;
        b=sixCaimE76yjlcx1seVc7AWXFk1WpzYC5F0FtS7K/hcbVSUpgOrBJyaXvBzWVF5Y0a
         eAwA70Qje1d2isvDdF8ggqOF4JJl/RRjYW1B846DPjo+xlXLwGNG06JxNOWl+VKCEX4i
         +dETI3/tsxCC/nI8YMxubWuXULO75vt0Gf/LA/mFSkCLweA+Tfi+KRvetGvoC+PgPSHa
         CjiG++eagt7bP09tKrFR2/xIGlnolLeSzxnel/szNKgBn5dFOpxeBDmS6k8j64YHR5T1
         6ZhasDM8VHIUGjUTjTRz/5rJMGHcCnci1F35iaXUrNAbL8agVm4H4MiLw8UOxoRW6Ipi
         TKfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZiBJkSdAbuXl/sFtqZZWBPz1wYx54xFOxo2a6UimVhYICWUVvf1bvny84ul+4+zfnpenUg3j5TtlX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9wkH5j8Xo94u7NJpCNg0OwE9YztGbfSCH1Wz2QtYsAG8a8iAk
	4HpLEaXVC4A1gbpf66AhqH0Vln7rqBGXMFEDuwgZmIeV3E4mSx4Wkb7byWTaGANglycr6liC+n4
	akq5pmdhbD47M8uk3FJ4UKXL/SW98+B8JmrQNygc87prFaKnrEJNG08/YXGKtpG9S
X-Gm-Gg: Acq92OG5qS/emCqRYh2aUNXoRLatt92NedqcQZIS0lQEbLYI3bXkqIJAEmy4xzJArKX
	WdmgOIIz0POpE9h/2g5Mx5K78JMVIO8nROru3wsU9YyLuYZyYr4fq1RoY+4aPbBgcbUKcoW2neB
	wMrDWBWazpHukXhW2YUWy14jiCzWw2fL3D3LNqwQThyVeWKBpJi8jClpY13Hy+ciJHipponWqRo
	wv2mVnCrm8UCE5bN5CttCZIojm3Zy740jphggJkc1TUgPJbMVtVtxQ9U35f8udOCBLH2z2aJjzu
	sFMxoDtP+oi4oVdZvRXId3Sk7vYTZRvtmfgMaCjjMHiO+BqOI+iphux4M8R11DiI5GFOdoo0NoG
	M9z0+LjTBVVcAQ54rdYcx2Cmxej2dRYFICFg+C5ftAZDeuukBjGgSW9B93R1UpbXdu4Dhlk47i6
	mpNH9owFhgNoGCk0TqipIKpcLXf3cPS63mVYQnoxH4Swv2DA==
X-Received: by 2002:a05:6102:809d:b0:635:1bc8:3568 with SMTP id ada2fe7eead31-6bf479340dfmr655241137.23.1780054453430;
        Fri, 29 May 2026 04:34:13 -0700 (PDT)
X-Received: by 2002:a05:6102:809d:b0:635:1bc8:3568 with SMTP id ada2fe7eead31-6bf479340dfmr655228137.23.1780054453001;
        Fri, 29 May 2026 04:34:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39659e28e71sm1766071fa.33.2026.05.29.04.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:34:12 -0700 (PDT)
Date: Fri, 29 May 2026 14:34:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] clk: qcom: dispcc-qcm2290: Add support for
 Qualcomm Shikra DISPCC
Message-ID: <dduromih2zmmmqocijyxevabmoioly7lujcvhwucepkz2fjqsu@pogjkd7ugctv>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-4-953f246a0fbb@oss.qualcomm.com>
 <qumelrcom3wxzgcibou6vmw2jc5tushr4z2tvmudflgpiqin7w@raf436u5gksb>
 <937bc3b3-bd38-4df4-bee9-c68e83de3ff6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <937bc3b3-bd38-4df4-bee9-c68e83de3ff6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDExNSBTYWx0ZWRfX4fgYHCI5O55B
 UaRND+xKcoEBhBKHbNP6Be0TJ1GD+74Wdjzv0fFXoEKZs9E8uor2PWb/3EFcFQurLZD3iSFxQhs
 ZilWiJUIHMmiqvHwe5Z/I7YeHeTUyhho/wyq7UyPVwd5h1an9+cIIOnWE+E+LFPVAGW1c5w3lTG
 5wsFUPgniz+1IwNowzoHVBOg7zOx6w8jdBRDZyxndZLFaP3AmEqiFnqlt6lIgrRuRP0IGMLQ7Fp
 fQsXQ9BjIPiOmEV17QhDPcNgM69kJyfqGLAFBhiTXePk3iKE2iqs+ww0HxHZQOp6c3FS55orD7H
 DX28NOvTL6YdUYVMkGiTrg92s+zF85c8uacKn6/NlXaYFJBELHf7ZQvANyUwkeTudEfzFCGbLw0
 cnRplNQ4iDUpOkNBjEaEeIqoaYccNqH3+QClCWIf0F2prYpe7AzFQCnsKB5fJp2hmJsNlvxW+eX
 Iv39aX41Ez5ozVBKRAg==
X-Proofpoint-ORIG-GUID: 6VDsSGyAbBX6FcCQJmnZ37HX6Sm3QdBE
X-Authority-Analysis: v=2.4 cv=Tt7WQjXh c=1 sm=1 tr=0 ts=6a1979b6 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=sVYnoZhgtxLjuife8BcA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: 6VDsSGyAbBX6FcCQJmnZ37HX6Sm3QdBE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290115

On Fri, May 29, 2026 at 02:53:45PM +0530, Imran Shaik wrote:
> 
> 
> On 28-05-2026 07:12 pm, Dmitry Baryshkov wrote:
> > On Thu, May 28, 2026 at 03:37:05PM +0530, Imran Shaik wrote:
> > > The Qualcomm Shikra Display clock controller reuses the QCM2290 DISPCC,
> > > but has minor differences. Update the parent data of mdss ahb/mdp clocks
> > > accordingly to the hardware clock plan and correct the GDSC *_wait_val and
> > > flags which are applicable for both QCM2290 and Shikra SoC, and add the
> > > support for DSI1 PHY source.
> > > 
> > > Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> > > ---
> > >   drivers/clk/qcom/dispcc-qcm2290.c | 18 +++++++++++++-----
> > >   1 file changed, 13 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
> > > index 6d88d067337fa132114b0d8666931b449f86de17..19c997f3fe9f197d2c252a9dd1e8169947200f5f 100644
> > > --- a/drivers/clk/qcom/dispcc-qcm2290.c
> > > +++ b/drivers/clk/qcom/dispcc-qcm2290.c
> > > @@ -2,6 +2,7 @@
> > >   /*
> > >    * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> > >    * Copyright (c) 2021, Linaro Ltd.
> > > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > >    */
> > >   #include <linux/clk-provider.h>
> > > @@ -32,6 +33,8 @@ enum {
> > >   	P_GPLL0_OUT_DIV,
> > >   	P_GPLL0_OUT_MAIN,
> > >   	P_SLEEP_CLK,
> > > +	P_DSI1_PHY_PLL_OUT_BYTECLK,
> > > +	P_DSI1_PHY_PLL_OUT_DSICLK,
> > >   };
> > >   static const struct pll_vco spark_vco[] = {
> > > @@ -84,7 +87,7 @@ static const struct clk_parent_data disp_cc_parent_data_1[] = {
> > >   static const struct parent_map disp_cc_parent_map_2[] = {
> > >   	{ P_BI_TCXO_AO, 0 },
> > > -	{ P_GPLL0_OUT_DIV, 4 },
> > > +	{ P_GPLL0_OUT_MAIN, 4 },
> > 
> > Why?
> > 
> > >   };
> > >   static const struct clk_parent_data disp_cc_parent_data_2[] = {
> > > @@ -101,17 +104,19 @@ static const struct parent_map disp_cc_parent_map_3[] = {
> > >   static const struct clk_parent_data disp_cc_parent_data_3[] = {
> > >   	{ .fw_name = "bi_tcxo" },
> > >   	{ .hw = &disp_cc_pll0.clkr.hw },
> > > -	{ .fw_name = "gcc_disp_gpll0_clk_src" },
> > > +	{ .fw_name = "gcc_disp_gpll0_div_clk_src" },
> > 
> > Do you realize that this is an undocumented ABI chance?
> > 
> > >   };
> > >   static const struct parent_map disp_cc_parent_map_4[] = {
> > >   	{ P_BI_TCXO, 0 },
> > >   	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
> > > +	{ P_DSI1_PHY_PLL_OUT_DSICLK, 2 },
> > >   };
> > >   static const struct clk_parent_data disp_cc_parent_data_4[] = {
> > >   	{ .fw_name = "bi_tcxo" },
> > >   	{ .fw_name = "dsi0_phy_pll_out_dsiclk" },
> > > +	{ .fw_name = "dsi1_phy_pll_out_dsiclk" },
> > >   };
> > >   static const struct parent_map disp_cc_parent_map_5[] = {
> > > @@ -153,8 +158,8 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
> > >   static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
> > >   	F(19200000, P_BI_TCXO_AO, 1, 0, 0),
> > > -	F(37500000, P_GPLL0_OUT_DIV, 8, 0, 0),
> > > -	F(75000000, P_GPLL0_OUT_DIV, 4, 0, 0),
> > > +	F(37500000, P_GPLL0_OUT_MAIN, 8, 0, 0),
> > > +	F(75000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
> > 
> > Why? It's not mentioned in the commit message.
> > 
> 
> As per the HW clock plan, the ahb(parent_*_2)/mdp(parent_*_3) clock RCG
> parent must be GPLL0_OUT_MAIN (gcc_disp_gpll0_div_clk_src). Updated them
> accordingly and mentioned the same in the commit text below:
> 
> "Update the parent data of mdss ahb/mdp clocks accordingly to the hardware
> clock plan"
> 
> Will move these to indices approach, and add in a separate commit as you
> mentioned in the other patch comment.


Why are you trying to move to indices?

> > >   	{ }
> > >   };
> > > @@ -450,11 +455,14 @@ static const struct qcom_reset_map disp_cc_qcm2290_resets[] = {
> > >   static struct gdsc mdss_gdsc = {
> > >   	.gdscr = 0x3000,
> > > +	.en_rest_wait_val = 0x2,
> > > +	.en_few_wait_val = 0x2,
> > > +	.clk_dis_wait_val = 0xf,
> > >   	.pd = {
> > >   		.name = "mdss_gdsc",
> > >   	},
> > >   	.pwrsts = PWRSTS_OFF_ON,
> > > -	.flags = HW_CTRL,
> > > +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> > 
> > And this also needs explanation.
> > 
> 
> Sure, will add these GDSC fixes in separate commit in next series.

With the proper justification, please.

> 
> Thanks,
> Imran
> 
> > >   };
> > 
> 

-- 
With best wishes
Dmitry
