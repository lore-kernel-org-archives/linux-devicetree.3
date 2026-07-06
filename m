Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A53D4DA55D
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330404; cv=none; b=WYoALu+5e59c36NoFGTG4NZt8PM/yQX5I+EaG2LhVovEGTpHEbLC+2tlIZpwmouXXIQmyPE/7UzfLTxKZWyWRrkyKgdaKqSCjVrlwS3uz7qoE8Jwm61Smj6QFnUT674w+EBE+4uy+P7NCBZd6VzIeOMOzFSs1iniBgpoKqBkLv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330404; c=relaxed/simple;
	bh=rS/tT4UyEIl+85LBso67PqHLP7F6BOYzmZCdyUtb3x4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XZzWYCVXHss5E7hA5hXW3qXfmMwRY688q7hb+iAlvsoEVm9IgzNa3Bkfwpf5x1G040ZkvqzGJJlMkLmYBYOIjjv+vHAx4eOCQbfdhrNR9glZxtur9duXn4yFLaNfgpbgqiI12yenxTn7WdOSAuAfooY8c5HFx8XHxrq+q7Hp2g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oV4pdxOF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dq/xkDfq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oV4pdxOF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dq/xkDfq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66694E3t128078
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CqI3glLxpjkIaZ4hS8KAt+z85sv8/xneAfqqjsT0BtM=; b=oV4pdxOFkkgiwhy3
	KqQkRC/eNXZnrAUtWwLiMjuiM9z75nTKAlsexWfvJ06t8B6RMx1uhJ3n+CvmsGvq
	ijj3ukeTsKiOA9rME3WLIRqParkCUvFsqEPrM7NAllVPF69cpNKHrm7/RWwAT6kM
	vMg+2abWKTLmYA+EcGRmtq16AxOY8VT0/lyNrcjvYE8Iu/KXBPmqxB0UsElSBR3Z
	/QKljMdrTPLdXnr2gHXPBVEsuD31Zvk0qxhQQ62aXHKcLHuRx5e3q4ykx1HopZd1
	leEUczyCwW6zfkO30AlDmc8rEN5RBb+JoFUOWU3w7EBRRWhjz0nS5NRLA6eAMcwo
	cVsUTg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvnmc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:33:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ef4a54f86fso7563736d6.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330399; x=1783935199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CqI3glLxpjkIaZ4hS8KAt+z85sv8/xneAfqqjsT0BtM=;
        b=Dq/xkDfqavyyNDvbKYPlxuPI4/doq7fNuC6zMOCLFM/Y3BGc5J1ELOOMNSUg7/s9co
         dOodiyQXrhlvYusiCQWbG+3M44zHkE/9ePo6O5DOOCoHlsXuoDEmzj5YGYmXS0kMjK9P
         SyFXxSiJjPYxQhr8ShRBMPq9I2jf37CJk+/Q4FhAzxMvhvgA38mJWLeSPgKyyoH+fcez
         qhtvq9MeQdQB9El4Tf6xbvYphlFzgXLE40Ac0OGe8KZXBcBuPORuNH0y+kZpwyTeffvS
         OVJ4YXnsLF1aIu7Wa0icbitPXwW3Z8wf6rkjUeJtyPvx4nRh3OCFEVK4WZ1d8/QRSiZv
         IAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330399; x=1783935199;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CqI3glLxpjkIaZ4hS8KAt+z85sv8/xneAfqqjsT0BtM=;
        b=WFqaDXkaZBsopA7fGBBPWBoxqBYWdvwBpn7Odbn+aSIVJfdWmtwsqs3iU2m+092QiX
         SfdnKGWC0B+pp4TCKtRFlrOFamcfmf2JQlNW2hVc/CLECTI/GWTvGZUUsDF+MTf5HAB5
         NcwbkGJpc0gNNe8MfXp25zxRwQw5Ss553sOXYwmgCS8TtnyQ77+2zhcIpVBStSLa8bOO
         /9sZRbsFuy1I2yxtEgGOeVqE2VO6ulqLXRaNbgoJ1qW18l69SdFQY2o1R6DY0g9iOcLv
         zmrimw8yp9bT27Z8RODSaiNjzdDqEh1JfFWDnsEMa/6L+TcCmnKSfGnczq++fW3EF8OB
         lqBA==
X-Forwarded-Encrypted: i=1; AHgh+RoxAlkISXN1efD6XL5sSMUhgB5l4V1sM/COjjRxT9hkisQHGnMURShuuNsxhyiQ7InY6r9VvJWe8iEH@vger.kernel.org
X-Gm-Message-State: AOJu0YwIEN+eh7MD83I5WlwdCw4KGcAxylYooXBjrTdv/Zmp/xmMLx+A
	Cq/mNecztWdfkLeoDsdPiZsdA8cFfgjCIjbs+Bf6xqRwhzn1u772VKxyz/JPasYuXSNj3VNRTbU
	fYByTuZC2S9tVHzcLgttoVd+20C2cQAyHSYB731H5mC78bTNC3JB3M+wegKzjdxUB
