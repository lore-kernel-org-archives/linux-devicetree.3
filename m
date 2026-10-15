Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7B851A722
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073944; cv=none; b=J0Txt77LrI3FgzftHI/2KLy/mnF6XOtChwU3aJqX5e22myK0BlTmfy5W+y/jnPGg2De5ZOPyeP8sLCxB78GKzDfV2Ri3hk6RO3PK+BOmf5Kwuq9T406iB2/zxqDxd8VU3x3nOZ3riNi+ongCE2piYRS1LzfiiQypvXWwLqQJn9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073944; c=relaxed/simple;
	bh=mOiTog5tfPT9mRHcxwNC8d7TWozkEJuMOC+++b28ufA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V+Tco1wQiTUnX0i39iSeZ5RCo3F16IS2u95iuSisw0m4HCzY/nNakIje+hfgEL2lPQhZ+SU1Oux48UW+HjUnFq8iRiZp2nNaWUqFckOAJ52nXrOhjXRrg+nTcAf9VvCDnES9vfTC3dI/jHDGfg7X8QoA72NLFlbmm0+5W82yNOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oJXuN8Nk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jb/LnVgI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oJXuN8Nk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jb/LnVgI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jVx12416857
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3MsqTcPadrnF2+XI+izdfJ39qRikRltf2g8Ip5cYrRU=; b=oJXuN8NkVUon6SoG
	PyaVV2K9qzrSjMOCSeqyRYPS/q01KNz3NhKLR6QeSLmKSrfBR/Q/9R6rZiSeA7dM
	MV91W9B3dDZoGtEfflRW+S23Sc6AI5iD89PCWyUxkXzukiSFesJJpevyzMzLGekP
	HRrMPWg0xm+XnJgyV7b90+FPkUHCYvcjHtWs2ufvEi2t/cSUMbejnPO7OBYUPyb6
	kxaYnQ6hL54cxnbwm34HMkZ1CCkkinK2FaaQfTI77/4Kr9eknkYe56GgpxEV1fKD
	p4gVQNy18pRZkKRe3TCuWyupVpWepVd/lrawfEmw/7VBeSHXq6PN2tRYA0aJhRVx
	bM1Q1Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhjh7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:19:02 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c2b7a15cedso210179137.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792073941; x=1792678741; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3MsqTcPadrnF2+XI+izdfJ39qRikRltf2g8Ip5cYrRU=;
        b=jb/LnVgIQIe6xapcPEGBM4ZIHZRmzEfN6OS0OKw4MMutCMxusyAHl5zM98vatp933B
         HL/OYEecBhXVrtwiGsJ+d+uzQ208smPvE8zvoDjexqpqxrH9nvsd1/WUMbVlgY6RuEsU
         hPdrHSPpRuBVViqlaoJ+L4c4aqMRt/cmseUA9ryZLS89Fy7OmMoC9hDk76IAK5iwGX/m
         ZNIs1hk/9yqYdfRTGgcTf9C1R1fCAzQlKFnzee3w4ibjGMZ6lnZ5OqqJ0zCNbbAWQRAe
         ePvPRoMTMYLTZuRcSlxgS1hXhWRlbHwGWogshRDsjHfuXFbEwlitfN3soJeTAEMgEg8R
         2QRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073941; x=1792678741;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3MsqTcPadrnF2+XI+izdfJ39qRikRltf2g8Ip5cYrRU=;
        b=N+vkjsg3ndIWVGUZg/vvLa4uauWjVtTuCoQyukTZ5RFwVgluEDzZQ4WMWqSV9e8UjI
         ysYpcQkornzTWNfuHw2BIl4QBNzuc5dQbR9zg2UVY8MtBtv9lppHyuJLAwKQwRNKSOgX
         bwjc91PW7R8IUK+tPZeG2qTlvXmV/ph4acOj3yxUZopGI7QRjoWHJ3VMvHmUk4GYbipR
         T8I8Y28HJvu01yiL/uli5ldZQIhSme8NRMFHL+7R85ItcrToftgP1R2QlZBE5+nRMDku
         qhdC/d1prrkNgXUXUrymaM0dupO3UUiFL25oqNoLDYSzwyEeL+zHj3ENpYAErv8BNYtt
         X0bA==
X-Forwarded-Encrypted: i=1; AKwUvBxceGMxDLkPLiOy/yLOPLiA+GEaJEOsBmrr3Bpe10Hj6JQUzIEBJKQjtsTobKEseRmVGhLpRV3d69pG@vger.kernel.org
X-Gm-Message-State: AFq9FYJgG0VxHO5P3tMrDdf3Ap7AFbIHSXWfpMtW8QsXL0gVSlIjol41
	t1QMkfR4xfqWhrrRsbiTGP9SS+pA5/HhQWLFMLfziuxJ2tYkW+EYLQxG2RypBl3rf0SA/tpS7qF
	yZtQwTDHZawTDJlWFwTrXMreha0j4fs15WA6WgyaWiZdcqt/x/8eA2QyY+GQcVekO
