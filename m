Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E893CBE97
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779041560; cv=none; b=Tu/eTcRyRgnkvWTppHSoEjjuzzQqEQ2j2CFe1jpf1kn3mAYuSim2OxvZweDyvvwZrUhuz42ePb0SXM1Wo2roa+rgO6K0CvoHrmr74l5SaZm20bOOMklzg0mZ5mzZEwdm/ZppedOKhyLyZHuWIvhsRJVYjje3GLZBUYmAlufomMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779041560; c=relaxed/simple;
	bh=Xp5Ixk/UrdXHcKamwm4bzOPo9EV535L7yyFC9Vwqp6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyQFnx5GE73rdm+xuu0Qihfz4aUkQ8PDYJARPqvGPyCBxNJkHBRhjaO3BtR9vK5W3n61J2WnEU65bb81pvDh7SlEoHMSxBaTYGXKvgh07axxUxB+eVvP0e04IoXmDkoMk71J4vDETlZNQuRz0RczThekZFNnrBInyWw7j6tG6Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fibiNalo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B7hY+iqV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fibiNalo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B7hY+iqV"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H5JS6G2566976
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+84c86+BTqUsmbfvYyoIFFXp
	0JFmH796Nm7BJ6t7KWM=; b=fibiNaloGlav2yQbI8Vhd3ypyF1GgAmwx86qdW0K
	qIBRJOf8g2LIfiPWKdU5ZS5qnM6gMNL8dzGmExzJ6/375sHinzPSRMOyMYmO8CqS
	zYyNfmR6yqxw0RHLHwpb5EEl6SKoLDSejHOr5PSw1YlJitxFkFx8I1IREh9rteDQ
	7LxDqechJkaxr0nEWcVOLMlUjKOr2txvuvjY7ofy8gsB2WPgrV5sRmnTvrWwDzKV
	6lOjRxfsyZ+sTLvrIx70KYzhQIHNvLEjceVID+0TyPZafkX2udbxwR4wOYXMQy98
	Dz8PrySb/9VP31hb/7maAK+O2BXzY62ssWqiJrvw79w93Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvquaya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:12:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514b5d6bb45so29231141cf.2
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 11:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779041558; x=1779646358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+84c86+BTqUsmbfvYyoIFFXp0JFmH796Nm7BJ6t7KWM=;
        b=B7hY+iqVSjKA6sKeXzMBJZSKMC59CpXz9Te+wZU68k/GRLuZqVpHj22WJ5U0V7Oxny
         oBgYDvjSTfubbftaFcji85bd4JJBuYpfgb7Cdu3qMzbLGug/pYxhnees3KL4SLdsctYN
         /PcCGUcBXFl9yzEAT4s5aWjlXVFn6zdH6xtx4xkz13CV2hOMnV+UIqcIgaAZpJC5B/Nm
         t2HPz22w1I0vw21WLzaDJoShV11azkcuK8JZmkfM3aMMXrfBSzbGwKKXD6YAIJUBwSoV
         Ve28W/ywsBPNzZkIFsWjf43ETZ8xe6k+SgyKTpK8IGJHc4FqFNmFedkk4Hjm9iPjSgAT
         pPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041558; x=1779646358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+84c86+BTqUsmbfvYyoIFFXp0JFmH796Nm7BJ6t7KWM=;
        b=SxdsAGLzQtNbccP2n9fzFSX7ds2oUzbmGUiiTCGYLgJJpmFHtidFn1cvdD8vZuZ33D
         iGDDtTGF6n5kQp7oxhVCqFcDVLCXXjtNsRLwG7RLKPADH8hGOOpOq6sfrXqKOxsDqqM+
         Ybq2CETtFs5XaGaJIW6R5ngPU+++YF+rnhc5/ivXZ7WkPwC/iMvLC6h4SGaBCReA8K7O
         r3uMwCf4171VIE5DObJjMJDgjueevckvICsVagquQf2Kj/rmYhI+SmJdatx7YElgw9CG
         e8mQQSyzqpylP4HOHjcxr9Z5/4lNEqP27C7Q9t9oMtZT54NZmqEmeQ/t4qylECI3+uCo
         uiug==
X-Forwarded-Encrypted: i=1; AFNElJ804qThQ2263vGiPQRVSJXUaP6UvkfE64YHQBpL/slr2l9X8xJUluyoKJ1rKoMNznoWlBEgMY7Zr2HG@vger.kernel.org
X-Gm-Message-State: AOJu0YwN2WkOghWVOYOCvN+64lm+y5YlIGnc/jYdkv6aXQRwWV3YicPh
	Q/Evo/NZQFJcIVxTuLjtohliGGeQumD5HKJBIb9VPD4eWELm+2De6s5BBBhlJkAFGLi0UO2NA8F
	f1QHmn3V33LfAY8+l06kTEMC1Uzm6UwSFDteqHns+Ov6sO0AzP22OHADdpn+wAG3j
