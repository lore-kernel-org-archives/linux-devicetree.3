Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99313F7E8D
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 11:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042583; cv=none; b=izGua4vEgr9bOd5vNPIGnc/3zSa37ydyBW2vbx3+E3Lk8imS8R+CwtusMhdNsfpEBMF33IO0dzD2kwuUGEAffGw4VSphUr0p0XsAYAW4LVOYac4UCV4kQT0oJEFKWtQT4EIndM0PSqWJZFoSiP9O0sXXlcdx0Y0bytFViaFDopQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042583; c=relaxed/simple;
	bh=HFZIwdjvFCVqlnlKEXL6zunPKCqxEN+rXSac48bmSfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXgRKcrHVrl82QCE12jresm0AYi17Cp8ZvZX3K78DOkfzR/no0VD2qfTLAVhuUuCy8ZKsnZ/LacRmPQlh7HBB3gIFlnXSD2A24LkbyMlMADbNwfo1k16kDJmCRfnOrOxDsYf9xFuu2gK3K1QYJqYIKJ26GRowSAjrxXJ/JLaK+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=COiJk5TM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxoqrHRK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="COiJk5TM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxoqrHRK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6318vFIu1459443
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 11:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EFpGHIloUslqBpn7CjNpb/3m
	u/C+T9TgimU/YhpEbzk=; b=COiJk5TMOFLBEqzniUjNzusOdYWQtG1IrGqUvqLp
	HQgarzGSNzQ17FqSVU28xOmwQwgPvEf1r5ZKrofdFd2yQdempDYH0ZLi5oXLQ+8E
	Xzjf7k2VR5p7pxUpASmVNpjZTYId4nITC3VOBzRzBR3J5Pwk4EL0D2FxY5gVCHyS
	U0DpocZlyJQpmtmM5Ui+8nKpvb6Mp2ywWN8PaXpVulNE+hOuI6prOIgxDYSfdIQZ
	WvDWSFGf6sQzXbpnlI1U6FcU7Mg2L9Q0ssz8/QXo+4J87jenD55Nb4a3NDB2rmvn
	RshsTWpIyRJ4chdh9eXG8rTsta5zWuMp+VWHZEDja98qUA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8uhg1tek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 11:23:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094741c1c1so74149751cf.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 04:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775042581; x=1775647381; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EFpGHIloUslqBpn7CjNpb/3mu/C+T9TgimU/YhpEbzk=;
        b=kxoqrHRKLT0LA9jAf8aftHA+TtHFjYr4fVwmIfg1FFCl45ykjWxJXsS47YxSPpP5ku
         7qRpRh+6IizcgZ/6P5yTzDcfkkGk8KvlHHZFPQn1crG95+lFTR8YEXZ6JxdH5sfZaf0X
         YnKldYIw/+hYZKZQixr4N8p1TcvyhkWhT0l3wMH5HL1E4ztUQiwChYYzoaiOisiV1VV6
         R0zR+2gaUfQ1DxtbYmohvFDwLwRYH0yxd9x0j+jW3AW0c3bsCqt9he1S7IWf5ZOLgeUW
         jkKYjg37sdELYH3XSB/SWc6FDm1IkZlsvRJUaNL6JdR0H/TM2YnE+H5GaD87aPtmnlHJ
         jiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775042581; x=1775647381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFpGHIloUslqBpn7CjNpb/3mu/C+T9TgimU/YhpEbzk=;
        b=eimIQy2nO30y2YtXv87uLSr/Y4L6fZLOaA4E+k1FvVxSS/JK5PFmPdw5XgZ3GdArKt
         b2ZRlE3tdY2h9wBts5lXHNhI3WDxBKCxvAL3ElfR4IKWd8OaVgWlhd0urGzebM7iUKbz
         EsFx0dI50OruYrkkCsVVh2Ad7Ftu7rGh+taPusOsWhf5vbvy6yf6hToZdF7pEosoW4pc
         xKXP1PJjohBW0wppVe9xX3CK3iobIXjmHbq3VZgW5gVKDhGh1nbXqHw0B7Z8BdpMFsD+
         z8qgkGtp9LQPBNjYgiZ0BxF9gT35MHnWC3kFOGq2z+6GhLKe0K1qEhQazAdfaIiONOcI
         UePQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdivVTmYfZp7VbTd8IzSCZ4QqzqCyJ3mfKcEouOoClEXVT4SDNPve/WwSJJIQwKQqWnOE+zmqHPBdB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4pKPd9gRiClP3POvaKr0+lpAHSko4/GcW9efWS8t2Nagx4cDA
	u3QN+p3AFgaTfDXSYC/UffZWQmoIu7mnHRcrcT/aZ/jBEDJF7u+9G3QON+JJMiQRFtGjqFNpd9c
	bx3nCHt77WAD2Ty01K+sRfZXzDFyo9xQ+oTLW5qkD3zupRtFdqLjQulxEh6HzoKzS
X-Gm-Gg: ATEYQzzek2nETMUx1QktB3qLQJNvy5rv6RHlgOztDOWXebz1CGOV7T8Z3ZcaViEkTus
	nE+oB4MgSF/PuevYFh4EKzS4+lyaVUY9lnZq1gkYp40b5pobXYuUAIMXY9aQ14gPWh4vVZnfL13
	zWAe30PS9Z0Y3CUEZX9E0bTjiXXWxVQ9JrZSjbDxsIYXNcmOpiDh5wR7X3k5/OsjaMQLBWBx9yV
	nwcTATwovF61vZc+zgtTRxgVXx2HPOAUxupLNImwxMs9i9oWzMsMGDTSTQXa9KGrYJbRobtsTvJ
	KyaEMoQskfj+bWXpxBKpaMirBiK4qKjOB2cLZyyTGIOm80p5cSgz0k2zsgRHHegZjnJcYyNYR0O
	bCYqnJ/innjkz+1Anww+AFGtjgcuAx2j6YnNC80TV2+aylDtoxqBuNRBonv/A1Xpvh9TwWmoHTs
	w7QgeGdreUfdmwyxysIOGJ0q/f76OkPrDT8FY=
