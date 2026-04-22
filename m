Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB63358360
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776852395; cv=none; b=POKRMHjPVK8slFJPhLgGjYa8fzoznliuSabG9mwox1e18mFkjM8xOtnBoh4IPvApUnslmyahHkk2x2cluqWQ++YdVw5d5V1k9XN6RQivVW7I7W5fO1OEWHKja7KW4efQzN3WQDcyxs5zdEdqG3kSLInxDPd6g3ezkWepst0dO14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776852395; c=relaxed/simple;
	bh=F2miv3VN1E5bBVzs28VciCLl3pdFG9c3gR1nAApTKMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WP5jazTInpB8X1d0kU+pQWJ05JIrB2MLDIJwt6/3LTD5oQLiDLBViYUCy7qbEapc98AgRubP+TkZ7Plun/C2xEHgpwPDGXuGhSzPItHf8HcDzjlMFLUdKjY1O704N5cZY2j13oHfowbBjyQynpOQFXWzSW76DfZJH33F/HeQyVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZxzASiXL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jFg7fqQd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZxzASiXL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jFg7fqQd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M99EuK1443728
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E7dhqIXNT+osSd+4CR+kMtKfRz1bj+2wyCzp2NKZcx8=; b=ZxzASiXLj94Eh0NF
	7y43PtYpG3BWFT24Fcer0gOJBkXiwhm28xGzc98EM4f/oOMScyR/C7BJEHlROYLv
	E/PiJK8uoZnNxrNlfiB0nAUttIQfsZPyPLlH05fMviMgk/Lwtd4WW1ORlzxAvAjl
	S8VXA/PgIXI0UBuyXiM94+h6FT9grpMpzdurfNddqyOBnhrTe6J8MXeszuAyBWSe
	c4oCInioFy+SbMUzCGNuqh9tY3ommcSBJ+KNvw/TPuPVuvo2HTr4gr4SzuTQwAKt
	AlgF1ZbUtAr5n2Kx2SBkwC+mckyEZQNpmm2DiklX4Dc776qx9/qS1dMbieF+xuDh
	TvLotg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenftsq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:06:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8aca4966fe6so16398896d6.2
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 03:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776852392; x=1777457192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E7dhqIXNT+osSd+4CR+kMtKfRz1bj+2wyCzp2NKZcx8=;
        b=jFg7fqQdhendR8EkJKDymreAWf6KrVyQYTa6g2SvPyiiifimNJngdTFZC7qIDJs6O6
         rp6nF7AfnNQOqVHSFZI5pjFOmEaUlIk9AUwrMv9tVAu/9ZZUgMhYZlyBmJYvkrVzaN57
         LYxcCaNr7i+LlWabWYnW0QX4s5bUXQsZWYt4xGbH9Utcx0qgFbBZdTzBTbBnOWi3aUYV
         J1FQG1lPLvzz3gte0jQ2Uu+KX413tQ9Utn/JMCko3p3Dp9AAmnmhPrLJAf/+lI75x9oq
         MnzIBDwOkb4YACDmCJLJ4NoV2j4uHuSZduCIAVo09EYi3ee+4blnrdVf6ZHHa7JDpD1u
         DnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776852392; x=1777457192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7dhqIXNT+osSd+4CR+kMtKfRz1bj+2wyCzp2NKZcx8=;
        b=AgIC+yTk45qjq8R05dFmDrygYZxYMeeo6SMtoWdJ7RSYIjlcqp4UDOlChodf9RcccT
         Yy4Gtd8BGCrJ6X3Z5ENNA0oxETYtiA4QL1jnJgXZNHdO+6YhqYn2zMjS6Q2VgXjL1Os1
         2H5rRZxj+euZvCGT1y4cfvC7Pe1dxQIebX6qD+UJeNP6qVhc7x/zedoF2iJA/ilWH1tj
         5fXkAsVex8aLW6B61jlstkhLG5vPISRzs8godGJSZlllsMNTi1LcmkbjQgYp1I4A/o8/
         NZCJzB0vMZCV2WRKfljPO7gxQ96iop7g0ZDCpc4mYnrasp3soJDEiJWchIychTngHBaA
         HYUw==
X-Forwarded-Encrypted: i=1; AFNElJ+92nzLL7PFQ5hioRPG8hUlbUNZbFwSVOTdSCvXaXQRKwrai8DEQSh3Z6EvpGiqDe3WHbguRC39u5fk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1/NAj0t+0+tFKlS3cWniOYxXXr0FspEux3WmO/kvwsnPJD/LZ
	zNplz0G8LgBPzSEXgUBbejgi3MWiWuipq/Dhmq0iz9yui9BvXHGjW9YirECfaqE7D/+8CkL8bU3
	+O4hKohbY4+c9rbP1COy0B+a+ZUiTj9tHpbsnB37e0I0idRB7e1DAogVDawVpPg0v