X-Gm-Gg: AYBFou1PPY1W7PJVmIQrLu5lLMiPV2EOmP7YoB460RX6oVzkbkfxrOmLSv6RSQANt+2
	qzkeo+Wpnnz5rm1QiHDQPWsXYDs5thBzigpa5QpWyqq/VDbKXDrN95LUu+69tKeL3VavbfQH1MD
	oz+GnrdBc+HOotnWs6MG4lmRgJlU7fScadwQDHSr3jfhv0OJialoUqN1Cprz8D51eH9kQsbIqsD
	XPR2UpFsr6xi5X4+uRUnX2El6Fec9mKJF627Xs7ltTdTvZIipvGDUdN19VV6ksiqJEGkazb9atu
	NCK3uIWjI8YpuNqhUWRKw3sIp+CMvJB5ntq9dCEcMxkCqTjcT0bhJtquKMm6hIM5pcOOKdFhIph
	SpCzQmHIigpRDqsuz0c9jtA==
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr4063284e0c.3.1792073940864;
        Thu, 15 Oct 2026 07:19:00 -0700 (PDT)
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr4063195e0c.3.1792073939383;
        Thu, 15 Oct 2026 07:18:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed6be6bfasm131596766b.2.2026.10.15.07.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:18:58 -0700 (PDT)
Message-ID: <37ddf1d4-4c53-4f74-ae15-f1f8025a79f7@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:18:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: nord: add CoreSight debug nodes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260922100850.527109-1-shengchao.guo@oss.qualcomm.com>
 <20260922100850.527109-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922100850.527109-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfX93b6ffW7xgB0
 JtHyN4dilGhLW6K1YSleGHrsCPeoJqw+ZYHHkIa2nBAllWUs8EQni7BrsFtFBh4c5myyRrJI7r8
 nyh2MuSDoWfaXXeinym/e3Vp066rwumhmnFA5TMSrm91g+3f8RpnIIpnCPnTQff3lrfXg8gJJl/
 /Y7ANXMpl3cb8gV7SeR2R2qts77/+jB0ljCn8yfNB6ZsnGjb2s9/bXqnO2C7eLn7xSirzgXVoLb
 dM2l/qgTB/8TOgQgspOzYdjaNq99M22od7C/8V/tdlpCrh2qAgSTD8vxBwTNn16z7l1rOPZkmTZ
 6R6PAd1vH3MgKVh14gApAE+fNaW8xQ4IurIzpY1ureRZLohYjw/5+Kri8lghIr7BBps12yzD3at
 CSUQ6nL1+C8mmJXBCVfp6NFKITbZD/uQUT7tNe3xQWMl5hqQ32/Pl5j5Mjwb8Wez+UPsePcboje
 YTo1X4ujk8s91/9daRA==
X-Proofpoint-GUID: 3fW1t4gpS28OsLaUTgS7fDTmfol68G2a
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0e0d6 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=iNO32DtW_iceHKFLXyIA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfXwijCyKSSQU4V
 2pzM715dhXaEvI2baNtaX1uqt+kIhMeLT8GPmmFS1tMIaX6KutAraUEXKLI7US0QqiIY/poiR+u
 Qa5kpc0rLyXx3vv5Y8O0yD4e1tUqMZs=
X-Proofpoint-ORIG-GUID: 3fW1t4gpS28OsLaUTgS7fDTmfol68G2a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150056

On 9/22/26 12:08 PM, Shawn Guo wrote:
> From: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> Add the CoreSight trace topology for the Qualcomm Nord SoC: CTCU, STM,
> TPDM/TPDA sources and aggregators, funnels, replicators, TMC ETR/ETF
> sinks, TNoC/ITNoC nodes and per-subsystem CTIs. This wires up trace
> sources for SOCCP, BCV/IMH/DPM, GCC, QM, DL_NOC, the CDSP NSP0-3
> clusters, DLMM, EVA, MDSS0/1, LPASS and the AOSS SWAO priority TPDMs,
> plus the DDR0-3 channel and LLCC TPDMs, all funneled through the
> tn_ag aggregator into the main CoreSight funnel and out to the AOSS
> sink.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---


> +	tpdm-nsp0-cdsp-llm {
> +		compatible = "qcom,coresight-static-tpdm";
> +		label = "tpdm_nsp0_cdsp_llm";
> +
> +		qcom,cmb-element-bits = <32>;
> +
> +		out-ports {
> +			port {
> +				nsp0_tpdm0_out: endpoint {
> +					remote-endpoint = <&nsp0_tpda_in0>;
> +				};
> +			};
> +		};
> +	};
> +
> +	tpdm-nsp0-cdsp-llm-2 {
> +		compatible = "qcom,coresight-static-tpdm";
> +		label = "tpdm_nsp0_cdsp_llm_2";

GPT points out you have a separator befoer the '2' here, but not in other places

Konrad
