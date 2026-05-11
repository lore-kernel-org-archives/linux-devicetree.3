Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854FA3ACF1A
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778491203; cv=none; b=qq8sOkkEs/AQ8PwlfuabItMizuzomv6Gw1d4GHe739jtvY3FdRWLSg943embkYXRba4td8iCYyLCf2JgJ45VMBOQHM1Zqn9uiUEB1o7tiWHgDBYaoHvnLLNRyAJKmyFiorDHVflIFBwADBks3WSTzxaU49Z0h5YWzxmIiUXw+Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778491203; c=relaxed/simple;
	bh=5rJvbkYU1Cds+pHnp8IhQ0uuKul2+jUK58aooICkDOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r1bdCZUxRG2UbFu+aywgYfJsk2mXT8r1JyzXB/M5csi9xk5MII0cFKykQE9izEyrU6QmTxLeFJAzwjKynWQC+et0AlCIQkB8K0eS2NqjdnPFNJtbYMtym4RUsJKJfWVW3upByNPCPUgFCL9qrUgayNqlbLdnxs2vm3rsWuAxICY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JZHzioRb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AjIpo1Vo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JZHzioRb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AjIpo1Vo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B81OYA1393499
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OH6IOw4LvlPC74wSQTZMRd3GjpTaSP1yMTLUPKXvH+A=; b=JZHzioRbuAdW9A+A
	F8Hse+myv4NsfFt4YYPguntfOc31JpA5/rXKY2ZSr14eAYLwBBNZTjxGk5VEFRNb
	5QreiuMHN9TZznIVfGMlorc75WzcmQMWhuZHRDkcFVfhmE67EgjyOuSIazEzztpv
	0Ton3xKyBzU04DEO3a+ib67bZiWbEfUhPwXvhZifAHlCJ+uCR8axVWt3feBDv/2S
	CNVULKaRCbhmJ61mAP6kRU/qDfTobp3IQRxdD2iuRfQI9t/jJrrDILBmdYKefj3F
	TOag/2UVn7V2ZYA8fx3fcLUO8L4lcZP/T93YRbkPRU8BtfQlentk/DQlN+0N1FHV
	jdgWCw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e240h4j5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:19:59 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6337c4cd5e7so22924137.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 02:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778491199; x=1779095999; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OH6IOw4LvlPC74wSQTZMRd3GjpTaSP1yMTLUPKXvH+A=;
        b=AjIpo1VoXcvPjfFQwctha8aFjGC7/7PaAOSCxd09raSbZLle9DwxGu/iuID3d+VRI9
         HoAh3PDkfGPfl84Wiah9W5pK9ITSaY75Vo+7t4EoGElrjDF9onJstPlEiiaPqgouG19b
         vhTOzjvDOdikRUQ+ne+KGzh5xHEQ6ijbKC5KGs/bn/iO+Sz8FJO2aZY9GXXN1PJnqylz
         InhDGK3omjZdEu/dkrr7F6kzYMkiszXPVRWVRRHXAuLLz8WY8l0b9QBVGpcAlymDlv1+
         K77OgMipZ/eLO9BJvWfliKlouJsY230gWzpzkHwdmE0hC37yPPp3zCIDdr3Ey1xmZX/d
         ovpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778491199; x=1779095999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OH6IOw4LvlPC74wSQTZMRd3GjpTaSP1yMTLUPKXvH+A=;
        b=Himu9t55PBqpLBnaCmWVQJhCBJfJI9f+zeDAE+t6jNkXtemocAWrpAWAgY+paZa9Mw
         Q39Bwe7CaPmqXnOXROobLzmuguPtNbvLsbsFngYRtAdnJUOtJrMp3MkqD6eWn3Jy+4X6
         Xn+XDfRw6hNXfemboLQ4Krequ5TIQigUJGgxTkNpH5Qqh5wVIAVJnRwvdbzNgMBMhUqq
         3AB+GFzCJHIfl3YFIgEe3FGq0vrKmUfYLSCHy84xvRkvP6w1TUNT5xrcvQeI+eATOIXI
         ECy9OuhGVEqiOO99u5XxtPbRclb+9FDw3BNMgNHl1JU1PlXcngmqgNsBCXIf166WrN26
         3mUg==
