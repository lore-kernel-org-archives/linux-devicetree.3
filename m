Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11EA43F4BA
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784669886; cv=none; b=YWKrpQadfTRa+yvgH+/QWDVCIZEfqzk6sLJKpfQcHUlprmFi6E9TeUuagdjI9KionmEt/FAonhQikF1y9fDpBjEqrh8WXG4f001h+vrVRKi1ytME4tnRni2tVRqPiW+4Imr+wadfAS+sRwjjY2awlrxoAqXqb3uMaNlIiPOAuew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784669886; c=relaxed/simple;
	bh=4Vc4LLoXb8IdFlbthM8VmyQ/2GF8tCJAvXydwEaK8k4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bd9V7CM2PiFFrAPcqej+7dmsIKQesSFFwHB9jB50gQmrmfojsunjQiNaIJflFQDqAPRFVsUgsl/nAhW3+otPS1yQ0fFCcp5Rz31zm1LQM3UQy8ZedWZv1brAvnjQq/uw0haSaKDiXoTeklx+DU3sOui+9a7T1m/o+poP1Vk6Hcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JF+08X0L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M0wigpz5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JF+08X0L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M0wigpz5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKmHt02952862
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ok9fniegEQfDj1/O2qO8zWDl
	AsO/LiCXdrMzntWc0G0=; b=JF+08X0LVz766AYEYWpO/zBAVP2Cf3PfIP/xm8yu
	7eAklh7Udbiuv6LmDxn3arDOIt861pmLNa8p7L/GrkxcUEduZuBP5g/A3sRFFoIQ
	WRHn+26XYfBoVPNrBkNkmn0/o1+fSQE9hXMXUfxtL9n4HRDjr70+SxCwAdQAaS+S
	vDTzQ8ub4TDGgrgOF6DTtdnMnNIuPu2SI89QYGCGgsAHQqe+xEjpLhd/AzQj5MLy
	LyWLKxUt6EV9lnoWWA+eJEs5KHb2d7yxOnqKgi03SReH/LH5dX5yodZ8LZdNNjfP
	BhdsXKdlWWJm+1gb6VOlTRBe2EuR/VPqbtnYcumApI7r4A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d9092-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:37:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52769fc3f2eso13662721cf.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784669877; x=1785274677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ok9fniegEQfDj1/O2qO8zWDlAsO/LiCXdrMzntWc0G0=;
        b=M0wigpz55XAZXarqd8GJ+p9EDNrRHZZ/vfEgQZ8xKcJMQ0udtcsoZaa6XrAyytP/Cn
         WUHy4fhfziTdgMDWcaju3FxD4NY6xzSvoMwsxqchRvnsPBWUlnfuhyktO5Y8GbqnTOig
         0yxCTk2FFrWUt4Rgt00Ea4cHQXnOn4j9qlUadxwd3IBvCp/v+YsXJO0IQs5vur0jb3vR
         E7sIblG92v+9kLUOnv9f4QjHdByMfDPxDrrFmRBaTDjEL6FkQEJ6GowuFSG2p/fHH5mF
         7PUmChrrA7bwbW+Q7vE29yRgSiopCqWsDqMboHoizWhDbYhAxdmHs1rUmkDhlcJgTedY
         lb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784669877; x=1785274677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ok9fniegEQfDj1/O2qO8zWDlAsO/LiCXdrMzntWc0G0=;
        b=R9pi+W8d1+McBO28GvBjKSmMXQQkb9YbjpLVTyDKNp+DWJBgLOY56k4oZznNjdY4Uz
         BI6z3ql0Lbx9COwdt49vK2Vd+0UqAINnbgoFSfHjn6bVJfYRnSI930UUsPCvywJOMd2I
         Xy7Z83i8hBvt4CkpNyEvf1eY8OdwYimCjXjJMAuu567Vpp62AX+EDozEa5+t+6tPkGyJ
         9JSFSLp8t0QsYewBatvLXBsZUzG7lv9T+xhjPZV546eZwL08dAyC02LvomnuRmcW9ZIr
         /eJFPWEH1sRK2f+Cj/Vf3E3ABtOXq0C+oKtSAU8AEXr0Q/aOxi3k8DjQex4YuIlFReZU
         gXvg==
X-Forwarded-Encrypted: i=1; AHgh+Rp9exhpMEFDVHRBDH6ThiYGRVj73i3jJrIfqKxWb3lWfBf5jUeAMue7ZOOZEwKcugSuLpjCoR96ZDIX@vger.kernel.org
X-Gm-Message-State: AOJu0YzAWitQ+aQYr6XSvG5bHyb/8N1rSBhWIJVE8LmVQrPtCShHCyCr
	jEBhwFLz1fXdCLXNWVepOYIkIYDc+0k2ZAvR12jT6Aw2rfKnNI+xWbqG19e62WIEqOsjs6bwbxy
	0Ei0cNcnpLjyE1dDU7Ytx9QJjW0q2pSVTzn4+hfe5jNlkqu8VmQlgRyydYeSsd2Oj
