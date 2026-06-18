Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9E23F8223
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 13:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787906; cv=none; b=n17/ztn3U8GfZGfpi08fN5rUWUy4S0govXCg+PTjb2DRHfiG8lV6N4AMqr3NhkcBmvXCL5sBW9UI+s9vDp55XSU5ssbUhW01fK1JXGW1FT/l1SVOqxkw731MH4EeXJ/iHsOdAiMXzfavQrxyy/ZitKv4s+ZZF6J89Wqy+luJ/rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787906; c=relaxed/simple;
	bh=iJFpoj0Y+KkhOxJkO9jtgeUe8Nz64iXqGZjDvXZnyJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UgdHHBZ1/hnxF2NJPzUoge1CiSUYPdoMlg2Gb4FIPEuW+HBDNMZgc8FuYP/XEiclW4YfKZbtCCz8u5TBsBoEL3QCowzOzehu0Wi68TpDuxz1qBkRCgaKtz9IxIBZwxsZQUPWadluiAboJuUHws4FSn+DQDELN3YeKZJcu6oYf8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L45ruMnf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Os5cPV6P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L45ruMnf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Os5cPV6P"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ICro3J1319848
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 13:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AdpWPnfspT0O4IPRrN2sCrHLTuOAQdpa0+3S2ykbaYU=; b=L45ruMnfSUOYwG3/
	WLCojx3MdHdc9oEGKewXflXk0OQM/XLe+iQRLiQDvF80xn7b6eSUx6chpBMCuqar
	wlR2bPrVrEZT0EQFBgLiL21bN7Rx7Buuy8V2QKp74zc2U84PETEwY6CbFyCaVDJq
	x5T4HMk2HInVVSp+/9O4966VIup78INEziGHIQPpAMwrl3RlFB/VQWeptpzViFSi
	fN1m2bsript97o8HTU1hEaeej1ebxDwPZGMMpWGKMeg8iYSO5S24ytx8oTt8TJSZ
	lX/JxKF3+MxPHPgeIkFZGPI+MUb0XiEq9V4AMqumJliRieyWMzlsD2CBX7PfPR8T
	G8gcWQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2cckjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 13:05:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ddecbc403eso258466d6.3
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 06:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781787904; x=1782392704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AdpWPnfspT0O4IPRrN2sCrHLTuOAQdpa0+3S2ykbaYU=;
        b=Os5cPV6P9KKADMWgih/gwCU/2yspj4T11Ksxhrn87DDJzapp4CrdYSPo65DzAjaOg4
         7mOImf+qD9O6rmIhmzXm5zrlD39EN+s0DVkJT5392J3GuEy/1vsX2U0m5fpEU68pf8VB
         2lMHSvJLfECelZJRkmTGUg2Z9XEYDDsIDmQZa0hMqK8fYtDX16VdmqZyrbjBFE76hYX5
         VmLMKoeU/xvCKfOr5o3vQVWCLS3t4MltI09sHet7dAsJvn9v2n/JLCr5mduAQ9NTvs+w
         jVw+Pe6N+K86LhXIE++hPVI7iGh/V37mX0PpndU61+pKu7o60Q06dXEGwNgiD+6MELnc
         xuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787904; x=1782392704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdpWPnfspT0O4IPRrN2sCrHLTuOAQdpa0+3S2ykbaYU=;
        b=QMuBmqTaux+NYIVILHHZdzhiwWsJCZVMLsJG0ViSYWWlpTDjo+/yx5GlCqt183Ng+K
         IZBFbLDIUHvl27VIPOjfUUH05c5nOEuIR+K8bVwHKZHmLBdNSMbAcBvGW+UG0QKP5/48
         QrqpvX9mkoamoevQHxUDnk+i2sRpuuLVlwoXZ8r8+zkDBnIDX6tFwzQCVPdzR02i8Up+
         7v0U5VQUY55P9XolJwGkGJmwj0PGXD5iOFNw6J2b2HGwu0v0SmTi0AGHVgwiGljxxvSG
         gIC93BAlmoiAp3F3z+K/pgWEBv1MMzAUsCD2RSPMMhDdBXUvjfKTqCFInUcq+p7YoNdD
         SI5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+6kLFdgC8IvCq8uem86MgyVunEg59cyROm1agyfbWgC7kNiiCGaRWKYOhGYZILHoyY9itYPd8Jn6zc@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbri64NuHDt0LewGjffbhbM/ShfhVBvR1gc09Xx+AeqUerqqFQ
	tTQYzX0Hh67BVVgIzP9uG9LI1pMOODnPiS5+5kMW4rFoNdylj11MagzwjEcWMqKLKTUwGjU7yI7
	TZYrkcBgWEUdsiRCxn8pjX/Jy/kvaChAhFXU+3aiuKCx+ggBZ5UP97raDa4Jj4HHs
