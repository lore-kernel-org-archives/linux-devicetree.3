Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D4836213D
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640226; cv=none; b=TamgCTpYn0k3EAEuHbYsoE6tI+G23A4deJ19bUKJ/FkcgLitHy6h4i6YSLNzVXSaQRWKX7rpuMOSpP/1Jiql5dXl/4WR0BHH/1GxoVfSWEiIpVIgOJrlZRyEquJvBMCvue8fTbQSFf0Rj2QUrl4UpOR6X7fvRtaFW2dZXFs6KOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640226; c=relaxed/simple;
	bh=AJCMzLpRw4AQZ42NCiZn7YI+4yZZy8o1BfgRnmh5jpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5WQh3e5gNvGriMm2yofvKc9c6gR5ur7OR4Zst1JWD9J6p6s04pnmT+J6YuRMmPgGSj548wwwQTgo+IgfLV/ArQMC0YiyXuL3fpnH/AtYdfZzu3TFAYH380tB6NDxJl4o1lq+n215L+QBEH5zTIiQdHp/rX7jbAbM+ulg1aHvaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aasllb5E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M/NEuFEx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aasllb5E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M/NEuFEx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMH651756832
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jVDOlH+vUt2ftF4BKKj2HHgr
	uZoxeRHPX+o0uUZLbR8=; b=aasllb5Em9o5/9giEY/IQMhKDywDVi5nZgy3itRk
	eWmhFPypQMfDz57lUdhH1ZlSm5E1ZPDrxOLPB4VNny2Z/0o1Y97fuJKhgIwBYHxg
	5jMrewu7MLHgI7Elk7+eTBkkB00qvr+y1EogGzmoSXmW/7OmFB2yHqIn67OVQ9GZ
	zOFNgKaojg+9D+AjtUasF4WGGvljG+O1Msd6S/RJaURIkmvLny+VeWs/3L/6YQkC
	FupZF5zKyrNyn/7E0+pDVNs9hqs7lFCBjEtkIXYue2wa41qIHBq9xU2ONuGkRHtQ
	u7xOxGtN1tTdWCNwx1HtvSRFp7VCfyqh7XlXKod4ZmS7Bw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pa8vne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:23:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21c01cf3so175760821cf.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640223; x=1785245023; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jVDOlH+vUt2ftF4BKKj2HHgruZoxeRHPX+o0uUZLbR8=;
        b=M/NEuFExVozg3Z0G9IQKEm0melQ2WC3W8lZ5hJEbE6qtgQrryU+LTO5GlIF6EpxMJl
         XaTOPbLnJf49awTSdsuTOjxZHatdSaU9P9jOQFnD9hOJmg5xKzHcuQJoIyae05soqv6e
         9js2awGpgn/w0UC4ae5w/poVtsfOtU01uuCOI7NB3dmIZwyfIyOstFigDCVqJ6fbmqBS
         Cjm134r4TtTZ5ldNcof6P7xjfKL8vc9Lyjanh0k/+MGC44UUZZOz/sZ5feXbA4+G/KBW
         WV0Z9MR6S6eAhjTSH2eFqeDpPfPBmbLUgKcNhFk7MXE7YaX7LsCRyWqftlxI5T6E8HzU
         WAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640223; x=1785245023;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jVDOlH+vUt2ftF4BKKj2HHgruZoxeRHPX+o0uUZLbR8=;
        b=QUEUNywr4T7o5f8nScWq5zlujEBDx3/3V35SdeTrxB9HKowzsWNEJt1ro6BUcKMImE
         PQNMJNZl0rz+4TGuNaRJvGWWOPxDC6F6rD7W+qZVBNOQBN/T2ihIPdkishsSPHqIqDh0
         g16XtA2v6M7cQSl2VOyB6koWWwmmwYl+IJFVEivT09mqZvoSk2c/tqi1h13XrfoqyuZ8
         nZ7hVhNNTo0VON8vh9gm62sA/LRXflnP12sM1K+qd+C2/00zQK6BtG01z1kdRsbWWFlE
         90zNah1W5fFvsjS/qoCqGher+1axqkbtAD1I6N4FN87LExVqoxCS+5mYuHq4ZjSmGByu
         unpg==
