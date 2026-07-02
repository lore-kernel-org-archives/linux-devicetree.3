Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95BD4ADD8B
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 13:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783000131; cv=none; b=WNbAs1w7dxhCaR2ad6dgbu5EaqU48IgrYbsNPkH4SrSCBXe4vDvb5Q5LV+W+eYnYMjP9KY9378cR/cpuasOXViWz6OBKTJ3+Fm/cHe7OISBaxa1XPT0VTZCzk0dohdU8jQRMlGAj+6At6n/94kt4uFERLRKHn25tgmWwq69Mjxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783000131; c=relaxed/simple;
	bh=rx0BFg8T6vGGv8JYvumdBHdMHun5TpbMOGAZgOFbMJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxAWTI6mIPJLyM6BPGO4bL3yHSpnhDm5VCs0GqrMM1MX3AAWX21bnE1HUrLMdvK2Pue7dxbjpTrsCvq6vtAPLWer1gC6JRWDETdNdtYDbyRJLZ6AzMeBQf+K+9xOmtCJFvxskQOJRm+UOYXp4uUn4j97wYJ5VpgLjdihZVNM3v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CjPEAwd/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1R1TNoq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CjPEAwd/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1R1TNoq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662D0bS4519002
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 13:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oYxkn5iUZTM90ui/LZrkij2X
	FVtbxLa8KyTrnYbeUCY=; b=CjPEAwd/YuWtofeh4ewgQBJlmCv0hPOJmA4Ru2Uy
	XYHm6aXPqq5t1a7LeRA0t+f39L4wcJu01qiZSKVpb1dfvPFDT27L8LX8B1XSmk/k
	NNr1lg15Tw24sLFgSVn/P0hHp2SqZXeTqf4mrGAnAkgPN9xpGIeijqEF994yNDSz
	aVeDmLNQ/arYoJOlASGR0bYoYMhMTaOQkwdcB6fSKegTa8/S6FWsKqSzDdzkXzmR
	EQidzpB/RojVvUVD59xjhkaGyjpQIoI3bXFs9xfbJqj88/FLpFFGZmWqGvqF5xlj
	4zUdVskC7UeL/5RwlVBkI3BD4CciPJjeXc5ZIDGpWOkYZg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnp8edk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 13:48:48 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bd79bf6152so1626478e0c.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 06:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783000128; x=1783604928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oYxkn5iUZTM90ui/LZrkij2XFVtbxLa8KyTrnYbeUCY=;
        b=E1R1TNoqoiT030aGSvUWwPByPQYn1cItZIOfOW+sRx7pKIYyOL4TrVA0S67OzvP53A
         yx9rjU+1ywMHlyUxatbuJDlL0VPn9YHoByVVsiy9wImrbVtAmNzFRhSsgz7ZwZOIVgC/
         trlN7OlrIWLyBwTO/xH1QvujkfPbmLxYxUYz8oveBJRUf+OGDxZUOL1v3IKhK1oAg7jU
         Gnfb0iZCIiuwxztqLZVu4l6tZOZyQF9q0JiTa0GnRg7sRsny7jfALKyRmtRTosA2wvD/
         0iNWydYBiTHOz6ixzWnrg3/VO+itv8+nht3OYTBPp9eL33jE9eHkQGquAA3tTEL2+Cmf
         gBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783000128; x=1783604928;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oYxkn5iUZTM90ui/LZrkij2XFVtbxLa8KyTrnYbeUCY=;
        b=iv90V7vAc5NtX2zIXPWJLdVi5nyd5rP8JOv7SKNX3obALfDUkNt/VjEFisBzI1UBqK
         qOjQ7GYtsiEqjud99QW4xyyLe+VY5/zks1AKTDc0FTNgy3AxBXSXaJY/Kw6dPwhlgleO
         jbqEdoOO+ZIpnGUrjobT1HI7CqpTfjQnJ/pVD9AYG15EFt+HrPYOCpFDaC8uQkKiharA
         g7JjaqajsVmsF+YT0cL20IlvIEku393JH9Afn6z8mr8uuiZZNedcFFG/cVhRuCdPQww1
         zjyhV4vR4KUU793rY/0zaFKm5CA048Xsd9lJ/faBYU56py08npWvZEk0SV1LbDgWVsyJ
         NL1g==
X-Forwarded-Encrypted: i=1; AHgh+Roq0Vr8HDEokEYjD/QmAP3uGTARRCVo/vAxkyxvXQYEhQVpG2LsLNwuA5MhSQgcOQlNT0wtc54a6YR5@vger.kernel.org
X-Gm-Message-State: AOJu0YxB+5XVoJ5N/+oLHgfDJYndF/OtZ0TXnJPZSacJsHDoz0uQ5foj
	oZ+ylEKkIvl/GZE1YEp1gdyFU0ezYkoJfStdQTPN3r5mM5qiWJY7Pomhu8aMEB+JNBxVnKJupev
	i3Q2ejoIZWlJ/96k8upLEQN0OKXDdkYaVDBX9YdStzPJF5jveNre/QDY0Rtwopwrp
