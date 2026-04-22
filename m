Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29D23CB2E6
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 11:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776855887; cv=none; b=qkHYuWngWO1BVzWGLxsyKWFK8b6B894t9v4HAhKkib3iIUcMbh6/TYvSSfuAMII7Ed28VjgNnZrlUvxLIDHy9HlztSOFVcozSY13Veiu3XDlmAkkutkIyPT8khuqmpzFWfUGXBMSjkbyLhxlDJ9A7fhMIPBUk/UfLcTJsfsJPio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776855887; c=relaxed/simple;
	bh=KDHR94zHOrFw0CnnfFBoGmRBQY4qJsdkVtXomYv6FPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f+xEdUQ6fWaCQkuYMF40qp7e1DQuj+McS2CmA6tRhCvgdkeeqQGhPgQPvIdUIqRR4bPn7rsxgFkw3nqtwoYkqqU15I9WapJJkCPdmgL9MXFI1pYIbSC2bD5YJ857GYPZyJh38BG1U7kRYKb3+zgvvB1b606pNmYFMl8A8PW8Af4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RH/oKow4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FJInnORF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RH/oKow4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FJInnORF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAlCjI2123519
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 11:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k8zN6wAPMYJyqClZKSaXPUPyTdC5aFzSsluwryyz08g=; b=RH/oKow4NNB+fCJP
	pTZn9YjeyCZWfpzZBBl6ByhXZEeWM7VnaVgstz6AKHsVOB6l74XTkq9WzKtQdcq5
	eIiX8DJ18V1xnA8ZDIQ1p/Kv6dOWNrIgU1OXbKrx4c2QeStO2IhMKerIBjUBKow6
	4PZNqqpP//X99mWd88uLrX2x7KzRbDQq47Oe10W1ksqlgUPVnatdQHNbssfJ8Q2q
	AYPqEAjxBTaT/nYmI2IUYIOqcKtYRU6jQ5ejXwGDjTuZZ+LkfCuAZmx2QufaF2rD
	AyU64p440HX87fnJtbusagAb3STC6tYJ6c6od9ZkKv219KoCl+E5tTH235lK1rv5
	pxpJgQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfu2rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 11:04:43 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9589688edfdso164522241.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 04:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776855882; x=1777460682; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k8zN6wAPMYJyqClZKSaXPUPyTdC5aFzSsluwryyz08g=;
        b=FJInnORFEROpjjl0l92sIpP6xZvahSQvcJd+qQOjgVIqHDqpVmrWK8NT3lObJipnOO
         y+s22HZ/MiWEr5qy1z2R33xaT+bm8tqrz5K58ih/blIB9YGbnQ19pk40LtpoEGbI075t
         n8v/shT4r+pyjiFDqmREFAFjJx4USuVAph+m/dfp2YtuHJ5uuCyPgiVLtQBQDsR2Jn3s
         nHynffksZfPwlz2lWElq3/1edyeClL/ac/9MGSmMICFEuzu974ibPYjxdbTBRAnVHmSn
         4TSdYB4u0PW8Xhz4IN4avaujo9+umbbgXn0YSRlgyAKS8MB5vwuHlBbaUqx+VadqXFEA
         oikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776855882; x=1777460682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8zN6wAPMYJyqClZKSaXPUPyTdC5aFzSsluwryyz08g=;
        b=Nhm9+eBvDi4nVyQsmQk99cATa6MoaSXw838eDIe8X6ZkU2hZaS7eMs7rMe7AlzA7NW
         wMxzu8Ntsxvy4Ds34Z7W47L2F9WeqT+r+p2PvQfO6R6y1ctriVImD+pjAb3EQOpttBvR
         u4phEQQ2dZw+USMnngA3mBy8WCy4ujGlUzEYRR/hdUe4TXKpvTe0yYyZj9w2IwamcdbC
         v/3RRsqc20TorTTQUXyf9h8vnAwJY53UGhnCcMbMngpR+srGXM6GZVR5fjUS7uDY0gCr
         I0nIPRsomygae/HSek314vytRDXRr0K1Ak15pIxKAtY4klHmQ6SBmbbcpiH89mIs5YoG
         snug==
