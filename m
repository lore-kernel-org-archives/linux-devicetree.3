Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787965519A6
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 12:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957987; cv=none; b=RKI3Rp1NwxeRT9ipjXeEAk9ljTwSP+5p1kb12+afzEm8ergpWR4PmN8H3f8Opu8Lmysx7MoXPmG2bz2E6oe7WNQ9kN/J9Xp7mo+auHUSsDXue2uI7P/kE6nl2gz4F9IIlOqVI5yM3t3gY92yugjrCLYQHmpP1DPndyL6vSFyiz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957987; c=relaxed/simple;
	bh=yI0YtwwDoRq46cm6dlAsPClpp9C16ia2CjUjaVPn11M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pT1SUUGYx9jOZpv2pTwHmSzvg3ehm6ozOgdIqWr9vPKdpmrkUY7qQ2sYt373XPg+nYvy0IhQICyVyszeJTLJliZ34WEgNHpnoWQPHcZNLRaKSIQtgfkOAm2Jgtn5qv4WSDr4an2WJNDrGj2n+G/GYR3tdxaNFIGPaFqTbOAs8+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dkkJeDvQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ccNtRyVp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dkkJeDvQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ccNtRyVp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUFjT2376133
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 12:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Rx/vpo0zvv0ttoTKgs+GGM/ZJwxjq76fMb0r1Xbs2U=; b=dkkJeDvQdQ3LR3Mu
	2R2KM1Rqn9gxAo8WifsUlLYIdBz/yVuTja/aKb4DseodKUcbyr9FCsnAgcTw2rVE
	PdNnFEEdM3JXy713aNWi+Lz+jovQn9zxDcWUp2I8Zkslr1OoTU8K1vL9c6At/RGQ
	+j0HEZgsxELhJjlOOVqEuFPvLslwlrWNwmbJHCv2+/vSFV9DxIQVTSJtHXsk1b4t
	CnDjS9ccmHDX//Y91u9ZhhZj8P/hNbcKOsGJI9vETDw8bbhh0Cjox+CCkT2hJzbq
	d4DoRXwEcsf7b8dS6g8iaDN9odOPE7Au7hes4KNL6ZiXhm8yjqFP4HKrb73APElJ
	lm5Fhg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5ru0fdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 12:46:20 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c66ec39d8cso136208e0c.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 05:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957979; x=1789562779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Rx/vpo0zvv0ttoTKgs+GGM/ZJwxjq76fMb0r1Xbs2U=;
        b=ccNtRyVpSPeaHLieEMgCCCR55jZj+NpEaZJc0sMU0iJ48cbvzF6Lm+8HvgZQpt9YtU
         JsdAFwoYBD0+StcykJeC5VYQnR3cBGutcw/ZKNX+j/wHkPHRvJ2x2DAckFMQgMqT8ZFE
         V4WN7nahJbgU5PvCjEYiy2+aJjjEvRJfpxLMZVgIGRgbYucI9j+6FhSekLl3lXHT81l7
         gHV5AOcf+iiCbcFcImNU9wuQaCrMsDhuYrVCRJpHUsPV/xHYrr9vopwebn0JzmZNVOBF
         XaDKbJwJ4Kiq63k0ZPsg1M1WUvW7BpyKNWK2BdmnG+BcC0uND6pzmE84cuKzJCiSrBNs
         kKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957979; x=1789562779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Rx/vpo0zvv0ttoTKgs+GGM/ZJwxjq76fMb0r1Xbs2U=;
        b=Ekn1NwbJOB1JeK4u3WkLxkzBDbMXT/DWh19P1wlN94D4jWHUPH6qYjUNR4kX9eV4k9
         akkyH1MrXVjzasXJwPWfsvJcmC8FmbFMKIjYNgt8++OhLQu6evxYso5vIy3ufMh7NhYg
         gfROmc91+ydvPI0DS6nY/pm4J4plxJq0IrwniZ68IGtY/HGgENJOnGsAf/O0mjFl+uqq
         PYLlWaVjtCpDkITFunqWkbNgPI+rbbZD5PxW8NWPt5HnVp57QMLtxQgGowJVPQET1cfw
         nM+fJhqqrG0B8PK7KgvGKspcFE1K27BZV6zKuts7svD1cY6KTibT9ICM7D2WOU6+lMbg
         LhSw==
X-Forwarded-Encrypted: i=1; AKwUvBxOlbhFrHAEzZieDauTdSjmfpLr/I+QYi8+sjSYxrNF5W6k8ZZheqZJmtim8mOishUQm2TVZsra9bdn@vger.kernel.org
X-Gm-Message-State: AFuF++liD3ZY0keo4fijZdgc43TK2bXiczmcMhlFWljF9NW53HfCAjLi
	tAQ00PZkk4rN883JD4Bm4DF3MuVmcSKnFGBDlglpLPHkSvYNFZr8T3X1uyQeFuOqxpZOwsJmj2N
	dN22UzZnCG6mqzknzlQCCc1ozD5LIVliYJJzfDJRcdqBNWZsd2Y0OgnUcy9RlhjIq
