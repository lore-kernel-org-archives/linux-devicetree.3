Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CE8279334
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 21:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775252826; cv=none; b=ajTTXETJ9jCAPoF53G1hKgASmHTkiY4l5yHKXWd18TtvDNfWgAiVlK+FyTaJwWTFE2PTZ2JdkS0wPSdvkrib613SO/jRSmeffrlgnjWwTkVAXBd8TvY0WRGvKsRal5DmFp25Lrk7uGpaNrgJJdHT3F6KouV52k+q+cfz1OAncUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775252826; c=relaxed/simple;
	bh=I5ist+EvO2mxP0rGH61vvoYKEdW2l3eY87onfBP+vsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OblnlQSKUlzaBH8E0gK3jDdGY0q84sNjzpNjQGyg5sPg4Phqwb8eJey03jgTBdHLo0K/AcZi+wRYBo0N2l1RXBt2UPOA6JVtSakxlRisdqSBMw/1raK3VrksI2Y+2boHwayvpAMmnxkuxz9io3KcETywuEWLTqttJ59Xjlh9vjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IW5W80Mg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PvAfl5CO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IW5W80Mg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PvAfl5CO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633KvI7K1455852
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 21:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oRO36lu8/Mjs8ncmcB1jMrb0
	3PSx4SM4zMiBDXsvdj4=; b=IW5W80Mgcmews0sCJM32E2lQahlihqrIBGR2s+Yc
	jChNL/iiB9zg9y9qf/70PKUCQc3xcY18V0RTy2YdOoG1PhaT1/eKmMSOa6HhUnlK
	1BS0eL2tkrgm8MC6tBQs668o56VHuVHXYmEKUN9KsCq2cJwZdFI6xXvBn6vVQ1cW
	BHV/tzyFeIE0HAHDBhbbXzgR05hL7Y0N1MxJoWtLpC7Mulw3BXtxbJ7wgDp+SYZp
	Uzk3rAyCoUMIQ6zKU2Fkej6AkvbAL1/UWk8BoRrNYr5ysPSjNiIWIJEl+qcGOLn2
	e+4OIpsXL+SwFmHw/WYe3N4kqhNuC/NdT0tHiQGTibX0ng==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dacam9nd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 21:47:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4b81c632so42391671cf.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 14:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775252822; x=1775857622; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oRO36lu8/Mjs8ncmcB1jMrb03PSx4SM4zMiBDXsvdj4=;
        b=PvAfl5COi0WbrykjXFxMo+suchfzO6ryGsurK/pNXbXZeljmOa1Jghh4ypDN+ovkKx
         q+uCsCCkY6j5XdrL9BI5Jv+oxt/xOF59V3GkgSbGRQc4U9hpHWC+/5VHRaRqh6k7suWE
         UFQgEaZGMmT7rTrIHiL1ervcyv8mVnnMzTElWmGEPr4aCf86ZCVfM2cE1M2iFDr3VDko
         g55vXO/h3aGxx/J94iiM7/twWcNNGmrd+2/CEp60csfwbtoXYmXzoOKY+SllubGAOgNb
         wCNNEBhgFz0cZspmi65JWN1IzErYPzumtnwjjHeSRitM/thkpw8RSDSI60c2vdRhUIFF
         SioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775252822; x=1775857622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRO36lu8/Mjs8ncmcB1jMrb03PSx4SM4zMiBDXsvdj4=;
        b=mumYPmBW9RdrUdlwXfWMzJf9EVBO++GPfs6zGF2UNKW+bM6L0dsaLtimwlyXsaFnR9
         T8y8MupSTYx8g1KMrX6qlHUe9JoJaBo5ebkzUjDrlyz7vUroW5qgzqEa2dqecTwNgFpp
         muqLjZLURfvmLi4HO6jkv7CngKiVXlfsS6spaUygHef5iY+v1hhU7B7ZsQ6krM1uDqgJ
         eUCAplBqszqqXIfyRn47TLZr22BoUyqEBQ30g66g5khPzyxZfEKmUxBUhBlDwvrTExXY
         PtUKFANab4VReXoUNXFZQi3+oHrb9qcjGOuI/YzWtGiLjGTkNq2k7YC/d5ZNU8AhwEQ7
         ErNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwnjY+5fc8vUTOc40lDMdvOvXczPlOR0rHsWGaRLPwkBMGM8sMWbo/RB30b4SwKfEpW39ZiiH+aLDo@vger.kernel.org
X-Gm-Message-State: AOJu0YzaPf7y+fAvVqmlWMjbp7Cux27SMr8H7rZxAQzqMAax3E913iJN
	Kg2JA+my9nruKd8j+LcV2nsuUYjJFlzEg9ybfrDfottLPPPVbL0yxBQkBmv0mP9EXRufpLZLD3/
	KXenGP+aAK4Hp3jXOLtoMZKMkYYB/L/5keHqCKAW47bel3dQpSxwb+DEJUJ2KO4z6