X-Gm-Gg: AeBDievL1jxyeNnY5b7TitSuJM4fCI9pd0RiMIWoiA4hSGXA2VsnfPsH6u6lMuvMH0A
	NBOBMYkvz7k36MwYX5Yw8fl7CnyKboiO700heoQGyc+3VDowogDY+BWLaIEg/sCQVvmZpZGQEQ2
	tIQk5BvJbLaafHRUCuMvtyPA1z3ilQYkDf+fl2A0yBHLY97QiyMHsu7DaiGpS7nCBycfWEZ56XN
	fJT5PFEZensCPbwNIFPqOTCKSQ/2It5JerFhR3sUaBfPsyVypEY8HFHOHbQJmI2jpn11Gzz+FQa
	QcmSQqzauXbwgN0KOdze9OzqWSnQRXRfwdIlnkPJcaAnv7GEtqc7OQQvD8YXDYsSxijSwPQdIxS
	iATS9CO6ZMdRP9X/1QeN4r8FX3n+R9v1h4SkKN/FDVkFsBaSyInUFhPac94grOt6pj3lxos0Q27
	poTuaGTTaI9detyA==
X-Received: by 2002:a05:6214:2521:b0:8ac:a205:f118 with SMTP id 6a1803df08f44-8b0281997b8mr227504176d6.8.1776852391815;
        Wed, 22 Apr 2026 03:06:31 -0700 (PDT)
X-Received: by 2002:a05:6214:2521:b0:8ac:a205:f118 with SMTP id 6a1803df08f44-8b0281997b8mr227503966d6.8.1776852391406;
        Wed, 22 Apr 2026 03:06:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4517ee077sm538493266b.18.2026.04.22.03.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 03:06:30 -0700 (PDT)
Message-ID: <3526a6ec-20ab-41d0-9130-8dd6d5b76f49@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 12:06:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qualcomm: qmp-combo: update DP PHY PLL programming
 on Glymur
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
References: <20260419-glymur_dp-v1-1-ad1067a8e8ae@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260419-glymur_dp-v1-1-ad1067a8e8ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IwqrYDrfy5MwhUZbgIykvY2L0aOBSknx
X-Authority-Analysis: v=2.4 cv=YJuvDxGx c=1 sm=1 tr=0 ts=69e89da8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=PVKFNgOZ47auAR9NjogA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA5NiBTYWx0ZWRfXwHYoMd2LMARy
 p0klgnYc+vkzOmNKSCSUcjABD8D+T+Dj4hKfH5Tx1iJw/8pjnr9IsI1jrs+zCH7VjcsAj9NUoCs
 oP8LGibTTPWYMiFw0GxThs0iYeF+EF/0LWc7hbx/+oZqxtC3B6ntrzw5utTs1wJfbwIAZ2/3V+H
 f6h1DhX/8cHa97pwqnwO6nPln/aINdhSQ9G3pwIyuu38miUIj1LLIobh+xd/6gf6NCCMGTupU76
 bQjrATq9J784gCte8c37en3GlCfn/2OHfh5tVec/LM6d4qksSLgixwxYQwJjnqGJoNFxBhw6LUn
 KKIoMbe2bFj2I757DYTMcpuM3hUpj+4KVhniqKcBCe87vA5Yq9de7KFuO5khIp2wxNwG9rkRg16
 ZiSKgrCgM5hkTvwCF4ue1ojfBZUuYHhwHA86vZkHxRwB7p7aB7gNLLdYWNCF4ybHb31pyAIeGud
 F77BA65i1rkRowIs2lQ==
X-Proofpoint-ORIG-GUID: IwqrYDrfy5MwhUZbgIykvY2L0aOBSknx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220096

On 4/19/26 12:15 PM, Mahadevan P wrote:
> The existing DP PHY PLL and AUX configuration for the Glymur platform
> does not fully follow the Hardware Programming Guide requirements for
> DP over Type-C, which results in DP link bring-up failures.

[...]

> @@ -283,8 +283,8 @@ static const unsigned int qmp_v8_n3_usb43dpphy_regs_layout[QPHY_LAYOUT_SIZE] = {
>  	[QPHY_DP_AON_TOGGLE_ENABLE]		= QPHY_V8_PCS_AON_DP_AON_TOGGLE_ENABLE,
>  
>  	[QPHY_COM_RESETSM_CNTRL]		= QSERDES_V8_COM_RESETSM_CNTRL,
> -	[QPHY_COM_C_READY_STATUS]		= QSERDES_V8_COM_C_READY_STATUS,
> -	[QPHY_COM_CMN_STATUS]			= QSERDES_V8_COM_CMN_STATUS,
> +	[QPHY_COM_C_READY_STATUS]		= QSERDES_V8_COM_C_READY_STATUS_N3,

This register is in the DP_QSERDES region, not in COM.

The updates to the reg addreses themselves seem to match the hw description.

[...]
> +static bool qmp_v8_combo_configure_dp_mode(struct qmp_combo *qmp)
> +{
> +	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
> +	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
> +	u32 val;
> +
> +	val = DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> +		DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
> +		DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN;

The Hamoa (v6) HSR suggests we can use this broader value there too.
And same for e.g. Makena (v4), but not sdm845 (v3) (perhaps we could
use do it either way?).

With my response to Dmitry's comment in mind, the diff in this function
against qmp_combo_configure_dp_mode() should either be broadened to
other platforms, or the function should just be the same for all targets

[...]

>  
> +static int qmp_v8_helper_configure_dp_phy(struct qmp_combo *qmp)

This function would then be the same (except your v8 impl returns earlier
than the existing one, skipping a 0x19 write to QSERDES_DP_PHY_CFG and
QPHY_DP_PHY_STATUS reads)

Konrad
