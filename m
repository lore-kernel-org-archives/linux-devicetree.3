Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792581920;
	b=3ReoMqHJr4I4Drn1/ZsNQcHUHzb/xNqXKAXzxOC3nFJzyJcXWG19XIntRPHK6yJ/c6uD
	 lCma6eGfmMb1UJgOpfc1MFgSBtP+7inKWOvfYmx/fIylDg/sMZT4TnAUl+P4VQeZRy8Jk
	 XcvOmoeGjk0ikFsgPGaZxz3Qugp/WG81i/Cr2YZJXSDCZ54IOOBtE5sMClhZuB68bmDp1
	 TfLYKrGhk/Z6Pf7TCLjFxBgz2UPQLPhqjmY0aURp2D5fg+bvNHsjYmfcfgCpJ7s3F8deZ
	 RjA5UseRjJEgl7M56BcjYQ/z0+F+qdpf/zB0kvEtC/gj3EV0gJJ2mZDi/uRelfcN7Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792581920;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XsKx229A2cLUh6PDcfG9nagyZ9GT3vCswf9ByNtPLGE=;
	b=cuOjYSVEbJugg7KFdpOG/iiBJI8aEcUQ8V5MSXA5V5TXF65RW9l4PBvF4+N7pFAnH+e2
	 dCW0+uMY3mWfNAvqgc49f6WpDbONSwweq+lwdw2aKUPEd5xkEoi6Bre5BWqMrLyEaEYLQ
	 T3MGKOaFbwdzyjfEQ9hSMo918vSOkCpdgILKnjMmCTuD3a0MMPgYDacBl3c5jhT+FEs39
	 b/63fo1XqjjDgNJbss1m7TVOOf0o6JJnQ5sPEMsdbWhE/E4AM8dLMmkHHfIEi1aW5hFCQ
	 GGt9SZJfzshDSXIdsd+DwNJjSyfPFk9K4JuswuX3br8/WQekDaZsIsRQ2BxQxW7McWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fyeI7m3X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e3q7fQLf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D3960A261C
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89D3960A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fyeI7m3X;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e3q7fQLf
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA63ku3958413
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XsKx229A2cLUh6PDcfG9nagy
	Z9GT3vCswf9ByNtPLGE=; b=fyeI7m3XgCeXBBvm9Lc3tglUxyJyVwiC7LoydVcw
	BS/sYlty0A5J/hpXS9Zhq+t3ANy9qZsX1/oo/59O1+hl600qqeZqEjHvk9G3T473
	oIfN9pqorFLiqhUJlPdNaoyDxWkl4qFsVi+6QfG0rdV9nExf3fzwy9M2I2wn47lZ
	eghG5SlbcTirlgglFlRPk2JKratyZdI5rGSFyKva8cpJ8SLwpZXEPzAy5epq4v08
	YMrOJRK0Cgak84GxM1NLWCeO9EkRrjLSIqby7ssUzqzAppklyXKSokwLiW6ORLF+
	7MD+Ktq78D6VmY9UxgYiPd2+E+8iZsPzDFWQ0euMDbw57w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0kn29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:25:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so209704985a.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 04:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792581919; x=1793186719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XsKx229A2cLUh6PDcfG9nagyZ9GT3vCswf9ByNtPLGE=;
        b=e3q7fQLfbGrZKLlUo0fu0DZ/Wkr9w/pJPTndeSC9r/d7gPtLWfVuqvYB+YnxxIekyi
         jqJ2xGu/92YNcPuJYGq5FBNBGCYBifHSYWElPEy6pDaMNda1H4v8Im7MgDUfys/FbR9y
         qzhdAhn8CPqsfFLNDk24VV1DlIGJpHCbALJFIjV3ITJgjhCYMxD+Iw14y4SKM7IYXiKL
         RIDzLXoeaOTd6yv5kZ5zNbsgCpME/YFLT9LP+zlT96kDLjBPg4hgU9n5PiafLG9dnWoR
         /C6D0Ta9FL8qgo161Kl8zWMHATUteFm6CT0XCMHsyy4HRcTXjpZRPiKM5zwx4BCz9q1j
         PxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792581919; x=1793186719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XsKx229A2cLUh6PDcfG9nagyZ9GT3vCswf9ByNtPLGE=;
        b=TzY1M8LAEu1bytNIBkPNNZu5Np1ClUJ4Jx6PJIH3UtYn4GFiVbGXY7BQlIAEJjJSmd
         6nuytHQZyVg4rrsP75l0b99GTazH0qJlq7PxakDCXnB30KGOn7Sy4VtitSqQrhbwsnpQ
         5uyYOi16Z0TTJi/h4J9mRAffROmxT5BsWFAGjaWlNIpq9zdEKIhXyImGxIVLJbeXcxhH
         vaX0EshdAuip5VHIYTed0Y2/G2xhPHLD/BfKznkYubfZcow/5b/xPRn9PjhG9DC04FAN
         Z2l4k3ah1k1sieUQwASnUp1qGkDJ8nr1fA57PqkfmEYfL8S2HOJnUGquUSMI91a1L/sX
         j1Yw==