X-Gm-Gg: Acq92OFvaZ2wUU+C8ar+v5pY0CSGm7HY7xtmVp8kPBQyNeECf/XwEyHBaoAdv1P2/Jw
	Up/Xwr4LWa22Dz+qqwqhl4oIzUKBMCsTuYKavzMaJNTLi/SLIFa6PLvhg4ImF4dWrkyWD+mg0vi
	cgmwZLMeMrzbD7lcnzFiXHTPS3SPFNdCLdb0BjbXLhcQVnNVVpDYZA+oupxH06IeIG/EHJUvpMx
	K4C0UI52B/qHwb+jN626C+/Jde2bU9Y0q/b5gCalJrJ8d7WBwRT/Os6UuOHj16ieP/BZOjJWfor
	0SSkLhQgANrf5H7dF54hEDOQKKIKfWt14CCs7gH6QYyQg5Enwixt03tdVG2oFXQLeXGcoiY2IMR
	OWCSRCmC96JbosuAJJRzYGAP/ek/Qb4WXuYc2yb1UWrEYvtAdHBbl8GVV15O6WCgCrkNko8c54b
	UPZR8d2bvQjs9j2vnSG9VIwNP1xQdRIofHfno=
X-Received: by 2002:ac8:7dc2:0:b0:50b:3831:417f with SMTP id d75a77b69052e-5165a2c8c00mr167619351cf.45.1779041557765;
        Sun, 17 May 2026 11:12:37 -0700 (PDT)
X-Received: by 2002:ac8:7dc2:0:b0:50b:3831:417f with SMTP id d75a77b69052e-5165a2c8c00mr167618911cf.45.1779041557200;
        Sun, 17 May 2026 11:12:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395882c0c67sm6568821fa.10.2026.05.17.11.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:12:36 -0700 (PDT)
Date: Sun, 17 May 2026 21:12:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 14/14] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Message-ID: <pockc2vpoobmhk6pwy5wluekbdgon5ndtltbs7lmq2s2hxwhxs@qp6bhwl5de7w>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-14-f6a99cb43a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-glymur-v6-14-f6a99cb43a24@oss.qualcomm.com>
X-Proofpoint-GUID: P3nCMOiarEUvthwuz3DWARmHiSK4CV8k
X-Proofpoint-ORIG-GUID: P3nCMOiarEUvthwuz3DWARmHiSK4CV8k
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a0a0516 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=1OBNivUE3TbfJcvUgGMA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5NyBTYWx0ZWRfX/LsgEg0aCU8l
 0pV2wuq7tWq7gm+jD7gSss4F1LpBqO4peztldolyKw/qDjDreaxOwvTSqU8BYT1l1YFNd25aXje
 969zyFlmh97TkNozQ1a119XYY1dZ/tSDJt8dZo2ouqDW8yEd21YYwNOTy6CQJ5r+aberq1ygm0x
 4t0iFGwPlL7/Cv0xPrpf1c7Ul11+qYicGyAIB38H4CaZKDW4UDkAdjL7H3JSf4xz87uCBHBM1mr
 xxgQwcb6K00JLExlf8dw4EPr+yp7Op2BVnhhkaQgv5f15qDV8w1t06UdrUZQH8BZjDIARmFJyFX
 X2NTJwthjgLRy2+xK2y1uBg6sX+eoF1mi5P3EnNqjuA4raf8jk+Xk0hTFUQlye2ZocHaojsmNvL
 N8OM6f9rjPwzZAvF/PiQH/5LgB4+vSAMTDJaAyhfeuHScl3bpDSI2hFV96iwBW7Got4Qiz8O+bf
 64qdKVvwH8uGcF5sXEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170197

On Fri, May 15, 2026 at 04:51:29PM +0530, Vishnu Reddy wrote:
> The iris hardware block is described in the glymur SoC DTSI, and enabling
> it here allows the media iris driver to probe and use the video codec
> functionality.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index 35aaf09e4e2b..8d6ea857634b 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -198,6 +198,10 @@ ptn3222_1: redriver@47 {
>  	};
>  };
>  
> +&iris {
> +	status = "okay";

Could you please make life of distributions easier and include
firmware-name here?

> +};
> +
>  &mdss {
>  	status = "okay";
>  };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
