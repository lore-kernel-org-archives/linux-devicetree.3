Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F236477990
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491278; cv=none; b=pmq6qmTXVth3eGTBN3PCAmVekA2rt1lJueMP5LOXXFInFWu9NuPs6KjR/44eD7a31laEM5oIMpRhMFtixuh6uKgYLUXnDGs5Jxisme3Up5ZKHdsYGAmWN6JwRoxIKNWGzeVY69RyHcmldE4+H1EoqhUJLXsmiPrlLjkewV4P1zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491278; c=relaxed/simple;
	bh=9+n+K6+F9T18IJNcVM8/gJFzB3IhFzMgRrteXx5TnGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WHEeENWaBWC0Ybs1RMAO9SCi2gNOHi/Sj2AMtKM2guP+5J+G93L+NMExPauwPY8aV5WoBuUIW1PUBJOZEHLfezZmP+s8oSlyXKShMx9c4/pgv+o0eauF0sCb8Ng9THw6WtC7SzyX2h/yeludtnf04+dRuenRQai4TRYSHfnQrn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fr9dezQq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q0+9VeCH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fr9dezQq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q0+9VeCH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653COgLm3077851
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 12:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A8NVRgi0C8volC2nHJt9tGXZ
	IIMUtcoa+sDpiLdYLdM=; b=Fr9dezQqsFVQqD1QlFGT2jHheaHXwsttS5anhtvI
	jl6FSFlDr2ibA55x5kmAZ8D0OvJDFkXkrc9bTaiz11UEqvYv/nkgxWwF1psVtgXS
	5PK6I6r8HcineT5AZZTkRTDa+wJOR2br5m128Nj1EBU2v/pNDulDPHTxSEXZgfVg
	DNYXEUXal6+QJ2Cj+wr0bcSBm0PRMINyRAxBvXO/gY+L6mjtF2GOZVFpC1QZcOZc
	OxSB2pMEm9AhoSHomc3/GlwwIYpqZeT0yOoyEuH4xLXJTU77iIQbD1sDGN3q09OG
	D/RFm5J60KpraDWJQWQv3rTeUZMd1999SYitTohNQc9b0g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabbtht5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 12:54:36 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6ee0bfb5681so646431137.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 05:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780491275; x=1781096075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A8NVRgi0C8volC2nHJt9tGXZIIMUtcoa+sDpiLdYLdM=;
        b=Q0+9VeCHb8753G5z9/BhXPzxO1FUthUx5sWKR4XORRwP8tIVhkaP0A3fShw1LefL/C
         zQIHe4OjOy2wq1ZnXWZ9A5bE9+EaLX6+EU014RTIfjMYjUF3NEhJJV9T7qxOyacIeLVU
         wJmA9dEStOhNj6V1eki96Ez/+qUfNSaVsn7GRYdzC0BBYb22m1eYXvO3dNujeAO+j7X5
         1lS7VLfNEeM7UNKuf85eOabrQ6WpzGgvMfELP+mGsJ9dkDbno2Xo+cD7Oi2XvK7YZW9s
         KInUUtOkyxyt89zJBzvU7qonr4LMlzGz8P0V667sF/iOJDu/p554B/5UzrBqvWv0y1Lj
         1dnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491275; x=1781096075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A8NVRgi0C8volC2nHJt9tGXZIIMUtcoa+sDpiLdYLdM=;
        b=tWXbxovaS/vKv6qvuW9B8E9D5MWfZUR9uNY4h2cc36RtHGnqzWVqIfWj5QgJwhbgUl
         gxUULlncQrj0JKFHW2myj1gBQCtI0LVJwitlriX2TF6FYdFnxXtrbJwka4LTRxdsU0PL
         eXcio7bK/ufcENEsJpuAj14zKQIRoeBVgWsX5NwKIGBp/AmvM4MP/toqfc+5MgTgzHgX
         2NOhD+IQknMWawd86obkZ+nb0olJa699563o8bWtKFG8proe+farUfj/4MP+KExNfLzT
         b9DUyUzHNUDh0GqS0FZnrlGUb0nyyWPy1cV/CQcBOiUrJgiysSgPmzQPzOvznFHcGSdz
         vIYw==
X-Forwarded-Encrypted: i=1; AFNElJ/FzR9tgTUnXr8UkjJhhWS8jaALl9WKH+iWtdoKKrJ/PJ0FV5NvzladX4lPWPgQrSsP8hXejFH7yfZF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0CurJiGGESCQMvtG7TUSmydrmefi8c3WXrcnI9XVPS48QD1G4
	iN0lYxruefixKr35T66Rcdzb7HOVtxi28iWjSkCptrRkmmf7P1XHQzvWrV+X3rJHmAnS16gtYzS
	THgf51rQChgNVbjsS0/4l7P/crToaqthZjSRXFD6dRn2UbLSOdgUvTqx8HeACSg+e