X-Forwarded-Encrypted: i=1; AHgh+Rqvgas0MO3LjFVmKjnWzDC5tzTkYHktCUKsNG7lErZzRt5mhiaFrzZ6KjGJiuw7SphEx9rPXjIQI5Q/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7coFxHHbm7jyphXhyMkOvUUWrVNeJSmfpnQUN9ux71UA0iK5z
	9k42QvgaPvcvfaZUoj0rjdkC0PbuS8KBajN2mZf/OwVSaEvBIRcx8HM2Y6ay7XfmVDINeHjj4Tx
	tOT6+jV4opmVYxoyrAXMMuLlTaa7d33rWbONsiaL4AdJGk7CmKKwsiSbmstz1v9D1
X-Gm-Gg: AfdE7cn11LHFMSiL0GqONrJE7QBYKUeO7gprKXFQaIidJGBq3qBF+RsrIDXgEbPPlA8
	ecM/MSxgNZsu9ACRuMeX4qFrsdrEHpn/lavBWOW5Ph33UQ47U8mOjjeP3Tl+821t8KVjZhXnOlo
	buTqlYPmllxfLIn3oYARQzyw8jP9bBFwFWNM8DvNXInGDcgrEy4eidSesGF0tkdVZ0PN8o08dgO
	2UiAZ/YunjpUpsgRvedZ8B3vQG0yzWM6qh5lKG1v5zfDQ9XCtzsnUaazJXNc9srF4+dg5GoiNW8
	6zdrXQmnUDMtR+FhzM/b3NpRRohYFLZllodCtJ5TcVBuxZa4u7YjhJLWQONjsWnCIKH/mzVKKZM
	zSCerci2grJkzZL52IPe3R3P7bIxIuZYZk1LwKWRVEbMnjo2Du7gTk8udfR9sp1tQqXnE2wr2Ag
	+YIpxHm5Cou+2Chw==
X-Received: by 2002:a05:622a:164a:b0:51c:1d0c:605f with SMTP id d75a77b69052e-5213d7afe5emr170641371cf.20.1784640223138;
        Tue, 21 Jul 2026 06:23:43 -0700 (PDT)
X-Received: by 2002:a05:622a:164a:b0:51c:1d0c:605f with SMTP id d75a77b69052e-5213d7afe5emr170640231cf.20.1784640221960;
        Tue, 21 Jul 2026 06:23:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291dae2fbsm2891472e87.35.2026.07.21.06.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:23:40 -0700 (PDT)
Date: Tue, 21 Jul 2026 16:23:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: qrb2210: fix PM4125 regulator
 supply parent mappings
Message-ID: <oq5sjn5yudd3nioind5cx2wxsuo4r6h7s6nz6zjhgthlde3xzx@qk3yyswu5aut>
References: <20260720-pm2250-fix-supply-parent-v2-0-60ca47031b50@oss.qualcomm.com>
 <20260720-pm2250-fix-supply-parent-v2-2-60ca47031b50@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-pm2250-fix-supply-parent-v2-2-60ca47031b50@oss.qualcomm.com>
X-Proofpoint-GUID: a0M8afgTf_a3V7hNDZAl6skQGEtx_72k
X-Proofpoint-ORIG-GUID: a0M8afgTf_a3V7hNDZAl6skQGEtx_72k
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5f72e0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=pkpiiNAmCQNE7EOobEAA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0MiBTYWx0ZWRfX+6bLAJILICLq
 d2bPLrfgw3LPQAIbmeV2uVSL+IE4p4+RRCWh3HGRsjCRsGSRH2c+krLENxWmh5nJGCov0CB7MqE
 P8wdVORw9qjq2giib+5PrilJIfsg4+pDrxNN20c8D516jHibtVX6FVDfgnU/UjW9nrO4lhxkAYm
 Hzx7pnbmxvFjlpYd+vVQuCB58Tf49rT1l47DwCDdUhWsy1X1xl1BTe4Ja/K4H1IKDFaKPTGLykN
 vAHzySofEoIgEQoETb8b5JHhvDBDX264tsJB2hbjfoPRFGCp5BA7aV+AE4iaqrzUJs6Kt4SzCaZ
 4u+Mjs74sotvOS+bWK53YGPMnlrtTgwnfjl9G8DH1bDWNVlvGSRDDDIU+MoXpM5oPHI4j6SdSSF
 siTV6MekMGwv/wQFmbHSdGuqPF0lnDhbvInBFnfmxx2x7oTmxEhGAg8MoLSk4j0RwU3EqDC2++o
 bjJe/vVeid73bCWIRMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0MiBTYWx0ZWRfX+XnDAdBMNVff
 Wx2KQZM5uXVfINXiBSOgtZ+SEnaYom5oFbsa4IRUjv+GOiDL1N17nkwM0DgHuBgDukVbKqszgWx
 uOLkjcJyFrWIdIJkOy+/6y0F9SFd5cw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210142

