Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFCF3ADBA2
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 03:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783308521; cv=none; b=DO0ELvSHW5ehpOcwkgPoiSDmcSsbB+8oQQ1qOZsvhKuG8ysS385Nib3b/9ZBDq4jjzB7eIl+5/6ZAi/xiv0DpN5EQSrppIDrbN9QLI+EfTJNpp3blCbObuU0POAblq0RDdR0zHVRTMarSGELVX5rUa7Ix98/jEpSmf3Chb9gAXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783308521; c=relaxed/simple;
	bh=XXnnosBHHEG+4Tp7rVSsLTBezTokdwoXuJeq610RzBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnhGSrwoW8186bz2kk7Sgu1i3wrRNKSRSZjGj+6T5GpG2DYt7COXjoeIF7faueLT51Rj7McBUdVFY7mjpqbuXp4ZS82sFA3gVC15MKrWe6tGCp6QafznrR0aIUtSC7V1993avLay8/W047reEadUjHCdoUFPAUawKlRAXYUSkm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jz5EivmA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jh0U9LWw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jz5EivmA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jh0U9LWw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665LxgXF2787173
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 03:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eK6+g7ouEyZ55quMY4a0IzhrH/gHcqLqIlm2JyFXWbw=; b=jz5EivmAlCnGEhaL
	5snzz6HCL+8livh/joYJB+fiMly42Lz4hQz94ZtFCXintREAtNsVIk96M126b5ZN
	7RhA80pPsuc7SQn+hdd4AQnGJcwkNKd3lIW3t6+gCLY3EBdgN/L0apOwDJXDkfbZ
	xZnRCCUQW23gm+bS5cIX/ws/bxSv37QOoyvaefzRjExBWFuMumCkTBm0RuMtDBIF
	5G5KZcotgOmbQSBhUUO2GtdKfbyA4n/UKTLX7Mq/bjZD5m0Vezn4oK+4W1DlkG3D
	kCUvvOMq1SmSUviOD5Jj4CEAW7THLe0S0/WX9T9RBtsM7O6X7tannBb455G1SxSE
	ZxNFqg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qhnmg4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:28:37 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847c3a12ce8so2602414b3a.1
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 20:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783308517; x=1783913317; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eK6+g7ouEyZ55quMY4a0IzhrH/gHcqLqIlm2JyFXWbw=;
        b=Jh0U9LWwNvXw40c9K/kzfPOaKGIp066Z5XayKkzKs0YzcHMkJ4yDA1ULZOLCRBb1ay
         zsmi+e4JGzJCCo6yzZGGc6VghZ78XosZaYsIbvzDBxr198Hwp4KuVz+4N+Zo9mSKZh6b
         vU4kNm6kGXuqHwbz9wRkNIAFA7SQOEZ7ecJzUWIqCgFDnyHoL1/5NRscry3vBPfS52wf
         8R7Qn4JN+1J/crBG0ZgweWybTon+H0uW8jyUjOVTJGVQBQm5pW5046VD/ZqNnivjao/K
         UPJTN+IcIvdIURc2SYqbDBLH+FItCzjhYkr4EdcTeglkF0yi5uQJBCX2noauaVeP/b6k
         JYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783308517; x=1783913317;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eK6+g7ouEyZ55quMY4a0IzhrH/gHcqLqIlm2JyFXWbw=;
        b=ib4lBOGqA8FU8Si2rQW52gftmIK3RYfbqpyCr23Wdka61XsmmLekl5XXnsfGW/90P3
         VXdt9ZT8LmdbLARcSpa8sOCl6DA7MzuN4gbDlsx/6cgZrC/aBIW/uRX2UGA1et5ljUVh
         JhrOyLtHup7YvUQHWwcpYxQoErH6yF0ABkWQ3dYx+4gT9Fu6nEFy2ivU5J+R9yQWKkUO
         RheJKR5imMzAwlNJDJoalOu0Nsf6jCOJ5jgickjTlPwjlRZAgDcYbHs1Bou2E0+8t+Vy
         EWnazBqcp+IZ6evGsEjaTiDTDDACBhGR0cpkIUcGNL/gh+p/7C2bCDc3/98grgtStyoh
         Xhew==
