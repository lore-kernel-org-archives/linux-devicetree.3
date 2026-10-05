Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737F336B915
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 07:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791183888; cv=none; b=ozjfDHOcbM/c55p81Y49402wxJ2gUVaAGTNEZEF/Fsw1UCamFUIVzQgodS0BjwFW5hFVqY4zTc+P49ZLqEwgVZ2TQ9Q9L/4yhJKrAUw/tuVmKGGges+zCQRnB545fD7f1Bg60Ms1txL33GM1Vaw+m7wZ9M+GM/J3rEyc0P3CFC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791183888; c=relaxed/simple;
	bh=QVyR7CP7FE2myu62IAV9y7e29voRASCl4OzYEjj0lHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPXLNxc5Cp7gZ56j7LpeddnnpYSdAh+dMUZ4weA/h8uqr7LC4To8FGjDCC2o2AINO3RdhaMXnm/mpQX2ag+PzBlmioCMG9Mk2KdwKMNlXn7RyoqV2iPFfbmvI84CFctnQ1iwSC9S7Ombu+CFVllgHA74HPdqeN/19yztfcbjo2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LCKMfVy6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YilHN8Qk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LCKMfVy6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YilHN8Qk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510CJY471070
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 07:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FvnM3Ex3fN1kuVWZlKJ62wpzcxskyyIy0mNGiZDRwtM=; b=LCKMfVy6z41UGH1f
	5BezKTKfKxMyj6OSMRiLsA98jDJpOE8pqGOxhOcpRiVpNNpbJB138HYtzohzaKKX
	jHpV8yWsk5GwIqAlFV+7xwrZekxg9Uecfepzl6tGUV24nEFBVjszCKiAO2KlUXfa
	btBUAEEOw9hAIgWSLwflmtj6PhNJAyPenkSWHiPrg0a98x4cPYkXd9ZSq+psaIAA
	aePeAvdyiekyhIE5KrwrUvOnYiii2sZ298SQqvgf9+zeOzgG9BHtqQ27XT1CTwdU
	pdLhrEtEB/b/w+ZY/gUj/8ZvuDnoiSg0389Y1qUblQskwdqyg9nRosMU/QWph5Hb
	GL1jsQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssucu60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 07:04:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc359d9easo215812285a.3
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 00:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791183885; x=1791788685; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FvnM3Ex3fN1kuVWZlKJ62wpzcxskyyIy0mNGiZDRwtM=;
        b=YilHN8QkuF74UPlfuh7pcE/C3LRkiBbKO4OJRcgur1KbnjJh90ooDje+dfEiqbXoSO
         9SpBEeJXjt3YYJTH8vLCBInwPYeYVifbobpTPrA3aNbgT9Q5DNScIwpm8vF7RXwUqKTi
         gM83/+/71rcYX5LwMk1ps0/uzUeYooalhtzYAsHk8vkPXk01LmNkBFFVjE8rdO4dAlVS
         9JloXB/VQ88OrvHDnGHaxl6QtJWbEtcWyWrewSq1X9Ki240JxrCADdTbYYVW7rr0x1Nn
         kGLqgF3LeW4NdLuMtJb0Ggqx1mafnvrsT7uPnTWaT9IgdogsZBAsed8IB0dkjKnow1Jn
         AyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183885; x=1791788685;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FvnM3Ex3fN1kuVWZlKJ62wpzcxskyyIy0mNGiZDRwtM=;
        b=OnWDHrFI6aNYOyP9bIOpOY4PNH1ZDH/AH8o/QdqXzy45M1c3IFzMs+W0SKIour7e2p
         on9RY9BDHt51/pdOaeXJveqn4KprVPsyE4LOjHEayHufu24lYMxezcP/ZGXTV4VGZGR+
         I+yp+mPlJPupUVLNoH2iXZ4v1YBt91R6HM0n7d8K0AKEHGgpBiZcf2bVqlgpYfUCylIK
         w2L1XUfleKlfQCKwJy2UfpzUjL4XdJ3cGviT2umrTAwDk3hinc/HgG7pmCxS5vAcSMx0
         s+cLXQPji8lBBSk0hf5uMZIJSNFyFIx2eMMYtWGob8mQDR2X6n9vW68Sk34G3CfXNnhi
         KURw==
