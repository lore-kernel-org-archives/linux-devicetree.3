Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C010E35295C
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774385856; cv=none; b=ERedDc9t9BtUdewy+ct+66txPnpJ4EvUdGEwCieJx1V5ioKNuthaYClw1VquWQVvH9efXZNux1tK0FoDNr8T66GGZx1jruQ19oIdArwXFRmpEJjVd+Ym2xtTx97tVQb3Q+F4Qj91TSqcE8h5eQ/DYwnr0cAyEpM95dweQ0vaXCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774385856; c=relaxed/simple;
	bh=aVffKBe82Y2JDZLFV3d1zJCx0BR6sZKq3+fXXaPHqM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eBR1lDAHkxs+NIY/KmvwUOkqCW7ze1/Nbv9wHtpTZJxqBDcC/Mych0A1LZQRySWFTi9g8WQh1Ny2ZRB8SCPsrs7UW2XsobTfxNrNr0enuaoQs2gvMMnD5aGvbzav+HJn9Nv0Wyl247mfhR+PmrboHs1k+WLQUeqPEmzCiBx3Xx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4+yvi0Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JNIUlDgi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4+yvi0Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JNIUlDgi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJDnxQ3984685
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K3NdLMxVT8hyMSZgwFoPCL7F
	pdKCgNlTeb97WvwOgVA=; b=M4+yvi0Q2drUeVzdapFX38mgqhU3/ocdnfxXVUXi
	qdzarfXCt+M9P/a+l2So1aPiYU36A3FopVubUW5AvtQPkK59VzRMQFwguGwpfH0u
	Y17CE7kibCTseKGMdIJKFurb7eE+UX6PuUXKAEeyzTu9WGO9CTNmj3IzIJUuR02/
	PZdxeuegG3XSIaDbidB4iLycVROAN9B8RRgw/1Ed59HXuoPmyLBcsIbkhkKlhhzy
	0bxEzHty7JX84g2KSOZhsZ4WfhxPRGf+EAzht2FrXB6dhT9PiTNCZhCuX4lBUFht
	fmN2lVbOe8n8rdVx/0QguPePzINvrF659nP0hanfJcGvrQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3p8331hq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:57:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b802961ecso6916811cf.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774385854; x=1774990654; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K3NdLMxVT8hyMSZgwFoPCL7FpdKCgNlTeb97WvwOgVA=;
        b=JNIUlDgiiu8zNaJm/eiM2unDqQ9qS5uMBe1XEw7UCVRieTE7H8wVhsS5VB0CNKo6Qf
         AC+RH1NemKUxjOnKG99SDg40TuxcZaG5htwQOsc+IZQN4TG8kg8urmcuAP1GHtoBGnEl
         qaZuOyCinYFpd78fPIQdGLG1X3UR2iSvIWQCezCmrlr+MqdYckflSalF+xLGZVaXiIhP
         2xiGmnLrlJ/D0hrmjAb206BcAmOGjAFRo+taUANpvwi8pG2o15c0m4eG17wXT1DaOeyV
         OuDnhOU0R0z7skarLtkalgQKRPt1bEK15Or3doMF+rNwb2t8JloNRA37P8PWwMSWN1Wq
         aL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385854; x=1774990654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3NdLMxVT8hyMSZgwFoPCL7FpdKCgNlTeb97WvwOgVA=;
        b=oLpVZFVcOCkCSlE+yBDwVtiEo4hTCcAfpi1Ocm3C/4oSh0NA3E6R4MQZeIcelfuKtL
         RsqaRgRLTzsth3a0grQk5NYVesRiJ+yasI1ZcE1FPKTo8hbLm45Jp6lTNUElNGgbvQim
         jxSF2ccXfqapff8N6e7BfU1QD0ZxBTHlGQHlv0ROga4Ow4PKeggEeCu7p03By78Q8jGP
         c1rUI8knX5/LUL4ndKtuMXbZ4hORgWXg4lMN981Y8tE6VxTwWjTmnI4t0Ve2taOnIdaZ
         iZ6bEA20ehFtEy3FcqcVikh/RSURMKspaqg93PejfIB4SurF4tTabZbiivIECa+4tp2R
         FeOw==
X-Forwarded-Encrypted: i=1; AJvYcCW0Pi8+lm2BgpzgvqKaHqu5MbHLpwmbhKBKHOYIf1cBSt8d6hpMOUnzAWJ8xYgru7jgqqgCA++6hnJD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Udif6/any+++OfLeAzvicpZvMyhlVh4UKqHI24xQ9rx2tt9Q
	HMUvvlrHdmGyCG4G9/US9OCeWouAT/3MP0nqzqa73G92w9S3zZyvIavvh8qoy3jtsiD8uaDME+0
	v/F2huiQBFZOB74kIpxrb7wIvIt7gxtDWfTkp0K0WlIwsAKv+JRu6Er+jTnFavRSCiHswk0fg