X-Gm-Gg: AfdE7ckkdRxl0rRH+R5k7dVfdHej07Ft2BlqUwDS/7oYDhYZj7hu2SLjeYOicFSdUkE
	ahTDMLPscZNpADw7t+6icEdFDNjWrh0RcxkyxNCmQ82IvAliDtC05FxZ6OHjwUYArRNbDe/Ku79
	zDQWvwsaZGUkuNEQwRnm/CXd+aUs3uEbpGlnbsltLzmiI00GqO5oo+YLv3Klws0dKjj8KPOIEQY
	4/dqEWPULBosTzKnpdbaCjmqwEdzMAHHDvSBNJfuOPOe8FQrWTXlGGbhe3yh2mAvM7Zs7auS9r7
	RK3QrSY5rAX6hln/xUtiROTUAhvAW+vFivIAx+tC2dKO+LK0/k46FPKPbNX0sj2Ba996CUMPdHb
	6e2bWfMIUkCgNJNc2Hsn1I4iCa/38nDaqzMh5Vmes62ylfiZcu4zP+1vo/UbYmt6boPgQQ58vAi
	n93IWbDSa9mXu3yKvEHrl10z4W
X-Received: by 2002:a05:6122:1309:b0:5a5:4166:67c5 with SMTP id 71dfb90a1353d-5bde3a39c06mr2024694e0c.3.1783000128023;
        Thu, 02 Jul 2026 06:48:48 -0700 (PDT)
X-Received: by 2002:a05:6122:1309:b0:5a5:4166:67c5 with SMTP id 71dfb90a1353d-5bde3a39c06mr2024680e0c.3.1783000127626;
        Thu, 02 Jul 2026 06:48:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89dc2cbsm700630e87.64.2026.07.02.06.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 06:48:46 -0700 (PDT)
Date: Thu, 2 Jul 2026 16:48:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] phy: qcom-qusb2: Add support for Shikra
Message-ID: <ym4zec5vw2mudnvhw36w6vkuqupbl6up4dqmhk2sqeabphotsf@sudiy6poyjyx>
References: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
 <20260701165051.4122259-4-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701165051.4122259-4-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX+W7sENv/BK12
 BGAi0zPEsjiQJ8CMZ1cAunWxeI/ihJK/zIGE35dnAAuj/HfWjQDKEY0gEsrBc2OeTzN+9YpFEnR
 pKi7MIE+pCzeAI7aMz4EDmvAtBeC2WY=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a466c40 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=PNGB5_nj4YWGvdh4KMsA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX6bJBfVDGrJ6Y
 lDkyGfber2lVojj3THl5q219+60f7+IIXZMWTVnFqY9f5I0nxw/wh2xCdrJQIMzlYMoaIn/Xcqq
 GNabxiUH2PWcGBnpgN9aX6isdN1i5D4xEqYQrrTjqjIFbp9mIOzJJ7y5TvpkhNTdJ9IgAIY3Aqu
 cBoHze3sUxYA3TlstVqRlfjMi3cnQFKKldQ7sL05ME/s21HRHuXvPLzpEbov8aVyYlFH4zCPUoo
 xpU4x62kXCpnIiDtDAXW1WNElHMtntGEwOQvmNfuJ5/uG5gSVU22OrVgJW8Yd/wLqkUDfAije3v
 D1bwjfL2TCKmK7FnpCvznD86bWXdQ2tZyIwWfaR8cxj8awAWfxkCWBj4scAADH1wnaBz5h6T+Wi
 XgkFrHSraA0UUipimlm5Horit5S7W1FRG1BSxv1yVQztRsRuau6g5uFjOkz/v/gaX+qdTB7KF40
 aEQvOMQGju15HLantlw==
X-Proofpoint-ORIG-GUID: Eb630fv9dEYOsUJMYE8sL7hjYyrAU32h
X-Proofpoint-GUID: Eb630fv9dEYOsUJMYE8sL7hjYyrAU32h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020144

On Wed, Jul 01, 2026 at 10:20:50PM +0530, Krishna Kurapati wrote:
> Add init sequence and phy configuration for Shikra.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index eb93015be841..ab7437e7b751 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -381,6 +381,19 @@ static const struct qusb2_phy_cfg sdm660_phy_cfg = {
>  	.autoresume_en	 = BIT(3),
>  };
>  
> +static const struct qusb2_phy_cfg shikra_phy_cfg = {
> +	.tbl            = qcs615_init_tbl,
> +	.tbl_num        = ARRAY_SIZE(qcs615_init_tbl),
> +	.regs           = ipq6018_regs_layout,

msm8996_regs_layout (otherwise you are programming the wrong register).

> +
> +	.has_pll_test	= true,
> +	.se_clk_scheme_default = true,
> +	.disable_ctrl   = CLAMP_N_EN | FREEZIO_N | POWER_DOWN,
> +	.mask_core_ready = PLL_LOCKED,
> +	.autoresume_en   = BIT(3),
> +	.update_tune1_with_efuse = false,
> +};
> +
>  static const struct qusb2_phy_cfg sm6115_phy_cfg = {
>  	.tbl		= sm6115_init_tbl,
>  	.tbl_num	= ARRAY_SIZE(sm6115_init_tbl),
> @@ -958,6 +971,9 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
>  	}, {
>  		.compatible	= "qcom,sdm660-qusb2-phy",
>  		.data		= &sdm660_phy_cfg,
> +	}, {
> +		.compatible	= "qcom,shikra-qusb2-phy",
> +		.data		= &shikra_phy_cfg,
>  	}, {
>  		.compatible	= "qcom,sm4250-qusb2-phy",
>  		.data		= &sm6115_phy_cfg,
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