X-Gm-Gg: AfdE7cmGiN7LebwQmaYF7Z6gbXaknuyjAfKf/Qx2UQVhTGWYuppx849HwwrBqu2PzUt
	pbQHi2vZWlZAW45ZqYSXhlsxcHDWGCyn6aZyC+CabunCtAKUarrcwjH2yB5XGMt4izlgawz4POt
	jf1ngk73uy0bSE5SKSFCgl8kXEsCvOou2C+YpLcVkrYYdMgPXLbHEvW4ULtlB5rn9CkYJ0y/0Xw
	AA+u+eaVA1Z2C5CRGNLFfsDmpL1H9GTgAKW/Jv4R72hPA34XfCBx7PkZ3BhleZnFkT0v71Nxdvk
	e/u8Q4mS6SdIkkWyW+o15JYdyaoFvsUKD4F42CzzwanKhjUKkmlG+Iig9edDDEbxDe4HBbb6yD6
	toP8sXEXCSgaYZBx7jNazyFGcU/CbySk4kJ7LpDMlwoEde++RjHgR33JsksC6OGlZV6udTOUxWy
	HNtl3MbdRvVpgaWA==
X-Received: by 2002:a05:622a:1307:b0:51c:73f:e3a7 with SMTP id d75a77b69052e-5213c9db3f6mr193033951cf.26.1784669876588;
        Tue, 21 Jul 2026 14:37:56 -0700 (PDT)
X-Received: by 2002:a05:622a:1307:b0:51c:73f:e3a7 with SMTP id d75a77b69052e-5213c9db3f6mr193033611cf.26.1784669875964;
        Tue, 21 Jul 2026 14:37:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d30d9asm128181e87.44.2026.07.21.14.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:37:53 -0700 (PDT)
Date: Wed, 22 Jul 2026 00:37:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: Enable USB controllers on
 Shikra CQS platform
Message-ID: <mh63jqjocq2mm6h5dpqck6okfmsugjg7frrehmd5t6f3mynojc@tpfnitctm6ye>
References: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
 <20260721-usb-shikra-dt-v4-v4-2-2e7a092d7f27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-usb-shikra-dt-v4-v4-2-2e7a092d7f27@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIyNCBTYWx0ZWRfX8RVZcxvWszg6
 lqRGFDjGewb+qGP2GY2F1Dc16QFExXk+HT8AVJBaxnOQx25M19qALYxneuDHhanzMuBOibcojv3
 5LStVJEHUSML9beOf01YjkZaLynoJh4=
X-Authority-Analysis: v=2.4 cv=Ipsutr/g c=1 sm=1 tr=0 ts=6a5fe6b5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=J2N_nXOhfcilw9lcM9MA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIyNCBTYWx0ZWRfX4lcFJyO45oP1
 pjDpmIvoU/Ih2iAWdP5vcb5Ke/mfPnLJcaO1eeewGHiHMVQJniQ9j6XVjYHdkpJi26HJgaQrLwe
 M9CwhS8T4gxicMGebj1DVGnh5yFRuf58FWnmTIOorz2Y8WomY94Kg5BH2z3kLb4OpQPyh1+fYVw
 EnxbJYcEMjgZzeJo6mb9O60wVy4jLZSEAbXlm8ePIx1IAepmIH/sycrPKZslUySgSvndpZMzlCO
 tCf6ad3zhRLcAc6qGoFLHgEMOw9yrM81kkMgQumNPY8uVozhnkGtSAFIk/RKB+C/LgjBZMLtGu/
 p4xkgwi1lpwNYMsPA3JKgMqXVF9/YokeL9X6Gj/AA/+jduuzGz8LjHmTTBCEFHxe7+sUQXRYw8S
 VUR/lyZ4T2zZx026IuLCrnkmPirpS4xaQjFWpZRpgqXVH6YHFpVMgOY+iUy+Dn2wbndOt5wrQyP
 C7nNFS2UmKPLGYoEFtQ==
X-Proofpoint-GUID: F3wwBDeGXv0w7QagIZ1mn6Iq7C8976pQ
X-Proofpoint-ORIG-GUID: F3wwBDeGXv0w7QagIZ1mn6Iq7C8976pQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210224

On Tue, Jul 21, 2026 at 03:23:46PM +0530, Krishna Kurapati wrote:
> Enable both USB controllers in device mode on Shikra CQS platform.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 35 +++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> index b3f19a64d7ae..006e24a62f5c 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> @@ -38,3 +38,38 @@ &sdhc_1 {
>  
>  	status = "okay";
>  };
> +
> +&usb_1 {
> +	dr_mode = "peripheral";

Why is peripheral-only?

> +
> +	status = "okay";
> +};
> +

-- 
With best wishes
Dmitry
