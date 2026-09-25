Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B084CC294
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351653; cv=none; b=AlcBf1PSYJfjZqfK88eLKWMZ/0g5Z5Qe+Oody7P5zKUtQhb61MWCX/rv/2T6gOdOwIZcUIey4O0CpF6oRC9q56Nebqyyp6vk92K7FbhdOI19NZUIEVc3xwBB2TtFSVdUlDJnN0QmthdrtFnzxEpNRcL3Z7kGrIGZmPm0OQF1qcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351653; c=relaxed/simple;
	bh=FIyGzBGb+RYhP8IDWtExS5czZtENC5WK8/oieIJLmXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tj0/sedPrbENuqramAhBt/fqIX1JbdxKpMGmtMue7p1fgEO0KTPw4bb5zCk6xAubyvu+1DXwrIhYqSqQKFyqYl5K9f1oWq2d/6JoQk3ETGKnvIfX5l+PDSM5fzv/hJ72C9DTbp3em9TtVXdt/jpQzW9JKVP+TOKETvhVr89N/7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOFG+sYe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPiQ9Vif; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOFG+sYe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SPiQ9Vif"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PFHpVo2554187
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e7cEgO8K1Kkv0l1fj7GcpaQP
	E8krEk6i5UR46iPiSaE=; b=YOFG+sYex1D54daS7CVtIP3OcQd+4HMg2+lBaAWY
	Zc/KZbhP137dJVX78uwHNYnFeeXdHIgwmbqRq5/6SmLC0+4dtcccK3SU5JF8ZyMJ
	4v3YjP0TfOxsjfkQYHS1RO+DK8p3+enYKkhcm3HgWwWyT1IbCNwvZbNJIztmwpiI
	0aFBUXvfL8Z3gViZ35tm2Sgsdau6sOqvOXaugeuZeIE079YyTUeQKgCb6gTZpDfX
	Q6f/qn2GzNkCGdDvSLMHu91M34MMdaO76IOAi8cIjDILcvfDwM4HFSEfo1SJxaJX
	TF+RC1UNeIM6Psel2PMH1fMqiKe6WgQieR/iHXRLMIcgLw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwufk04rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:53:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0050a554so216443585a.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351638; x=1790956438; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e7cEgO8K1Kkv0l1fj7GcpaQPE8krEk6i5UR46iPiSaE=;
        b=SPiQ9Vif9AujZWkhZmMe4CSpve4eQIssMZ2IUtrf5xB11Y/F736l5j/mnpCVGOXv2A
         wwk8MqYl2lxD64zy4yXj2zwbHR5qHDf8/i9Mpu3ZfQDsCMb/Uy/xzR4le8bli9gfXvnp
         u6So5IAL00UYGTws1ghw/vwshQ5+yca7KznXvuIZrnAb4JdYhKDwaaurgRM4qVYwhHEY
         DhTosUtA50fb0dNrK09eXtNPsqdumSivYbrC/VGDrXDX+9FnEEx9yVKhoYcCbOgCdLEl
         nxps79FjjpS7VgvIBQIhY5fklJRn9cJFU4XYapLuQaMJK82Y2cYlQkZsCrAoYN4ByTUV
         KeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351638; x=1790956438;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e7cEgO8K1Kkv0l1fj7GcpaQPE8krEk6i5UR46iPiSaE=;
        b=e5NXltp5X7P2PD1J5MUl9WjkopWp2z+JK7nvQ+9DXaNkhuA+SaYjVpmjWdB3OdNO1c
         EpI0tMlkP9djmGlf9lVDFC8lFQEKGpeKllhYbLErJZsE4BIXUBq0eJk/4AkhgN82aN/m
         D6aM31bZeYn47zc5z5EWJh5HAG+wpmvRbUGYDbPbcgF/qXqwn9Gjlou9iwfspny4THew
         KbDBA0ZGNI+bax1JNvet2jMlt7saW1XYSp9ZZR5AMq3LnP9VAPcPhW4WgJy8B5fHWOza
         ZK98OWPHnpuog1FACyK849nAPBKQ3PXmojH7HHKAxNY/w9qomi0C5n2Zbzj5aNpFn0ow
         9HCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwB2cOZO+hNWAzy3d/3C/0Br9HNM2pVavC5NNrs4+Orgi8tITnAxCTbTtt8bG9+xd4SO1XeFba8dflI@vger.kernel.org
X-Gm-Message-State: AFuF++kXO91ztjJnkWKXDzOlgitA87ojBqWFD7XkGCi174PfEB5q2O55
	kxYB2GmcE5ign1ywuSAcfmoZc0RUAOCHjKlu7cO9RzeHtsspKFbPZoICtyjUtk3y/T2MJrZI7js
	7WeATHEeQ2ZhA7BZINrbLV5A6AwN7YCpn0EGtq77cbKdMojThStV4dAVL1ikWbY14
X-Gm-Gg: AYBFou1FaOkjvy1oHRn1KT1XhVIMdaNnBdfVnb2hlhe4uQ+McNAIAZcIxQ5uyj9VCo/
	LFWYeg5NmUel0+0ycUKZyk94qMa3p1Xjz5sev5mgacAXPmQwr41q/O1mrsrLHm18u9TAbBYDOxd
	GSnDyOebzU/kbEP59iZi24uPwdMg1J03pUxNo6SH7XMHgwPQEnj/ju6drjQT1kqnaLxWBwRTmmZ
	nK3ziRtJYoZWlhdvrFZS4PxZqR+y/s+sh8Gp6S6PQd/Nb1xp3g/d2KOqBqORl04ynv/aTP7ct+f
	pSq1itBzxJZD3m7Bz4M5cbcHJST86nBxMzCHD8eiQzovWtsvPjyjg/DOQjqT+UOT+061MmpeCA3
	FnA1ZCf0Qxuq/xKU=
