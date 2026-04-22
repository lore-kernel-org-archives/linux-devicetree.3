Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA9E175A7B
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 01:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776822353; cv=none; b=U27fQE3VZDXnImMPbmgII/GXGIxdOvypAD7KYJyvokeevsgqo64aOo3O4htZ3EXjZOLAqj2yd1WNZ6sGel8ZRGkzyfdSXFqns6aVJ95Gvp36ZocjaWa7TWFTHSmT4x2XJqEzTUTp4pdKV2CqXwCOYyeDI1veOdQkUs4bI66vsCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776822353; c=relaxed/simple;
	bh=WAELlRbfu9Q9ChOw2T9Dh9NZf+cQmOdSh1QOFmr3Lig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSsn853AACoZzmKye9vLi3Uf/vCr0FU534qXuFgB6I1St7WjFJVcZXHC97hafP6HY1tUHFwQdHBZ1Y2iYrTeJDgXf+QQY5lQEr2UvFFuLmfkwmMV1js6QrJqmAcg+Ab1aRdLLQBhiDJeq3aTZSlqs/N+jR/qxnQih6DU7rOKc9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fX0/CtT7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R9vUAVeI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fX0/CtT7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R9vUAVeI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZlwK4051049
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 01:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5wHdqqn7SDS+5SZ20jG8Ptef
	E6PvolnfCH/vcLHZcaI=; b=fX0/CtT79Lf7McX0/JXcisYHIuPoYziwG/mSIRfA
	XEjvT0ia0LCX9MctirgK32TibQzWRVtk+qYMJL16lyXc1AjW61vJMXJShxXbiUKV
	uVZ/g9XJP6nId4Uyn8jm5swJq4XNnqJie1CUGayva1WuFux25XpeRyHICacVauvK
	CEoH2Im7Hq/AcB8h63ZtnvZc1BKfTrZpFZCt8hpgdIcOJH6DpxG1Sv4KZsaRfaM6
	1TgHwDtLN2vJ2zmWbWviDq5PaGI3+jg6d3kexdOFm+BDUA2eU50W8KPNXky0/xDp
	bBr2fvx/cN4Jhlq0ZmzzI8RTGRnfZ/k7UN3nicHhRAfBjA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfh68j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 01:45:51 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-60fdbcd749fso6481209137.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 18:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776822351; x=1777427151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5wHdqqn7SDS+5SZ20jG8PtefE6PvolnfCH/vcLHZcaI=;
        b=R9vUAVeIJt/Yl4T7nxBtsFiu3yXMm0bLZXkG6X/VRQftd7uX7oaQie5MVvdZvoqIUy
         rwPtkPUPelPLaLAY+elg0f6PLWdyzV+bJT1lnn82dpr6bKfU82OzMj8K/1kRKMffeoo6
         V7voJWN1IHPzeCKbwR0uZQc0CMsSFiyhze5unx6SPw/tmDnTjkMX+Ql24ov9jj3kcClu
         4pZ/5P1MO24Ugs+VCpuYt0/2t/2v92gink/YD9E1LV7rnRHODsZ6/82PZhCkn866Fyu2
         2fWqrgzWbsNmvZje/7vEzERH/FgBYy4gs7ooy56W8RAYdBmVaf6NtbT9bPMWxFgXJf2u
         ASow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776822351; x=1777427151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wHdqqn7SDS+5SZ20jG8PtefE6PvolnfCH/vcLHZcaI=;
        b=p7X3praDCQOnvYUqYXlRvyF4ne8PXlo8C3nZiHytHOKyIhax0IpsM9y7ecLSHl+xzx
         UYRIJQ39uiO0DJAlZhGWNKSRd6+bkvXW/Q7lpFzrwxM8RRUTjseYPabVFRsE/eVLnsye
         4ZI4BSLqXJkDOgMsExM9EtY0I1t+1LdO63lFiDg6iMSFNhhG3URc2rLax8GJIJXCwyQN
         QIXvZD8sAUz7Lj2HAmY9ncJf0eGdfnDMu+XZhaIRfZbCO0Nm07gqCgCy+n8BWzNt9Yz4
         dWFccTTfrtdoDb/WdbsS/DvLu0U/B3TNmPxLzlQ2nuKzmOkDycIHBXqWfnab+XotZKtG
         REOA==
X-Forwarded-Encrypted: i=1; AFNElJ86HxYGVBpFzOzZ7xZzTS51kXMPN9wKhdkTilrpViK9gd0v5a/myhdVSSoAsEFGrew2JMw8t2Dy9ejj@vger.kernel.org
X-Gm-Message-State: AOJu0YwwtkiUbPF2SQvVvQJwIoaSILerDFhI8lo+mO+jdb/xYabrPxzg
	9jWzZyxe8/CAtrvgKgz5hUTMYBDnL8oY+EURov3NMbGblNE4H1na4byX6i5VFafafJIr6mVMD/C
	I+FNrZ80jjrRhHtodSZ7nsmOnmt7jQSk5VZF+IpWWsOr4kzSrC+tYGpDMO8P2yYR4
