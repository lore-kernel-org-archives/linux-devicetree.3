Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B862029B79B
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492680; cv=none; b=QXMHob18nBT0njskCpzwHpn0m64EEHRy/Ydc6fwG6wt8n7Y64Nrh4jfDhyaR17IkOUsCU1VsdWZBR/c7yBlPnYloeakVEFKkaO3ALiQpYXUG6waQCjV9pFgoVVuWV+Guo+lGFcBFireIGRsSYj6WIkCs5GpQDzVY289npDpkp+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492680; c=relaxed/simple;
	bh=XvtldXilXkY/PAyqaT9gfS+5Z6NSt+lIR0mWqy4PwBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQojg62ff327dXa7yGW8wlQMmTyGCXYKXL+2CRZmWLPbGRoJ5fHd0uaf8HCny912s/H8ElcjEuEcgOb2q8M6w+pX9dZTkys49z23+wMz1PNTO3OK0tNarL+BYgCT4UMhwdwdYEa2IvfKlpzSxnhUKGZ7ge8cvVkLobdF+cieg8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zv/jD7eh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MHpEuBDA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zv/jD7eh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MHpEuBDA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CQsNo2076787
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 13:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=csBmCVVylLxai6dnI43bsxJ9
	942nZz/wU4Ao2SyUnqo=; b=Zv/jD7ehjMOQeMS++ZxuuHFJeMs7AJCN5OiS7DT3
	e9htJKue7owJa2ft0KQD9fhM5CzCjYQoqbbh07uLwYa711JhUIXGkUJ9/VOFtWty
	+O5kgF0gssl/Xei60U0664epmcBHXQIWpJZA35NYJBKbUHmG5Ocv/hTuQ0skkCsA
	yAXpRAlGm2UdlXoZZlfGq8ImP2c6SFEPRNSBKh6dZNFKQiQlGQEuxRQ16jrufFhW
	GL8Ub4BzZlevCNyOIVZNDLD+9b18q130Wl+WWu4dLny5CCguUb9E1ccaSogYK9vw
	mqBUmhcuakH4WcTNjQcnQVVzg3+gifeXDGU/WFLlKLIflA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejev19pcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 13:17:57 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6751db2792dso5214577137.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 06:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780492677; x=1781097477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=csBmCVVylLxai6dnI43bsxJ9942nZz/wU4Ao2SyUnqo=;
        b=MHpEuBDA6QYyECtLhOhunlTJcEFCE33NyuEyZy0DtjnduPMOXkum+ontWTl/dXH4dN
         BvKaBdZavdjEYzdq2Kh3z0dhSZgYALqrAfqMgkkoHZakyvyaTCbRxYd9SMGqBd4pbsjN
         69iJal6Sm5xiqBtDw7ybtyjAQpoF8MJQI2mKgWeHBSSSxEzJvj+yU/Cvd+5W7xwXX77z
         gKIITR3+Vt73pqdahkA4Ej/hIF6vNdCbWtBhCCYUTH96R0pEZnIJDSm40eb38INKlp/2
         oF0elwJ0xVzHVninb8qeKfJexuFBQjpTBDEWFAA8Y0xEquCEIzXBArDIzn2u/uZQ41ar
         c+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492677; x=1781097477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csBmCVVylLxai6dnI43bsxJ9942nZz/wU4Ao2SyUnqo=;
        b=eZXJFVD6hJRG7UQUoWInH7N7s/3svs/tO7yL5k0Na2lnVB3RNtb5vBIDPleILesuAK
         F4vwT1J4HAFX8QSIXqy04t44DZyAlD2h1zvaNlHUopCfe0bhYVBazbpy8/Mwe3TzKpP8
         d2xrcucWDuqQh/VxhU92ADSX4jtMx1aKqr6xdS8K4DQNy6CEqgX+GMpyw4fSik6dvDRA
         cW2utyhC0VaVbipjKyERfAYR8oSkzmm23tiyDiwxcLQJp39PB1+CQJ/Gu5kISL13NS8j
         4PhTDMB9iuMYknjiIB+s17J3LbRAYSeePwfzBw1juiwGly7isHeTxbNft7opUtsjjBv/
         R78Q==
X-Forwarded-Encrypted: i=1; AFNElJ/fEZERz1uyCQSqA17MYSq0MDAu9qojtLIbPpy6yQsMFuImkvkeP6e8VK5+GjKCPD7ooInUKtNLRxSC@vger.kernel.org
X-Gm-Message-State: AOJu0Yznp/mr9acQ2k6OqVheVMJCZ65vDI+elSOxP5IueXIHZbGgmuuY
	a3KXBV7JpDVC7wNrD3vI8QxQmwn43iY+umveBO/cUB8l650H7xWSnIF8FzjIDnzT9ci3mDXiPaT
	IDMqacBVf4p6/5taAk69vqBWGYYqYi20pmEePdAX1tUisKUNV+7nE3RQyOEX1+5d7BttntrL1UR
	g=
