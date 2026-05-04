Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A011A3E8668
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 19:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777922886; cv=none; b=TCXxiIIEO6mBQbYri3frkQBdqS7leCLWfgPXMC3uEHEePaSXutObnlz/Z9KkZtZxAVBysm4jq+BR3WsIOF6Y/kaag0gpBW7agcjB0lgMBNz3iM+Y0TitgmnGWlyx/J5WH4Rx6hdg8BOMPtKyGrveMRHEnyHLf3L+mJyHc7pXAYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777922886; c=relaxed/simple;
	bh=qpFFSBikNZWQwG+bBK6lsQ4HVH/DkLdsUpUbtTsIUZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4P6s/qJgTjhx3IrGJnDm2kbVftroWb4IZJPfSQVvHsnurcKu+6jUhHhxvdzzkTGbVuqaP7kqZumfEiHtbW2CggM69cOoa36f+FLTfgp8T97IHqCcmLXIomjosxrtzcb+aAGT+8TXBJ84VxpO8yHq3cgiTHuPAoyySKO7Jl8fwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UwX0c7LQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DEdTVmz6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UwX0c7LQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DEdTVmz6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644IZb7g4128847
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 19:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PMC7EZxzEAp7VqfI8gWRBXZL
	5WK6FzBLWaPqyYA6xkQ=; b=UwX0c7LQkrmiglS99RbSq7UN/mYW1a6bvPn7ANKW
	wooYmGB0LPfzmlj+GGXuKl8NmthUq8WML/mCKZGXBubfJuby9iiLlkb8xb0uk5UW
	jdLVbbpYhKF5LZVN60dw9wiK2PDQoKvFYp92V2QookogJgx0NceI5xJmEIDEyxES
	hVii3ZuYeEKXuveF06OXuVYYBPs1+XO3RmE+BoGhB0NytXEgGnrG//EBkQFmOQce
	/btZm5rrh1hEaUzyCLqPSp4L5ujimLlHqWIVF0Jm55D5ZaWFp8G0Bb4zbVkiaGYz
	quTk7NAccovy85v2OEXHbuvHNF23ylO1uUOST/X+2s9tlA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsdw20ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 19:28:04 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-696906dddbbso3551666eaf.2
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 12:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777922884; x=1778527684; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PMC7EZxzEAp7VqfI8gWRBXZL5WK6FzBLWaPqyYA6xkQ=;
        b=DEdTVmz6hrL6iTru2Oue+1lTUJnvcQNlWIO8+3o3DONv5evYgv2od/r4rj06zZL2EF
         j25ahx6DXk86ENKDE/9zsFbNbLApMOq+laYpmBfM331krlCz7zESYW7Edu35Y0SIXhy1
         B40JeWVaPOtqNVOqudbbafYw+15x4YGZqszn6GUSmHJgKFrpBG3sAvi959R2MteN8fHI
         7uA3IXT22KvEQquc+/uoAvMJgjhxXNfPU0mtAqDY8lIqDalEdzZ2JfmNkqUL8Ul6Swy1
         muicV+xxsdICFtJ2FWi928NhZeG2BzhKcVh4xJv4jo+Pg+PN7fqZ4sqTmoQMfaWe+N5t
         GWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777922884; x=1778527684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMC7EZxzEAp7VqfI8gWRBXZL5WK6FzBLWaPqyYA6xkQ=;
        b=fhLoFA0BuJQEQ4tkFOWhS6ZX2lj6mMMqR5k+D/HeL4njm7mVIK47UfMtDSDH12APJ1
         sipiBuyjpp12QRxqjahtBmnynH/rV6n8ANG1+r1SwG6ZEltzVJRzvpW4KfqLFNQbfiQS
         BSyfHe2j76V0BWB5RJWvFthgiYQhXK1vG8FzmD8PTWb26zH2yqgDPpry6BktGQ2u0C+w
         YWVdQ4f8H907PXMdU+PDxlEKOXlD+FPAMLrH72nc6sqpBmS93ceyC1u0pplhQTtbARMx
         GLPFN9fYP+Cf2vN7L4ZIW1mOAXU+UMh5NWJMyRz2FGd7lKTSfv6qgxxHGeogMd6qyaEX
         wZ7Q==
X-Forwarded-Encrypted: i=1; AFNElJ8o/+lF0OmqvoCbh/R6DOIf+kfULdGjVcHDozO/ZeCXD6COxEEp0NqbbjKoJqy8+qvzT5WtGHKggRB2@vger.kernel.org
X-Gm-Message-State: AOJu0YwMgPEobuCrdPAg48M7ofhzhJh6ngWpPGzOo9GQbqmhNUKA5OEE
	trHul0IzYPTYKxu9sP24uOKvgFcFrFf2MpjbJy0/0wV14PhMPv4wf4XXTNz8cGsit0+RsHiu3Qb
	rIg5x4eiwE8cuIEWJijgeg8/s0lixWyzMKNoUNQXgXTdyTgTV8bG4NGgJKmIkDd0y
