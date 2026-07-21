Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5BC43E9FD
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672503; cv=none; b=gpALpR5Xsf25opq5kLWhgReiUIKRMjYwph4LFAoGYogbVV9Fy0vKV4kGvBhGjqJkkXFkGniLX6f1krVYWcq772cTx8e1cjnxYTBFo8cBoj7dVrnx8J+d+d7rfDblLOcA2eJXrqmijotdmg74tlBgWIOFGOHKodOPpfqkEw+Ji6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672503; c=relaxed/simple;
	bh=R/Zzp28ZXI4WEznc4Z3EySfdvh0us080PPtKrUuFp1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eiZbkajhxabGoVu6A6IB+zOtqPObhJDCCV3TkATiI8dX7TtAHSkAaCvK7sLJ1nPN4EdqZgXME5WuNJNqI+JIbqqepLvp6Q+m+J7k/9/jW4PWvleQXz0Zk6rrP3N/+Ntl3A138dRn6Dogb1+UDx12KjyfEJKZ2/th+10QnYzXplQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cMmXF/mU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ig6CSeiC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cMmXF/mU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ig6CSeiC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKlYtu2903790
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B4vjMLPJ5NAnEPS3jE48/Xhx
	Su+zIG0VlixIejSSPxQ=; b=cMmXF/mU9QgYSLuwy6kwoXFZLSphgeqaGXDRr9Q0
	2dk/35YQnN+jvy7Zqvv9Ec99pR/1is3GnSsN2gQSb9H0SDqHCutWvGbQevn8HdBx
	ioUcMXKuYNHgVPJZjyD7V3vJlPNc7l6TpCRz2U5BzIUOjI6bX5B7AFXjTvgNXVu1
	nLpnE9wDFsLwPtmXhjeY64b8HdeYTdIY+idV5ez5EffJxRsx65A8b0VVamPlo9uO
	JNXOL64tW6OD2AiY59Zykvxle9IHm037LB/Vf7CFDCEzaDPBBuJoo4P7hSXCQ3Pr
	IaGJqmSXOSLomP3K3VfY273fl0xar1GBsPKIxZ5aNsKE2Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d13q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:21:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0199faafso181520551cf.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784672500; x=1785277300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B4vjMLPJ5NAnEPS3jE48/XhxSu+zIG0VlixIejSSPxQ=;
        b=Ig6CSeiCFal6WphazNl/XM5aiNqIibENKvJ7tg7dWulKPIvG7B7r4L7dnFrC4cvC6O
         0XJqk32K42Cc/U6Dj56tECcHHxihUgVO+XcIYDoPzFsI1wUZAELomUVNOyEQViJp51Kf
         NwFna3XsMFMETbvPFCGs4RlwrJE6S/Q9AxC1YKamndeV7zbOcWSEXUBXR3vELWpvoFQ3
         ohqH/SSIMHZmT+ZmvY+0+R79SXPSJlXz28SAGenaxtG70rtlpjRlhETPbsWpLoS1/KSd
         oRRlc5H/NUBlWO+1Fn44CtvjhoxKDQWnTuX9P8blK0Saqpo8YqfZaXw00STAIchL+TaM
         uIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784672500; x=1785277300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B4vjMLPJ5NAnEPS3jE48/XhxSu+zIG0VlixIejSSPxQ=;
        b=XbNzmsxwNCSXWJRiOw3yEP57svTiZ/RYLxXSncTGgkk3TcZIDxoUhTxk+TFL7gg8uv
         smtvgAChNXJVjwtZPfiSB8lxiAKysCkaAzkmd98tW/cxyhKzAK/SObTaP0EtHjnxK6GH
         E9Zw3y7kVulp+4ah6HmTV4S8/+FKq5SI+tur4WYr2nHIJqlvhP5n9WZ8HHIjESsTh1mf
         9AB0XY09aXt20vB000QvaugmeB8JKl7DekASxxx0rYNw0B2buxKdBrPmAJiJzcGDj5jC
         oegfKcKPec6sbbCpmM/aclYqtYrfJ/XBLtPjd4xecpxQGHrFjbycuDq/bzzG3iNi3jdd
         Hy4g==
X-Forwarded-Encrypted: i=1; AHgh+RoigD7URKpioHBZ8TaXekNqbb8ukFBmUaQE8rCOeImk8JYUaPFEYMGXWx/cTLSaSzljdtantdXg+Zk5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2w9zkANOoGJRzr78WJTj0nc8JvhELHBAk1Ojx2FuRz0B77k94
	3RNMyHNqH7sHodLy/+k0T0LUFspMn0iQHF7D+czuBbnUZV8Rc7fXw83jTl2vJzcsBfVsv2tbv9I
	lPe0wNOmDWnM7YPhH+mRRG5wHqUSi0AYGWfab56A0PtrAnFD0PoK8BC/BsqoB9JCv