X-Gm-Gg: ATEYQzz4Djv9TlzvOjcqzqOnxpfQf6mNYlqMFHknUZRFYnBqZwfde39FexLzzfHRnoJ
	sI0rkBWvS3yiDGHeufUqsJARO7tf6SPC73MLKyueDfmFs0OjDwUU+bJQ+UUR0q5KKGL1eQzDR9P
	lLYRfMJ1Q4bkIZx2EHRNYXaUVCacpR/e0WMPOixjBO+ZKCs4gcLTNcosfTp6cw1l4AmKTAC0xe/
	Dz4GTuFhPd/abgrpBc7Wakx/24K2FIDX/CTSjeWD+FKAup/E+vP0GI9szwAo6czxDWSI62/a3oc
	QkheTWDjy9B0ZnlvTxrOEN5BZV/F2K6ym5oQaYYuRpoIyZH6tZaK6j0cUImZDnzC5ThP7v+ntoq
	eYBz+ITW5Fl+o+M+uQDR7rPwuWXg4AgULIIDhKi/Q0KeHon4rpHsMzZAr/8hK7yxYKUacyP09Oy
	YEgiKmOGt3a94SeusADO2zV/HpN2659nEy6QU=
X-Received: by 2002:a05:622a:6695:b0:50b:2763:2bc7 with SMTP id d75a77b69052e-50d62a8f465mr45207541cf.31.1775252822592;
        Fri, 03 Apr 2026 14:47:02 -0700 (PDT)
X-Received: by 2002:a05:622a:6695:b0:50b:2763:2bc7 with SMTP id d75a77b69052e-50d62a8f465mr45207241cf.31.1775252822119;
        Fri, 03 Apr 2026 14:47:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cccbecsm1672808e87.62.2026.04.03.14.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:46:59 -0700 (PDT)
Date: Sat, 4 Apr 2026 00:46:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH 6/7] clk: qcom: gcc: Add multiple global clock controller
 driver for Nord SoC
Message-ID: <qnlojbjjo3agzoscf5edwglxe2oto3gnnaj7c24itd7dn664pn@uryse2ulsvsz>
References: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
 <20260403-nord-clks-v1-6-018af14979fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-nord-clks-v1-6-018af14979fd@oss.qualcomm.com>
X-Proofpoint-GUID: J0p70RBCKg3sgjusBFODdNfxhNEBikG3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE5NSBTYWx0ZWRfX/y1ZHtdSMz7J
 omzrhLOTfMVlNne4X26G5ESoWL4qbEmAk+FDqZ6dHHUt5Euxp47Fd6+8Gtp9fyh0OlOivMzNnkT
 eyWpBASObQBckBRuCmxLYj5Wfm6pQruky3+J+uM3PyGF8qRyjdJeeyo2rTarVgAnciKKv44EnKb
 a0jrxNsu7r8GLwa0ktfKslflBrmkXXHWUJuoRRM9D93DThOcgdFLl7P2kFWDmFtzhN9o7cwd5kG
 g8nNdDoCLgHm3q/amjLJDxevn1TC4wSkpSJ6myrh0GJWjfsmsA9jKW5gb8Jg0INuxNKOeqOVajK
 kp9v2JhhBFR/Pf0JtLD4gfJfRqQxNC5yX9wvimw/4JQ+7nIWdGfaoNYt4n7QX1FUZnXU4k1l6rR
 hhSiblqyU6CouojgDyrNxAty049z2KjDli3HMY5cD6xMNCA4fbMyKBSxDxUHiVqH1JK90jvx4R5
 3K1+J1lG5vs5I9ZHL5g==
X-Proofpoint-ORIG-GUID: J0p70RBCKg3sgjusBFODdNfxhNEBikG3
X-Authority-Analysis: v=2.4 cv=ULXQ3Sfy c=1 sm=1 tr=0 ts=69d03557 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=UazbwbvKEZ1Oz8zh9_IA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030195

On Fri, Apr 03, 2026 at 04:10:54PM +0200, Bartosz Golaszewski wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> The global clock controller on the Nord SoC is partitioned into
> GCC, SE_GCC, NE_GCC, and NW_GCC. Introduce driver support for each
> of these controllers.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> [Shawn: Drop include of <linux/of.h> as the driver doesn't use any OF APIs]
> Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig      |   10 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-nord.c   | 1901 +++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/negcc-nord.c | 1987 +++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/nwgcc-nord.c |  688 ++++++++++++++
>  drivers/clk/qcom/segcc-nord.c | 1609 +++++++++++++++++++++++++++++++++
>  6 files changed, 6196 insertions(+)
> 
> +
> +static const struct qcom_cc_desc se_gcc_nord_desc = {
> +	.config = &se_gcc_nord_regmap_config,
> +	.clks = se_gcc_nord_clocks,
> +	.num_clks = ARRAY_SIZE(se_gcc_nord_clocks),
> +	.resets = se_gcc_nord_resets,
> +	.num_resets = ARRAY_SIZE(se_gcc_nord_resets),
> +	.gdscs = se_gcc_nord_gdscs,
> +	.num_gdscs = ARRAY_SIZE(se_gcc_nord_gdscs),
> +	.driver_data = &se_gcc_nord_driver_data,

use_rpm = true?

(here and in other drivers)

> +};
> +
> +static const struct of_device_id se_gcc_nord_match_table[] = {
> +	{ .compatible = "qcom,nord-segcc" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, se_gcc_nord_match_table);
> +
> +static int se_gcc_nord_probe(struct platform_device *pdev)
> +{
> +	return qcom_cc_probe(pdev, &se_gcc_nord_desc);
> +}
> +
> +static struct platform_driver se_gcc_nord_driver = {
> +	.probe = se_gcc_nord_probe,
> +	.driver = {
> +		.name = "segcc-nord",
> +		.of_match_table = se_gcc_nord_match_table,
> +	},
> +};
> +
> +module_platform_driver(se_gcc_nord_driver);
> +
> +MODULE_DESCRIPTION("QTI SEGCC NORD Driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry
