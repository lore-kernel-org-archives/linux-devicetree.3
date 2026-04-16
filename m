Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6FC383C71
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 12:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342817; cv=none; b=jbTQElQOXpFCaS+nMsnDrF5leNxTD6eMb8mo/FLaqLxXYn48h2g6IoBFEgkg9KTCHT2jRU3yb1CYYSSidfDkEcVOBL7zKQnQ3bdPvoYjPDiz4YTyOM7eKX9XJc/iesVnDtXSFTu8d25KFED5oNYijnE2krSjoH687Fk7y9LOQQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342817; c=relaxed/simple;
	bh=WPSs3cMf16X5/TvEN56VuiGb0TDRAm1CjS6Ltw/i7eE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pvpHcNDewuKKq9v1gJyt3DrISuEh4XZJIdoo9QPgkhONBiWvgptrDaVaSB77TfOxmPLs5gNEb9GrQP3hT8PRntSCsL/61R/nMyj2UaSAVNJCUCnla3dTIWB1ZenyoGuf9wsqmH4U5KKwCnr9mNB+EWncnGUYDycUkw8othQJ6UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dTZM4pfO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fnRJqnSX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dTZM4pfO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fnRJqnSX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GC2DfN1668243
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 12:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	csr7RGPlrUusrxVMW9J1fA3qg5w8Sk/3ed0IXgH2GWM=; b=dTZM4pfO4ImZIYX/
	R3pmtLNgaUyevEUnCZap5wtSktjVG20Y0iougVL0TjUdbuW2ZVXevKhr8UaBGN3h
	WGcK2pMakvVxPnzN3tZlwgteV9ZxZmY/yjTy3Q1UCumCoa4jvafQW1KXG3M6032h
	oVDjdMTLaMtMtQgQ9/noG59HhAgg5zUjCH2JMljZIxcg9HqI1sjMYevMZ8Q3wJ04
	vOpw4nzafgZYVhtToxcpxF8l6NeP6HLKtm61vdDBA2n/rjHDk0jEJxD3+6Jf2Jyb
	rJkxJkbWqEHLePzDm++azzzEyHVsJxJ9pKSPvuCnJiZkkDkZE/5ggj2enPtLcpp7
	x5F/1Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtd91aa8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 12:33:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b32feb719so11107161cf.2
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 05:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776342814; x=1776947614; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=csr7RGPlrUusrxVMW9J1fA3qg5w8Sk/3ed0IXgH2GWM=;
        b=fnRJqnSX4xup+vZjZG/OgtSJARkfggcTZ70MpCXtcgoxmIMxsAn09eny6V8MsQoQ4E
         4YeYRBrbQd/9U7dN67T5N8lTQ9MRGTxFYIUeaxHq/gR5SWQQebPuE6nu1dXwd0WkICzz
         uLh0Atr9plNK05fQDXcgH4iRKQuEusN646flK3yZQHi1PWxePoRgupWfY/K9ggZJ+1eL
         QHhvkSzlqxSKu3scs7AMAJu8kTfh7smzslCvYA5ND9flL0pVKeKC78C731oa2gIo0TtI
         A1mFTZ4MeAnxy7XRLHc8aiXY7/Sfq5nWA3ShWhtz+L95aRgFLqKLMHLBW2Mfx57JNqNA
         dN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342814; x=1776947614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=csr7RGPlrUusrxVMW9J1fA3qg5w8Sk/3ed0IXgH2GWM=;
        b=JpltyE2n/YFx9Xajo7qPKJEj09CcXlG788d+iAVC9JyaHW237BVmRVNMon1UZD083J
         17U7jwTQSQdKuQEmQm58Jyog+zuFNdy/fRgelgvw7xX5N/IzDeqZRZCI7s6sr/4JJ47t
         0nezP9UivXL49xWBGMniQqFNThnJdsn2yQquFaZqm9b7iLfeYQELeHUuJWG+ho9EKdOe
         +UayO/Jx6YttQEBzIU/6bQxAlpqQPp9JIqliGTpuEYJckNkDkbtOaaQEN/7RypIfC4iz
         zZcRkZqPohDl5li59JCHDUPnYBJuH7kVv/Cr0nghaJObETd5kmWJ8cRfYFnkwlKmkMdF
         Ritw==
X-Forwarded-Encrypted: i=1; AFNElJ/ckgCnw4tp+/DT5/E13dhOT7OB8rGOMIjZ1td40fxU/dV30tZW6M4PUbnhk878Scblw5i+sCwFQVAs@vger.kernel.org
X-Gm-Message-State: AOJu0YzSV4HCUuHTDAKUubMIfCE5/UOrbmHZiMp8s2JAKxLkAef7Nu9o
	pRE0oPZoz2aBAVBs8Ml2DHNaCakEBFakkQCUYc1NA+kYtxm8V75lL+gGCFKqUlxMPy1PPAtzV7T
	ODLEXPwR2O4s0Va+5d+LlA5CrioxF4gvTGC7/bt9Cm+MNhgfJ0rHYHKWWSrD0KKSA
