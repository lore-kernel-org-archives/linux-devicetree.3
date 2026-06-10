Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D94E409E0F
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097737; cv=none; b=NQ2oiCkJbBI+4676LZGXd3Khl8YuSMrXgzvhVLnV93ukThTiHClqCG4EPo5hgiD8lEnSmGwEatiGAVmeOrhQZOVH57myAkgcVSTlOYGj5QD1xzTRW+LLOqicus2iUkChZMS0bGbY1xW2hFa6jIIocRzk0/hyYC7KEhcuRfWd9N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097737; c=relaxed/simple;
	bh=DxcFDEDab7M6jTdXLSVgfP8bv6eIibiRgkV5gK/3UKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0/CXpT6RljrECXvSerRQPWFLJ7yRQ1V6XiR5sfdBA5d6Qxb0Cz38fV8A7FhbVtO+0ZHYYvbRU+4JuTbZg2qjo42H6TY2D1d7DOTWQ2IXNteMdu/6FwxUefuB3LwIzcz8LGNml+ZhkazUkPq4Ozjz/J8W8uKtzBFEPK9/FF0blQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFGe3Wbs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aLZu/CGO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JFGe3Wbs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aLZu/CGO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBjJN1134965
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7xGelfqpYfB35fDLv15ULStO
	ev6jl3t5C08PX3tm+2Y=; b=JFGe3WbsfpL57t0BSkZsngpT5kgI6RRH05Std07A
	4FImlq9LMUdl0kNK+QacVMhN5RrAtUobwaVFzCR5Sp4uNY3gZNIxflAm6a3wh+Kg
	+y7cu/i539BMOIG4gplV6n2/3c5+gAL6D+WRJfmDDo9i9z8Pbu5is5TvXLOaq9Di
	fBfXkkWWeaL2ORdLr+DSwzGB0wFdBK2MDXXg8ikJYl5Me5mB1xZtjsTbL7qmQNZk
	F5iI0SiusAnTs18oGWK5N6fh6wO+kzvaZPT+2W7MTUSUE3RrExmHzpe6X9QdiOiv
	Qf35TbiWR9uIi+En7ffU6RqgITn39AXi6AoKkEsr+hNO5Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0m1syg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:22:15 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6751db2792dso3211795137.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781097735; x=1781702535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7xGelfqpYfB35fDLv15ULStOev6jl3t5C08PX3tm+2Y=;
        b=aLZu/CGOrdAMl383288YpyRho9ay01vGpe7bJ6lMogWJzHNrFrzjciD+/YfqXn/foI
         LLOlM75CaxtA2jlt+zSkxnt06m04Zeu2Tv6esB6ReKa/0kR2Mzq/winckkOXwGiJievl
         yGZa76L6qkN0Gp5Yny7xC3wvISn3X+GAjWOINQycDtfL29IHuQXOmgbrJvnffdnwlpB5
         9hUQOEeXO1Lfinm/hwxN8M8+0qyehIzyjsEJv7bLw1OG419hVkY2WrUWb+nprVlhvSFJ
         jUqkM2SGTxQ/BSYEl3nmNHjab3s4BkHmKFHPwDaXPVWD1TmegJeHDl68W2Qm5vq9/ckE
         oMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781097735; x=1781702535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xGelfqpYfB35fDLv15ULStOev6jl3t5C08PX3tm+2Y=;
        b=EV9dO0xydQl4AEzClOIhFrbtRadDkJvXOXe7BZxujW8Hi4xulqPV3R11H73XZqaPLP
         aBc33BDyGyilV19sxVtSP8XpFVrtCD1BmJy+c1y2sLbPWgAocBz03QTFHj9sXGi1ln7Z
         Zqa5LqX6fkHIbOKve1pLrofpjH83/ofaUg3WIzPAfC232T4QZg0Wr8UM/+fMqeQWL+XB
         HnQPB9qcF4nWqNAcRdNpgIzUpxQ9VPzVit8YpO7obRV481t7XGMHtsKYpFCu+nRaJZtr
         jz40fS8zEHzvIX9TnAPRei3gZ+XKo5YY+fm9eiAIi+21LvFQ+KnmRDPLW9oTDoAUZtgl
         YxzQ==
X-Forwarded-Encrypted: i=1; AFNElJ86yBdmWUCmajh/g3eylX0t3ge+2Om2W7Obsuuz2CG/EXM5bq2PGCLxZ0swXawV2zAiWus4zlIxkHFC@vger.kernel.org
X-Gm-Message-State: AOJu0YwdTIjjrrJ6vuVgLq4poHxD7fEXH/U9STLlKo6go1IDS1Z7PvW8
	Y/NnJLnohjSUCvBw44qxET64lNN7nypDCX8duzeASkt9q2MVJtCR3bJtcX5Ojch49/bEYi7pAVO
	5gi7l+L2pqvPWcFxD6ElbGGBo62Ld7Ne77TMzr3CIZw2MRuDlAYjmoXiK+dlKW42gWZkkdvkY