X-Gm-Gg: ATEYQzwv3xzzd1iCUu5sf5HuFjDS10RtIhef+hpzDNfbu8ks6W6/vj2w5hvXIY06Kxp
	tBbRiPrz/Y5kKRRhT4o+sC2kIuD2sKWVaqVX+10tMjsUly+ELcppo0/JSytIRoRp0eZDLCVFh6Y
	53mkb5RohIcFcHxUNeGxchOXxNwpV6twUVpI7P6ClaJB+jxB9r7fC8166WOfEdYjwwf0QCNPk2T
	t0NdSEO/W5c016hRRRyedtRUQtFzz1S+S6xfMe3Ua8h+1tiW1TwlH3Al1ZEGm2C43nBb5t8F++A
	UnPFh8p+EpU6xH+8cBJNAWoTrAswbUvYeohX7+wQkwvXxUAQn1sHdiqRKRVF9i+AntB3UtZ9ka2
	w9C/g49rJyRKx71Q7Hy6UKNK8XXkRqmoETwZeWmMNWvsrVWkrUaG6rwzgEuJwBHA1uoWLodVGpm
	uQ91OG9BqDOJ0QStD6D9owQwSuORO9Wlemlmk=
X-Received: by 2002:a05:622a:aa13:20b0:506:a624:1939 with SMTP id d75a77b69052e-50b80e8a8f0mr14116691cf.51.1774385854008;
        Tue, 24 Mar 2026 13:57:34 -0700 (PDT)
X-Received: by 2002:a05:622a:aa13:20b0:506:a624:1939 with SMTP id d75a77b69052e-50b80e8a8f0mr14116521cf.51.1774385853569;
        Tue, 24 Mar 2026 13:57:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207476sm3402419e87.47.2026.03.24.13.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:57:32 -0700 (PDT)
Date: Tue, 24 Mar 2026 22:57:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v6 03/15] arm64: dts: qcom: sdm845-lg-common: Enable qups
Message-ID: <ckq2s45fts6d4vreghu4h6i7bodjdxqfywv4xmeamdrkq3ucl6@fl4pjnczi6cn>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-3-29d70ca1651c@postmarketos.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-judyln-dts-v6-3-29d70ca1651c@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2MiBTYWx0ZWRfXy1hf5rDiIvaG
 jvX92e/mZEJitA1uzsv+ecK0y17HuP5xujMdoveZ9nkPBfOLRBlZSyMgCjGfe2mSuwaHOJ0wDcm
 RnVQCMQCvz5Y7UBJqXh0FYzWefnIz5fvLOikTylqiDd5gxlXMosqNpwvzAY7Km1AseAMXA+6GXm
 TQUlOoVM0thJYzGCDxhwXp/XIrgrCERMcx8nkCuFdnzexSlJLgx8SQu6qpACg7AlhB7UnbQjho8
 PmwgDzJR3SaEvfGdfHS3ean7RHUxbXjUjRrR79VDvUmw+ysDbVBM3h1xmrMtlS9dcXfFSyNd+kd
 OMXGFxjTDz7u6JqekKk3IEhNTMDf3JocBBsHEXKyQJ/dj7XqVC2CDLiG46sh1EZfU+fZBPVVBqo
 UmwCTY4eCxDc/OQM4njcI2AOmos+UBglFOqv/GfMYjEdKC9YcAEXHNinbE1aQZG1buVJIctcaTj
 a5fReEBISuCfxiawyCw==
X-Proofpoint-ORIG-GUID: C_uWM9w_dOiaLGl_zzHe8n0H7N_ZXHcW
X-Authority-Analysis: v=2.4 cv=F6hat6hN c=1 sm=1 tr=0 ts=69c2fabf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Gbw9aFdXAAAA:8 a=wMieUAD5PgN2zKFp72wA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: C_uWM9w_dOiaLGl_zzHe8n0H7N_ZXHcW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240162

On Mon, Mar 23, 2026 at 07:06:33PM -0700, Paul Sajna wrote:
> Qualcomm serial communicators required for i2c, serial, and spi


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 87ac41ec2e46..eb8de8d01177 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -482,6 +482,14 @@ &pm8998_resin {
>  	status = "okay";
>  };
>  
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
>  &sdhc_2 {
>  	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
>  
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
