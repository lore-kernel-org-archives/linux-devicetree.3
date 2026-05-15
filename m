Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0AC47DF9B
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846066; cv=none; b=AYmvzId0Bpz9EQ5QzPa8zAIvI5qtIPExpGVdaXoNgGrgACxIA8JmwO4frvJfbtI/fZ+H60C9u0r1Fhb1hhlPavJUFUz1VGsJwpdsjjFj1EJczLGbpc6EFn+NZRpOlrp+JLrgz0CegiXLaNoHwuaewQrPwAP+cnJ+MvmO+GpZ4PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846066; c=relaxed/simple;
	bh=9Sho0fI6NMkCeh4ivAx1th0lJtyk1bZr1iXmawYJupg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOd97EPU3UASAM4pShTyir9jfuPVoJDaG3rqAunZiMxfnfrH1KDY55UZIDCI+Zd3Jk4yfuHPdbkmzAkmIxDcSHgbe6dP0gJXfV8P1F7hJUlWBRQhfckHdCSnkmrObVhSl/e7RNbCsYy9DiivoUf1k7SvFAo8ZLDBpoxETFtfHPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O4Ubf9SE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQAMgZDz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O4Ubf9SE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQAMgZDz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBK2Hs3197594
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F/w0biPfBm7tGN3XiFzZ+RM/IeqIJzrVr9O3LBKg0qE=; b=O4Ubf9SE6YBD2URc
	uS46GZbrn82iC0ImqkJmmGevdmdWGJrY6qGPRZSEAj7OtjFEA341qP5cq6ucMdre
	l25Xud0tHil1kw4WysLzq6S4H4p+gQFrIFcUnatoC5SnvPShX0ES/7YwYSQQBvsN
	EGMqlDjg40RXxx9D3BZ+E+nCo+GgVqfGPW+B8ixTERSsmtfAGWlMOwRhZMRT3+if
	ayB62B3xZ+1LWnadWsMTDXZPw6ZvXEVRoTMan31sSsnLzZRoWcN7v4PE/M38rMep
	a8hcFGVbrPQfoMMBQIgZ0RS6n5OeIWNuRNqwT8mG9r0uDmkWK0JjB4HZi9eetFj1
	UVl33Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qb41v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:54:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d812c898cso217405671cf.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778846062; x=1779450862; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F/w0biPfBm7tGN3XiFzZ+RM/IeqIJzrVr9O3LBKg0qE=;
        b=iQAMgZDzgDjR3MZHPNYTTdQMWkJQjlycGzT8NVVRKoDeBsvbRc8GSdh6+sGrIjhXeP
         uVeZNDTYmlAKShwokSzemYEh7/5J4oo9gprp9/+npnMm+tOUbdPqbzwQKjj79owr8GvW
         n4GoLGTaqq43u9rTKPZggMNn9tVr0pL90SXXpfl7Su5UFMj7BzAa5lL3HYUtk98uOX1E
         mLGlwSnGVwkAcTuWGF+9ynF0mj6uRzQWJVTYF4BPLQVIGkBL7Ky7LhCB1DJvPH6E+O1l
         PrWZGAz5A8ttCA6TlBK5Rs/uOYo15BQEOZbT+K6UW0/FcsvTiDDg1hr3zsXIvV3eBY96
         n1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778846062; x=1779450862;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F/w0biPfBm7tGN3XiFzZ+RM/IeqIJzrVr9O3LBKg0qE=;
        b=Cmn259kp6ot7dqMlRUHBlTQFjpkSi/NnuDmfBO+PFOz/mwsWUzKazVk1+sDDsXw0Dw
         9lwYyYbDzDATAHoQ85V0gAQSGVgAiYPZotcqnTtCUFQcOZIyxImndFjU0JXPpFp1Sje+
         QoJG6/bS9VlwrgNlLuH8nojOYisYetwv9kpXMCPQkW4iaBV0W4mxn0AHbojuhN34zD8w
         DW4JHEE4qIG6DY1jGW98Nd0STh0/1BcFt8chO3ERvgZMAx/9CML8Jie1uBpS/x34EiE1
         QSdaNvke9gN92XAJWPJrKHybzQg2vhzBjKhicS7GOM1PrZUq/1Zb9HEWVecaFFfpapbI
         M26Q==