X-Gm-Gg: AfdE7cm8JSXsdzjLJ4+3zG1v9iG+NOYdAx4QcWwMQEDqyjnHcovPXpbuAgaoU/WcK7a
	dZkPbVoJV5POMNyyw4gn5Is4HC1jp3jJSiCRxxrluuY+31Jx6f+7KDle9+0Xtp/7r/QhlTWhXD2
	bNXKxNpnLfFVrH95oDf652DJPzNUlEnR4P2uNDXxn7lvAeWhAetz4Pi/B6D6UtFNG5Hs5s7bmeI
	TTE7J8xpBR5UUrvb41e7/k1feA3GdYyXKi4jvKc60qgEdshLUCE+YbCZVbMsElqMI+KLRB1rLD/
	4AFOg05Hoxbmy7dZdXWnv030Z5izeoo1tlgxKHB0d/gRs3b0z/zR5RTwFZhpoIXxQ42o7rZILyO
	gf0ocsqBHo8Wb7eEzAcfzhOE/b4AwzA3XImc=
X-Received: by 2002:a05:620a:d95:b0:915:769d:56e with SMTP id af79cd13be357-91f27bdf21amr330333085a.1.1781787903785;
        Thu, 18 Jun 2026 06:05:03 -0700 (PDT)
X-Received: by 2002:a05:620a:d95:b0:915:769d:56e with SMTP id af79cd13be357-91f27bdf21amr330324285a.1.1781787902760;
        Thu, 18 Jun 2026 06:05:02 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6954c2a4450sm2231829a12.16.2026.06.18.06.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 06:05:01 -0700 (PDT)
Message-ID: <d8fd7888-cf7d-47e2-8e77-3ba705c88502@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:04:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/6] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE eMMC nodes
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-5-1cebc8b3275b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-enable-ice-clock-scaling-v11-5-1cebc8b3275b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEyMSBTYWx0ZWRfX1MpZQ+mLqCVf
 taYMDcgvEuXhZx3IqoGpZ378QnbWPTe1DABVKaN2X+wkrw4me5dzJYXZUwf1fGVOh6MvDc2hneh
 oVUtINQ9QiBqSrgTIz774q5PABUDXlj1fVS/4DSy+gDuVoKTITJ6D4vN9ZKbUkfXF1x8Bb9EGek
 45MRXwcyRGbLLGimR5lbwl5IbThLbcrUey+TsxNUJxBopGYuFpsn8vl80eErAptQaHz6n3Q+dfs
 nKzVkvdPLnjokg3teYFpZ4C5mZB9bjOOAyXvsuag8p1n+G84A7FZXSEyni0006huACS21IcX69r
 Auo6tdc0HEd5B7HuUOrms6H34qGsXABoSj+9ZJdDTslIjvDokZBhKjUaOhamwTB4p+Q0IvPQitG
 uxTt/QP7ZYG8GxCnRz60GX3B4m5G+QBdYv7qIGcYLwK4I7Id8xRaj1qDu2Yr3q0B/5sRwTarBI+
 5/aNFecOFTAD0hgEc5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEyMSBTYWx0ZWRfX33v0IemMZz+f
 2HwR1GArtogS8LRce3Ilq9Av+B24MdN3BUwXL6lEWQuHEorb7CVkqSVGBWyTTBrPJ6JfnXVKfUA
 Yx93IYDXAIY47Q2eEyeN5TBJyGI6GL8=
X-Proofpoint-GUID: nOIit3tonNuUt5noVAH1Md7fEM2eFpVM
X-Proofpoint-ORIG-GUID: nOIit3tonNuUt5noVAH1Md7fEM2eFpVM
X-Authority-Analysis: v=2.4 cv=WN1PmHsR c=1 sm=1 tr=0 ts=6a33ed01 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QRdWpJMrku1fmPn5X40A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180121

On 6/8/26 11:47 PM, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS and ICE eMMC device nodes for Monaco
> platform.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 37 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index a1b6e6211b84d0d5008231c55613a0ccd61b9450..d9298d8b7874b8669b2cded2a28a99dce6eadbda 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -2742,6 +2742,27 @@ ice: crypto@1d88000 {
>  			clock-names = "core",
>  				      "iface";
>  			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> +
> +			operating-points-v2 = <&ice_opp_table>;
> +
> +			ice_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-75000000 {
> +					opp-hz = /bits/ 64 <75000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-201600000 {
> +					opp-hz = /bits/ 64 <201600000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};

Since 75 MHz and 201.6 Mhz require the same power level, is the former
OPP any useful?

Konrad
