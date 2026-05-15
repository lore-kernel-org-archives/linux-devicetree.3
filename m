Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4CB421A1D
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840944; cv=none; b=JbSPHZ31R6v8KzXdZFT0pD6N0x7z6XqjltFau7DkkZktSKaNs5IUtlwSq7zOnvqPdNhZc7aYQTImEqSt0sP5IKVMhPZPZ6CIeGdMvtocOJBIk42eZj7THaxSjBuidgXqExOwgpHRT/11np/N/GAMj6C65MaH9rH0i6HYSZc8oLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840944; c=relaxed/simple;
	bh=LnYc4Uf6Zj7qgzTrWROWBK27v52kuP5FNB3OaImv/DU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jiOvbaGP6vr6qlxCdwjIwe8eInXmwfEGo66DM30WJx1p+e3Vq3lKNVQi356TFFR3AUZd+beQhRKrEOdDbm2lzqlvp9ucUypKxzXQc5ylvO4bwNr3b09+orFhdWEAm2GDWyR950cDNC+scUnFhuoaUACHIJVVlJYSFsnJW/X0j4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZJao5xn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IzNX8VNS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZJao5xn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IzNX8VNS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5iqij3199796
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y1RiNDXIBfcOkBMrHcP7edqinXmBvxHiwFxSxjAQBr4=; b=SZJao5xnlh5A2eTc
	f336zPMF1Hz9W9q7q1LzHyRnxPPovWF9WNoWlvz66GoblgOjmCOQ7NH/purQKU0/
	4Tqy5bcIqo5BPu3hrRKSxFwKek1cxaUDGHCLi4Fdt7weX0lz0n5xb3mTCBu9+nh7
	W5uI5uebiD+h48fZ/W5pCrkMmHo+Ge/E7MVFU4jd2pXrfcVk+4Q62JDXEjeMWUyz
	x5UA3XzT1aV7kJwLS+RJjZW6XPux5+wVUr54NC44aQ7tI0SgflATpo1UkivAWAVA
	PXuNogpP0CCR+aVZIkOosnxXYCUqw2xKsMmkNfcnzaFtEzuDCKi7+NEOSbAgXHoW
	ScnGYA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qtsxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:29:01 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-631bec27874so425800137.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778840940; x=1779445740; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y1RiNDXIBfcOkBMrHcP7edqinXmBvxHiwFxSxjAQBr4=;
        b=IzNX8VNS/G9kqYeg0ff1MOSJsfCdIYX2XsTDUGrYYwj8/by0P7Ld4cHOo1B89l4eZq
         35O/BcmX4NIiJIqDJdCZh/CBwFnQ9qMn5eEP/HZTPJZHZVv+awYI5Wp2K0FDNfkn/ki6
         u0ietD1wPFstCDX1c9O7/2TL+4nlvd/m0JVgbrow18XhDJBIui0oU4VacmUVFjYegpg9
         ldrUK8cTeE6y9mUeP+z2zwqBnqxnFEkfq/WKoB+x5BtHasSb/0NqZhvJ7gkBduAhLZGl
         vhNiKEGCsIPHvN2C2j+hrYs9rYZ2DEuhFxKvNcI1uPF2hJzXQrkZC0dgHMxrTODHYx3D
         UdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840940; x=1779445740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1RiNDXIBfcOkBMrHcP7edqinXmBvxHiwFxSxjAQBr4=;
        b=Z0V0+5d/vslaSS2DJfQ42A4Tzo4xHMeXnosnlJE1263ipLballP2in7Z0NFCkelC5U
         ONMW39D80WKLYc8sK0la3x1d2TSYT2VuIXauQzC6vxTmmzV7oVF2MBiz6IM+9cMzITgM
         fBeJkzWQJ2MvgWfQLabHi8putor4xvQA8GZbRtm7QBz8ONneydc42RTsg9weDkbVdcfT
         mX+kqNUiB3cCRdBhee5HvLpcN+4WyrU46JpTtsa6GE+uclu5mFAvKVBj83z3+nTc6WKx
         v4DbDhSU8pXolI5PwqvtXESXK37Zm61LKsJX63085jqHoJLV1RJqNbL/7hVGt+Tz5wOw
         FrVg==
X-Forwarded-Encrypted: i=1; AFNElJ+QcyDGc/0v/FYPrTLVHnZ0PL+1mO1b14LduHQaUdBl2174w9hJuSgLO4FyqOVayNOblihEaMd1oOrr@vger.kernel.org
X-Gm-Message-State: AOJu0YwtfH26OXotN3ptPqsObzTD3Qt6430ZBzBgfRT20Dq1+YhJyELF
	Yw+bP1thvGhPmMB21/T6eNkRyRZ8YeizLQmqGZztSpq3xwnCETqqrWzWzfaNsR/jvTP+KCC0Cdk
	6defXk0uqcRGG9UEqkdA1BEvSPNbhZROdDxD+7XcEeXjibu5BC2ty2NjAImFd7Q9J
