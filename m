Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6361A3B8948
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138989; cv=none; b=nD2/kF11YFrs+Up4vgU+D2E7qdUbs9O8ah6Z7Qk/Z/aHHqESKeD8gNRXKzGkH/0SrZHB3Bki/ZmiiErRwXrLXy9nUDn69ri/P+MraVSg8h6dd+YzEQGixm+i9p5/NikhCn34EPsOtw8gpSYDikQiHGosvl/r3iW3KZyllMP8X0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138989; c=relaxed/simple;
	bh=81xJNwsV2hThx94m0mUACRa9V2TnijGNC/Fo/63ejY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QvJLOCYXCj6cRKoiD4WS29ytPFM3aLXokb2VcTbvwpUb3e0/1aZnR6Tp3jA8wBGo264iB6yvYy9+n/JSQuO/JevhYSA8qPPPmiLJlT6olIGko5fHyIzM/LMsjQkfv04gq1kORA5f1zWKQLk8ksos5G/pqzOMQtM9GRW/hlbxftQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m3AX/bVu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=flpeoyS/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m3AX/bVu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="flpeoyS/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G6qNit557668
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zywhglPEDHWFnoWPY8Q8bVI8q6iKlypiLOq3HGmVQxE=; b=m3AX/bVuAi1WvgIB
	8oRWa4ZheHc1vlCx2zY3iiHEucBt3ot+ztEW1Lzx4P2U99okNXjE53Q+RuBPYv0a
	QW5OySUKcrVDLO9cz1l8zE9aB6HOCPWs+5ZZz8q7kZ1tVbdhivDRRzMnlRD8Gu9O
	l/L26lzH0J1qtSMW2SyE0UZXpiqn1qSv46ZArA+kgbyucMtvKnxq9UJCqNkCNgD5
	fXaZCHdh4R0/Kc/K94XNhVnAFqBikOJP552KYkU36SEJMYtk1RZ62wuMl7sbNMQP
	m/usO1R5WJftUFK+lbqP6gzjioxcrGY6amRnl9z3BIRkHXx0IS5NA7oTSZXzGZqg
	gFCqfQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a89pdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:23:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53630cded29so713391cf.2
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792138986; x=1792743786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zywhglPEDHWFnoWPY8Q8bVI8q6iKlypiLOq3HGmVQxE=;
        b=flpeoyS/+qAgjew8wXUOK+7uZ681Mud4dD8daegU/J9ut+65N8VP9x6OqxW48hy9Vc
         aKVVWe6ewP3mW6Mg+dSB9s99PMCfU6hQ5GAlUs63cGxKKjNUYO1D7afxAkW8gb5+MCqv
         OVrAJU2/AWvB4ltA1Ro9aDI4wdytMUhyhSXBZoD0soS+4koAz1sQBS198m0XOUH51mRU
         Xv2Z0hhJaeJD1xLl8OEK4urrgiWgJEltVbUoDmatkrkC+hcNhL2ulYQi1IDNEZrAPSRk
         bRdIhRVRrlH7ywHOFaijg7L8sHn5VA/RlrdYwmmYsyKDyfVgSvi4JDnV1Mja4DmqMcyF
         XngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792138986; x=1792743786;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zywhglPEDHWFnoWPY8Q8bVI8q6iKlypiLOq3HGmVQxE=;
        b=Nu6d/wo2tIV7kXtbJRKyPZqiJbKclKa4AhatWwGgY0rwkyNpsRyFZgfwtZfvlFhz8B
         DnEXVO6fq2EOAtNpHRRa+HlQ0DhbuuwexK1ISraG/atnMMUFoDz6FVEiBH5Nv2+Cp9CE
         MiCyTrldq2MtNNYmGv6EC0hyCTyrtikZjqDP2yJtmJz0ud479xWPAdXp/mV+OddOxLDg
         pQcSdGws62UBGYWIEkvyPBaz8y8lqb3ZzA0AWr74JKpNIlZ1XC83gao8cnaYCOTB1ng1
         CD3WOdS3LTOiEDrDXZ6SEojiQG1UD++Fja4cAFY69y2s2uR+d0JSQTIPX84gOrOm6MYQ
         FciQ==
X-Forwarded-Encrypted: i=1; AKwUvByPHt/AV4MiJc/N474xFYbP0ikhipnlgZ6ojZt9IJSs7glzbv9VkYrOtzckoHlmVRhwNZnPDF7xUalC@vger.kernel.org
X-Gm-Message-State: AFq9FYJGwi4iKq+bKSSLaU/qKjUlzUjwi9VsNKgG3XNWKXpk2qRiahxQ
	mTyYDBXPCCevnxR3GQK/ZbmTI7XK89J8l2FOCojQSBludxSRwgYT3LY+n/4GuUqccoPxsDuJfMm
	2PrVUG5qR4P0CEWrhzMVE3i+1MEGS7+l1Ty6GtXo0aMiMauVChqM1Ouf6uZqQPXzs
X-Gm-Gg: AYBFou0qZ3uHzogHjWfmaA09eyzqH3OFVMgCLVqC6JLPhY+LoqgSY7+Snz84fTmVnhp
	pWEv05qQqFGXwRS9831SAtxN43X+7rHC41mv6N0TPlDpvenJVtIghXWKiahynrf5YvYiZs+Z8hb
	gpt//UCTxGvhGtLPU38nXFsiEayoNRB3t6FrueJ4cDvdLnLqZP7xb+fOw+xY2g32F9A9ryWTKvD
	xUTmRAWNEYVKrsv+SREPqC61lrZXOHY6qQ5z4SzGRWvBzhC7uLFenN6jk3j8fvRog7M2dCxNJAG
	99COR27nupu8Do7pzRQu8Q8HFhI60U4uTpmCbhBJW7nfw79+zhEpyJWy+FBtIMkrjZFUByMRGyh
	KM6CJXH4XbLGDIT8eYgKrgg==