X-Gm-Gg: AeBDiesfgAOHQQTR+yAYxo+Nb27ie7BdH+GfAYdWQbOeNA4Y1WJFP2WTf51fUE03/ed
	p2ClJd+wxiZKO2Rue8rrLbWsGLkrlAm1tEd+mB7/PdNVuq/x6rgVzGaOQZO0oO0VkPODfR1C/LX
	ZVvH6PBNLt+haEl+8vaZ5pJEJ1rOYqsLTjn6c+qZJrIiuHrioOhebt6jA+CEmGPtO/jpN0aUXg+
	VJizzUN2vcNAstl8ayOcrurKxRSUuytTpKzgY5ZY/mqPm/rJfefiu76bvSqIjpX5t5qqNMUdwlA
	RrpvaNJIT6mVVF+dlowRGbHgnVf8aZ1JblIE9XF2AUHao9GWjWiQxtZnG8VK5+GjyGEaSX+N53T
	f5cZSBgtWs+Wd1A2F+N4W5e0PEbCbbioHjEDNQogDIjaoWOVFHDDB9kIPZwfuGhV/eFMy7OVWGD
	9Tio3CIy/FuAnaC9qE4IZrHC5aElmSaXRkPh+9Ixd0nwxatw==
X-Received: by 2002:a05:6820:6aca:b0:694:852a:28aa with SMTP id 006d021491bc7-69697dfa518mr4590459eaf.60.1777922883729;
        Mon, 04 May 2026 12:28:03 -0700 (PDT)
X-Received: by 2002:a05:6820:6aca:b0:694:852a:28aa with SMTP id 006d021491bc7-69697dfa518mr4590426eaf.60.1777922883095;
        Mon, 04 May 2026 12:28:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393610ba631sm34733671fa.12.2026.05.04.12.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:28:01 -0700 (PDT)
Date: Mon, 4 May 2026 22:28:00 +0300
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
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] phy: qcom: qmp-usbc: Add qmp configuration for
 Shikra
Message-ID: <gb46nv455vfkldkhvlo7c26amuonrlzvstirdpbzictbqgyxox@6vypar3byxhs>
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
 <20260504170659.282532-5-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504170659.282532-5-krishna.kurapati@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=a7AAM0SF c=1 sm=1 tr=0 ts=69f8f344 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=fS6AiMJiFTYgNuFnBekA:9 a=CjuIK1q_8ugA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: F4uWho4oet12EA63aUwlEqIET7-3cPYV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE3OCBTYWx0ZWRfX2qcW/MRfmB/5
 HOzVyczyl9xeNPgg3tjxoYl+Vs0gWBaf+6nK3j07w0ws+uWP7off4rQFM25a69Vs8wI7aRk/OdH
 dVNhUXIKGL/gYgcGZf3siN3hX3TFbBFDPc3x2ThFa/11szYMdU5EaUWY0j/mjNlrKjUQS/AhQHp
 F8Q6fkYDxTSCx7AYqpROURsJkRF3YcFyTnVHsOCbiMKOhyzYPkAPrCOoAxmkwxNWiWba7E0GTUj
 yuHWA6FpTkIDYcEReeqcGcFHuR2G+QXiIDF/5utamcFAPOum7smtVQEckqWxgqnY2D9kxSislaB
 PfPOiPI6NJ1/jFHsAqqyPxwTiwzdDkTdAzj5phYnd/+dYG7+dA6t+Evft3M0pnke0KbuKUb13j2
 rh9/Eo1caTzyBJqDA0ZbSIQSGG0hFA8rcjfIjvxu9uaGamJylrW1zqZiP/6ybg2MBZHeVBNE8sx
 gGwt54tEnbl2RXZozsA==
X-Proofpoint-ORIG-GUID: F4uWho4oet12EA63aUwlEqIET7-3cPYV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040178

On Mon, May 04, 2026 at 10:36:59PM +0530, Krishna Kurapati wrote:
> Add init sequence and phy configuration for the Super Speed port
> on Shikra SoC.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> index c342479a3798..400dcebf8222 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> @@ -2019,6 +2019,9 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
>  	}, {
>  		.compatible = "qcom,sdm660-qmp-usb3-phy",
>  		.data = &sdm660_usb3phy_cfg,
> +	}, {
> +		.compatible = "qcom,shikra-qmp-usb3-phy",
> +		.data = &qcs615_usb3phy_cfg,

If we are reusing Talos configuration, should Talos also be used for the
fallback compat instead of modifying the driver?

>  	}, {
>  		.compatible = "qcom,sm6115-qmp-usb3-phy",
>  		.data = &qcm2290_usb3phy_cfg,
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