X-Gm-Gg: Acq92OHeUGyMbFNvx7g7+KmcLITC78zSzukr6Kd38+hZJCpAqwoHCjz/Spcq4GzLiJF
	mxuaoUnKIHIACcslwr4WIUT1hKMkDbtcbQR6eK3GxsBj7cGljEp4oZMfCaRt0pY8Q6XWxkfzPJW
	/gFF6q/jzCcMrabeNlLD6JBdtacc7LaizBvLrjgPMHPXBGi7fPSAoxzf66DMiQx1zeP8pdvkMnb
	G/yIFE3WYH0cDSyuUXScWyrroZ+7Ij7faXceGODZulDc3SLEBcHcFGrpOJ6P6H6Ey6wbf+UEXbN
	VvyYJWRA4+YyPeLqKTzuDN1JRlTrlEiFbosqWQazAilCAWJBsnPTIUIV0pX3/i4oyqe5qJM/N8o
	+EcMAZ3MIFflqawYMX4vUf5/wasnhs2rHmS1JYrsB7VeW/QE8gEl4NdmoRgba5n1gCTebZhskdo
	kpchc=
X-Received: by 2002:a05:6102:3f0e:b0:635:3f36:e1c5 with SMTP id ada2fe7eead31-63a403a486amr577743137.8.1778840940573;
        Fri, 15 May 2026 03:29:00 -0700 (PDT)
X-Received: by 2002:a05:6102:3f0e:b0:635:3f36:e1c5 with SMTP id ada2fe7eead31-63a403a486amr577732137.8.1778840940077;
        Fri, 15 May 2026 03:29:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c29ea9sm204315766b.16.2026.05.15.03.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:28:59 -0700 (PDT)
Message-ID: <8dfa0670-7605-497b-9d53-db9b4a8a3d8d@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:28:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: shikra: Add qcrypto node support
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
 <20260515-shikra_qcrypto-v1-3-80f07b345c29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-shikra_qcrypto-v1-3-80f07b345c29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a06f56d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Cp0X72Tp7Ho1uHa1MVsA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: dYI4cgcNQWQ7PKW_O19WMXP1nD5EQH_Z
X-Proofpoint-ORIG-GUID: dYI4cgcNQWQ7PKW_O19WMXP1nD5EQH_Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNSBTYWx0ZWRfX+YVAkZk6clSu
 T3xBNbQOh84gixQtU+d657oNSYzmxcEpuNKLDrUL2Q92Rh7z9n8YS2n2xDFyhN1udhG8qudtr4D
 5qUzpfOaOsf+3Nw4YfNegUDQ/Mn2NIE9lIZGwFOtIfTpbTkDs3y/hiYCRTCpBgCL5qVgfSXuFux
 f9gmi1lU15+dTGnDCZtgmpd0KhvRl219i8TSPbRhFGJJc7aVZt5K6ii+Wat9mJQtatekmEMWRXi
 Hb8wE1mzM6zw2S1yz9zAdNXLgn0vvuJ70bqtA0KZsnF0gNGIM/+z2X5vo9rfAVeEhKCXhFCouU5
 O9TtJarOWXEdy8pwm3ea2HSPaNsECA0jl29FvBZEC4//E/zOdp4tPkkX1JhfZeIcev2nnZ8++Ul
 fXGvQpoiU8vW5xqtkUpV3c58NPi5YpUnInB7PFnIWEi/EnzZs2KLYPJv6CX3OV4TJrlMbfLbh6M
 QouUUOEm/y7OcCxdSTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150105

On 5/14/26 9:23 PM, Kuldeep Singh wrote:
> Add qcrypto and cryptobam support for shikra target.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 262c488add1e..dbac0e901d6e 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -541,6 +541,41 @@ config_noc: interconnect@1900000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		cryptobam: dma-controller@1b04000 {
> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
> +			reg = <0x0 0x01b04000 0x0 0x24000>;
> +			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells = <1>;
> +			iommus = <&apps_smmu 0x84 0x0011>,
> +				 <&apps_smmu 0x86 0x0011>,
> +				 <&apps_smmu 0x92 0x0>,

> +				 <&apps_smmu 0x94 0x0011>,
> +				 <&apps_smmu 0x96 0x0011>,

These two entries are logically the same (SID & ~mask) as the first two,
does it still work if you remove them?


> +				 <&apps_smmu 0x98 0x0001>,
> +				 <&apps_smmu 0x9F 0x0>;

Let's keep lowercase hex

Konrad