X-Forwarded-Encrypted: i=1; AFNElJ/PSICqlOniBTcM8s7b4o2W7p5o0RIVgaegr9mFnVw57Q9L39Wq1GdBSdK+S0zgC++KdRDVFX1bJXpJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgr2LKkrSheMSHMz9wuJ3cXPHVo+WkNrf0X95p7wOcK4JK3K+k
	8zprTm8bJnerLF2kcVuPwsh8czNQe91iBNaEETZQrUP4X513HfKhSeska9HCNUjbdFkgkbGNoFS
	mOjLsUzOfAcYuH8ydB7GvtUL7I7HmFOy5W2Dx0bo7TVnKhxHIvXPRRlIhC2zY2iz9
X-Gm-Gg: Acq92OE8PqrevkJnUk66vg30BBaYFGug6WoESGanMsg2ZRR1XxJLjAsQIwX0bJCs+Dj
	zE+nG/HzWKANcH/ymvG3H8NsqxFud8MPzzGXy5UgjjYXoIrQFWIK21LDu1LT+RlWrI050gBSa7q
	81ALiRBocLvV4m5rOsJB3ZZVwVSNIJAx8TIiqDc785C5EVNo7pAXG+YAxyJPeJ1+MPcYnr1vAF/
	hNKCn2IuHqsHPK+5sQQBBiBte6K3Vx6MEyVxoLJU6hJ8D0cfKnha/VQZEwZh04c15fRqnzUbUfN
	+ASLDx9LZvM+YrQDykD+0E8uyjXEUb2NL3C7I2BOkCkbN096qZutNj9Q92rqHIY8t1b2yHtYmnf
	LauAzvYck4xnVXA/FyPlfl3J3M8Yy2ZJa6WflypfMrxrkgFE3mO6yOFUhNku5HN0JrDd5UzP5qF
	Wkzk4=
X-Received: by 2002:a05:6102:5112:b0:632:c8af:8a8c with SMTP id ada2fe7eead31-632c8af8ef7mr977100137.2.1778491198804;
        Mon, 11 May 2026 02:19:58 -0700 (PDT)
X-Received: by 2002:a05:6102:5112:b0:632:c8af:8a8c with SMTP id ada2fe7eead31-632c8af8ef7mr977090137.2.1778491198360;
        Mon, 11 May 2026 02:19:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac3a7fe13sm462890566b.31.2026.05.11.02.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 02:19:57 -0700 (PDT)
Message-ID: <846c41a5-8f6c-468a-bcc1-d8140051d0de@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:19:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket DS gaming console
To: azkali.limited@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260510-pocketds-v1-0-cf05acec06af@gmail.com>
 <20260510-pocketds-v1-2-cf05acec06af@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260510-pocketds-v1-2-cf05acec06af@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEwMiBTYWx0ZWRfX7mcaH/9iZrFS
 ZmBBF6Lqbc9Ce5W2vkYR9nF7mY2rg2SbxrnZ4mMulio1b69Eihp6bTDLFDkFia1XpWqYoSqLTot
 Tm0FND5gVbO2FJRmx6TqM1DYlP9zZqvgQiv7YFMDgTJhAsMtFMG8o69HDHa1H79fpRTUgb/jI1G
 EphEregpWLJeLDRKU6mPDJrlJjlOAAQ474fh/zMK4f1zrprCTGOldj0au1gwvaUMoOYScRfqvRL
 vYsJG8E5jTWSzDQXWmLX5fjqg6nCAlD6h1Uc2r8wqMXkj0+lhlucmGYycwBWmP+xyXppiUcraBy
 IsLobd479rU1SGX3gY5UHmx1aPKIvOd4gh3YdfQp9+MsAWbJE42iJsaAE4I/d3pdnZiPkdXb47I
 nXqLafNsf3bvYGInvGsZF8Ss1qzo/Qh5O/+1FiKeHFLHCbVqxa5W1EjbXcGdwmzGtevCWVJfgT3
 mTGAFj1zT1/JJqlNH8w==
X-Proofpoint-GUID: 3Wp47A1Z-ZVXqriZBkYbFAQpXC3d9BGG
X-Authority-Analysis: v=2.4 cv=X5Bi7mTe c=1 sm=1 tr=0 ts=6a019f3f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=UeHltZ2LXldOZfv8U84A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: 3Wp47A1Z-ZVXqriZBkYbFAQpXC3d9BGG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110102