X-Forwarded-Encrypted: i=1; AHgh+RrUBHH/+AUwbkE+v7PhULhga8Tiv5R04Fvug4y2UcecB2KdFYHFIfSntfYewBZTwA4d1KQvneMUsjT/@vger.kernel.org
X-Gm-Message-State: AOJu0YzHLh/dEg1/iE/rqsM3xOqShiXk9V3EYf0uoDSAZ/Egr8OJC9mA
	9joyfX+FZa+p46+0e3quqDOeJM7Ks7TdSJd4XHQNFAg1VZkJOL7J4++m93XfyfM/YPpcSSFBEnf
	kzgkReTHWxc75FB8Cu3vdnofwQ2uZtdgxP4jCZPuf6NWh8vnxlSz2vYciASuoHPMT
X-Gm-Gg: AfdE7cnrFAz7MR0Zq+Y0LoSyc4V/lMih0CRbcTnyCxWw0YfTlHs0gbOdB5jMDDkTApn
	gIL9Wu+4WYsI2Bsy2sytEucCzYFxiOKsOLrRsFPjzra4iMAmT6cN+z1gbQ9M9Y+b1sgVlx2AXaO
	ttc17ol71poS+KVNtnni/r0Po9Z2OdTy5gqUUOFG3FxHldWJ1Mh99FNE83aYM2MNDsrjqfJ7Yfq
	TBVuOhV/xVWtQP0XCD2ZTXDNGzsBMXzwhrOX4gY5qwImvrKKs4pKxMmMOwzr8YNxjom4gKb763O
	TVGiCpMnWM2wkndz6X9F9zhISRVwEUxefX045URrFMiAgP1SuFjxvGRmDDWJOWEkH/BKrpR9wEi
	71q9rUVH+YHcxmWOsAagmqJiVJanzvdwgkeVz9rWfoZvar6V8sRjw63ovaQ==
X-Received: by 2002:a05:6a20:4309:b0:3a3:a9c4:3d60 with SMTP id adf61e73a8af0-3c03e25825cmr8268388637.27.1783308516605;
        Sun, 05 Jul 2026 20:28:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:4309:b0:3a3:a9c4:3d60 with SMTP id adf61e73a8af0-3c03e25825cmr8268347637.27.1783308516162;
        Sun, 05 Jul 2026 20:28:36 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b816a42sm76309105eec.9.2026.07.05.20.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 20:28:35 -0700 (PDT)
Date: Sun, 5 Jul 2026 20:28:33 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] phy: qcom: qmp-pcie: Add vdda-refgen supply
 support for Glymur
Message-ID: <aksg4arKjUXdQfA2@hu-qianyu-lv.qualcomm.com>
References: <20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com>
 <8811c181-9caf-4797-8e17-52311702e292@oss.qualcomm.com>
 <akJhrpyMuLnoXzJM@hu-qianyu-lv.qualcomm.com>
 <f2c68d67-1b12-40b3-8097-5b863d7710ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2c68d67-1b12-40b3-8097-5b863d7710ac@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDAzMSBTYWx0ZWRfXxA3NEktpXg/S
 +DHqcSX0/zhIASyev26b5qf+yaiqcVTS3vdPo+bsI1M4zG7oD9jofUhVypOmTjOGyffCkFnIIsP
 7wDoZlAfdDa55FrOD7KJzXYdqRVvQdc=
