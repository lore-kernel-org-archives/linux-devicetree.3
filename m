Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B685A33064A
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 09:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234253; cv=none; b=tCBK9gYFLXIUFG9eUKhxJvSYPOnHp8kmtYH6bBX8hqkeW/FdBKyP2L0uqx4wGVY7K1fb+BqyvmBqGXMImrNnj0d4jLxhfmNB+GluRWR9YGSKuotFUgpyrEGpY3lQxPD3jZTX9T2PKxprt5nfeAohdOO3rhsswzQk7tUujU7KGBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234253; c=relaxed/simple;
	bh=5E58D+EVQJVFrRxJAbfWFijvIQe461itWawamqbK6Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YytHgRn56UY2t4MN7PwRHIAuZTKlEVqWydU0PMSIxX/che0dp86IgxwyFRhlSz+Bi5pbHq1MXBx82eM1XwCA94UkzDLxDFyHm9g++vxnTEAd2PfG0FBDk2QKVrn3Rsd9q6kPsn2by/fJZDqIcW7iqEGzq7lV3EvzX/ZOia0qPwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ofeS1Rd3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a45L+mMn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ofeS1Rd3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a45L+mMn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6487KZCR317490
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 09:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VOKsL2J49RtwwStWfXi2hXlW
	idwW72y1RKXh369+Eps=; b=ofeS1Rd3Q1DU1m+cYgr83/9VZmuty+jzKYGTCmm5
	MHwXoUZouZe8U3f1KN+BqaBTeMTvdhYOIWyfHRFKygYXWbLN7jR7XniVBid8hZ47
	2AZ0+z9s3Wk5hlTeyGvgS6xOaxRYuD1W4lLSS5r0nuXksr966uUUgS5JqK0ss33h
	5Ejflfbto3v7U28/jbnXJIwFEtRhkZEIVfNCXSMZZIrMyCGOd4cO2teDXM/NDjD6
	uUr1WawKgtsNGfUirXeHN1rLorLfZ+OGHo6yer3YAuzUkKTl/UAhuaTqPtOimRYM
	sTcVkZSpjsbTLQBPZUYEDCzctYjJytqLBK9UT891qGXUcg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1bc00mj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 09:57:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d890580e1so31653681cf.3
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 02:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778234251; x=1778839051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VOKsL2J49RtwwStWfXi2hXlWidwW72y1RKXh369+Eps=;
        b=a45L+mMnjq3U8BMd5BaTdka0WdnbpOwG37T4RzK6FqRoaMpjIud0oh8v6/GiYhCgzd
         I5hhnSCOy6wZXHY6GBnk/MvME7k1viwNrFa3Ssx1rrQw3CoGO4C7AQlrY1xRgsZ1OiPq
         20k8uILZsfnzQHsQmFZfsPmkfxcbhN/pD8VkWrFX1VwCVyPd3GL04umksDEsTRKk61ny
         /7dPVVp/8fS+Zia7vEbqvJs8Nv5HhHmxHfGAU3OhV9peWFpYe93mGUB6hC3mODSkX2Ko
         LzV7E8luGV3w2/j8ATwv3invork4SQFrbYuX0rqKoSm7LkT18m5Kp8rzFiziO22dFZVO
         sPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234251; x=1778839051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOKsL2J49RtwwStWfXi2hXlWidwW72y1RKXh369+Eps=;
        b=tYakZMY6a92lWMpN9E1rlaaWBuP4WNTlWkS9LUNxL2MJX9h2jAGWFpirYBvLyJ3pn7
         J6Wl/Dbw3f7APa+F1EiQsioCwZ9WCeQFzF0ixqWUHpOJYH2v67/ktGUAkqofeaipQvHJ
         GOVmltGsYHAqhjqFvOTAS16JysJvgKjF1b8gM5V8hdNff69HqsVQx0vBULuuxo73TbuD
         QA//0LZ+57uwW54iNAoTMlIdarHO/mF8kNfWKiTgXIV5jGOBLWyoSPDpX/4W+/emH1cT
         GiPHjqhCzokxSLh8tHZQ0ZV4ZKc/TU/AANrPKG6unHBdIC+Ct/ELXp5zT50EJ0j/mvzk
         ZpXA==
X-Forwarded-Encrypted: i=1; AFNElJ/TJ7uHADLdnXSW4eDK42d7jJeczrhwmogZTvUcXdeFBL11M7wyFEE4XPvGtUBefoB6Th9mMtjo8e8C@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhk8jKe3mmbWJp5P6pdo1kGSrG6Wt3zt8EcCtBvpRXZjx/0H2F
	L+Zyu9Xqez2B0bqzqz6Q5+22J2S7nuUEBDC/ERXIjU1mNnFfe3L2MdJfi4gq0e9nbUEmba3JRJa
	cnrLxMoFdGQVlhaujQ8sRLoHClO5rM0jJVMZ8QDoNdnnQDSVn/E5yaEponAJidwzB