X-Forwarded-Encrypted: i=1; AKwUvBz6p6STneTV9mBcaDNsO7zDi9JDqgifdMCzjDACe639DI4qB+dgNS1BgPnKH4LNrgKZCxmQ2/wW8HRU@vger.kernel.org
X-Gm-Message-State: AFq9FYIDuZj/IAIWpuHCbjvIu8wgVDkUQPOAQAsGeG90xr85lTxGRVOE
	hH9qoleFwEl1Jo/k3c2cLjR4GI1lpE3CuBXBnvTISYRQaizQlYOGq2utLxrvyV0/932rIWrV83S
	StOZ7TobrdE4HummdpGrJMP5JZstBsAgCf7JgxtWeW/hMQeF0DV8eX3diZtWrsGnm
X-Gm-Gg: AYBFou37vmiya10Kh8JkO00DSl6WPe5J5cNuDV4uX42bjlgkBQt1FyYU9Tb0z7TMtdQ
	4PH5xWDeUh2VI5dMlXwnxIOrBk0Hr58onflbIeBkPr4pacavp28Y7NkW22JSNeuqs3XQiqRP5Xl
	MVTTomhl2XYwLUvcgB97jpnyyioJ8qnTvNq/Aok94UUhpBRCtl6I+Lei1Pu741Krwo7YdxnMAH/
	nUfcNsyJL+4s1pZ0iUAu9OuC0ghtgqDuvQ7mWQpMjRnCI61SxozLYPKNxQNEGGfqFU4ure1eUGw
	nvxG3/ruxjUGqh6qBaINiRfE/6S6xfyejOPNe2pP8ynBuHxqYTNHVXi7yeiTnAeo5/z1BGYupDI
	Q72f+FPKcgipvH3HUPdnxP6+WxieCXfMp+fSh9F0Kr5Eo7y76Oc9pVxVRQy6Dq/MW3+SFzLFdAE
	GoygyJCgPngadW
X-Received: by 2002:a05:620a:649b:b0:937:27fb:96f8 with SMTP id af79cd13be357-93f57f580cemr334950685a.41.1792581918777;
        Wed, 21 Oct 2026 04:25:18 -0700 (PDT)
X-Received: by 2002:a05:620a:649b:b0:937:27fb:96f8 with SMTP id af79cd13be357-93f57f580cemr334946285a.41.1792581918255;
        Wed, 21 Oct 2026 04:25:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac437d6d7esm5338761fa.30.2026.10.21.04.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:25:16 -0700 (PDT)