X-Gm-Gg: Acq92OF5XMHkfUdwpGmXBoePViOcwv/lESqi9ryOyZI4EuYAkyI5PgA7yUeJpnFQ1HK
	MaXSSLeH+6p2hA0uzg44rO103GJv/BSAmlFUYYiVtPAp/AUUmk/3QoSNFYc2vIYDCPb3Oo7oVRT
	UIipCswNiFxTiRJZcyVwk3FyzOE4gQh25c1XLDfJE/Q6s6yCYsJOtTicB7oTq+Z9KoFvekOBjVy
	9VbRuHYMJSE2wvjJHZjhCmZegNl5sbiZt+pMsBrwRky2QL1HN/emZ9VKWxfEpqmz7kkS4gI9dF3
	J/GTUaPG2RhhJ+477vd4jOUx/w4UcvCqc0H0yzrJySoV+FtmQEl/ezfJbxWwYKnOp53e3/np8r6
	vbUlKgDU3dGAhmW4VNhGOE+uvxhUc9utTGGmtpwmrJ2W8pp24+1uSK8y4HoOrG48lLnCSYmh8Xn
	XIyloQXn/z0n5lq29ejzYiqIkdqi4zvvyy5FrKtNnvXOQfrg==
X-Received: by 2002:a05:6102:5e97:b0:650:9174:32b with SMTP id ada2fe7eead31-6ec53921cb3mr1486309137.1.1780491275412;
        Wed, 03 Jun 2026 05:54:35 -0700 (PDT)
X-Received: by 2002:a05:6102:5e97:b0:650:9174:32b with SMTP id ada2fe7eead31-6ec53921cb3mr1486295137.1.1780491275012;
        Wed, 03 Jun 2026 05:54:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbe1dsm632104e87.27.2026.06.03.05.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:54:34 -0700 (PDT)
Date: Wed, 3 Jun 2026 15:54:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: milos-nothing-asteroids: Drop simplefb
Message-ID: <hs5roqpupi7svf4pyylvseqx44s6jcwnb4he36psoijjeeizbl@aq3b7k3xffxn>
References: <20260603-asteroids-drop-simplefb-v1-1-34d73477c9d4@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-asteroids-drop-simplefb-v1-1-34d73477c9d4@pm.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEyMyBTYWx0ZWRfX7Q/vfSEtqOuV
 LxhlVP/PRRrI5XtlCQYhxAC9jHbCvmodzg7TPnShxHhoyosG1d2xeTjjJI0nUpShC/2Y0pVYS0W
 dq95BXDMJzE2ed6NRoPlFlFuCAY3JyQoEZVxgRfEoKlCBS6bjfDQNm+us6OtrLZsexct6SsylDG
 cRU0W/9xQC92esJ6llKDXcsjLuKs7BUSt9T2zpbC3zhr7bmr5fI/EnRGOQX4qbzvBE893JW/S+g
 HX11GfJsD0O+3sb6BaMk5g6aKT+Y8yPhoqyElROcV/henf1rFQsFOKx9+dOWI5JJV1TVIVnx8n3
 LynPzmmuz2V+0obD9uN3eEeKZCzF2yznhh60n4FkNEcTGhxJYPFrqmdxiYiDU+JGso1ynSr2ZXr
 Wq+DsFVl0c/YHVm78pPQhAARlDjjYFyegNrKW8BaIDQuTosP8uwQligAgXnRSggP41lCTSqSJNv
 FTQwXoBUeZ8IGhCyAEw==
X-Authority-Analysis: v=2.4 cv=UqZT8ewB c=1 sm=1 tr=0 ts=6a20240c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=k0J_EwETjg03J8eOh8AA:9
 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: -LvQgcvD5r0NrV0Pv3kPCXSgVkEwfOOx
X-Proofpoint-GUID: -LvQgcvD5r0NrV0Pv3kPCXSgVkEwfOOx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030123

On Wed, Jun 03, 2026 at 12:41:34PM +0000, Alexander Koskovich wrote:
> The dummy panel compatible 'boe,bf068mwm-td0' is missing documentation
> and gives a warning. The 'interconnects' property is also missing from
> the binding.
> 
> Dropping the nodes here and will just submit panel binding & driver for
> use with MSM DRM.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  .../boot/dts/qcom/milos-nothing-asteroids.dts      | 38 ----------------------
>  1 file changed, 38 deletions(-)
> 
> @@ -131,15 +107,6 @@ ramoops@81f20000 {
>  			mem-type = <2>;
>  			pmsg-size = <0x200000>;
>  		};
> -
> -		/*
> -		 * ABL is powering down display and controller if this node is
> -		 * not named exactly "splash_region".
> -		 */

You might want to keep this node.

> -		splash_region@e3940000 {
> -			reg = <0x0 0xe3940000 0x0 0x2b00000>;
> -			no-map;
> -		};
>  	};
>  };
>  
> @@ -507,11 +474,6 @@ vreg_l12f: ldo12 {
>  	};
>  };
>  
> -&dispcc {
> -	/* Disable for now so simple-framebuffer continues working */
> -	status = "disabled";
> -};
> -
>  &gcc {
>  	protected-clocks = <GCC_PCIE_1_AUX_CLK>, <GCC_PCIE_1_AUX_CLK_SRC>,
>  			   <GCC_PCIE_1_CFG_AHB_CLK>, <GCC_PCIE_1_MSTR_AXI_CLK>,
> 
> ---
> base-commit: b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17
> change-id: 20260603-asteroids-drop-simplefb-0aeb1d1bbadb
> 
> Best regards,
> -- 
> Alexander Koskovich <akoskovich@pm.me>
> 
> 

-- 
With best wishes
Dmitry