X-Forwarded-Encrypted: i=1; AFNElJ/FnfVgmWSSPQ0iG2cDZdDq0GXaBkSHYKSEvp9v9fEuKaipj3pXG/7T5RCSyOx4Qcav1n7ZGl4mcNMI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0D+PTW0uIXpdGMYaNvUog2STdaOit28apztpbMvobLEroP3rX
	AEGlZTcewVMOTcjT3LkTciIdDXja1V+Q32jxB1Rw/bMXXyopbqJPxhsmDFV514yIQtTtfBrC4Lk
	2gkGR3hFJpRWfCGG3u6GlFDBLzMik3u5dFYV9kUh7Gtv74Ad+ZcmQLi+ZXovSKwPQzs31XWu+
X-Gm-Gg: Acq92OFrIYqRCNopKqywtwjFPQsp4wdqVPB15aGYKp6Ut0r3nrmVULpSBva5IUIWPyC
	7vFEwHpI6O49+e6vt3S8MYw87pmcG1QjRRFwbVSnQ4fin3gH+TriDJRCKpRK0usW0bqLNMHW/mv
	eY+v8zDhmIlnRvqguxLz+zmkhvxTodnfMgo7tcOQIouw2uE06atztrHKuGUWo8ZxSy83aYeYkal
	1jRLcV2MnpgSdOYQxGJEtTbfdbtuXWWntgQFLPuByu4HuUPRmCUgcr/Ya5MEVKJO0CjRh5R8/Re
	lMgOOq1rGORYxzKySJO2dZKRPOJAR90DTnObZvJ9+i0QQcOOKQV6Z8Zv8nmAoi/f05GtN3pwifk
	n7ljBiNMFY9WFQx9+RbvukKpUEyZd28HYywFWede7BUdNCQd04tFZSR9pFThTCFTx5wAeNvgUk3
	/EM/QMSxp+KccfVhXQTHaHbX6UyavLaX52Yxwk+JeejmBDtw==
X-Received: by 2002:a05:622a:4d4a:b0:50d:8cad:2381 with SMTP id d75a77b69052e-5165a263955mr46272541cf.54.1778846061512;
        Fri, 15 May 2026 04:54:21 -0700 (PDT)
X-Received: by 2002:a05:622a:4d4a:b0:50d:8cad:2381 with SMTP id d75a77b69052e-5165a263955mr46272151cf.54.1778846061069;
        Fri, 15 May 2026 04:54:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a59dsm1293974e87.25.2026.05.15.04.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:54:18 -0700 (PDT)
Date: Fri, 15 May 2026 14:54:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
Message-ID: <a66m3qbpxnef5alqphm275s2lbrxvymvvgxzhasfg277sdnuxd@6uhm5f52vgzt>
References: <20260512-iris-venus-fix-sm8250-v6-1-51856dbef83c@oss.qualcomm.com>
 <20260513214204.7BD77C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260513214204.7BD77C2BCB8@smtp.kernel.org>