X-Gm-Gg: AfdE7ckmatSqOQzuU1UI0jTmjyRpTLFi2bKWswVd91dWKCC1+O9kcACUh4SAQ1TJ6iw
	EzeNKbn9GGkvjLQZF3yNDE7KXTDLNOZBSTnyMb/K4trieCr/uKwvfcPVSsbtTdnEgqDbQHm1sQf
	fAZP3RRZP7wnMuIztKYTh50uEpjz6KJWdpJnODePKNWTGkRVdupiAncYl7WhweO+e7kazfmBJB6
	OFgiYafvC6LshgnFIs5auCQKOZw+TLIKXaTuODUHMzTJE69nyHTB27/cwjS54OuqnWiq76DPL1M
	++6OAYVY8PxT9njmZrv1/RCk2loDbBXltfRCj8+55mbkDYw5jhXyFWabww8Q3vN+gQri+ibsFjF
	0ZJ3i6jvBXg/Dn6o4ECD5SpMeKzRjh3upAzA=
X-Received: by 2002:a05:6214:2503:b0:8e9:f5de:d5fd with SMTP id 6a1803df08f44-8f74caaf417mr106701816d6.10.1783330399121;
        Mon, 06 Jul 2026 02:33:19 -0700 (PDT)
X-Received: by 2002:a05:6214:2503:b0:8e9:f5de:d5fd with SMTP id 6a1803df08f44-8f74caaf417mr106701416d6.10.1783330398707;
        Mon, 06 Jul 2026 02:33:18 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d9e701sm3807545a12.21.2026.07.06.02.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:33:17 -0700 (PDT)
Message-ID: <14c366e5-f030-401e-b51b-62d833f9dde9@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:33:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] arm64: dts: qcom: kaanapali: add the GPU SMMU node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Qingqing Zhou <quic_qqzhou@quicinc.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-3-6ac53de56314@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-3-6ac53de56314@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4b765f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=54KNg95dvv-uSQ5X8vIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: j2O3EF2eW00UDv6yd1SsDDo6rNyzH807
X-Proofpoint-GUID: j2O3EF2eW00UDv6yd1SsDDo6rNyzH807
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfXzccmTlqIvWSd
 n5NF43nFW1sF0ds+6emfBQZIpAbr5D920Fv8ftoHY2MD0rxpYYMrCbBfUSprgoHstbIB3QLM83g
 m5KkZzfw9t4inhBwmwJAIbvCluAF98+ZrmXZuymXeiNPkANRSLQJwatyBZdLLugLVrPqK8M3jtA
 cNJZLbU6+o1xy4AyAcgGHjXr03zuJuDcTl+jGzqfDriyMn1YfQ+AiA6J3M2DRzs1yUgqoNWViv3
 QesMUSrjV7yapoUQRbKDqQMsevB9x0d160KaKbkUznqwAH7MFz4FlqwJy53DNWLx8cyY0xFMwkJ
 +99o2g87OADEt5SVcd+kp6xKVbAOLXHLcXQjre8fbXrJiPHRD/e6NRJwB1tbu6OmTMUOc1hDVLc
 BKq6aNRg+jhrMkqsMl5n/3liCdKH7bQyyn0kYEbwpjvOSxy30g8hH6CsepivpFD7r7CEjkOe9et
 1SHA+HH6DzUH0ieirzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX3xOD9UxhZWbn
 39tOuGTj30OGaX4HTR49v8WDX8s7QjTTD+I6aHGb7LUhm1ZVZU3DeHFspP9ITTV4jMwXXhx+wuV
 rmjBdDTSOhqtciWpCullm1YoxPhhFHs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060096

On 7/5/26 10:00 AM, Akhil P Oommen wrote:
> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
> 
> Add the Adreno GPU SMMU node for kaanapali platform.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 43 +++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index 7aa9653bd456..19eceecc2a19 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -2601,6 +2601,49 @@ gpucc: clock-controller@3d90000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		adreno_smmu: iommu@3da0000 {
> +			compatible = "qcom,kaanapali-smmu-500",
> +				     "qcom,adreno-smmu",
> +				     "qcom,smmu-500",
> +				     "arm,mmu-500";
> +			reg = <0x0 0x03da0000 0x0 0x40000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;
> +			dma-coherent;
> +
> +			power-domains = <&gpucc GPU_CC_CX_GDSC>;
> +
> +			clocks = <&gpucc GPU_CC_GPU_SMMU_VOTE_CLK>;
> +			clock-names = "hlos";

Let's match the property order of glymur.dtsi

for the contents

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
