Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264E34E1C82
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 16:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352085; cv=none; b=pblUd8W/b9RfWnltH6C+K9ufr7tvRRDLANS96Luji+A4grC+pyCdGH5Lf0bqB4xsiWWfzmPYojNFgUZBjQIfNoTorj3UFTLk6NOgrr4DEExWEglVZlCm9hOhLM7IbilXjsHFrHkddAyhe0rrMv0vU5kyfAZOXHvZZmqZdbwFB3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352085; c=relaxed/simple;
	bh=gvm3W7J3Akld9cS3FZ/cKcHsfdTHgkXOTxcsTRXbuzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lp5SAzfHr1XORTK58FvfIZRgM+0wMO887YPoyK5pkJPVKQTgLMUMBoJNAMzETGda6Og90bnDo4s4GvawJ6NKKitKsEaOlBZ9FU0pBgDD53p+X4iO2t4a9m5+MfyUnaEJu80VDoEv3HpVZ4kC8bziaC6j0o7wiMTHYOvopr5CIR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DEeA+MB+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LH4JyIPn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DEeA+MB+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LH4JyIPn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG12h81748049
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 16:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uHHjqtOTlg6U7m51a3YRL1jQ
	gEeRztIvr0DL8aArJq0=; b=DEeA+MB+psZnAKM23CGE71PCa2YfkGB5gQukVaBZ
	miBSM3WtFCkJ9FS+MwNvxmwNWT53FFw37Htc/R0PcpvrRHctcl8VndAAO5r60Qss
	kILsphe1XsEZzA+2wBZDFUs3KviDHqSfY5iURnu7jPkXhWDJCRfanufOyaW50GQO
	UWNweEJ2UwVjrCrGaJIHoIz6NmE0RLl2G9feBiXOevWp1Soi3xd2urkIIagTmuoO
	iWoM26As7Np87VcVOsI8osq/Tq5iAyVTxVPxsz3WBBk8Pt7uTLfaD3aH6ROziQUD
	CHmpybYGV5FY48Z4vKKoKmgpVe9APFZcKbW9Z9j+uuHbgg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881vbba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 16:01:22 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78fbc5a4cf8so1948429137.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790352082; x=1790956882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uHHjqtOTlg6U7m51a3YRL1jQgEeRztIvr0DL8aArJq0=;
        b=LH4JyIPnj5/ebMold1mPVf4FcpkIX+eLTUnYt2gEjpeoTdH7cBc68aTkTLpdP2yjNM
         QRqZ+N3qodIO8/UFjcrOu0M/mUTL+gvh6O8kt6J3JjSe1RZqMrRsRrywUSKjFuCdaPdA
         da3NYof61NAKCe/l2gL4vnPHyIJmMhf+ngAQCJcpEa7FHFGvp5EQbOQcVifpdxco1TA3
         HmjIpHFVEe3Gx+blasfnyHKZK9QKn/tEG+8QAr5Xw+yPxAF+rstnQhkBNdFCqYZcB3bj
         yCOU0KQK49IHIGF8gKFRYeHoEh3GMDSpcAtUU/tuBscXs8cEE406qU7QQi024tJ5qDWQ
         hLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352082; x=1790956882;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uHHjqtOTlg6U7m51a3YRL1jQgEeRztIvr0DL8aArJq0=;
        b=art7g5MZ/TF5rdsfOZXh0IL+ueMe6Y3WhczlmTloI6Jxm4vuJLMnQCmD45a6g4/3gu
         8qZvf7QoSaBEQYcEX+E+oMF3LA+yr/WZ16tB6now1MMtL/wogaD7WU0W/hQfh9S5SdZ3
         KL+kOh4UWkggnNJyNtzwW6UGr3OEDK18UhPlKqesD71CEMqty/tLTUfzVQs6mXC4wVJQ
         bESmC9tqMTnGWtP5xOVvmvOU75t6lCfvHDxySWpew6AAdmdb/8hROCg2ipq+lekxNLDM
         2XizsevTjsaj67YXvGyLvs4jgayGI72mSBYuthZ+twJuW2lAEiovk0UPmewJsq7wcUvB
         D/Fw==
X-Forwarded-Encrypted: i=1; AKwUvBz2KMLS39MAI9Z0KX9TqmTFxYvtCzHUozVNOJtnjdUDy24ViWrHaQlJ0pIDwqRYAYL6FIjEy6EaAhJs@vger.kernel.org
X-Gm-Message-State: AFuF++k5ngcjl4API+GvY9yMM668luKtPozCmfA3Ljg6Dyfm49BLN+tp
	BK8omDifyc28mKUpV4OHcZgD/8eO7xrfOOkIHau7KCMwv6CQlLwgtIF0OKR/FBVBx17ZRjK3Ctm
	zc9fX2pnWo/q97NcSTBiUfWj7//uBqJeKCCl0CjkKGwUkTFmAwOGRF7f60qgfEMzp
X-Gm-Gg: AYBFou1mc3uZtf8hVTDVI6CHjpy6lul2H1fQNLk8zjetbP7NYOtbtOnMdQh9TwaIEGt
	2ikckNLlMLRnpMvmTwXwL0U5XgtRvNUzFdjE0EOw1ADiAMx92c/R0ysOEPdzI5AuG1pwWthP2z2
	SxIQocJkolZ8DG+te2mGXW62+V5hkewj2tl408zkiSRVSpGpt+UlySI42ViqLBzucFyEetDkbP2
	u1vXUOUekVh4xRK+Tu0rP1TN338gtfCoM8Z1V6IYVh+OTXlhuKaDHZI4Ch+gP/YHtMY8ix3JzH0
	Bb5yZncPEEIIXtPtGnhyPvNs5U503dYTOvbzb05Z2urOwym2V7tc0MhxvuooF7oCrA+zg6LFU9K
	/UDzL8Aja43bGgdU=
