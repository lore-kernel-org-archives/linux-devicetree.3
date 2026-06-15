Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1B936D9E0
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 23:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781567995; cv=none; b=qz3ldQmc6ZXRPeDMmugoAHVm677LZ1quseDukI51tiBWUEML3ye7R353Q2CCY71jW9xQbvAeXk8fYECWoyEaI01AfFRWoUTRufWI7NXbUrARVhG6cWq9kXYT4fOyaUPx6eUEu0jkCcEL6P6/w7aqPam62ZO6mXDNoD6OqQYEmqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781567995; c=relaxed/simple;
	bh=qYdZANNrh+1rBcjj0sjdqPZQNdJybPkQRdix2i2ADhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RaOKmeZRlKrDsB2fM/sNYu3mfjCeCTdvpq1/co520RpeOF1Mwdp74mPpUfYITKTeKo09IA06Fnf3AF/tobBl5k9zsHA7cfk8vWcEH9Xf22ujjPnAJ4KFOUPftAZJZBF7Tt/albiTAOP21hpljA2D3unFR5p0CCAl4Si+c98UkL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IqWuZMg3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YVlq556u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IqWuZMg3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YVlq556u"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIx7jY861025
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 23:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X1+NqhAiejMS2vQskIfQNFtVS24ac5HJGsGoWPBxgNU=; b=IqWuZMg3kIdD9sTc
	A57tdiKBThS/I7eq4ivqXQAgBEFvTsudL6Vgu0ZRltdVuEQIqWzCxnW2UzInq7nc
	isd4dU4YqqbqxuWzDmB2hIJHp6LSXeDG8eW/9svutk9aEBgQdVbGDc7EinGrqL8/
	GwSS8h4TzyPCJyhyrGxAEY3uCdpBmMpEl+tA9expTkCGPTHZWEGQDG1FlCHi4DCb
	bfIAp/Pp+vTFEwPo5PQ3jrIhFG2gZdeLGoryI3J7Mc1f8weuqe1vlG+R41hRIfcM
	lPjKm6uGgb8J0UoZpPbpYvJKKC97qwNF8Osn+rj9u1z3yjWUsD2kTF16tNqDelnT
	5+NvUA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteydbkth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 23:59:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915f7c37734so859971985a.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 16:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781567993; x=1782172793; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X1+NqhAiejMS2vQskIfQNFtVS24ac5HJGsGoWPBxgNU=;
        b=YVlq556ufPdQ7cAqOfU8VPAJa1cRTcb1aen1AMXw1Y+XjtmzI5dqr3sX/cUyngNRyQ
         a9H5BognQRk1HFbajtHhsHKHOTEZEOYl327hNKbc2WqcWaCPtAGLaaaUfxtgwBQ5QcQr
         q3V87UbPOHpytT0BcMDnyTnrmsx/VIRk5t1KoDwFAbsVCJHUogQLZLajjIx/cXrFv+5G
         YOpPjrRQ8lTZwU0fLc/yIc6fFgyznUAWjYYA5lmysgij9s4lZqxPiQC0v0NYG/42K7Nd
         H1/Tbeyr5PF8IiOwr0NqAZyz07KIblg1c2DYqn/PJC3hdFuwFvdqdKeXh4qmBnRil2Rl
         jbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781567993; x=1782172793;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X1+NqhAiejMS2vQskIfQNFtVS24ac5HJGsGoWPBxgNU=;
        b=TTSbHVxP7yCAECgHpXbHdyyS3vhRJkuPD+W7n8rZBH9UE4L8x6QWBtHMy5524MDv1L
         6KCa35jm0YeBQ896pgEvhsnvs8Zg9gcZ01qDWospYuZrcS8eeh54u8CliapRcd+lx0Fg
         gPt6xFDPADM2r6K0PIceM/o0l9Sn9sb8FXN6FLa6d9sDPdCLPKcfc1k0QIt0rhKm5lZI
         gTEm/UjY8J5Uy/adVIGbi5LloUwp2n8aBurwfjEcKVYaNAt1uYZQ07XXMyL7s7128Bq3
         UvTkNp3wEKOp1444r7jg05mjiPb4dbr/AJ0+c562rPAY76bnbGbFDcfx/56Ge3FvjsNx
         J7vQ==
X-Forwarded-Encrypted: i=1; AFNElJ+UslQeOEQ0RvfocxLsjpJyEedLsaG2pFttUEjbBRxrYhdwQK8I6WO9ALgOLgi6ympGiV7nXjgjc+M8@vger.kernel.org
X-Gm-Message-State: AOJu0YwGx37CHjHpIjGohH5wWGmpXRS0eD3pVeyxw4Z8CVi3Gyq0b8lK
	p+iukLSeaB3bOqN8TlOvR2SqbKNpwHfu8wsGK3Yti9pXzeDYK3Bg1dG/cYkMDSGk+p6h5ruAaqv
	+Yg7xZZKibMqkDgm+IsfBFi5OSShEA4AKe6MM8DY3+VaFe/z4mP8tgYn0E6YmY83iESTi+r0I
