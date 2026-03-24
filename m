Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AB32459ED
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 21:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774387405; cv=none; b=kerFIuTs5pG2hHY6kDqsD0gbHgRqKSM4uM+jrGBigNBRqsgAsdTYsU3V2ZiEUusSE8H7z/PFScC94AQuUkfDDAEsGUT0vz8ghAq75kFMpWxaq89va1tBBYqI2amK7auUTt4t9aVHCIRvDG4oYx3kOPe4HLGV5vHNtTt49l84QKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774387405; c=relaxed/simple;
	bh=UwUHERYtmXxJl0X66fQxCxhaSYJYyWT7RIeWnnfY58A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/gPjwOBYlW6uFgn0xfPOP2GyW4MyVEvbqU+XUnMZFDsZJAq3Iq7uHBX2nXrkmpcS2k48wiuS8O3OoFkVi5lGxsTFAc62O6q5XIuzq4JxAxVyiA6D1B++AkMGpiWsWuQZVs71XTroBUbffuEDG8kDpVNAxdctgM1HqQjGRfLhdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=an8mFH8L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QAIHrQkr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="an8mFH8L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QAIHrQkr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJObR31862776
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 21:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1uYUkNycc1pWaJFwxUlYF9h0
	XG3GMiPmjoHxa/L+c4s=; b=an8mFH8L6MaAq8RbRnDt9nxEsrCNEaceKSMGPHkh
	1apxYF+3QwB9xV21Qjc82W8SjzcueranvaqlCxebVPo1qgeAlV+mu2xkNViVTWMk
	9JcSqfqiUVd4fFeokslVy0HA0mIaezOrVUYZl6F4Mdz+4P90WlRYMHH6sFza4Bhz
	ItHCBxjnJUC+aBqxHBEvunOeRpKdOR0Wq7ICaJQM6RFF07v04MlnmAFnZXUfnwiy
	LACJhyWqHu8dEnhzjh/AFS5yXn+tjuUZwMOSXjzOXeWH1ZOlzCyx11+k5FTqEY9i
	Zd2Lj6q40KAwyBtN++hNvn4lTjll/0SASiS5j/kVo6f79w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40raraah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 21:23:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5094ba09affso105436621cf.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 14:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774387402; x=1774992202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1uYUkNycc1pWaJFwxUlYF9h0XG3GMiPmjoHxa/L+c4s=;
        b=QAIHrQkraKwIiesUi4mpGZbaBbzrouPAO30qAGZVEMTEDEIod4GV6AIReWn+2QQERX
         RdLPUmpHNH+eC8ImE9Cgki6MNUbVJEmQeREWB5KKJd69PL/I6CYiIO4f90WMy1RCQC1a
         2zceDqLdiqWd6hFMBDwUk4/R9r+Dq7mPRaMCO6yn6WDgG63L0yByjKhFaMixiSwTVI15
         sqREmyng/Si5iKq5cmtgOz4pp/xor3tykH5ZfW54VjwbaO6M27yRHEEPElzSLCeeT34r
         T0Ejb2BOm+WpAuSzrQVXKOWf6bw2O5+f2jN/AyjpFDiVOz11HY+Db3yvko+nZMcAhCiG
         QkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774387402; x=1774992202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uYUkNycc1pWaJFwxUlYF9h0XG3GMiPmjoHxa/L+c4s=;
        b=RT0G84l1NShkxQV+CegFDboFcYm6nvfGQDrCotvEERQm1DUJs/EHMoLjVoyolZWN5w
         7ED/PM12A/mXmNtZ+QaYpOiwLSJXuzy1Vbii6GDVT15b7R7CpV79bXWSkkMvZoikurso
         NNdgefu16PEnkT14N059iMU/8CFsU5kaWCk5QL0WoWYEtOc2INBxmI2hadq6aEtZ8szs
         AM4TOfDh7Sw714zpr4KolkSgm/7HIdJoYnmAcUhl8D2PNje5mIXyn818ml++jgzaJm4p
         SzO6WBpfjExtWuoFnFmb325sLKhDvH+zc36ZUDLk0ob1vfvey+RJcus/3PC1vpCuqsYJ
         GBhg==
X-Forwarded-Encrypted: i=1; AJvYcCUjjhh0gTl4cuA4gJ8JxEeZTj0B8EML24COQVCwjrerVFx2ImhGRsSgAUO80dI/IITciVVI739TMZYB@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy/oG2ttjRkdpQghgUCINKPsjqU1+YoCUwfTQL1mfk0p3Zocqq
	KnglSFX2WJ7ZGg+Emrs57jFx7QTZc2tOfrVeQO7+rcYbRidaYo9R+0I4vGx1b1n2ggfZwkWtGHE
	67lveCcgZhAaZIToaj46hY7VYyTkuNWJY13++6tPBVFFXdVaVAF5hqMYYotKbeN2b
