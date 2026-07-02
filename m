Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3944274B32
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 13:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782997310; cv=none; b=F+iEcLchencORB2KuOcbiPCZVIWv1lZCIJc4sBVKfZ+NK4Gr9VYsSk7qYwH3lVbYo+eLBZ9H0DpghVGv68KEd5mzj8+yB0O+9zLb0G06P20DeiHNq6X7zpQtJgDHoK7IWkTUafF6PkC17opgNUPzidMacGXLsokGkuV5Zk2SQJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782997310; c=relaxed/simple;
	bh=ezLOtxWqKn29poR3EbKSCjTs8hzTE/3uKWAQhVGNsNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVDffol0zVC/k3DDpRzaC06dOO+bLXTR3+Pgp8k+D8ufEYY1wJ15onB6y07tuYyvyaAqRJxudcAP0K7PlSYVOokrPOkU6MDBLC3zQIGGxASjSincVYWO3gr496riVBjWGLjZLoUuHcrdkU+42Qi+0bHTSHhi1Q7goUnNl3mhlsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QrytFl/T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VWNUzpLt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QrytFl/T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VWNUzpLt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662D0Ypc417130
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 13:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8O20KImHQpmmLRgmOVM4WWfT
	ZSqB/dhjPfVMqyEC+IY=; b=QrytFl/TK8VegvviFSMz87RhVvK+2Hh1LCJaJBhC
	EUF7H/00g5YePMfNI3JTaHZEDKdwruVEUb9bSO7tiGikMoja4laZkI1toPWMyVmQ
	KSLV+nMC3EgsOJLetSMt9SiDBhJZqZ1eNVcft1BzVLhuMyGfezSquHgqBbE9Fx1f
	4O8zSpr+6aD83cz8IQ97p9YeC+3jOsRB8lYqhju1fwRz6vEW2khG32WoasGIUp7M
	NXpI5uIIza7tY+Ro0vasJRLnfPOgHVqIL5v9DaZ/kznhyIE9kzhQssrbAmUK1hji
	eZb6VjRFnTaWgX6kZenIgjTDplMRA12dKx/kQtaUg1Up0w==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9bgtt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 13:01:48 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4960f0d30b9so2136366b6e.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 06:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782997307; x=1783602107; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8O20KImHQpmmLRgmOVM4WWfTZSqB/dhjPfVMqyEC+IY=;
        b=VWNUzpLtHe1kmYk6uEWaYzqjwNGJ6I/R5AJPXsV8eH68524+p/062MpoCHFjWoc4un
         f2h/jPuTn+D+OXI0cXrlMs8bexA1oJ5jIYe9in+DJjIks46vDDVtelBElggZIQLElvE8
         ag+vfY5jYQSQFLY40SMUG3p5dGyN91bmuSlmMtEo5o2T9nBdUuuD67f8EhwdL1Bzt105
         7klSQ6XZaPWUZdM3mr2AfkC5KHt7kNbQPtqX0lIfR0Sj9t2VYVKcB7qpjGVwIjuRcvyo
         rIrwbJm2ILqoYtzuCPZVJX8WwUKJPUJUzqIvnnhSEA5eKLrWOyqhv3YCQ4wWG3T57X3n
         Hqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782997307; x=1783602107;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8O20KImHQpmmLRgmOVM4WWfTZSqB/dhjPfVMqyEC+IY=;
        b=Ah5GuYsN6g06iN+I0Z0A52sBFjqOByWXFI6k+MqTJ/AZLlUlxN40KTnl5ZnF3crVcc
         fOZZrN/Y/msdd+qtNcf7Fu75z/OkICFvEZCgqjz5L/QGP7zcu3zIyFCnMYYsLUaJ3JVH
         MILPP/nlLcR9JNudQZRywA3ZOgecuD3PXjid2QhkXUYDcxGcyJiYLs6jw+jvblzvKeYV
         huS1toXQfBNySvz20x46zeICYSJDUbBB1G2dhp0hlspWhPnfvvO9ELfLE5C2ILzMpdag
         49AKjw+dC5oal1GcXvC6LDcG2N6Nu1mDo9NK7a8yl4lxxNqKEgXifTtGo1Vr+aw4pSSy
         cCWA==