X-Gm-Gg: AfdE7cnrnoXaDkaZ/RpGzdpXhSq/1D3Rx2r1Dyuf8HdkNfw/duidloG4GHNufmcNNnr
	V8FfwGzK6TIX8m7O9oxc/bTC4PPS/iYPjkGzGLZXP8JprWrcEwZNBPpze2biCPd8ZlaTK09mY8i
	02/BHoDlo4MlbSSyqD7RSzZA+/BNchYQKJa3S2ls7HhnI9omWxCfBzS+swHwI74ZNIdwS1iCFzP
	OWByLVQ73Ca03s7hOQdhAwlhpb0P9nmFH6aY65eCaPwbiO4NZTa8s/rdod8V3qRU8WCOffzIjlK
	tAvB46kci7D8frEIvn3wwZQE+ikr4ff5ncJYCS4yNCj7QAjdG5HMx3fz2JG1Sh6e7FQlyccyAxL
	S09qc/Wwz2d5u1mekghudyFp7bnGKI3m96EMhTR3E64xOjXsq8oDY37RIevZp2Yh2L0+6iuwCSP
	Ck4FQRef3BrQycxw==
X-Received: by 2002:a05:622a:306:b0:51b:fca2:af71 with SMTP id d75a77b69052e-5213e28f185mr198251801cf.42.1784672500125;
        Tue, 21 Jul 2026 15:21:40 -0700 (PDT)
X-Received: by 2002:a05:622a:306:b0:51b:fca2:af71 with SMTP id d75a77b69052e-5213e28f185mr198251431cf.42.1784672499566;
        Tue, 21 Jul 2026 15:21:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9e44b97sm136668e87.61.2026.07.21.15.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:21:37 -0700 (PDT)
Date: Wed, 22 Jul 2026 01:21:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] arm64: dts: qcom: agatti: Do not mark MPM as power
 domain
Message-ID: <uhpxceqh5xafvnxvzi22fvifsczzdom73sew3dy3oedrhggzau@ygovn2qjy4s3>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-6-3d858df2cbbf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-6-3d858df2cbbf@oss.qualcomm.com>
X-Proofpoint-GUID: xzrSIqwxj0b-W_xkDrG9e9WNuUASU4K0
X-Proofpoint-ORIG-GUID: xzrSIqwxj0b-W_xkDrG9e9WNuUASU4K0
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a5ff0f4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=13kYkAZBl8qwplEETVoA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzMSBTYWx0ZWRfX5a+PDK+r2Vwv
 XgByNrUfV4Xjow5ypiB6GCT2eEV7RKbwLF7rN9q3TYKe0Zfz1vEjfgbA/p7GCGuGJwGHeckryC9
 bIcU4UXbMwXwcmKON5LMTr77N/uJAd457zrh7pu9jQlgsxVHISoFXSUaiQWDXYb+Gq25tI+aIhn
 2iRee1wmyX2/QxCQqXFmnynoyWpU3IhKoxxJ5A5fCsgOTKWoW45C/JCwIfEgPZ57bBKXKzc9ZOe
 YZQXxkV/yuTxL+RFVBIEZ7MfrZayrp4TqrnkX6CNBkp4EPCqtQ5Oyx1HFQvcgfQbVE89EzR9998
 WGWW5iCrKS72zZgWCb7VQmcbiiTsEWLXTx0W3zYkwHPNIUSiFnzLHQ6RgAtruMGzePVZrPVSAsv
 rae5dF+9pfUb2P23x6L8FGHNgLLIbWsE0D5AserRL/qaHhm5kavjgIJIs29vbnxG/z8cM0x4SGf
 4ZuO+XFf2SnbjLeSobA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzMSBTYWx0ZWRfXwi9sfkdWi9WI
 Twg9j5Up/C4RETMwJGWPkRQGa0Hi60ch1uCpAK4kSACytJ9Qw3ZKW9K1TqKBjJ+H+y/EaN2GXUz
 jjU0NgptZD4LKh39oachiReyiLtjQXI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210231

On Mon, Jul 13, 2026 at 03:55:46PM +0530, Sneh Mankad wrote:
> Do not mark MPM device as power domain since it leads to idle-states init
> failure because of probe dependencies.
> 
> CPU cluster power domain node is kept disabled and hence CPU cluster will
> never power collapse. Do not register MPM under it in this case.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
> index 8a7337239b1ebe2c40d64ed670752a680085b871..05505dc3b400e923a574bc89ec9a8e7382ab803a 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -205,7 +205,6 @@ cpu_pd3: power-domain-cpu3 {
>  
>  		cluster_pd: power-domain-cpu-cluster {
>  			#power-domain-cells = <0>;
> -			power-domains = <&mpm>;
>  			domain-idle-states = <&cluster_sleep>;
>  		};
>  	};
> @@ -281,7 +280,6 @@ mpm: interrupt-controller {
>  			mboxes = <&apcs_glb 1>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> -			#power-domain-cells = <0>;

Replace it with power-domains

>  			interrupt-parent = <&intc>;
>  			qcom,mpm-pin-count = <96>;
>  			qcom,mpm-pin-map = <2 275>,  /* TSENS0 uplow */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
