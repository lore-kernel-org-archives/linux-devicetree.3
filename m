Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489EB3FC5C3
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782734187; cv=none; b=j+TxZc+/t0SdxZEQkUp2FLu2hBLYbnRUZfgO3tkLKgpz+QSemCN1TbxB8h7eon3JDEFrYdR8I8rZ7KUi6nianUo6A1URCSArQiMkhB0p2mR1ThiaJFwscIYqfPjZ/e1b7F1gQ+MK9iV8Y3Sn/dR7JwB1E7HyJWSjRBpi78P8EeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782734187; c=relaxed/simple;
	bh=ycCB6aBXbdoi7pq++CaVTDKq50tu2AeXYjXrW9M+eC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tsqdc9KIG3BUjUTyfUcC9Hd7hupI55+QNqc/dldYtjXgDUu4S8k+jTuueVMsow0j8wdedOeZ0Ci/dHY+CzXFvTAgWixKHxRTaorSBuTUgYkmWsx/kVOVDDprazoEIQwldjb0saSBQQQzuRpsOsc+PiWvt0QulLw6ePtisusXVTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YihHik7d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ffJJmpx5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YihHik7d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ffJJmpx5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TB5FW62728575
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4+K9lShj6MJEDZD3t2KnSzbviJa3ryh7VYCUzsecjGs=; b=YihHik7d/lDJFwGQ
	8bhB9INNJaNyh5/dUyh6S3l1xLFYAbrrYyeFPDO40AepD6bspAuughI1eBFbnpVT
	q0cvtWtiWDL3jAc7DHByaZlfKA2TjlusJ8OBdDxjkFPRdHesSzdesacTpMGTx+Zg
	Kc7QVeJb69zaea7DTM6zd7Z8bc87EJf7mWKvspT6TlIrk8Oz8kmBAa2vLcbPH6Mx
	BPm89mI9PG2gCPy9EIgfIzd+InRuNsTKtjOnkydhzRrBjfzG8DSWAqfetvTornGa
	hXt7DaKm1h3Rn/xKjfKxh4NTML5omMhDNCYGeWIYlx/UWCgwvioCqMq4BwRcwgm9
	o/yh3g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3qha85ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:56:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a07295d67so8663801cf.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782734184; x=1783338984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4+K9lShj6MJEDZD3t2KnSzbviJa3ryh7VYCUzsecjGs=;
        b=ffJJmpx5b1xJcz/GtQ5aM7kbbiyW55YGYviBzylzeaMpnN3ZMMtWGYrF4hMs0z66l0
         ezk0bJmCcP3XuS+LqKjfFMwRncOWJryiIJqS+GoiAhbsqJU9psNEJYpbF4g+zUu6A6YT
         lPjzcOko9K6mt0iksrqhIY2PPqRnEIGzvXDBr3SWyTpBkKLj1AhU0q6NtH6aHukdX51N
         qZ8EApSQ0WV45Tyf/S0h50Web3O3hwc/4XY5wzOCx7HBTPqupaXVG/GKoZkZGhpaWaMi
         37OTSOburn4LgoKjeD5jgGj768dG9bxb0UGMvPNsw1U/FkUshxzGJxbDs4mmc2nQa2vi
         3Thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782734184; x=1783338984;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4+K9lShj6MJEDZD3t2KnSzbviJa3ryh7VYCUzsecjGs=;
        b=nO+RKEKeKhlHU8VeMFS9izJ4Z6yeocybtyY1TBwO5q7QdDwHCGGvQlLJLLW/mcrzK2
         1fNtxPJvROWzyNMWPIIVI6dgCFuovTIKSQ3rdx++QzlP95laNj89FWcUyNmhZYz0+EQr
         qzZq+EMhseDPvtVthwT1IY9evqr3lItQtBHc3AGiSYllh33GKjms1Lb3hlcDJPeXY3Av
         c0hKaPUu0GPlVksYI5hbpTGaQAFklVAFejWLYl7HU2XKPBTdL7AkBF9m1vGmp0KJ0RGF
         F3GdZy5LzpRksfO4+E+jxsgHlE771ejEFyp/DG8AFEOYVMf6r2ZEigqOLvK5/ZMfBoxq
         lo4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9LZ437q3pxNullFMKlRa4P0E+ILkuoDd7MHoqvXIrbjfMEsdAQHM4taMI+JJuTj66RVUKHUsH0tRUe@vger.kernel.org
X-Gm-Message-State: AOJu0YxmmrqY9hJENKJxAcvA82MLhBcrg2FmgBvlipcplMBhZ89u5VMK
	GfIJo8PEUx/9DQpY09zCLrFQ8re4qoHuagC6/hZxOhvuMiRXK+X/ykqDouFCZNb7dlda2ZzYjOq
	5zWKHhJCKKGhEqsxwUpR6oZBcnmhqQfnSmEgqUi/4te8oRGx5INiFcAOxPYTyvQyH