X-Gm-Gg: AYBFou1jIeQJtV0litmeIHOiobmf/niPUU8GujUNPc2JDa04AZ6h/PkzKesqIarxlU4
	HHR8aZxoNatQkrJ2AaO1VT1FR6R8X8beR/jbpPN1clhA8z2Ircpn926FHoQP7ZFalemDJPI44EO
	fm46wIQCQEuBNVbsV5JRrgn99Hu4sEeeE6zFMBJBOGPcl3pOkq1N5l1P4swRTx12WhQSNPvU0kd
	K8/Qm4LL/TEEGWb+V/Fh5/kwvrQyf1Gtq2Nux6d9NATbf4hPzuNjkbsdlbDE4I3WbaETWUk7IvU
	DY+LSfPDRxm14i3UC/g00Xn5jKHZMEUhIDdFF1U7z21GyxHsWWMdNG6kVNoXZlU0GcxZNI3gw68
	esWyVtkJUFmFXhNq5rZAuJQ==
X-Received: by 2002:a67:ebd5:0:b0:790:563:8d1b with SMTP id ada2fe7eead31-79005639f22mr328339137.0.1788957977210;
        Wed, 09 Sep 2026 05:46:17 -0700 (PDT)
X-Received: by 2002:a67:ebd5:0:b0:790:563:8d1b with SMTP id ada2fe7eead31-79005639f22mr328244137.0.1788957975073;
        Wed, 09 Sep 2026 05:46:15 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260cb7a18dsm762361366b.0.2026.09.09.05.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:46:13 -0700 (PDT)
Message-ID: <ae3a76d2-9c46-43c1-8521-398ca23b36e0@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:46:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/13] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
 <20260906-x1e-camss-csi2-phy-dtsi-v6-5-067f2ecc4630@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-5-067f2ecc4630@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M+997Sws c=1 sm=1 tr=0 ts=6aa1551c cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=BxjtONQi-ztXtwshH1IA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: 5KQlNptsiB_PFXeYZBi0Yk_2EJfWxVmW
X-Proofpoint-ORIG-GUID: 5KQlNptsiB_PFXeYZBi0Yk_2EJfWxVmW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MiBTYWx0ZWRfXxRRabPzlLuwI
 t+9HHy5mu+RTIRoanK8NgK8EnHzmGlvhg850wwDHUcivTBevCZe7Ga5JyIpcR2zS/bs3xPI6AB7
 BVpfEgcVKoQRwJLVqpc6B0ki8Bocass=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MiBTYWx0ZWRfXy6bV6huPYhhh
 Gac80vXvd/EQ2arGvLR2021xYNTQIEnDgbfbTQur0ip04BBpxQDcP3CNt/cxfBHA4JnJ/Mk1/2W
 npe09zHUfT2MIfPv7trNJLEEZ3dEY/4wp6kGu9pvL3kxvMEj093RO4a/b5ja6Fx4VuTjrJ+jPow
 atEK7moRlw86iJibnGg/Mv/eb+e1IM2UHiFaJKc9MKFQFoD3s7kyWQTDv4S56zGas9B+KDLorks
 mnlwCsPRJ7nUFoJvL+jKgkjYhpgPZ4jjMi2ahYXouL1DsTA1GmoQqzQ+sSTgyFTv1ZVb7779B5f
 /mk/md66pY22pS0SlTaudTlClhbCXdm8RThDXzVIaYyerP3OPrVa6Yzu2182dvESbGSwL2ALLYS
 ny49Pn2UXR8vZeC9SJgSBeElFUESNf3Zk0LkG5ibbCzPsA3Kt3zKnw4Tc9tKsuZV11m/XRaWMUG
 0/JteJ/Qc5inEGOCh/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090142

On 9/6/26 4:20 PM, Bryan O'Donoghue wrote:
> Add dtsi to describe the xe180100 CAMSS block

"x1e80100"

[...]

> +		camss: isp@acb7000 {
> +			compatible = "qcom,x1e80100-camss";
> +
> +			reg = <0 0x0acb7000 0 0x2000>,
> +			      <0 0x0acb9000 0 0x2000>,
> +			      <0 0x0acbb000 0 0x2000>,
> +			      <0 0x0acc6000 0 0x1000>,
> +			      <0 0x0acca000 0 0x1000>,
> +			      <0 0x0acb6000 0 0x1000>,
> +			      <0 0x0ace4000 0 0x1000>,
> +			      <0 0x0ace6000 0 0x1000>,
> +			      <0 0x0ace8000 0 0x1000>,
> +			      <0 0x0acec000 0 0x4000>,
> +			      <0 0x0acf6000 0 0x1000>,
> +			      <0 0x0acf7000 0 0x1000>,
> +			      <0 0x0acf8000 0 0x1000>,
> +			      <0 0x0ac62000 0 0xf000>,
> +			      <0 0x0ac71000 0 0xf000>,
> +			      <0 0x0acc7000 0 0x2000>,
> +			      <0 0x0accb000 0 0x2000>;
> +
> +			reg-names = "csid0",

Stray \n above

[...]

> +				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +
> +			clock-names = "camnoc_nrt_axi",

And here

[...]

> +				      "vfe_lite_ahb",
> +				      "vfe_lite_cphy_rx",
> +				      "vfe_lite_csid";
> +
> +			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
> +
> +			interrupt-names = "csid0",

And here

otherwise I don't think this is going to get any better without
holding this hostage for another N years pending a rearchitecture
of the drivers so

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