X-Forwarded-Encrypted: i=1; AFNElJ8YQgQCDLHNEyU5S+4gJdK+UcHJ3kwp9b8Wv9NHPJdu2mPsFp3+x7vVtrh5OqXK+7QLjyxBkaadmyoc@vger.kernel.org
X-Gm-Message-State: AOJu0YwfTv9Nd2s2S5X2pxRI6/9t5zbGBSNZlmnii/jLS8/6h5LJDeir
	J2WPXPyaMzF1Yv7U/rxhfnNoQUNCLleyR+/OGMX4LK17BI883lwAe5aDnAe28F7MBYWGWCiEa3X
	xLkxNCNZUxAl8eKbnlFJE6fzpb6MSmTcSNZXghmUXC3GiLf6WiXOEkezU/+TUTBUk
X-Gm-Gg: AeBDietDZwFoINfNQPe5zvI9OhWio5qYGNsUNCpyA9nkD9+wp/Zyx+MBd5NNdpX9PRR
	6CCa0/jea0W9th+Y9pju6bMqR4Lzs94hBWX5KVrX+W6vF3c/2X5PWkXzbxFqKqZ7JRAMss90Vv6
	Ej/ZjdhFT4Y3byBAPubuIbst58tJk5LCtKybgZ8x5wRf8L+e6xsX/1fkNceBqJ/c8rCIrX46cvP
	/aoGLUtm4dU/5VcxBGYgwwLjy3mPM6HcSyw8888b4cpQnyZdpzJhSHLABdNn+KkkLtrs67AoE0m
	E2VV2OyMpEixorLvv7YN2WVxbiA5yHrtLJ8JCewBqWqjLmVFCimWhZNeTK/CzgONvfdabz0ZV60
	tXyOCP4b24H4Vhm9j8X3aH8+7YsK9W9U9UKaRfi8ZsqHYSMNEbCppk9MslapEYb0GBBBgN1tnct
	MghUg1m7TtrJ0D0A==
X-Received: by 2002:a05:6102:21a8:b0:5f8:d54c:18c9 with SMTP id ada2fe7eead31-616f8063fe3mr2818711137.3.1776855882451;
        Wed, 22 Apr 2026 04:04:42 -0700 (PDT)
X-Received: by 2002:a05:6102:21a8:b0:5f8:d54c:18c9 with SMTP id ada2fe7eead31-616f8063fe3mr2818703137.3.1776855882044;
        Wed, 22 Apr 2026 04:04:42 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4517ec776sm543624766b.16.2026.04.22.04.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 04:04:40 -0700 (PDT)
Message-ID: <fbac099f-ca46-458d-a628-393922cbc45b@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 13:04:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm8650: fix soundwire ports
 properties
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420-topic-sm8650-upstream-cpu-props-v2-0-689e07d8ab8c@linaro.org>
 <20260420-topic-sm8650-upstream-cpu-props-v2-3-689e07d8ab8c@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420-topic-sm8650-upstream-cpu-props-v2-3-689e07d8ab8c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OdioyBTY c=1 sm=1 tr=0 ts=69e8ab4b cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=kjch1nhIrtbhh0vZETEA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZZ-3O32Q6lZa-w5gpHT4__CoFesDIsMO
X-Proofpoint-GUID: ZZ-3O32Q6lZa-w5gpHT4__CoFesDIsMO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwNSBTYWx0ZWRfX8Fg2hrOLZe5z
 zUGKGJQIEjRVKaxYdasp+NgQgg8bwmhguFeTAxICzrSv89GVS4IrWj7Xwc/LmD7MorS9563asqv
 RP7JiaW9YjYy2jqCaUyofVpUdLBY+f+8NoUtIrROP0UdNMcgki/AuH8uIuKLrjstpq51nSsVUaP
 kQl0tM9Mc+mF+rDORjkLVCYSeMSIRlEMxPtpuiyPf4gmWMHjh1wb/mNZvjrDNiuTZrCNzuZcz6G
 BMAZNP+tnmZo7oQywwVSxGUoMKxwowS7acanHtY/N2ghASQncK4NPzc9OF99UFxr046n+2yS+Ss
 fRe3Y8c2V8ukZs9XeJSCgdEu41IUJbHQs47gc96fU/EcQVMVH33j+2WZa/BtlKj1v6zIyo3YgE5
 9g/d5ITsyA3QHFg4qqgCoQE6OiOS29fESCw/IZQ+/gsq8hU9UT9izkOMbVUumvoM04gKhShmRI+
 0Cu8m/AaMCpuRWInX8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220105