X-Gm-Gg: AfdE7ckoPSnm5kqBqzYnAhxLmLprK8x6DvRFU+d9ruTyiRLKrgVf+ZYr9oZdb9kGsim
	SuLAEFK9FkBWwmEEkuVih74ph6t1PLuhdIz4pGmi1nj8n3iNip4turzs8myWG+KGxBT8exW3DBi
	Dk36g2MZorNsYn/LPg24EmH/bGMpbREDeZF3fgCjirMIOYlyQbV63ExBBsuG/HbxVvSaPmufhqd
	5f/cFyU2i7UdWAaKsofG0jWh+EKLt0G1NaejBNzNM9A9qg+oYPS3h6wgDK2DOL16XelGNuFCOhv
	os+12oN15vvl54UJR02YvbVnF65zH5aN19gi4GTis1PVrCchIw2RY7RX1c27mc1aKmPiQYObAPm
	4n7tJ27IbXxjIxjroIGKpjiViFq+tmeIep/0=
X-Received: by 2002:a05:622a:d2:b0:51c:478:329d with SMTP id d75a77b69052e-51c04783f52mr15819731cf.5.1782734184371;
        Mon, 29 Jun 2026 04:56:24 -0700 (PDT)
X-Received: by 2002:a05:622a:d2:b0:51c:478:329d with SMTP id d75a77b69052e-51c04783f52mr15819401cf.5.1782734183975;
        Mon, 29 Jun 2026 04:56:23 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05b6dsm776045266b.37.2026.06.29.04.56.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 04:56:23 -0700 (PDT)
Message-ID: <c0cc8b08-b468-4120-b79d-2ab9ef4d0aa5@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:56:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony
 IMX576 front camera support
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
        sakari.ailus@linux.intel.com, luca.weiss@fairphone.com
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mehdi Djait <mehdi.djait@linux.intel.com>,
        Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Walter Werner Schneider <contact@schnwalter.eu>,
        Kate Hsuan
 <hpa@redhat.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260619125439.55311-1-himanshu.bhavani@siliconsignals.io>
 <20260619125439.55311-4-himanshu.bhavani@siliconsignals.io>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260619125439.55311-4-himanshu.bhavani@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: POwrsGyrq7RmTfftn7KBZEzrjiGKJmZE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5OCBTYWx0ZWRfX9UoDYD9dnzQh
 gepjdDagELzg+dmFeTtc6bC0MYxNbkAu2T+PGns6A3gP4NnKgyWV+ZfOQNCjJroJNDGFu7wvCDD
 T+zQ/qwFaCO7eQH33X9kI6tXaZla5hyJdaUDrlDAppfN7Vh7b213e9QzCiXmsJLBr04vcikuAm7
 5IaZ8NyUA1kEDu7qRrDOqDCHDp3n2pv8QICEsE/qn3Fys6Yr7iMmrY8vCR1W2osz29v5sbXaGhF
 KJjynhZkHdzCFqgRY/p47eM4m8kRTo6rWIlOFTURsoFzE1Q2ZS1RzhoirgT2FRC94u2HHjNu0HN
 Gz8rKu7hMQZL6+lDz/1SPDxnZZoGd0nXi2/uhmlMcT0i9vZ8Pq6iiXMyO62z2FR5S3ccaFXM1HP
 /BG93TMxX31SK4ht90JkngveUp87q+HPaMlYum4nSBf76yI4ZA1JC0kWKy8IixFRB2iwLVOtU3R
 VGw3V+Bw+lxFDftX7gQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5OCBTYWx0ZWRfX5QLuHQ7Cx42D
 +WZ6/Pte7X/jgSYwPcYN24t2EKh+JC9fBWa9DmIYSniWRlGuBlKbc/IiYUCX6qpshZtC0WSMR7l
 /Y4xrewiTzkEg4mBxpZTudL+g9nuQMM=
X-Authority-Analysis: v=2.4 cv=O9UJeh9W c=1 sm=1 tr=0 ts=6a425d69 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8 a=mUnpA-1eZJh-92FP3oMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: POwrsGyrq7RmTfftn7KBZEzrjiGKJmZE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290098

On 6/19/26 2:54 PM, Himanshu Bhavani wrote:
> From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> 
> Add device tree support for the Sony IMX576 front camera
> sensor and connect it to CAMSS via CSIPHY3.
> 
> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> ---

[...]

>  &cci1_i2c0 {
> -	/* Front cam (Sony IMX576) @ 0x10 */
> +	camera@10 {
> +		compatible = "sony,imx576";
> +		reg = <0x10>;
> +
> +		vana-supply = <&vreg_l3p>;
> +		vif-supply = <&vreg_l6p>;
> +		vdig-supply = <&vreg_32m_cam_dvdd_1p05>;
> +
> +		clocks = <&camcc CAMCC_MCLK1_CLK>;
> +		assigned-clocks = <&camcc CAMCC_MCLK1_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam_mclk1_default>;
> +		pinctrl-names = "default";
> +
> +		orientation = <0>; /* Front facing */

Please include the new define from:

https://lore.kernel.org/all/20260628-kbingham-orientation-v3-0-4ed92968aff8@ideasonboard.com/
> +		rotation = <90>;
> +
> +		port {
> +			camera_imx576_ep: endpoint {
> +				data-lanes = <1 2 3 4>;
> +				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +				link-frequencies = /bits/ 64 <600000000>;
> +				remote-endpoint = <&csiphy3_ep>;
> +			};
> +		};
> +	};
> 
>  	eeprom@50 {
>  		compatible = "giantec,gt24p64a", "atmel,24c64";
> --
> 2.34.1
> 
> 