X-Received: by 2002:a05:622a:1244:b0:50b:3f09:1942 with SMTP id d75a77b69052e-50d3be2799dmr42181591cf.66.1775042580905;
        Wed, 01 Apr 2026 04:23:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1244:b0:50b:3f09:1942 with SMTP id d75a77b69052e-50d3be2799dmr42181191cf.66.1775042580471;
        Wed, 01 Apr 2026 04:23:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c0b817e2sm930683e87.59.2026.04.01.04.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:22:59 -0700 (PDT)
Date: Wed, 1 Apr 2026 14:22:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com
Subject: Re: [PATCH 2/2] spmi: spmi-pmic-arb: add support for PMIC arbiter
 v8.5
Message-ID: <mxawruvb2p6svks3y4rab7feyn4dhkwe6dosjyc6yt2ozdaual@bvvof6rzm3jo>
References: <20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com>
 <20260401-hawi-spmi-v1-2-c40963041078@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-hawi-spmi-v1-2-c40963041078@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwNCBTYWx0ZWRfXw6u5ZMoRbiRm
 TXvez/aFgDXpLroS1stMKuJ62aV8/T4hkCbRRQ3AZYiXsBfeak3bAgJxLUUyynFSoPaC+WGI+eC
 /OnNfxuqNeaSHIS/tKMSUuYlQCOqa/flrPS6OQ5mW4B5y2GjOYj4X0nvkv+H3O6oK5eqtN4X2Uh
 K/HEYzZRSdyP0f62oPa/Cku2B0kcVAqcjanASPPmTSj7VeAk/KK2VtnappjGE2mO/nttqLUiSqe
 /hCAbGGEPY/gtIe4Sm3m6tiy55EnhqCmnjlm3zZU/bobSp2gLudlYJIW7xKakvXBW+PyrmVGZY4
 eWaS25bBgj4rI0vf15Unwtoh8u/9nNh3469VNS807G1KjVW2p7PkM295FHpff59qKFZpLxKiIm+
 UyBkQAKr3V2QVa4ko/j0EUIEmlHPMCf8ppGp7zyY9i6IjdCm08jQZzWJ43O48DA+F9WaFk6KY+e
 L2qcteDMsB28qIe/GCA==
X-Authority-Analysis: v=2.4 cv=YcawJgRf c=1 sm=1 tr=0 ts=69cd0015 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=8M53x7_Y370lfPAVnkgA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: xBQFJXy7rh9YiBDktqiKfwita38xiuOJ
X-Proofpoint-ORIG-GUID: xBQFJXy7rh9YiBDktqiKfwita38xiuOJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010104

On Wed, Apr 01, 2026 at 02:41:24AM -0700, Fenglin Wu wrote:
> PMIC arbiter v8.5 is an extension of PMIC arbiter v8 that updated
> the definition of the channel status register bit fields. Add support
> to handle this difference.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/spmi/spmi-pmic-arb.c | 69 ++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 60 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> index 69f8d456324a..deeaa39bb647 100644
> --- a/drivers/spmi/spmi-pmic-arb.c
> +++ b/drivers/spmi/spmi-pmic-arb.c
> @@ -28,6 +28,7 @@
>  #define PMIC_ARB_VERSION_V5_MIN		0x50000000
>  #define PMIC_ARB_VERSION_V7_MIN		0x70000000
>  #define PMIC_ARB_VERSION_V8_MIN		0x80000000
> +#define PMIC_ARB_VERSION_V8P5_MIN	0x80050000
>  #define PMIC_ARB_INT_EN			0x0004
>  
>  #define PMIC_ARB_FEATURES		0x0004
> @@ -63,11 +64,34 @@
>  #define SPMI_OWNERSHIP_PERIPH2OWNER(X)	((X) & 0x7)
>  
>  /* Channel Status fields */
> -enum pmic_arb_chnl_status {
> -	PMIC_ARB_STATUS_DONE	= BIT(0),
> -	PMIC_ARB_STATUS_FAILURE	= BIT(1),
> -	PMIC_ARB_STATUS_DENIED	= BIT(2),
> -	PMIC_ARB_STATUS_DROPPED	= BIT(3),
> +struct pmic_arb_chnl_status_mask {
> +	u8	done;
> +	u8	failure;
> +	u8	crc;
> +	u8	parity;
> +	u8	nack;
> +	u8	denied;
> +	u8	dropped;
> +};
> +
> +static const struct pmic_arb_chnl_status_mask chnl_status_mask = {
> +	.done		= BIT(0),
> +	.failure	= BIT(1),
> +	.crc		= 0,
> +	.parity		= 0,
> +	.nack		= 0,
> +	.denied		= BIT(2),
> +	.dropped	= BIT(3),
> +};
> +
> +static const struct pmic_arb_chnl_status_mask chnl_status_mask_v8p5 = {
> +	.done		= BIT(0),
> +	.failure	= BIT(1),
> +	.crc		= BIT(2),
> +	.parity		= BIT(3),
> +	.nack		= BIT(4),
> +	.denied		= BIT(5),
> +	.dropped	= BIT(6),

Would it be better to extract generation-specific callback to decode the
error rather than defining the list of masks?

>  };
>  
>  /* Command register fields */

-- 
With best wishes
Dmitry
