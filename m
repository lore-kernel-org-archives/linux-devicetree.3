Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695E23BCD04
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 11:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780054301; cv=none; b=H6sXpkdzvWush2INBeNU37M57ZV7mZojwBRKFIVCC31PUkQ/IRI0ezCSjZa5y3/V/zhNPSpLTWBeaNkrgYbLEIr7xdLAHKMRKbOy485uH+MBr8BBtmsiZGxzeYBAxbE0JvQrFpFT2WKw5qOZvYKUkPzqVWIzpGVvoqioFyKrwOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780054301; c=relaxed/simple;
	bh=jDAFGjiCfLrCl0hVy9nsbFdGMPZCs5ChqYR26a4YPcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nykze9e3STbanH+Kh9wI/OjBEB2U92ji73YXCES7SLlgehLIMcIU+4i4ZiSb6jx0hJ4U5ppLWzRyRH3A1befkDTK8KsdW/XDC9xd24wsohssu50kWeysZNI5vwxwSuigQh9VghR9YcgbTqck3wY9ROdfbabLErln10B2qq7H2g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/Q4T5I3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E9LXFdMI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/Q4T5I3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E9LXFdMI"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6XLYS1540465
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 11:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4OZfzQc/dyOQSntkzOUIiFH1
	GBBny4mWUmOpzxIrldw=; b=n/Q4T5I3mS3JauGC9yq6WWLDzem1jn/0eh3JJGS5
	ZO3xtLILkPvxkuVr5oryFC5WJxaC5bm7Jmpq4L22ba0f0SxXKpF+x1L31JyNfDOJ
	ogL8jx/uI79iG3DXHSgKlJe4BFUWOxrWXCFAlD0wwE3hltNfb5/S4GYpfXskjMFj
	fCLM2t/oiHUqomm4shzlxdRfyx4k+B+hTnCUA1EmlZ/oU82GNjZBpxHZuu5gIm0w
	Z1MjPLjLiyKyJ5cWuFfDtOmneYK0V8YeySjY31Y3N6Ai1Zkf+C9U+8Vst6JaR3+j
	0SIK/M96O3HbU5R21gxWfWseLsLo81NSdv5qlgB0ffKyPA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety4uvt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 11:31:39 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-575507a346fso14920301e0c.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 04:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780054299; x=1780659099; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4OZfzQc/dyOQSntkzOUIiFH1GBBny4mWUmOpzxIrldw=;
        b=E9LXFdMI5qYUHBXN/l1WExq79ZnAMuqvQvvTVJNA+SxhIqDK7f6CLLqLU5KCRG3P5l
         3zJqQWW/SKB//EYaJf+JCa93bGVnmkHaABRieGFDtSHnpjspduXPw3AW2nb5hlxbeo/3
         YaOMba+qjROEu5BhxhkT2xRWkqRe5/ugs9Q3J8t1ao+Ln7mGSHLdh1QbIUEtBcvg0uCL
         Ha79+cPPteOZCa+fS5gQM0ZghpycFS05RPmqpXi9BXJujMXj/RArn4eI3X8qxmWFDqWj
         iOAJbUiKGsRgUOLnu9wovEx7A9lhJYptDdtIcDnxGTQ8phxWVyvAPnW8WXGHUlYEaqsI
         zskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780054299; x=1780659099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4OZfzQc/dyOQSntkzOUIiFH1GBBny4mWUmOpzxIrldw=;
        b=eO5/mSiedPhqIq9GBWQ3v6WmM9ehaFmaPMgYlkH45uappFIrtynECzfVa6b6J0QOI1
         MFeFYCDpDSSH+qJQRn0wtqqbp8y2KaKog6gkTkTHlynb5axSKevFx6kgd/hx6o3HthLg
         he/VK+8R7+Cneo4DphInt93LdJsQyhchN2onv+YV2Vj/ZJ9gbQgJmc3PifmviAwR9sG+
         saO5q2ntIl8gpClSUx1UA9xY7NHkG6HyvoVkYR0PxodiQNX7t0lgPNJ5ZZcbDhaF5qlV
         mTpmpG3Y9vPD8m1oH2308XtYxWc5eW8PNjBB87+BvUhOhb4l3U85vFEsU4GwYoUcLDHt
         C9Bg==
X-Forwarded-Encrypted: i=1; AFNElJ8rcW3ZQ5jZOP9+Jz1YvJt3Spvfs82vpp/VFnUzT1EE5rs83Nplxk+0UzQMT1MSHs3AbpFYQzFdJMIl@vger.kernel.org
X-Gm-Message-State: AOJu0YxmDcn/IYslHeVzxCTHCcmu2J2h61jv2YZSLzddf5kan0iNICSe
	GtT1OiPI7AlFaAiUtcGapJPZl1Ewa+4vt/8GNEONdSZDOFmvV+kcNJAiO+xTuVMgYtBXM0h7fuc
	9CqdcSw/ws9I2CT8QuRVn06c+SAkIMnyeKUWJbPJ4w9AKievwHQIJ8IE44yFloTON
X-Gm-Gg: Acq92OFXJUVEAzVWspudF9YrS4i9zAwc3U8OCwzB53VRgVu8MFfc0pRjb56gCOqPkd/
	NndMpj/u8J2Xeo7C5ESMkB+fm1PAPSlJCFGx7tjwGJRobVMJ3LNdz/fLUx6L2lafSprykft3+XY
	bNajXYZq5saCSVky6EpkkKTNk7z8l4xFKr2bK4rLYAJn7mJy3J+tw8KkZra0LVCoelJKBjzfLXg
	rrj//H5n9mVseZGwOE9PyyaBLSxm2TPavQP0JwJ3lIPOJxHp+WdDEBFi6L5420Ph3iFKkR6QDc5
	v1+4qPn9QVh/a0XKxHo8h/zZswN9gi/sxzr7CsvqRNfTdywHreLCoXcMU2un5+0vjswtzu+QV+P
	wkxyVfbTWblqx3/plC4DkGJtAYiNbi9C/qbnzfeRhENSzHUfnQjbtni20fwx7LgbT3U28FDPEk1
	9nQeczJWk2qEeOPuaHnO+tUrYB2YJR8xixc8GG1nw5h0Kq5g==
X-Received: by 2002:a05:6122:3383:b0:575:cbe6:8416 with SMTP id 71dfb90a1353d-599fb52908bmr776930e0c.14.1780054298747;
        Fri, 29 May 2026 04:31:38 -0700 (PDT)
X-Received: by 2002:a05:6122:3383:b0:575:cbe6:8416 with SMTP id 71dfb90a1353d-599fb52908bmr776857e0c.14.1780054298205;
        Fri, 29 May 2026 04:31:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b596814sm221915e87.43.2026.05.29.04.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:31:36 -0700 (PDT)
Date: Fri, 29 May 2026 14:31:35 +0300
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
Subject: Re: [PATCH v2 1/5] clk: qcom: gcc-qcm2290: Drop modelling of
 critical clocks
Message-ID: <s5wjr7a7zkueqyzlmrij7f53brrh6rv5z3t5cser5cj74qca2e@6xhljjefc66a>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-1-953f246a0fbb@oss.qualcomm.com>
 <ro6xcalsh5vwsyxi4jyyk4iebmg2p626aqw5zobbfjj5noui6r@hsjyhdko2aca>
 <8b911846-1001-4c20-908d-1384cc81e30b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b911846-1001-4c20-908d-1384cc81e30b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: -xR05PH1AaB1L-E3b3nGzPBuK4X9HKXf
X-Proofpoint-GUID: -xR05PH1AaB1L-E3b3nGzPBuK4X9HKXf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDExNSBTYWx0ZWRfX9PR6AVeZ4Kxn
 +uynZUqBOaWdFAjrmwr21VDNZ7G4srl2l/3gj1NPS0E+fXyejfCFq0xZPTI0c0u8kNHL+aoUNCO
 8n/CBOsPZoZLkKtaSyc3ZWmstzKYMjTQZyHwGciyecKY+XMqdtQHbIVwkGy62RGEYlTBRtPna70
 dUJEEsMf1y95DoSqe8rmzguiXVBcKqNd8vayj+YcYO+915vI+CSo2iqpw2gLA5IQDbdoDum8Tqd
 OqmX5RWZQJ+PupxDer7SZAanYQh3Gw/uXfCXMWNengIlvNhNfKmQ4drtUv0T4SJVwAZwHGvviX6
 ajT5Gg6VTrEgP7TULQeTNW6BCKvXA4VFt0nCnPmiDjO3xzTwf802mpDV9fbwnc9G/8JFraRpQ5O
 caRPRSQV40nbCQHXG3HoofQy/F6yXMriLfm3cnq7S3QOA+6O7rNd3lYphM3leYN/dNWNzKdVG6Y
 qGFv6DkSo9WuqAO4s7Q==
X-Authority-Analysis: v=2.4 cv=S+TpBosP c=1 sm=1 tr=0 ts=6a19791b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=6Wl8FitGjV6qeXz9Ne0A:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290115

On Fri, May 29, 2026 at 02:52:39PM +0530, Imran Shaik wrote:
> 
> 
> On 28-05-2026 06:52 pm, Dmitry Baryshkov wrote:
> > On Thu, May 28, 2026 at 03:37:02PM +0530, Imran Shaik wrote:
> > > Drop the modelling of critical GCC clocks on QCM2290 SoC, and keep them
> > > enabled from probe as per the latest convention. This helps to drop the
> > > pm_clk handling in QCM2290 GPUCC driver, and the same can be re-used for
> > > Shikra SoC.
> > > 
> > > Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> > > ---
> > >   drivers/clk/qcom/gcc-qcm2290.c | 153 +++--------------------------------------
> > >   1 file changed, 11 insertions(+), 142 deletions(-)
> > > 
> > > @@ -2012,19 +1936,6 @@ static struct clk_branch gcc_gpu_gpll0_div_clk_src = {
> > >   	},
> > >   };
> > > -static struct clk_branch gcc_gpu_iref_clk = {
> > > -	.halt_reg = 0x36100,
> > > -	.halt_check = BRANCH_HALT_DELAY,
> > > -	.clkr = {
> > > -		.enable_reg = 0x36100,
> > > -		.enable_mask = BIT(0),
> > > -		.hw.init = &(struct clk_init_data){
> > > -			.name = "gcc_gpu_iref_clk",
> > > -			.ops = &clk_branch2_ops,
> > > -		},
> > > -	},
> > > -};
> > 
> > This clock is not critical. Why is it being dropped?
> > 
> > > -
> > >   static struct clk_branch gcc_gpu_memnoc_gfx_clk = {
> > >   	.halt_reg = 0x3600c,
> > >   	.halt_check = BRANCH_VOTED,
> > > @@ -2605,21 +2500,6 @@ static struct clk_branch gcc_venus_ctl_axi_clk = {
> > >   	},
> > >   };
> > > -static struct clk_branch gcc_video_ahb_clk = {
> > > -	.halt_reg = 0x17004,
> > > -	.halt_check = BRANCH_HALT,
> > > -	.hwcg_reg = 0x17004,
> > > -	.hwcg_bit = 1,
> > > -	.clkr = {
> > > -		.enable_reg = 0x17004,
> > > -		.enable_mask = BIT(0),
> > > -		.hw.init = &(struct clk_init_data){
> > > -			.name = "gcc_video_ahb_clk",
> > > -			.ops = &clk_branch2_ops,
> > 
> > This clock isn't marked as CRITICAL, why is it being dropped?
> > 
> > > -		},
> > > -	},
> > > -};
> > > -
> > >   static struct clk_branch gcc_video_axi0_clk = {
> > >   	.halt_reg = 0x1701c,
> > >   	.halt_check = BRANCH_HALT,
> > > @@ -2686,19 +2566,6 @@ static struct clk_branch gcc_video_venus_ctl_clk = {
> > >   	},
> > >   };
> > > -static struct clk_branch gcc_video_xo_clk = {
> > > -	.halt_reg = 0x17024,
> > > -	.halt_check = BRANCH_HALT,
> > > -	.clkr = {
> > > -		.enable_reg = 0x17024,
> > > -		.enable_mask = BIT(0),
> > > -		.hw.init = &(struct clk_init_data){
> > > -			.name = "gcc_video_xo_clk",
> > > -			.ops = &clk_branch2_ops,
> > 
> > This clock isn't marked as CRITICAL, why is it being dropped?
> > 
> 
> The above clocks also should have been marked as CRITICAL. Not sure why
> those are not marked in the QCM2290. Since we are updating the critical
> clock set, moving all the required clocks to the critical list in line with
> the latest conventions.

Sure, but it doesn't match the commit message. Explain that you are
making them always-on, because...


-- 
With best wishes
Dmitry