X-Received: by 2002:a05:6102:5ed:b0:7ab:e522:de49 with SMTP id ada2fe7eead31-7af1f201846mr1755474137.31.1790352082211;
        Fri, 25 Sep 2026 09:01:22 -0700 (PDT)
X-Received: by 2002:a05:6102:5ed:b0:7ab:e522:de49 with SMTP id ada2fe7eead31-7af1f201846mr1755465137.31.1790352081610;
        Fri, 25 Sep 2026 09:01:21 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff43ad975sm67537835e9.13.2026.09.25.09.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:01:20 -0700 (PDT)
Date: Fri, 25 Sep 2026 19:01:19 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        robh@kernel.org
Subject: Re: [PATCH v5 35/42] arm64: dts: qcom: sm8150: Add GCC CX power
 domain
Message-ID: <4chzlnyycjbh4o7sxlrjyifiw4fhe4oy6juxaxrvu3fbe7xndr@mzhorwtfoxuz>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
 <20260924-qcom-tie-cx-to-gcc-v5-35-38732033e5b5@oss.qualcomm.com>
 <20260924110121.C66B21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924110121.C66B21F000FF@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab69ad3 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5BNVM6Iyd4Sm4qojyzoA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX8+nB/4sxiTom
 qbKjQd+hd938fHoC2ZMel663/LFpwXiviDyNfeJOTwbjPE6D5KQXt3TvEz8hxHm4qAF1hkL3XaQ
 RfaLW9di/apyqRfvuGEFu5b2vwaO6tjVhRIZ4KRoNhfflSBZ7royxjlycseAWc6MRgbOmvLppAq
 9OATRPS++ugWVzR9xjl0d2ysDh0m7fEnJZvoAPh3JbgsBppX/SsfqZd2OvP/K50AdZeD4reU6t/
 Bgmkjega/YtKlYfzaMuZIVh2vXBgTD7R/FyLeRwHLeNESiH3DqCq4ZQBSG9QxXjwLZRhEInqPCj
 YdwRSSgr3/g2SF1aMQ5t3u26GyQM4j3nZkDxZ6jnLH05KODWqhFssldm85cmxB9isZSxQ9BFReK
 ymW7VExDCA9l9YFuTC3+EQSv+9H8LMf0SokTZz/ZABygG2Hpywq0NOowcyE9yRcoKHbanHkRkOY
 usY0vNs26T04H50Yr+w==
X-Proofpoint-ORIG-GUID: tojTZ6wHziM6-RaH2036MOqZWGRMPKKz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX0eiwrUX0GX0d
 KTQ7k7naem3SUnnWIPZsrucl58Lu2KFX17QxF3KTxfmlXN+Z60nuKHCG89S6tOEITt3wc+arxCz
 mdCnl3dIBVBYOVOGKPQHqoXgKUio+YI=
X-Proofpoint-GUID: tojTZ6wHziM6-RaH2036MOqZWGRMPKKz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250063

On 26-09-24 11:01:21, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] clk: qcom: sm8150: missing runtime PM support pins CX power domain ON
> --
> 
> commit acb1efde8c25f0a90d262048322b01fb3721956e
> Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> arm64: dts: qcom: sm8150: Add GCC CX power domain
> 
> This commit adds the CX power domain reference to the GCC node in the sm8150
> device tree. This allows GCC GDSC consumers to propagate their votes to the
> RPMh CX domain.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > index 94a3b02cb2897..397c0142ea579 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > @@ -913,6 +913,7 @@ gcc: clock-controller@100000 {
> >  				      "sleep_clk";
> >  			clocks = <&rpmhcc RPMH_CXO_CLK>,
> >  				 <&sleep_clk>;
> > +			power-domains = <&rpmhpd SM8150_CX>;
> 
> [Severity: High]
> Does adding this property pin the CX power domain ON indefinitely?
> 
> Looking at the gcc-sm8150.c driver, it seems .use_rpm is not set to true in
> gcc_sm8150_desc. Because of this, qcom_cc_really_probe() skips calling
> devm_pm_runtime_enable() for this device.
> 
> When platform_probe() attaches the GCC device to the CX domain, it uses
> PD_FLAG_ATTACH_POWER_ON, which powers the domain ON. However, since runtime
> PM is never enabled on the GCC device, its disable_depth remains 1, causing
> pm_runtime_suspended() to always return false.
> 
> Since the genpd core evaluates if all attached devices are suspended before
> powering off the domain, it seems genpd_power_off() will never power off the
> CX domain here. This regression could prevent the SoC from entering deep
> sleep states (power collapse) and cause battery drain.
> 
> Does gcc-sm8150.c need .use_rpm = true added to gcc_sm8150_desc so the
> device can suspend and the domain can be powered off? 
> 
> (Note: this same behavior appears to affect sm8250 as its driver also lacks
> .use_rpm = true).
> 

Since the provider registers some clocks with the CFF critical flag, the
provider isn't allowed to do runtime PM suspend anyway.

There is a discussion about this critical clocks being enabled on probe
and left enabled, rather than using the CCF flag, which will allow
runtime PM suspend to happen. But we still need to decide if that is
safe to do.

Meanwhile, not tying up the CX to the GCC could leave the GCC undervoted
because the GDSCs votes would not tricke up, which could result in an
undervolt.