X-Gm-Gg: AeBDietymOQ6VGBgtxnRPy2OLSjspEpv7rwvig5EWTQ0p3Kuqm5JIN7VtlxY7oOlsel
	97Ue2RgJdA4fXwY/lHTVos9UouH405vF6BxQH1QXHwy5MQpt8vt0mjXhaQ6dhWEp+PY84sfhBmq
	ekXXw0vmEctD5mybZwX6vYCBM05/HiYyuCHsTB/mSH0I9QadapzK0BXxE6X2IqoSJwSyCflUsmc
	7LFyWAVuJCLYfs2VRH27xQ+uVESK3HVnDU73nsj06FL74l/GzUDJs95/m0OABPm61AIHady0cOa
	MJYqnMusde/lx/Tl15m7+AevTWWe1sCSVfDKuhLc55jwk2J3A3y4UqI67bq/a4rbOeg/+A1F512
	RHM8oTf7dI9BS3NLrjhQwyw8qUmgiGNhgjXonp3dSjHsVlnpj2n5IAMfXmlGSJHoX6+eQvo5FzV
	upxE0FiKle7DeOwx659hCw9i8YLHxpJ0mB50R2n7wICaz53w==
X-Received: by 2002:a05:6102:5716:b0:5f7:2568:abb2 with SMTP id ada2fe7eead31-616f4b4be78mr10249666137.6.1776822350792;
        Tue, 21 Apr 2026 18:45:50 -0700 (PDT)
X-Received: by 2002:a05:6102:5716:b0:5f7:2568:abb2 with SMTP id ada2fe7eead31-616f4b4be78mr10249640137.6.1776822350339;
        Tue, 21 Apr 2026 18:45:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f51a7sm32980981fa.7.2026.04.21.18.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 18:45:48 -0700 (PDT)
Date: Wed, 22 Apr 2026 04:45:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: contact@alex-min.fr
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 3/8] pinctrl: qcom: Register functions before enabling
 pinctrl
Message-ID: <jqxpgl3wqpcbou5uvg6culdxbnebhydd6q3owtgubfxnflsdnh@gegu3gmz5bhh>
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
 <20260421-mainline-send-v1-sending-v1-3-bcb0857724de@alex-min.fr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-mainline-send-v1-sending-v1-3-bcb0857724de@alex-min.fr>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAxNSBTYWx0ZWRfX732PQhxLwqZk
 Lvb+zHXxUYtwrhowWxebPEsBytIYNF2KnUcI5OyMywapigugKApsifM5fsugY8gw9A+NjY/e40A
 lFppexC6UtIx6Jgi2mkjOuLgGu6fi1PpFwn4yRibEDlB44N40l8CfP4QaXcpXlIKjORsmuSYH/G
 xvBb0Nj5R+4oBSox6c4gb8aR9P23Yxcos02JRc4N3NVjaOXIkn/cypmSEZULjKu7Gn3FG3wMkrP
 Cjyk0WL5TGj/+Q+Bxgs0tdhB86444q8WjSQFN3CmcTcOkLOT2FI1N2JFf5nYHOkP5upv310ARfC
 Stg4gKIHYaKiEODH4GffbrvA4U3uWj6yR/lHBB2GEwd0H3XrWSYVHMqHQAbIWbDWguQ+9YHfbIm
 rR5I8yUIgn3fhxxem9Ed/30q+TVGs5tsXnu1WNy11lGNGY35o3mOnItjLzONlNUnGz6E+dGZZro
 PxSUUj+JFs7gJC3D3cg==
X-Authority-Analysis: v=2.4 cv=VMrtWdPX c=1 sm=1 tr=0 ts=69e8284f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=PRS8Z04pAEUxk0G-eYAA:9
 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: DnMUECm8bbOt20i_OEtJUiANQ21Pf0E5
X-Proofpoint-ORIG-GUID: DnMUECm8bbOt20i_OEtJUiANQ21Pf0E5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220015

On Tue, Apr 21, 2026 at 11:45:09AM +0200, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> Register Qualcomm pinctrl with devm_pinctrl_register_and_init() so pin
> functions can be added before the pinctrl device is enabled.
> 
> This lets pinmux_generic_add_pinfunction() populate the function list
> before consumers request states during pinctrl_enable().

Why is this required? Could you please extend the commit message?

> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 45b3a2763eb8..a2a1e0835735 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1593,11 +1593,11 @@ int msm_pinctrl_probe(struct platform_device *pdev,
>  	pctrl->desc.pins = pctrl->soc->pins;
>  	pctrl->desc.npins = pctrl->soc->npins;
>  
> -	pctrl->pctrl = devm_pinctrl_register(&pdev->dev, &pctrl->desc, pctrl);
> -	if (IS_ERR(pctrl->pctrl)) {
> -		dev_err(&pdev->dev, "Couldn't register pinctrl driver\n");
> -		return PTR_ERR(pctrl->pctrl);
> -	}
> +	ret = devm_pinctrl_register_and_init(&pdev->dev, &pctrl->desc,
> +					     pctrl, &pctrl->pctrl);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Couldn't register pinctrl driver\n");
>  
>  	for (i = 0; i < soc_data->nfunctions; i++) {
>  		func = &soc_data->functions[i];
> @@ -1607,6 +1607,11 @@ int msm_pinctrl_probe(struct platform_device *pdev,
>  			return ret;
>  	}
>  
> +	ret = pinctrl_enable(pctrl->pctrl);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Couldn't enable pinctrl driver\n");
> +
>  	ret = msm_gpio_init(pctrl);
>  	if (ret)
>  		return ret;
> 
> -- 
> 2.43.0
> 
> 

-- 
With best wishes
Dmitry