X-Forwarded-Encrypted: i=1; AFNElJ/nzhU0WxJalG0/djdyzPp4FfgEDWv1hCJW4a56t7JcO2zF+FAXzIGDue+LmTKS6lj0CluZhjZj+eUl@vger.kernel.org
X-Gm-Message-State: AOJu0YxrCA6dzKGGoFfygFfsxZaApOuRarUrA5AlIPbvC9ois0Itu6Y1
	KdOZYye6zpupM3EkmSWtO/KWrCQuGeYCyH1Fu01fsewz4M9vZMeIqWMg/Yv3k3ksVxkm/pgZvhS
	2lMUnqys1hp37yyOjLh+DyrDUSGOblW34fkqle3sGtELv9Vryp+3OPcaIEIiFfC87
X-Gm-Gg: AfdE7cnjxRhBpJuZvxcBWT+9MJwwd3PxjHSNjGt+4+tBMSUwtoPZZ4JFfLCObFBkDTo
	iO4Kzm+tVVyPcfsZPaaOOkwtO3og5LvcqEzZgFE69yMI4pafvqUUxsqlykRLOYYuvtvv6TOfoyH
	tIl6K8A56BqDWzwCbseRXxVZmKp78JYL7ACYaRzvB5qL9ktLr7uG9Ez98qJjeQCUmrUCAopDX5U
	6lJYstc4ikrUAcK/YIRBAZDrZZjVoLqtj7rypVKsGFgC2UnEwxCC8V7nNf+99IZEUiGlcmMR3wf
	3n7bUiOhMmKp1y/TNt2XHyozxfIJZUxiw08gWFm31ijYay5Vd1KhWdfAGKSETbtSEOfO/1ay79A
	HMpHDXje7f770suWpsyLBA+hxcHBarRK7mEhk2pq5A3a26kGU3rlSSIj2MGC2bCJW/MMv5cI9mt
	C+zrpf+eRbeJKjLU9jgk6CzmsU
X-Received: by 2002:a05:6808:c3cb:b0:489:9e32:16f7 with SMTP id 5614622812f47-4960f12eadcmr4022627b6e.39.1782997307234;
        Thu, 02 Jul 2026 06:01:47 -0700 (PDT)
X-Received: by 2002:a05:6808:c3cb:b0:489:9e32:16f7 with SMTP id 5614622812f47-4960f12eadcmr4022557b6e.39.1782997306567;
        Thu, 02 Jul 2026 06:01:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b430e7725sm895821fa.19.2026.07.02.06.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 06:01:45 -0700 (PDT)
Date: Thu, 2 Jul 2026 16:01:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Fix pm4125 vbus regulator
 compatible and constraints
Message-ID: <f5ltrexhy7ggnchlhpjax5xojowr6f6m25v6wgdcbgyijrigo7@p73yy57jan2i>
References: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
 <20260701-add_pm4125-vbus-reg-v2-3-6bac2bac7131@oss.qualcomm.com>
 <83cdc9dd-65d2-48c0-b172-d66f513b9c74@oss.qualcomm.com>
 <20260702073321.xsyu33rxtrku2xdn@hu-kotarake-hyd.qualcomm.com>
 <4ab24c54-5e37-48df-a410-8fae6d7b5289@oss.qualcomm.com>
 <20260702124331.pogzemduzwv25pau@hu-kotarake-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702124331.pogzemduzwv25pau@hu-kotarake-hyd.qualcomm.com>
X-Proofpoint-ORIG-GUID: F6flC6G31hPQvAzYTrkHUKp4KOI1vIBg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzNiBTYWx0ZWRfX1ieFlZijo9MX
 aoqcgYfbdxGg0IGXyJDU4qnJrVBAS+azr+lM9yO/4U4Upkq3g6HDRfPWWc+JenufrJ4L8Zw9VsD
 uG+Cjrr6XB1ocCFSCOZUhzTzELpiggs=