Date: Wed, 21 Oct 2026 14:25:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] arm64: dts: qcom: msm8998: wire up interconnect paths
Message-ID: <iijtxya7fr2xvo6kaaiydda5eqb6eicqpwkwrldc6fmd22ub5u@dbty5tsl6jyy>
References: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
 <20261019-msm8998-icc-v1-8-c2da3934b6c8@oss.qualcomm.com>
 <aee928e2-909a-456a-8ab4-66d8b5aaeaf5@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aee928e2-909a-456a-8ab4-66d8b5aaeaf5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NSBTYWx0ZWRfX5Cb+QCAaDUf+
 9k+8wHxTDIE1wdVuZxsF+rDCGDeMgXeBHipwWiWb3aCHnR2M5g39tslbDDpN4vYiXn/MphXjzrV
 e/P1ekfuAfXFjuC7MxPWB5kOvAuuRL3QzbYJ6IxF46AbZ41B2EALiUUPd0yr4hxE+HW1yTgSYMq
 w24KXWRpX7YCA5QvTIZQBQv+jtXgNHJhCQuqPWSwlhd0AmAeNq/tKpIq91wnBC7OIW0WURV1dbn
 TttoTgdxA7Hcw7MU928/6Y5N14TSjCSPcDZf6ZRQ3GPJqinCNtbcS5okijkddIC5B46Yj0et/NH
 RBlmmlB9zZOFwNuEamqqwK6AfUjNS9f5rPZ8T8rHU8ynetdhZRNyzJplhAV9W6MCb/Sv03EYZXS
 AXnZK204cwqUMoWNIJxPAjW9aJEgmQyJia7lXcJsRMin6b/M32rv7e7GnjyIyVEHKgkpZaLhcV4
 D1o/yozYAn570A0VaMw==
X-Proofpoint-ORIG-GUID: CXUzpyxEmjCadiwaQ_xpFyOyeplzBdTs
X-Proofpoint-GUID: CXUzpyxEmjCadiwaQ_xpFyOyeplzBdTs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NSBTYWx0ZWRfX1tM2uN/UnpMt
 ZmoMsnj+BWImb2CECBFdAlsQSbq3r4zVz2fLxtEHXl8rHyHtdyYUlvLl11BJ8UtbzR2OQ/jegkb
 lwFK6IP78rBMn3eWToh+wk5vP5KPRR4=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad8a11f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=Q16rnCddB8cEJ5J-xv0A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210045

On Tue, Oct 20, 2026 at 09:16:15AM +0200, Konrad Dybcio wrote:
> On 10/19/26 4:12 PM, Dmitry Baryshkov wrote:
> > With the NoC providers described but no consumer referencing them, the
> > NoC bus clocks stay at their boot rates: nothing votes for DDR or
> > config bandwidth, so masters such as MDSS or UFS run on whatever the
> > bootloader left behind.
> > 
> > Add the interconnect paths for the GPU, MDSS, Venus, UFS, USB and SDHC2.
> > PCIe is deliberately left out: MSM8998 has no route from the CPU to the
> > PCIe config slave, and requesting one only makes the PCIe driver fail
> > to probe.
> 
> On upstream, sm8450 is the first one to have one wired up in DT
> (intriguing), sdm845 is the first one to have one in the icc driver
> 
> Downstream, 8450 and earlier do not have a path defined on the PCIe
> node but clearly that relies on lucky ordering
> 
> I threw the LLM at msm8998-bus.dtsi and it said:
> 
> The only edges into slv_pcie_0 come from three masters:
> - mas_bimc_snoc_1 (line 669), reachable only from slv_bimc_snoc_1,
>   which is fed by mas_oxili and mas_mnoc_bimc. Neither is reachable from
>   the apps master.
> - mas_a1noc_snoc (line 679), reachable only from slv_a1noc_snoc, which
>   is fed by PCIe, USB3, UFS, and BLSP2 masters.
> - mas_a2noc_snoc (line 692), reachable only from slv_a2noc_snoc, which
>   is fed by mas_cnoc_a2noc, IPA, SDCC2/4, TSIF, BLSP1, and
>   mas_cr_virt_a2noc. The last two come from slv_cnoc_a2noc (fed only by
>   mas_qdss_dap) and slv_cr_virt_a2noc (fed only by mas_crypto_c0). Neither
>   of those is reachable from the apps master.
> 
> But I wonder if it's some sort of an oversight. Can we try to
> regenerate the paths internally?

I've only seen a tool to generate RPMh drivers. But it looks like your
intuition was correct and there is a missing path.

-- 
With best wishes
Dmitry