X-Proofpoint-ORIG-GUID: zdDvTchJq9NrbUhEgh9cxO4J58ShWUNF
X-Authority-Analysis: v=2.4 cv=J+yaKgnS c=1 sm=1 tr=0 ts=6a4b20e5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mkIokxEfF-L8pB4xSJ8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDAzMSBTYWx0ZWRfX6T6dwUt3OwrW
 OHTrJ1y0/YKS3APKNsgg9ZO9Yk1xXRhF1ZVWSabwZxDvVvGQHxgge+e866w1rC9KXy1pSJj1p57
 9QEiO1vkdz5CEs4XKd/+HgVm7ncLbAmv0LQepy8vOOGb5Jto5Qg6Q1RI49SuON57r7UD5Jf1bqR
 Yje4u7ELgjnQT1jagihLzRHVMvOXCU4GsBcwEx6N4ZorcgUoRpzxYL3fiTRt9rwrcJL5bHdaW2m
 D2AVnF0fgCbaZzU73m/pvNifXi1M4IP0vu3LlcqZr0tQZHsGE2tQsuGOwPMbefY+ojP9HlSftEB
 J8N9VmBMs3LrmFIbhb3gMipAB/h2QpFNUdkp3OVdE2mtCv/X+9i9dCRzZYj1BB2YYrrwlwnZQGn
 Ynx3YnNi4qz4PrvETLwoiV1+kZTvyZHsQ3mm/uAa6qtvJOxSxzZa8jBbLYVrNndzimpk5M/4xvC
 wshKhAJw06Z1XyT6OBA==
X-Proofpoint-GUID: zdDvTchJq9NrbUhEgh9cxO4J58ShWUNF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060031

On Mon, Jun 29, 2026 at 02:18:35PM +0200, Konrad Dybcio wrote:
> On 6/29/26 2:14 PM, Qiang Yu wrote:
> > On Mon, Jun 29, 2026 at 12:51:55PM +0200, Konrad Dybcio wrote:
> >> On 6/23/26 3:05 PM, Qiang Yu wrote:
> >>> The PCIe QMP PHYs on Glymur require both refgen for stable reference
> >>> voltage and qref for stable reference clock. The refgen requires two power
> >>> supplies: vdda-refgen0p9 and vdda-refgen1p2.
> >>>
> >>> can be extended in the future.
> >>>
> >>> This series creates a Glymur-specific supply list including the refgen
> >>> supplies and updates both Gen5x4 and Gen4x2 configurations to use it.
> >>>
> >>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>>
> >>> Changes in v2:
> >>> - Add dts patch in this series.
> >>> - Reword commit msg of dtbinding patch.
> >>> - Link to v1: https://lore.kernel.org/all/20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com/ 
> >>>
> >>> ---
> >>
> >> Is this necessary (for Glymur) now that we correlated some of the
> >> TCSR clocks with the right nodes?
> > 
> > This patch is necessary for glymur and mahua and other Qualcomm targets,
> > which can be verified from the REFGEN page and power grid page on ipcat.
> > 
> > Take Glymur PCIe3 PHY as an example: it requires two REFGENs — REFGEN0 for
> > the PHY itself and REFGEN4 for QREF. In the TCSR driver, only the LDOs for
> > REFGEN4 are voted, not REFGEN0. This is intentional: each consumer is
> > responsible for voting the LDOs of the REFGEN it uses. Since QREF uses
> > REFGEN4, the TCSR driver votes the REFGEN4 LDOs; since the PHY uses
> > REFGEN0, the PHY driver votes the REFGEN0 LDOs.
> > 
> > For some PHY instances in power grid, you can only see one REFGEN, that
> > indicates the phy doesn't require QREF or the phy and the QREF it requires
> > share same REFGEN.
> >>
> >> Perhaps this would be necessary for Mahua since its clocks don't
> >> require QREF (or we can lie about it and handle them there)?
> > 
> > For Mahua PCIe5 PHY, it doesn't require QREF. So we don't need to vote
> > REFGEN LDOs for QREF in tcsr driver. But the PHY requires REFGEN. So we
> > still need to vote in PHY driver.
> 
> OK, I think I got my mental model of all of this straight. But expect
> me to make more mistakes and sorry for that!

No worries at all. Glad the REFGEN and QREF topology is clear now. Thanks
for the review.

- Qiang Yu