X-Proofpoint-GUID: 8XO1EXqALp5yhtuH1jNzuVzO4V7tRDmy
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a07096e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=jl4yj-lrKLgicftm15cA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMCBTYWx0ZWRfX8hF0kgABPJv4
 VD/GILqiAtFFzh3A9ABNvZBWrxjDzmvrzN8ejOz6hYnON3KDk4k99WMOr8jNepq582/Kt4jteFQ
 i9ZIZEaEKVUe0XnBFOvuEMS46up0J9A5OGqeAg9hLSMUTxB85srzxhe4XjVx4BnW30g5v6sepab
 AW+PDlmQjAcVPnWnNowUXTUC4UgIebAUXl6YHQaoD+FeOQ9czpKlXwfItuDDptxz5Ik1FrAvKuF
 YMmLfbR6NBfnZaFLSfZFAdIIWMvUmyC35ybM1cXGoso8pMGntuti2B4MB0l2p/bzM0evhlq6kXM
 +T8LhUSowJ4Fy9D9C3MSr3t7NR9Ljnq2oZXf3i3SCHyUFY5ka5jjz+9frF2BlaZgGi2Uob8Wk78
 M39F8p7ZXG6EY9sB+H6vUEQ6RIrzA3GpXA9+D+odGzd0fV7QoLixaTlyJ+8XFX6AKe6z0qb+UHC
 wM+UCGkIJ2LSEAIYKEg==
X-Proofpoint-ORIG-GUID: 8XO1EXqALp5yhtuH1jNzuVzO4V7tRDmy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150120

On Wed, May 13, 2026 at 09:42:03PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] The Venus driver ignores the newly added 'mmcx' power domain, preventing its voltage levels from being scaled or enabled.
> - [Low] The addition of a fourth power domain violates the existing device tree binding schema for the Venus node.
> - [Low] Duplicate phandles to the same OPP table in `required-opps` violate the `opp-v2` device tree binding schema.
> --
> 
> commit b2dff816f619c94b6f1db957c2bb928b6d9248f2
> Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> arm64: dts: qcom: sm8250: sort out Iris power domains
> 
> This commit adds the MMCX power domain to the Iris device node on SM8250
> to support MMCX voltage levels. It updates the power-domains,
> power-domain-names, and required-opps properties.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > index 7076720413ab2..1fcbd400a3be3 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > @@ -4326,8 +4326,12 @@ venus: video-codec@aa00000 {
> >  			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> >  			power-domains = <&videocc MVS0C_GDSC>,
> >  					<&videocc MVS0_GDSC>,
> > -					<&rpmhpd RPMHPD_MX>;
> > -			power-domain-names = "venus", "vcodec0", "mx";
> > +					<&rpmhpd RPMHPD_MX>,
> > +					<&rpmhpd RPMHPD_MMCX>;
> > +			power-domain-names = "venus",
> > +					     "vcodec0",
> > +					     "mx",
> > +					     "mmcx";
> 
> Does this addition cause a device tree schema regression? The schema in
> Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml currently
> enforces maxItems: 3 for power-domains and restricts power-domain-names
> to exactly "venus", "vcodec0", and "mx".
> 
> Will the qcom/venus driver actually attach to this new mmcx power domain?
> Looking at drivers/media/platform/qcom/venus/pm_helpers.c,
> vcodec_domains_get() initializes opp_pd_data with num_pd_names = 1, and the
> hardware resource struct sm8250_res.opp_pmdomain in core.c only lists
> { "mx" }.
> 
> Since "mmcx" is not in this array, devm_pm_domain_attach_list() will only
> attach "mx". This would cause opp_table->required_devs[1] to remain NULL,
> and the OPP core might silently skip setting the performance state for MMCX.
> Does the driver need an update to properly manage the MMCX rail?

The updates have landed in the media-committers / media-pending trees.

> 
> [ ... ]
> 
> > @@ -4353,22 +4357,26 @@ venus_opp_table: opp-table {
> >  
> >  				opp-720000000 {
> >  					opp-hz = /bits/ 64 <720000000>;
> > -					required-opps = <&rpmhpd_opp_low_svs>;
> > +					required-opps = <&rpmhpd_opp_low_svs>,
> > +							<&rpmhpd_opp_low_svs>;
> 
> Could these duplicate phandles cause a schema validation regression?
> The opp-v2 bindings in Documentation/devicetree/bindings/opp/opp-v2-base.yaml
> explicitly state that required-opps should not contain multiple phandles to
> the OPP nodes in the same OPP table.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260512-iris-venus-fix-sm8250-v6-0-51856dbef83c@oss.qualcomm.com?part=1

-- 
With best wishes
Dmitry