On 4/20/26 9:26 PM, Neil Armstrong wrote:
> Since commit 9e53a66a2f2f ("soundwire: qcom: deprecate qcom,din/out-ports"),
> the ports are checked against the actul hardware configuration, leading to:
> qcom-soundwire 6ad0000.soundwire: din-ports (0) mismatch with controller (1)
> qcom-soundwire 6d30000.soundwire: dout-ports (0) mismatch with controller (1)
> 
> Fix the ports count and properties of the corresponding soundwire
> controllers.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

+Srini please take a look

Konrad

>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 42 ++++++++++++++++++------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index c5358894fbb3..2cccfbc6d008 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -4730,18 +4730,18 @@ swr1: soundwire@6ad0000 {
>  			pinctrl-0 = <&rx_swr_active>;
>  			pinctrl-names = "default";
>  
> -			qcom,din-ports = <0>;
> +			qcom,din-ports = <1>;
>  			qcom,dout-ports = <11>;
>  
> -			qcom,ports-sinterval =		/bits/ 16 <0x03 0x1f 0x1f 0x07 0x03 0xff 0xff 0x31 0xff 0xff 0xff>;
> -			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x09 0x01 0xff 0xff 0x00 0xff 0xff 0xff>;
> -			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
> -			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0xff 0xff 0x00 0xff 0xff 0xff>;
> -			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0xff 0xff 0x0f 0xff 0xff 0xff>;
> -			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0xff 0xff 0x18 0xff 0xff 0xff>;
> -			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0xff 0xff 0x01 0xff 0xff 0xff>;
> -			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0x01 0x03 0xff 0xff 0x00 0xff 0xff 0xff>;
> -			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0xff 0xff 0x01 0xff 0xff 0xff>;
> +			qcom,ports-sinterval =		/bits/ 16 <0x03 0x1f 0x1f 0x07 0x03 0xff 0xff 0x31 0xff 0xff 0xff 0xff>;
> +			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x09 0x01 0xff 0xff 0x00 0xff 0xff 0xff 0xff>;
> +			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff 0xff>;
> +			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0xff 0xff 0x00 0xff 0xff 0xff 0xff>;
> +			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0xff 0xff 0x0f 0xff 0xff 0xff 0xff>;
> +			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0xff 0xff 0x18 0xff 0xff 0xff 0xff>;
> +			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0xff 0xff 0x01 0xff 0xff 0xff 0xff>;
> +			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0x01 0x03 0xff 0xff 0x00 0xff 0xff 0xff 0xff>;
> +			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0xff 0xff 0x01 0xff 0xff 0xff 0xff>;
>  
>  			#address-cells = <2>;
>  			#size-cells = <0>;
> @@ -4827,17 +4827,17 @@ swr2: soundwire@6d30000 {
>  			pinctrl-names = "default";
>  
>  			qcom,din-ports = <4>;
> -			qcom,dout-ports = <0>;
> -
> -			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;
> -			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x01 0x01>;
> -			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;
> -			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff>;
> -			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff>;
> -			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff>;
> -			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff>;
> -			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
> -			qcom,ports-lane-control =	/bits/ 8 <0x01 0x02 0x00 0x00>;
> +			qcom,dout-ports = <1>;
> +
> +			qcom,ports-sinterval-low =	/bits/ 8 <0x00 0x01 0x01 0x03 0x03>;
> +			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x00 0x01 0x01>;
> +			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00 0x00>;
> +			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-lane-control =	/bits/ 8 <0xff 0x01 0x02 0x00 0x00>;
>  
>  			#address-cells = <2>;
>  			#size-cells = <0>;
> 