On 5/10/26 6:05 PM, Alexandre Hamamdjian via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> Add initial device tree support for the Ayaneo Pocket DS gaming
> console based on the Qualcomm QCS8550 platform.
> 
> The board file is split into qcs8550-ayaneo-pocket-common.dtsi and
> qcs8550-ayaneo-pocketds.dts in anticipation of additional boards in
> the same family that share the QCS8550 base. Only the Pocket DS has
> been verified on hardware so far; the shared dtsi is intended to pick
> up sibling boards as they are submitted.
> 
> Co-developed-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> ---

[...]

> +		splash_region: splash_region@b8000000 {

underscores in node names are frowned  upon

> +			reg = <0x0 0xb8000000 0x0 0x2b00000>;
> +			label = "cont_splash_region";

Is this label any useful?

> +			no-map;
> +		};
> +	};
> +
> +	sound {
> +		status = "okay";

It's already 'okay' if previously not disabled, please drop this line


> +		compatible = "qcom,sm8550-sndcard", "qcom,sm8450-sndcard";
> +		model = "SM8550-APS";
> +		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
> +				"SpkrRight IN", "WSA_SPK2 OUT",
> +				"VA DMIC0", "vdd-micb",
> +				"VA DMIC1", "vdd-micb";
> +
> +		wsa-dai-link {
> +			link-name = "WSA Playback";
> +
> +			cpu {

'co'dec < 'cp'u < 'p'latform

> +				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {
> +				sound-dai = <&spk_amp_l>,
> +					<&spk_amp_r>,
> +					<&swr0 0>,
> +					<&lpass_wsamacro 0>;

Please align these entries

[...]

> +	thermal-zones {
> +		cpuss0-thermal {

You should really be overriding nodes by &labels, this is fragile as-is,
since even if someone deletes the thermal zone nodes, DTC will happily
compile this (and it won't work)

> +			polling-delay = <200>;
> +			trips {

Let's add an \n between the last property and the followng subnodes

> +				cpuss0_fan0: trip-point2 {
> +					temperature = <40000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +					};

Please remove the extra \t here and separate subsequent nodes
with a \n

[...]

> +	vdd_fan_5v0: vdd-fan-5v0-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_fan_5v0";
> +
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +
> +		gpio = <&tlmm 31 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&fan_pwr_active>;

property-n
property-names

file-wide, please

> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +
> +	vph_pwr: regulator-vph-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "  vph_pwr";

stray spaces after "


> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {

Please use the &gpu_zap_shader label to override

> +		firmware-name = "qcom/sm8550/a740_zap.mbn";
> +	};
> +};
> +
> +&gpu_opp_table {
> +	/* Additional speedbin for Adreno A32
> +	 *	719000000  RPMH_REGULATOR_LEVEL_SVS_L2
> +	 *	746000000 RPMH_REGULATOR_LEVEL_NOM
> +	 *	794000000 RPMH_REGULATOR_LEVEL_NOM_L1
> +	 *	827000000 RPMH_REGULATOR_LEVEL_TURBO
> +	 *	860000000 RPMH_REGULATOR_LEVEL_TURBO_L1
> +	 *	1000000000 RPMH_REGULATOR_LEVEL_TURBO_L2
> +	 */
> +	opp-719000000 {
> +		opp-hz = /bits/ 64 <719000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
> +		opp-peak-kBps = <10687500>; // Level 7

Let's drop these inline comments

[...]

> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l3e_1p2>;
> +	status = "okay";

Please keep an \n before 'status'

[...]

> +&mdss_dp0_out {
> +	data-lanes = <0 1>;
> +};

Only 2 lanes? Are the other 2 not wired up?


> +
> +&pcie0 {
> +	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
> +	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
> +
> +	max-link-speed = <2>;

Are there issues with Gen3-speed links?

[...]

> +&i2c2 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	touchscreen@5d {
> +		reg = <0x5d>;
> +		compatible = "goodix,gt911";
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <39 IRQ_TYPE_EDGE_FALLING>;
> +
> +		reset-gpios = <&tlmm 38 GPIO_ACTIVE_HIGH>;
> +		irq-gpios = <&tlmm 39 GPIO_ACTIVE_HIGH>;
> +		VDDIO-supply = <&vdd_ts>;
> +
> +		touchscreen-size-x = <768>;
> +		touchscreen-size-y = <1024>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&ts2_reset>, <&ts2_irq>;
> +
> +	};

Stray \n above

Does userspace somehow map these touchpanels to the right display,
or do you need to bind them somehow?

Konrad