X-Received: by 2002:ac8:59c6:0:b0:51c:2324:666 with SMTP id d75a77b69052e-5359fa50f67mr411623581cf.3.1792138985560;
        Fri, 16 Oct 2026 01:23:05 -0700 (PDT)
X-Received: by 2002:ac8:59c6:0:b0:51c:2324:666 with SMTP id d75a77b69052e-5359fa50f67mr411623101cf.3.1792138984859;
        Fri, 16 Oct 2026 01:23:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c0f2asm48509566b.62.2026.10.16.01.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:23:03 -0700 (PDT)
Message-ID: <ecaf38b5-a04f-4fab-a0d6-4f1d633264c0@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:23:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: oneplus-kebab: new device
To: Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015-kebab_dts-v2-0-e783463bffd3@fhannenheim.net>
 <20261015-kebab_dts-v2-2-e783463bffd3@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-kebab_dts-v2-2-e783463bffd3@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMyBTYWx0ZWRfX3QnZ4aU/kIXm
 oKVCrNDxmQTwXb3WkhndibqcNzeNlDan3d2NoIyl4f7YaT1GzfocoZgAeAOJcWKKz0Jq/b5VsDX
 4Y/L+UDdmsHNJt7V5AIU0gypWBn4xWA=
X-Proofpoint-ORIG-GUID: Uisl7vhg3k0XoElp_N__YEHlPjNs_pyA
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad1deea cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=OQN141zOAAAA:20 a=WE8o4AYwAAAA:8 a=pGLkceISAAAA:8 a=RgHCbSjZinxpUVw5y3cA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=6aV5INxNnvWGCTbEtcBN:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMyBTYWx0ZWRfX+KdQ9VH1tDbH
 vBn2VRR+b6/xM8RrfZAqPMZZBeLFIJ3GdX2WCJjm9kHYO8yA29aLqzScFWMJpJ7Yhq1lt97/O97
 6j86i78HFaa/v/suXDcPxUePZ35cL9r95iEfSjS+uxhMGf29YCRvqn0jZeGJGswC6SFij0yg3F9
 i7xZnVgaYKIUbJBD0TN8GJ5nbuV+EFrcIyyjn1dNuG0qwTt3qPbhvLT6g4OVOUGQRXBGMzd0x0p
 f8lfffTAbX26AgdbcJZ4Xo/hIdIeNSrySDvqXIDYLHx6yD6Moq/p8YOZTGkROErdU6e69LC83SW
 Ula+MRSHL+LCbaKJQg5BbCLEOT9khmDvlhrLRKARNvuBtNEpNaWKrAscEdAXzI/6b40WTn0AOKL
 3epf4TnZfpPdda/ymRmAe6qbZc7qNWQLOio7S3SfUilVmVXJjjOmz6J8IKx5w0mCWkQdrGH5yPn
 Rd9Aq2lL9FuUD+orDmw==
X-Proofpoint-GUID: Uisl7vhg3k0XoElp_N__YEHlPjNs_pyA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160033

On 10/15/26 2:32 PM, Frieder Hannenheim wrote:
> Add initial device-tree for the OnePlus 8T. Downstream reference is [1].
> 
> [1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/lineage-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts
> 
> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml   |   1 +
>  arch/arm64/boot/dts/qcom/Makefile                 |   1 +
>  arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts | 129 ++++++++++++++++++++++

Better. Please split off the dt-bindings changes to a separate patch,
and put it first in the series.

[...]


> +&framebuffer {
> +	width = <1080>;
> +	height = <2400>;
> +	stride = <(1080 * 4)>;

Does the resolution differ between the two devices?

> +};
> +
> +&i2c2 {
> +	status = "okay";
> +
> +	pm8008: pmic@8 {
> +		compatible = "qcom,pm8008";

Is it not present on the other one?



> +		reg = <0x8>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <112 IRQ_TYPE_EDGE_RISING>;
> +
> +		reset-gpios = <&tlmm 93 GPIO_ACTIVE_LOW>;
> +
> +		vdd-l1-l2-supply = <&vreg_s8c_1p3>;
> +		vdd-l3-l4-supply = <&vreg_bob>;
> +		vdd-l5-supply = <&vreg_bob>;
> +		vdd-l6-supply = <&vreg_bob>;
> +		vdd-l7-supply = <&vreg_bob>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pm8008_default>, <&pm8008_interrupt>;

nit:

property-n
property-names

in this order, file-wide, please

[...]

> +&i2c16 {
> +	status = "okay";
> +
> +	fuel-gauge@55 {
> +		compatible = "ti,bq28z610";
> +		reg = <0x55>;
> +		monitored-battery = <&battery>;
> +	};

Likewise, is this absent on the other phone?

> +};
> +
> +&tlmm {
> +	pm8008_default: pm8008-default-state {
> +		pins = "gpio93";
> +		function = "gpio";
> +		bias-pull-up;
> +		output-high;

Drop the output-high, the driver will set it for you

Konrad