X-Proofpoint-GUID: F6flC6G31hPQvAzYTrkHUKp4KOI1vIBg
X-Authority-Analysis: v=2.4 cv=bOom5v+Z c=1 sm=1 tr=0 ts=6a46613c cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=t5tVnjamzBmkMDoTyUMA:9 a=CjuIK1q_8ugA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzNiBTYWx0ZWRfX7A6bVfQX4mBv
 T5F1JlcWJ4JtyWv4OTkDC9EJt9dWB3UxNmzBVurZnEBvqzRtX3KdN2d+UyICnqzSTfBd0nJClVc
 nbJDUychpNENXh4dTgqxO4r4GYbSjfvDSRN6+5RppbGVO++n0O2qfNYYIQihVq5u29PLRL8kA6A
 pAT3bmVOd0q1hWLLKKCvBzZlrBBGqQDKM7EVOJv9t6CFb3whI92ANq/lsazGRUSh4396ipJOG1U
 24Ub8ZJHZiQP4qwmZWheLO+54024znlH4kgMpvB6IdteaybcRhh1L1ez1S+B9T/HRyZyeHXDt3i
 VmzalYLMPHf7oYj4YM0oXSiNox15NGxd1f+MubQ/eAeXMB0uxiKgmwUM7iPm7Da3qXgPwwmStwB
 4zK8BzXNedn+0m88MN12/t5TZapvvL+npYMNyOU9wS3Ve8sqjtotvJhznEpbp2aTSrOS+GhIl/G
 Gvl5TVhrKf/ya8DJmSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020136

On Thu, Jul 02, 2026 at 06:13:31PM +0530, Rakesh Kota wrote:
> On Thu, Jul 02, 2026 at 02:07:12PM +0200, Konrad Dybcio wrote:
> > On 7/2/26 9:33 AM, Rakesh Kota wrote:
> > > On Wed, Jul 01, 2026 at 01:26:11PM +0200, Konrad Dybcio wrote:
> > >> On 7/1/26 12:28 PM, Rakesh Kota wrote:
> > >>> Remove pm8150b fallback compatible from pm4125_vbus and fix regulator
> > >>> constraints in qrb2210 DTS files to use microvolt instead of
> > >>> microamp.
> > >>>
> > >>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > >>> ---
> > >>>  arch/arm64/boot/dts/qcom/pm4125.dtsi               | 2 +-
> > >>>  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 4 ++--
> > >>>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 4 ++--
> > >>>  3 files changed, 5 insertions(+), 5 deletions(-)
> > >>>
> > >>> diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
> > >>> index 542e8fe030da40dfefc7b744dcc30133fdb35e74..3dc8d667d091ceb4267081d32b7aae983fc25071 100644
> > >>> --- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
> > >>> +++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
> > >>> @@ -37,7 +37,7 @@ pm4125_resin: resin {
> > >>>  		};
> > >>>  
> > >>>  		pm4125_vbus: usb-vbus-regulator@1100 {
> > >>> -			compatible = "qcom,pm4125-vbus-reg", "qcom,pm8150b-vbus-reg";
> > >>> +			compatible = "qcom,pm4125-vbus-reg";
> > >>>  			reg = <0x1100>;
> > >>>  			status = "disabled";
> > >>>  		};
> > >>> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> > >>> index bf088fa9807f040f0c8f405f9111b01790b09377..2b50f3f577577d30a87fcb6466c7d7690270aaa3 100644
> > >>> --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> > >>> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> > >>> @@ -235,8 +235,8 @@ &mdss_dsi0_phy {
> > >>>  };
> > >>>  
> > >>>  &pm4125_vbus {
> > >>> -	regulator-min-microamp = <500000>;
> > >>> -	regulator-max-microamp = <500000>;
> > >>> +	regulator-min-microvolt = <4250000>;
> > >>> +	regulator-max-microvolt = <5000000>;
> > >>
> > >> Perhaps that's a stupid question, but is there any good reason to
> > >> not just keep it at 5V if enabled?
> > >>
> > > We could hardcode 5V, but keeping the range allows clients to select a
> > > lower voltage if needed. The driver supports voltage selection per use
> > > case, so hardcoding 5V would restrict that flexibility.
> > 
> > I'm trying to understand if this would ever happen in practice
> >
> Fair point.The dependent client here is the one connecting the USB
> device to the Host. We don't have a concrete example today, but the
> voltage range is kept flexible to avoid restricting future use cases.
> That said, if 5V is the agreed practical default, we're open to
> hardcoding it for simplicity.

Moreover, I think current configuration can end up with the regulator
being set to 4.25V and thus undervolting connected devices.

-- 
With best wishes
Dmitry