X-Received: by 2002:a05:620a:4614:b0:939:a9d4:50b7 with SMTP id af79cd13be357-93c43be19f7mr547160885a.26.1790351637507;
        Fri, 25 Sep 2026 08:53:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4614:b0:939:a9d4:50b7 with SMTP id af79cd13be357-93c43be19f7mr547156985a.26.1790351636904;
        Fri, 25 Sep 2026 08:53:56 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm252013645e9.12.2026.09.25.08.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:53:56 -0700 (PDT)
Date: Fri, 25 Sep 2026 18:53:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 34/42] arm64: dts: qcom: sm6350: Add GCC CX power
 domain
Message-ID: <iuuu6v77jvukq3grlng47p7767lzrooln6loq7to2t4emnxmix@zmxaww4lqjdu>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
 <20260924-qcom-tie-cx-to-gcc-v5-34-38732033e5b5@oss.qualcomm.com>
 <20260924110259.19BCA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924110259.19BCA1F000FF@smtp.kernel.org>
X-Proofpoint-GUID: 62wmjNPxdVVGThlNEzKFxAxJ-u-bH9K0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX6Q7Bs+Le0bQt
 9qYRWDXr+AHtWR77TXtHy1LdSUVrVYEpIiBZC4wtr81zuSI0MElJII4SgmPQZRIj4B17MpAMQiV
 aFVR+PbllrpfNf4bd3CHzN17BhoZ5mc=
X-Proofpoint-ORIG-GUID: 62wmjNPxdVVGThlNEzKFxAxJ-u-bH9K0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfXwpcgg1mTwt7U
 8tT9Vdh8UlMbc1mKlEp7Y+AXxlRqVgd8WBButPkSKZBczTSOD2pWjCw8V6Hcq6goPeVFB+vPrda
 f3+7ly/CNfD2OZkaY7rMebSd95fZ7+O72qEYoTH4MXDdGnCbHu4+2PISGA+opeAOOSoBL8RBhLD
 wPhFfXZ/Eyat1poHqbJexAaeP12S6TENp7xz2tYhunZtahTyVn13Tnk/3meiv9TRrbm15hdkAn5
 O8cTMve7FlAKkA1ckqvnreTZKKKMbojtxF0fX8qWsk1UhXc+1YgI0qWoSks9PDeog5KrGpJnwZd
 FEiBddZk9U7PMqXitRvU0H0/JipUZlIZxBsxThfXwRrcy2JaM2tR/F1rgcBkwfe3V8hC0guGqMc
 mwzHLCHPODaZYszL0gLDezrCTHNI2x3GYumbRXj0LXS2iXX4yvGHnLqFzK1gEWtebbVkUNbvltY
 Bowq//dLvyon8QTvxgw==
X-Authority-Analysis: v=2.4 cv=B+wsQ+tM c=1 sm=1 tr=0 ts=6ab69916 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EwBXSBkPT_h72g6H0KkA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250063

On 26-09-24 11:02:58, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] PM regression: GCC device pins CX power domain ON permanently
> --
> 
> commit ee5fe8d5caad7b14e28c23c20f2b192fd4ae6ab2
> Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> arm64: dts: qcom: sm6350: Add GCC CX power domain
> 
> This commit adds the RPMh CX power domain reference to the GCC node on
> SM6350. This allows votes from GCC GDSC consumers to propagate to the
> RPMh CX domain.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> > index 15d38b7e803c5..ded5c3a45891b 100644
> > --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> > @@ -794,6 +794,7 @@ gcc: clock-controller@100000 {
> >  			#clock-cells = <1>;
> >  			#reset-cells = <1>;
> >  			#power-domain-cells = <1>;
> > +			power-domains = <&rpmhpd SM6350_CX>;
> 
> [Severity: High]
> Does adding the PM domain to the DT node without the corresponding driver
> supporting runtime PM cause a power management regression here?
> 
> The genpd framework attaches the GCC device and unconditionally powers ON the
> CX domain during probe via genpd_dev_pm_attach(). In order for genpd to
> subsequently power off the parent domain, all attached devices must be
> suspended, which is evaluated via pm_runtime_suspended().
> 
> However, pm_runtime_suspended() requires runtime PM to be enabled. If
> pm_runtime_enable() has never been called, the device disable_depth is > 0,
> causing pm_runtime_suspended() to unconditionally return false.
> 
> Looking at gcc_sm6350_desc in drivers/clk/qcom/gcc-sm6350.c, it does not set
> the use_rpm flag to true:
> 
> static const struct qcom_cc_desc gcc_sm6350_desc = {
> 	.config = &gcc_sm6350_regmap_config,
> 	.clks = gcc_sm6350_clocks,
> 	.num_clks = ARRAY_SIZE(gcc_sm6350_clocks),
> 	.resets = gcc_sm6350_resets,
> 	.num_resets = ARRAY_SIZE(gcc_sm6350_resets),
> 	.gdscs = gcc_sm6350_gdscs,
> 	.num_gdscs = ARRAY_SIZE(gcc_sm6350_gdscs),
> };
> 
> Without use_rpm = true, devm_pm_runtime_enable() is never invoked for the
> device. Does this leave the GCC device permanently considered active and the
> CX domain irrevocably pinned ON?

Yes, but that is the expected behavior here.

Runtime PM will be enabled in the future, once we figure out if CCF
critical flag can be safely replaced by the enabing on probe.