X-Gm-Gg: Acq92OEFarP8S9GOLTWuPHizIizQT1eizcd+Vi8QSXomQ4mtlRgtwBiO2YWC/6pwVQ7
	gCsL+pa6dh2kUY9zQiLMvE8zVk0rg61Qdb/BcocHTbwkimut0FENn6aGCaxvK7zQgJm+kla1KMP
	1IyIoBd1m17mgnnKQ3dhw31zrnr8YNAfLVcJGJgM6HmPLGm7co+3ngRG5bBU6JsxcmVTeVZEeNj
	bG0LLVODjKcHm+h58Q56zRXfaGw5H7RgYfM/1BZmQsxZPJyEzX9MF8iNc4Bn5PXPPWvmV5/SqgS
	6uYaTy68xIKnHh6/tXl7ZGyS5e9EK1FHrQJTb0fCnots02pevizz+GhBNBqzznThveTt8Sez3SZ
	b2N0DaqJ9e9rqfRjcCqsnB1EPctX4IdIoblzTB0U+nJjM09Y13MwQ8/oh+ZIux27SbU/BNYHOak
	Nvzzt+VDeI0U1nxvmkjk+uIQ4wfAAao1JJRko=
X-Received: by 2002:a05:620a:7084:b0:915:94c7:5841 with SMTP id af79cd13be357-91c23c7c7dbmr316922485a.12.1781567992753;
        Mon, 15 Jun 2026 16:59:52 -0700 (PDT)
X-Received: by 2002:a05:620a:7084:b0:915:94c7:5841 with SMTP id af79cd13be357-91c23c7c7dbmr316920385a.12.1781567992329;
        Mon, 15 Jun 2026 16:59:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161fc7sm3159486e87.12.2026.06.15.16.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 16:59:49 -0700 (PDT)
Date: Tue, 16 Jun 2026 02:59:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
        conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH RFC v3 3/6] arm64: dts: qcom: sm8550-qrd: add SPMI ADC
 channels and thermal nodes
Message-ID: <dz2leajz5bh5knzzhjlbisosfg3ujaokaoo5rq7lf2dzvgut7u@s44eop5u4li4>
References: <20260615-topic-sm8x50-adc5-gen3-v3-3-216a2b5ccb85@linaro.org>
 <20260615171519.F2A851F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260615171519.F2A851F00A3A@smtp.kernel.org>
X-Proofpoint-GUID: GKpfv1qIxyB_IPK-Rk7SajiQa7MrdSoF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1MyBTYWx0ZWRfXxaxUrPw0qUco
 F/cXnT18Hlg5sMBVsuvSE9/coojYEWj4hkU7OtgJG/zegQUMbTlO2PZPC4RtGuzSViW+Pgs8O3z
 9thHOrJlmeiYqLi8r7yrgkwV0xAN9W4=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a3091f9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=yLdGSESmcBtXjVWxBBYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: GKpfv1qIxyB_IPK-Rk7SajiQa7MrdSoF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1MyBTYWx0ZWRfX6mNSR+I2syit
 8yvu0GitObet4bzoLGP3EDqF90Lbzpx7UCNuwHtwiQWpJMeuxIGNYrfeifCvNb8JWmeR9pTBHPR
 cY7bRuAUIsSMKOUVBY2nBuzRTBkQ4dOl/q25RYU90CP6OVl/wHmKG+kXnvPyC7r71fEfLfv/5FW
 k7VjwD4WE0/hAkQP5iG7oAoDD0O7Fx0iFgQtlK4h0A1xFaUsv8mEJhQOzYyXgZMSD3T2z6mPBdT
 0bbiJ+ZqFqqD8DqlNruI4Gfgtf2Lh4lv6LIfp1PLRFa91GRHKVZlg1BfpsyfLA4iAf8FIxcUCdN
 TIfDipk+NY2pOTNK4qfYsPlQLU5hj7+I4OtmLQmXSUQEEFUB/AQLEgfAbTKOERrLJDwLYkz1g83
 715lfL/X3mbr5tHeebxlmVCSDRxjKx2+1C4CbckNwieLWiGxz/mriL2FeD0ObkJQA1Pdl/2ovuf
 Edavr/Dyv5famOLz5JA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150253

On Mon, Jun 15, 2026 at 05:15:19PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Missing `qcom,hw-settle-time` for the `channel@749` 100kΩ pull-up thermistor (`pm8550b_wls_therm`), leading to inaccurate temperature readings.
> - [Low] The ADC channel nodes are not sorted by their unit address, violating standard device tree conventions.
> --
> 
> commit 4a45cdf2d6ed588ab63165c08752b51ef046be4f
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> arm64: dts: qcom: sm8550-qrd: add SPMI ADC channels and thermal nodes
>     
> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> The thermal nodes are sorted by the sensor channel to be
> coherent with the system thermal nodes ordering.
> 
> 
> [Severity: Low]
> Similar to the above, this isn't a bug, but should channel@78e and
> channel@78f be placed after channel@747 and channel@749 to maintain
> proper unit address sorting?

Yes, sorting might need some improvements.

> 
> > +
> > +	channel@749 {
> > +		reg = <PM8550B_ADC5_GEN3_AMUX_THM6_GPIO10_100K_PU(7)>;
> > +		label = "pm8550b_wls_therm";
> > +		qcom,ratiometric;
> > +		qcom,pre-scaling = <1 1>;
> > +		qcom,adc-tm;
> > +	};
> 
> [Severity: Medium]
> Does this node need qcom,hw-settle-time = <200> like the other 100K
> pull-up thermistor channels in this patch?
> 
> Without it, the ADC measurement falls back to the default settle time,
> which might be insufficient for this high-impedance path and lead to
> inaccurate temperature readings for the pm8550b_wls_therm channel.

I'd also guess so. Neil, are you sure?

-- 
With best wishes
Dmitry