X-Gm-Gg: Acq92OF6tybZ+sB7f/NJzqWw+i6I9FVL/OL+wyJS0Tqrs1p2gV57ItiCsBNOEq8asDq
	UhuTHZpo8gg8k7PRC+JotBMrKC8I/cLg4GFLR/CV/+AVa2c+dJFJWGYahjgmcmY9O7e2S0Xm8wL
	o716TdoPgCSPbfyZT/cT79D+Z1UFo70dM/W4qas/qXngpQegWIDYGp6HxuNwLuggapqYhexqNGI
	lYrouIs/GkKzZIAwl0y3NSdpETvI34R4ElV7XVQ00etPHyl9KREgfjABnsSzzchIOue6pzH9D94
	2WcaK2X+Oopl0bqrJdtEVSWpRnF7yLq8Q8SJ8LhQ4qKbIbf2hgizixYXcTPUcFpJRJtc+75pjzm
	rJyPWOkbQsZvPWYlFkY23e91F1hy58cqRssK12+17+TfQUVgTXwTi4WwGoBHIBDRizUuN1W0aPG
	pl4SY6J6nxjgX02DFHp109sZHfXejtHf1LD+2yXNhMfuAsjQ==
X-Received: by 2002:a05:6102:8028:b0:659:3ae:e6d1 with SMTP id ada2fe7eead31-6fef194813cmr14333117137.9.1781097734659;
        Wed, 10 Jun 2026 06:22:14 -0700 (PDT)
X-Received: by 2002:a05:6102:8028:b0:659:3ae:e6d1 with SMTP id ada2fe7eead31-6fef194813cmr14333029137.9.1781097734037;
        Wed, 10 Jun 2026 06:22:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99c2b9sm5388071e87.80.2026.06.10.06.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:22:12 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:22:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Konrad Dybcio <konradybcio@kernel.org>, vkoul@kernel.org,
        neil.armstrong@linaro.org, olteanv@gmail.com,
        linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: msm8996: Add VDD_MX to QUSB2 PHYs
Message-ID: <rflqwagxxbebskp6lakuqtelbxfohcfanhtqltsafcrdnyvgwk@27dnwm7y3vqo>
References: <20260610-topic-8996_61x5_qusb2phy-v1-3-d7135980e78f@oss.qualcomm.com>
 <20260610121824.111631F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610121824.111631F00893@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyNyBTYWx0ZWRfX3ZoX5dIxdNxJ
 lcaXXUcdXFls0oP3mKavyZa7kYkhsu1SqEXi4Jvv1L4Bm5/4o5+6A/rb3sP6E1x+/Y8zqcW676t
 sYPmJDTj04aCnKOjJDsfFbMwh3Y6luOS3bosOWD3+kj2uOOwj+VTuNE47Orll/N4SqzSQJ2VMua
 m35SEjVB1il141q3ydBwN7AKUVaMBWFVGD9GI9dwhT9j2e+jsIe/Y81oxUDWsZKjwgWuzT498QP
 qC8sbYitOyeluE1LbOXZP45kxGGMddojJ/HRIpC8x4o2MFrsFoKezDDXz9/4bAEUUpHtrR5Q0XG
 cp/4Biamrg+soeW3pVcbKXzoWu8Bxfu+oWQM68tbH0jCE9LXxHVUurDhkQSqcYm1QeP7nk7r6Om
 vSSsguS/jJtF4DrNHYA6lfdRa3wOtKSFPc03Gk/fAP9xX6JKO4yw7E20MJCJPGiZQSYBQpb20VU
 AQ659ztLrgX+zHP4tfg==
X-Proofpoint-GUID: zgg9D_ZnMm7oOJrpQ0o6qUhCbwLLqPq-
X-Authority-Analysis: v=2.4 cv=UdJhjqSN c=1 sm=1 tr=0 ts=6a296507 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jEOOaJWfrG8VwPnPn-gA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: zgg9D_ZnMm7oOJrpQ0o6qUhCbwLLqPq-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100127

On Wed, Jun 10, 2026 at 12:18:23PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Adding the VDD_MX power domain interacts brokenly with the PHY driver's runtime PM implementation, permanently pinning the VDD_MX power rail and causing a severe battery drain regression during system idle.
> --
> 
> commit f3735b6dfcc42f0f55443d0f81c7b256532b0e25
> Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> arm64: dts: qcom: msm8996: Add VDD_MX to QUSB2 PHYs
> 
> This commit adds the VDD_MX power rail description to the QUSB2 PHYs in the
> msm8996 device tree. It explicitly sets the power domain and required OPPs
> for both primary and secondary PHY nodes.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > index 2f67e665996f3..b7cd1928335c8 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > @@ -3192,7 +3192,12 @@ hsusb_phy1: phy@7411000 {
> >  			clock-names = "cfg_ahb", "ref";
> >  
> >  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> > +
> > +			power-domains = <&rpmpd MSM8996_VDDMX>;
> > +			required-opps = <&rpmpd_opp4>;
> 
> [Severity: High]
> Does adding this power domain permanently pin the VDD_MX rail?
> 
> Looking at the driver in drivers/phy/qualcomm/phy-qcom-qusb2.c,
> qusb2_phy_probe() sets up runtime PM like this:
> 
> 	pm_runtime_set_active(dev);
> 	pm_runtime_forbid(dev);
> 	ret = devm_pm_runtime_enable(dev);
> 
> Because the driver forbids runtime suspend by default, the device stays
> permanently active. 

I think it should be solved separately. For now, let's make sure that
the PHY is properly powered up.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>




-- 
With best wishes
Dmitry