X-Gm-Gg: AeBDieuMLdf1VJz+i77s2vj5GfkaIz3jKSEEMa9xjygiXOnKnH1E4EBYsX87+KyblOh
	orH3+erOgHjf3DBaRZ9mpnHx5Lm9GIMin1dF+/ia0LOEn6j6Espr6gjwtteH/EGGzx6f6Ff61Pv
	jJfO0ctQv/DPnreGfhYk+fP1VseYNv0RQcicQOUw2lDktNMzcgKdfSCmolR35dx2ZnGi4WRvbta
	At5V2Z3lFWusUTUpykwCaVBlB+3JFx1U1oZk3MtJibbV5FT1o4npucPCumaXvehrLOspDwkwszh
	8L155r3OYAvXlr5Sj7VhJ79K3IyCBkFeoYjhxw8Qu6TPzPSiMMXnxlO7IisrUwSpJ3mVJrJlD9+
	Qif4DCdFRGgZDmI0fpzjYklEhlJ0f+dmuxLkTRizFvgSwoS+FcmvRBPxqVQ7N+YOHT5WSJBehRf
	ppCVAiqfMfHqcKpw==
X-Received: by 2002:a05:622a:1145:b0:50b:2875:5782 with SMTP id d75a77b69052e-50e2911356emr19909401cf.6.1776342813625;
        Thu, 16 Apr 2026 05:33:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1145:b0:50b:2875:5782 with SMTP id d75a77b69052e-50e2911356emr19908881cf.6.1776342813209;
        Thu, 16 Apr 2026 05:33:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba24865492asm107031766b.24.2026.04.16.05.33.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 05:33:32 -0700 (PDT)
Message-ID: <28108ec6-2b06-4b63-8e41-fa75b7858acf@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 14:33:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: glymur: add TRNG node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260416-glymur_trng_enablement-v1-0-60abcfd45403@oss.qualcomm.com>
 <20260416-glymur_trng_enablement-v1-2-60abcfd45403@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-glymur_trng_enablement-v1-2-60abcfd45403@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExOSBTYWx0ZWRfX86m6lzyXg0Wg
 gZjT5Fi9nmzR3bYcWZcY4uAFSbOFaFWhNwO1baG9LQH+BgDfLxTEJleoWvRuWRjIHih9iJAc5lP
 oMr7BZuJXClM0neUh6Ny8maE6PuLdI4KP+qLIvpaVuDtGoh/M03nIbIKsOnM1VZ4S8P52maIbkX
 wNN2SGfURus3deorm5JxgylTvT1K3QF4sFiPX7yjsWR+1+Bz6MkXxnfxvzc/rY/W6I0sU5H+HGO
 pd5obxBZkkd6FWjPl56lq9qpwqGPUZN1+aQx2FmHZ/jaCyoKdzFoL1gxpkKPP/5Ve5/s/PmX9yd
 LWuqUdVutBNBTUuJrR1t78gsyFQZtPvI8hIackuA8BAIDyYkcEgKfsumGzv5dvxvUcUA9vkDCxQ
 vC60X0TnVlHbgrPQbMPjP8+B9KTZcpP2KQ7CDT9Ntp8jaYcmbVpLOE+GttZy6qb5+5Bg3xrWbam
 XQWPbutAvvI1kdvL7mw==
X-Authority-Analysis: v=2.4 cv=avuCzyZV c=1 sm=1 tr=0 ts=69e0d71e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=GutRjl6PLZtdpyDJDqIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: fa8VHKEFyPiDCpiCiwqHgpGN7MBXbdp7
X-Proofpoint-ORIG-GUID: fa8VHKEFyPiDCpiCiwqHgpGN7MBXbdp7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160119

On 4/16/26 2:26 PM, Harshal Dev wrote:
> Glymur has a True Random Number Generator, add the node with the correct
> compatible set.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f23cf81ddb77..c9d46ec82ccc 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -3675,6 +3675,11 @@ pcie3b_phy: phy@f10000 {
>  			status = "disabled";
>  		};
>  
> +		rng: rng@10c3000 {
> +			compatible = "qcom,glymur-trng", "qcom,trng";
> +			reg = <0x0 0x10c3000 0x0 0x1000>;

Please pad the address part to 8 hex digits with leading zeroes

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