X-Gm-Gg: AeBDiesrDr/k6Uk7cE4SnRkVFcsdTOszlaffFUPM7StXMBquzogJblTNbRBm4zqhYKh
	RcDYxMMgFSe2GQ4wYDsMHdYj5+qajF611yGvOWWT2ahJqOZOPz7fOeWeV53zPO7oo4h8P8myi0g
	EKvvN7PZl5FS0ScGpA8areSLadOkWB4lWYfV3DiBWEzMp8ikFmY7+g/0G1SydoKJxsuKpP1CwCU
	QWGcSC7NcRqmgcfZWDRVZAtIOPqmUbWfvYtgY06evC3gFC0AAfUarjj3UULUHb4BxQhAgE51rAo
	c+prMtBUBoS46J7F8Uy0Bjl27XOmkGHFK6g4BoSZOPw1D3R1vJy+MBFbmZo+D7MLVThLbs7G7W7
	dWWhZkyStN1vOUmSe39OL+810TFr1WI63MpzvLF6bi+zLc6btsA126HPylGLfQZ/8q3r32vnI+e
	Em6WjCV4yOl2+rqR2wSQVvMl4fVCwGpKAPcukLcj/Gegwe8Q==
X-Received: by 2002:ac8:5953:0:b0:50f:b3d2:6ee1 with SMTP id d75a77b69052e-51461fa0395mr155370761cf.31.1778234251074;
        Fri, 08 May 2026 02:57:31 -0700 (PDT)
X-Received: by 2002:ac8:5953:0:b0:50f:b3d2:6ee1 with SMTP id d75a77b69052e-51461fa0395mr155370361cf.31.1778234250536;
        Fri, 08 May 2026 02:57:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660b6sm375257e87.62.2026.05.08.02.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 02:57:29 -0700 (PDT)
Date: Fri, 8 May 2026 12:57:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] mailbox: qcom-apcs-ipc: Add Shikra APCS IPC
 support
Message-ID: <n26qxqcft7rh24a77h454py2ye4kgzxiy6ib363vmuatp36mp6@otavb4hckcdw>
References: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
 <20260508-shikra_mailbox_and_rpm_changes-v2-4-ab76fd9e71de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v2-4-ab76fd9e71de@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwMiBTYWx0ZWRfX4S4kZ4EVjqjt
 NZ83PK4JyEfzKM2bB2LzWddASnztjyBW4tp0z8nXEXSrdRvDnl9nmhcxmyjC1OJ1fdEqiQIj3Do
 3r6/OZWID2hyPSun7I9zYNXQAHBf/wuqJFNpMfk35M3ES5DaOEtS9urLCOCSQc/8RZCq3s+k/t3
 JbjPoit4iIPwQmfypAhUHCfB5kCqE6a71e8hDdGrLV0R81w2VGvjMbZxniRL0a8un9FaMnpGlbx
 uGAZmwxPBh3t+GidARAoZ+TB9a2oSLKVkJevaNQCLHALttANgTsUZUhAV4nahFeb37YY89EWnd5
 2M27SpzCQ7iQg7vPMkryd4iXvhTbR2bvE/9S34kzsEdUIj3ES5M1GOSGDZiyH14Pj8tkXninh6Y
 YE6/2Xv7QxhWTkBMi+nrQPSDELeAdGL3zB2ov43JRs7KRJgA0dhMUo+UCEqVqNzJY5+ur5Gpc2L
 MUoDHm2kkybW2VBvyCA==
X-Proofpoint-GUID: AxGnbGtYFkgdfdFY-j9iyflWtW9c49fk
X-Authority-Analysis: v=2.4 cv=JJQLdcKb c=1 sm=1 tr=0 ts=69fdb38c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=GA4JE4aC73f7OREyLVIA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: AxGnbGtYFkgdfdFY-j9iyflWtW9c49fk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080102

On Fri, May 08, 2026 at 12:49:50PM +0530, Sneh Mankad wrote:
> From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> 
> Enable Shikra APCS IPC support by adding the compatible.
> It reuses apps_shared_apcs_data.

With the DT bindings in place this patch is not required and useless.

> 
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index d3a8f6b4a03b368821ef9a5b24fee78037104610..25f76965921ba695e3a1bf4df47ce643916a28cb 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -168,6 +168,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
>  	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq6018_apcs_data },
>  	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
>  	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
> +	{ .compatible = "qcom,shikra-apss-shared", .data = &apps_shared_apcs_data },
>  	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
>  	{}
>  };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