On Mon, Jul 20, 2026 at 04:25:05PM +0530, Rakesh Kota wrote:
> The qrb2210-arduino-imola and qrb2210-rb1 DTS files used coarsely
> grouped supply parent names that do not reflect the actual physical
> pin connections on the PM4125 PMIC. Since supply rail connections
> to PMIC pins are fixed in hardware, these grouped names were
> inaccurate descriptions of the hardware topology.
> 
> Replace them with the correct per-group supply properties matching
> the actual PM4125 pin connections, and align with the companion
> driver change that sets supply names to NULL in the qcom_smd-regulator
> descriptor so that the correct supply topology is captured in DT.

Two separate commits, each having a proper Fixes tag.

> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 13 ++++++++++---
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 13 ++++++++++---
>  2 files changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> index c472e13fceca..90e6eb284a66 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> @@ -262,9 +262,16 @@ regulators {
>  		compatible = "qcom,rpm-pm2250-regulators";
>  		vdd_s3-supply = <&vph_pwr>;
>  		vdd_s4-supply = <&vph_pwr>;
> -		vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12-supply = <&pm4125_s3>;
> -		vdd_l4_l17_l18_l19_l20_l21_l22-supply = <&vph_pwr>;
> -		vdd_l13_l14_l15_l16-supply = <&pm4125_s4>;
> +		vdd_l1-supply =  <&pm4125_s3>;
> +		vdd_l2_l3-supply =  <&pm4125_s3>;
> +		vdd_l5_l6_l7_l11_l12-supply =  <&pm4125_s3>;
> +		vdd_l8_l9-supply =  <&pm4125_s3>;
> +		vdd_l10-supply =  <&pm4125_s3>;
> +		vdd_l13_l14-supply =  <&pm4125_s4>;
> +		vdd_l15_l16-supply =  <&pm4125_s4>;
> +		vdd_l17_l22-supply = <&vph_pwr>;
> +		vdd_l18_l19-supply = <&vph_pwr>;
> +		vdd_l4_l20_l21-supply = <&vph_pwr>;
>  
>  		pm4125_s3: s3 {
>  			/* 0.4V-1.6625V -> 1.3V (Power tree requirements) */
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> index bf6fb12ad990..3432022274d8 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> @@ -465,9 +465,16 @@ regulators {
>  		compatible = "qcom,rpm-pm2250-regulators";
>  		vdd_s3-supply = <&vph_pwr>;
>  		vdd_s4-supply = <&vph_pwr>;
> -		vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12-supply = <&pm4125_s3>;
> -		vdd_l4_l17_l18_l19_l20_l21_l22-supply = <&vph_pwr>;
> -		vdd_l13_l14_l15_l16-supply = <&pm4125_s4>;
> +		vdd_l1-supply =  <&pm4125_s3>;
> +		vdd_l2_l3-supply =  <&pm4125_s3>;
> +		vdd_l5_l6_l7_l11_l12-supply =  <&pm4125_s3>;
> +		vdd_l8_l9-supply =  <&pm4125_s3>;
> +		vdd_l10-supply =  <&pm4125_s3>;
> +		vdd_l13_l14-supply =  <&pm4125_s4>;
> +		vdd_l15_l16-supply =  <&pm4125_s4>;
> +		vdd_l17_l22-supply = <&vph_pwr>;
> +		vdd_l18_l19-supply = <&vph_pwr>;
> +		vdd_l4_l20_l21-supply = <&vph_pwr>;
>  
>  		/*
>  		 * S1 - VDD_APC
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