X-Gm-Gg: ATEYQzzDDASaDhCqKNd/S+UzY1eRuXH/sUqSritoR9g3NjFcNmp5ELn91P8c+OZHmKv
	Nx3YNihwW9oHsA3IBIH++sYhQQL6IuG8bi4UmU/MbE7gfqLUpzZv97PrZAXO9wtEhmgXcUzvJlc
	funwrjx7F+yzs+ML3Zyrbo8QqoSj9zNXUY+LlhO+gynXiKjPRqpmQiUREIIM3ZZ10F4pDkHWT90
	Iz3/2+cp198RAh99fHg9ZTtjZg57QIBE4OXL4YTnkrhRDWSWa4eKzHtEv7UzZtToXatTDzR+hCL
	ppj45q+5nmOQ+lRcOfRnx70/Y+N0/4nGjogZpnwPKQ+50Yzw5XcFBb2oEK4JCodhd1q+73s6I7y
	T/OU3WrwnylXAzOXjQc8HY+ZpyHm5v1uCkbDDyPWq1CUDNvNjPnCKI8HU3pPdKoV1nbAejYNLTS
	QYse2YcRltBCO2YFf/2rEjI1AsrQC+6o3rMEs=
X-Received: by 2002:a05:622a:19a9:b0:509:50d:b9c8 with SMTP id d75a77b69052e-50b80cd0762mr19250571cf.1.1774387402294;
        Tue, 24 Mar 2026 14:23:22 -0700 (PDT)
X-Received: by 2002:a05:622a:19a9:b0:509:50d:b9c8 with SMTP id d75a77b69052e-50b80cd0762mr19250201cf.1.1774387401816;
        Tue, 24 Mar 2026 14:23:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9ae8570sm32654221fa.42.2026.03.24.14.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:23:20 -0700 (PDT)
Date: Tue, 24 Mar 2026 23:23:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] phy: qcom: qmp-pcie: Add Gen5 8-lanes mode for
 Glymur
Message-ID: <x3ts7to7c4qnorloahe7cgup3uekn4wolmmorqa3b3bjfslqfn@eijnzdp2ops3>
References: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
 <20260323-glymur_gen5x8_phy_0323-v2-4-ce0fc07f0e52@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-glymur_gen5x8_phy_0323-v2-4-ce0fc07f0e52@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Jvr8bc4C c=1 sm=1 tr=0 ts=69c300ca cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=8302d4AOEtq-Q5Zcfl0A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: iQuq4MK888EqRjfnpL0JFHejuJSFcSjR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2NSBTYWx0ZWRfX9wBfCr8g/899
 nZuSdQWjURrqHB8YyaDKATlxYX5s7ZzGp6S48quaA/Dxfde1m+okly4Ah/RmMS1VJtyCsxUI8st
 CzyUp1+1Pp8YEPxyR3l9r3KTw1GzrMrgMh8lB36ueYJy0Ow1rjn1zisNsd7z5xeeVGv63sRW1x0
 742TGn6fUFeE0mAJZ7jN9ImTPrFh//0xA5Ah3GduHHZqoPJIbirlPbzgykG5YGyNN80I4i3Ccqo
 ExAnbPadYlKWrQbw/no9gq2LdVSILrzG7aqKHzK0TJTcMWTxvWRh3jPFUcCdxXb4p7Sr6J/emUB
 sl0Mcoct24bXG4ATd5KqKFdd2zTAoPWY/QZ1SSmr3ykEit+8VNt1+7dVuDv3Dnj4uG0Y2uGImx1
 arpi6s/eoF1sx9t8NloRopXkUIqfa124KeTs9mLEV9pUOclZp+ayqilYKPHT8PEuMUicXGH39nZ
 BrcQRQKAfifY9Di/cCQ==
X-Proofpoint-GUID: iQuq4MK888EqRjfnpL0JFHejuJSFcSjR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240165

On Mon, Mar 23, 2026 at 12:15:31AM -0700, Qiang Yu wrote:
> The third PCIe controller on Glymur SoC supports 8-lane operation via
> bifurcation of two PHYs (each requires separate power domian, resets and
> aux clk).
> 
> Add dedicated reset/no_csr reset list ("phy_b", "phy_b_nocsr") and
> clock ("phy_b_aux") required for 8-lane operation. Introduce new
> glymur_qmp_gen5x8_pciephy_cfg configuration to enable PCIe Gen5 x8 mode.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> @@ -4705,6 +4713,23 @@ static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
>  	.phy_status		= PHYSTATUS_4_20,
>  };
>  
> +static const struct qmp_phy_cfg glymur_qmp_gen5x8_pciephy_cfg = {
> +	.lanes = 8,
> +
> +	.offsets		= &qmp_pcie_offsets_v8_50,
> +
> +	.reset_list		= glymur_pciephy_reset_l,
> +	.num_resets		= ARRAY_SIZE(glymur_pciephy_reset_l),
> +	.nocsr_reset_list	= glymur_pciephy_nocsr_reset_l,
> +	.num_nocsr_resets	= ARRAY_SIZE(glymur_pciephy_nocsr_reset_l),

Just for my understanding. If it was not the NOCSR case and had to
program the registers, would we have needed to program anything in the
PCIe3B space?

> +	.vreg_list		= qmp_phy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +
> +	.regs			= pciephy_v8_50_regs_layout,
> +
> +	.phy_status		= PHYSTATUS_4_20,
> +};
> +
>  static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
>  {
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
> @@ -5483,6 +5508,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
>  	}, {
>  		.compatible = "qcom,glymur-qmp-gen5x4-pcie-phy",
>  		.data = &glymur_qmp_gen5x4_pciephy_cfg,
> +	}, {
> +		.compatible = "qcom,glymur-qmp-gen5x8-pcie-phy",
> +		.data = &glymur_qmp_gen5x8_pciephy_cfg,
>  	}, {
>  		.compatible = "qcom,ipq6018-qmp-pcie-phy",
>  		.data = &ipq6018_pciephy_cfg,
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