X-Gm-Gg: Acq92OG8Fqc5HK3kyd1hplOJkymUMOf2WMif7+L7Np4sghnv28n2n1/rC/rkdEfLBa+
	F8uiOrVrXBWR751M3t5U0+Wt1krHzv21T2Klqt3lSdKbEvDEwbxnwjyNri1wp/ajmywe68D+wsQ
	83lzEUxfUm/oiViCkZ9rGg9Cj9fUcaoIeufjwalg+Dc5gajHzbrRccAzImVcVoWpP0TKmuwsZfM
	zz9FI7Zcqmh089D/bRnfoxhhzBRUfRfZD+OWlYDt8kA81juNiYLIJccQnECZGESxTvtq44Vv1B3
	UKoNZ6vZhoBlEUbd4DL50kws+ScVcXJSO1swkrTHvt5uTkfGJzTE4Yy+RNVpeWwK5YSg4GfLH4l
	IcJqpkagsq0cGgzJb/vjCNDHsKMILt4sI7Iboy5brKxH0nY0oMlXvxbRw0V89J+DHWfYPReVtwQ
	j8XMYR1mN0dexKW/NoxLJJ3A7S42+ACqosvtgDvJlyYrgJbg==
X-Received: by 2002:a05:6102:5091:b0:6c5:d55d:c095 with SMTP id ada2fe7eead31-6ec4aac406fmr1221641137.26.1780492677064;
        Wed, 03 Jun 2026 06:17:57 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:6c5:d55d:c095 with SMTP id ada2fe7eead31-6ec4aac406fmr1221577137.26.1780492676569;
        Wed, 03 Jun 2026 06:17:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2e9a9esm8876651fa.36.2026.06.03.06.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:17:55 -0700 (PDT)
Date: Wed, 3 Jun 2026 16:17:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] regulator: qcom-refgen: add support for the IPQ9650
 SoC
Message-ID: <ci2ur4vurrljhvkza7nqfq6hsjpj7aurb3r3lvjkebfwkcae35@kvnjmosamfzs>
References: <20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com>
 <20260602-ipq9650_refgen-v1-2-55e2afa5ff64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-ipq9650_refgen-v1-2-55e2afa5ff64@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: fawxqMCaml5keyMgg6aWyrP84m4JlIML
X-Authority-Analysis: v=2.4 cv=PNE/P/qC c=1 sm=1 tr=0 ts=6a202985 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=gpHlVAh8_vVDBl5ta1AA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: fawxqMCaml5keyMgg6aWyrP84m4JlIML
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEyNyBTYWx0ZWRfX6ariR1Ttz0zf
 imBeJNWXGkBcq/i+IaN7oAQgl99jzdj95+g9elebwH96g7gkwMld1ZSifdnRndMTjWWB4csmE6w
 kFPid3rCOcFDXKiKqUenv2dGeWw7A0fhVOH5BM1CSGpBsKjqbWILWm18VnLYNUjc0WSQh3smjCC
 8XTf9phMFf+i03/JoQ28UWtMoJFAZrR/sTPvfJE7mHWrbMaZ6vpXTdnQ8TqTbIW3P7u+ijyOQ9V
 tE3OXpy+7GthDmbj7ob8Y3F5a0inwwGpZPmpBkAZSXrFNwH46PzywMCTklkIav46KMLE2w7IbNH
 126b9RADzmJEvcRO556s3WwAgmeU6eVb9Vc7zx8T6oPsRl1ILHayGauojBPFwksFr3oL2bd4aoD
 4yJMCqL/tfaQICYlCzwbu4lqopvg74U8mGK66yQkp/RcKWJ0bI0dssblnFhPF5kmNaxsDYS5Y0+
 PAUi+jTibuUC7XDrp8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030127

On Tue, Jun 02, 2026 at 02:52:00PM +0530, Kathiravan Thirumoorthy wrote:
> IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
> PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block is
> enabled on power up but that's not the case for IPQ9650 and we have to
> enable those clocks explicitly to bring up the PHYs properly.
> 
> As per the design team, REFGEN block provides the reference current.
> Hence marked the regulator type as REGULATOR_CURRENT.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom-refgen-regulator.c | 94 +++++++++++++++++++++++++++++--
>  1 file changed, 90 insertions(+), 4 deletions(-)
> 
> @@ -62,6 +75,49 @@ static int qcom_sdm845_refgen_is_enabled(struct regulator_dev *rdev)
>  	return 1;
>  }
>  
> +static int qcom_ipq9650_refgen_enable(struct regulator_dev *rdev)
> +{
> +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
> +	if (ret)
> +		return ret;
> +
> +	drvdata->enable_count++;

I think, a regulator enable() is called only once. Is there a point in
having enable_count as int?

> +
> +	return 0;
> +}
> +
> +static int qcom_ipq9650_refgen_disable(struct regulator_dev *rdev)
> +{
> +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
> +
> +	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
> +	drvdata->enable_count--;
> +
> +	return 0;
> +}
> +
> +static int qcom_ipq9650_refgen_is_enabled(struct regulator_dev *rdev)
> +{
> +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
> +
> +	return drvdata->enable_count > 0;
> +}

Linux knows if it had enabled the regulator. I think the usual case for
the is_enabled is to be able to read the hardware state. What is the
point of having this callback?

> +
> +static const struct regulator_desc ipq9650_refgen_desc = {
> +	.enable_time = 5,
> +	.name = "refgen",
> +	.owner = THIS_MODULE,
> +	.type = REGULATOR_CURRENT,
> +	.ops = &(const struct regulator_ops) {
> +		.enable		= qcom_ipq9650_refgen_enable,
> +		.disable	= qcom_ipq9650_refgen_disable,
> +		.is_enabled	= qcom_ipq9650_refgen_is_enabled,
> +	},
> +};
> +
>  static const struct regulator_desc sdm845_refgen_desc = {
>  	.enable_time = 5,
>  	.name = "refgen",

-- 
With best wishes
Dmitry