X-Forwarded-Encrypted: i=1; AKwUvBylv33vZqu9RdtC4Tkmgavmk9c+v4EimouQnaZOmtBF1dmEm5S+u7xGgP4xatkyY3mDB/e7RHTxUm5o@vger.kernel.org
X-Gm-Message-State: AFuF++lte0WPhd67QSH97yv7vAxoNoJi8c45E4QgrxDNZ6lqwaupGH30
	KKLoVsF0Pm+hvH/LBiFoG+L60CbMhYcueYRnyqnl6GRj5k1vhT85M/i+JCROfD2r/CRYK/N/Eh1
	nqV7f6NhzI5hZh2yqgyNYn0YkMeR6wwYWeLyRuUUV7yeHA2fiJ19bjlS/O56eSlw6
X-Gm-Gg: AYBFou3ZRaN/rYZCSM21XZU9pqA0LjfuJEpyP/l3mY0UU5EsPo+PT1FdzF5Z9UR4hoI
	2ClJnF88L34HtPdfOcxwYCCHrRfwbufStXyVZTt6OLn2nQgS9RbLtuiLHv692/ZE2QAgOcrVqYO
	X4siKp+Dni9LuzOR5VGjQmU+D7C1ymsgfuEEbfEKVPXgrkjUJ0b8ttmFtj162iWosZAmwR/slTq
	aBu2jSAk8cHfGaqdDz+ypUpT0se/96garEVhsWH3x/UOhntXSmIhBiYC1D852bfslva8oswIdUS
	5CLWS5XIVerauPt1m0XaB3ccLTYaKLIe0Y/BIGK/j4s0EvN4ai8UnDUI6nxNhYmoVZ9xQzVh++Z
	Z0A244xFkpx89nmykqsoifcfLrATtSihEiHfh+UuylvP7KEYVSChp0D/Am9o6FlDvuKHvfCtSE7
	vhZRcLBL7dhXWF
X-Received: by 2002:a05:620a:4622:b0:93e:63fd:40a4 with SMTP id af79cd13be357-93e63fd4833mr596288785a.55.1791183884719;
        Mon, 05 Oct 2026 00:04:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4622:b0:93e:63fd:40a4 with SMTP id af79cd13be357-93e63fd4833mr596284885a.55.1791183884239;
        Mon, 05 Oct 2026 00:04:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c79f7dfsm2905025e87.58.2026.10.05.00.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:04:43 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:04:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3 3/7] pmdomain: qcom: rpmpd: Split SDM632 pm domains
 from MSM8953
Message-ID: <i4zm6zil2qyfdrclkxf6sifgup4phi6dlggspxrd7khlvbqv4e@yxotc3cslqss>
References: <20261002-sdm632-rpmpd-v3-0-95c47d0f26cf@mainlining.org>
 <20261002-sdm632-rpmpd-v3-3-95c47d0f26cf@mainlining.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261002-sdm632-rpmpd-v3-3-95c47d0f26cf@mainlining.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNyBTYWx0ZWRfX3ke0dDOKb+1H
 raO3MfqxetdT0PG2pe8VqBaYDN+iJJopiLA9FQ0Mv849fWIgh0ZKy6dA9ZoJ23BitoiFoLHg9Cw
 sSJp7sdkulegc7ga37Rv2TYsYDuW/lE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNyBTYWx0ZWRfX6yoNe57hFMug
 kHvY81fjukr7ffGqLh+rQ/Ywhu0Teo7qgrmcnSCISKS8I1L+G+5UomLR4AKyubvPZv2+HpAQbkg
 VTRk2wes9GbP0pf4w2D7uY7OTh3/3ufHktuV/sI6f1CfkacDvuG8CyDWsrZ81hJFWHdPLILFvGC
 6bW+ITwjD/POVvJ70fZBFV977GI9QAKB6qomTMdNkDX71jr0tZgivSzVlzopEoP5ifL2KnTQKMT
 QpWxnL8iqlshyD25Am1CUTVRhnXg9JV7by0gZJPjLUuyfY2w07i2IaieexQ1SA6M2KyjiKj4EWh
 8xuukl8cm6ADn5goKhsS0jNRnHZHFRpRjQFuWIn8uD2P/nhL/XvbstjzhJ6t5I2iYYarTHouf0f
 uEIarW9+w4sH+IHWQ07VW3Iu32uOlg7lsx0sq0i6UJ/t34NuC+izi1ZJI20vgMTHzZcd0Ff0cdR
 QbA+9/2DqAYkvup90fw==
X-Proofpoint-GUID: 8t-kCxy55M_u7iWacZy95rLb1NXEkfGH
X-Proofpoint-ORIG-GUID: 8t-kCxy55M_u7iWacZy95rLb1NXEkfGH
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac34c0d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=OuZLqq7tAAAA:8
 a=hzH8MGf3hV44y3egIwkA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050027

On Fri, Oct 02, 2026 at 12:38:31AM +0200, Barnabás Czémán wrote:
> Remove modem related pm domains from MSM8953 rpmpd because MSM8953 MSS
> is using mss-supply as regulator.
> Split SDM632 rpmpd from MSM8953 because SDM632 MSS is using mss-supply
> as pm domain.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  drivers/pmdomain/qcom/rpmpd.c | 29 ++++++++++++++++-------------
>  1 file changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
> index 5f55fc791131..c37a79d6bc43 100644
> --- a/drivers/pmdomain/qcom/rpmpd.c
> +++ b/drivers/pmdomain/qcom/rpmpd.c
> @@ -503,19 +503,8 @@ static struct rpmpd md_s1a_corner_ao = {
>  	.key = KEY_CORNER,
>  };
>  
> -static struct rpmpd md_s1a_lvl_ao;

I'd rather see #define RPMPD_VDDMD_AO unless you have a good reason to
drop it.

>  static struct rpmpd md_s1a_lvl = {
>  	.pd = { .name = "md", },
> -	.peer = &md_s1a_lvl_ao,
> -	.res_type = RPMPD_SMPA,
> -	.res_id = 1,
> -	.key = KEY_LEVEL,
> -};
> -
> -static struct rpmpd md_s1a_lvl_ao = {
> -	.pd = { .name = "md_ao", },
> -	.peer = &md_s1a_lvl,
> -	.active_only = true,
>  	.res_type = RPMPD_SMPA,
>  	.res_id = 1,
>  	.key = KEY_LEVEL,
> @@ -703,8 +692,6 @@ static const struct rpmpd_desc msm8917_desc = {
>  };
>  
>  static struct rpmpd *msm8953_rpmpds[] = {
> -	[MSM8953_VDDMD] =	&md_s1a_lvl,
> -	[MSM8953_VDDMD_AO] =	&md_s1a_lvl_ao,
>  	[MSM8953_VDDCX] =	&cx_s2a_lvl,
>  	[MSM8953_VDDCX_AO] =	&cx_s2a_lvl_ao,
>  	[MSM8953_VDDCX_VFL] =	&cx_s2a_vfl,
> @@ -844,6 +831,21 @@ static const struct rpmpd_desc qm215_desc = {
>  	.max_state = RPM_SMD_LEVEL_TURBO,
>  };
>  
> +static struct rpmpd *sdm632_rpmpds[] = {
> +	[RPMPD_VDDMD] =		&md_s1a_lvl,
> +	[RPMPD_VDDCX] =		&cx_s2a_lvl,
> +	[RPMPD_VDDCX_AO] =	&cx_s2a_lvl_ao,
> +	[RPMPD_VDDCX_VFL] =	&cx_s2a_vfl,
> +	[RPMPD_VDDMX] =		&mx_s7a_lvl,
> +	[RPMPD_VDDMX_AO] =	&mx_s7a_lvl_ao,
> +};
> +
> +static const struct rpmpd_desc sdm632_desc = {
> +	.rpmpds = sdm632_rpmpds,
> +	.num_pds = ARRAY_SIZE(sdm632_rpmpds),
> +	.max_state = RPM_SMD_LEVEL_TURBO,
> +};
> +
>  static struct rpmpd *sdm660_rpmpds[] = {
>  	[RPMPD_VDDCX] =		&cx_rwcx0_lvl,
>  	[RPMPD_VDDCX_AO] =	&cx_rwcx0_lvl_ao,
> @@ -954,6 +956,7 @@ static const struct of_device_id rpmpd_match_table[] = {
>  	{ .compatible = "qcom,qcm2290-rpmpd", .data = &qcm2290_desc },
>  	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
>  	{ .compatible = "qcom,qm215-rpmpd", .data = &qm215_desc },
> +	{ .compatible = "qcom,sdm632-rpmpd", .data = &sdm632_desc },
>  	{ .compatible = "qcom,sdm660-rpmpd", .data = &sdm660_desc },
>  	{ .compatible = "qcom,shikra-rpmpd", .data = &shikra_desc },
>  	{ .compatible = "qcom,sm6115-rpmpd", .data = &sm6115_desc },
> 
> -- 
> 2.56.0
> 

-- 
With best wishes
Dmitry
