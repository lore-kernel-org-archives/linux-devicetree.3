Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEF529E0F8
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 11:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778585333; cv=none; b=jdOHr+1Glr5yZEQKTYcnWJ38YVPfqqpfkUljt6h8lcQZ/GjhNOpuPTwefmOQSDe9MY5c6QyM2PkdE/piGPueJnkGbRE2I5QaHv9LN+7n1q115wKl7ZGBJQJACzQUy0NyOSACkSa2R7+klIQN7d+AqvQRRI4hGpWHw+JJHd0TJAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778585333; c=relaxed/simple;
	bh=L+4cMMv5ZsgrYT9SZWw9YF1uSZAITcwm777swf+z40c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kdvGfbUGmKBGZPXhGUgcUj8ZKzqAFsiTb71aWntGDZ5KJs1q3J4v2wlE808Rcco8T2LQD8nNcZLKo9hGeXMrtVvAGjchK4d0k7GlY0ibkdf0/K+pLGkzPQIQWeC8gKZ9G6Zpz8XgjG4D5+BshAHIewQ8osKsZ0zviKmo8WiTSgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BZtFxzDj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LkDFx+Nt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BZtFxzDj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LkDFx+Nt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C9bwan3971018
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 11:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2v4JWikQJ07SSn2brZjE+kujpKuq8tmqWZaKK1Ws2Ck=; b=BZtFxzDjHiMJjqEf
	avHqHCdu26W+iIarGuad11yGm4CzCkY8xAGZU3LZCnm/Qpvck7sjEbXsC+QXmdW9
	De43p5fr3LghZIbY0+6NdERvy0FOq7fk9bHUTu/eLm1aFkPkXxfv6JlM8aSOGXFb
	xcaW1gUPdnqDq9nWaKG6xnsP16gBu3Ns55eDpL6KAlqlPOjLDUsXUI7TD02t2hCK
	VCqazRR/MuJvH6+o7DG38ishsOG2flCqjZdUzHrRh5yjDMfgvTfKOWkthgpyGRkC
	mvcC35YSIFcj8qPgFXkWHgx/t6R8srmQMRU8SXeSsoYygQu2bVBUyTcHcj8Tjo6U
	LIV+0g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv2b2yv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 11:28:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e429ba4dfso12783411cf.3
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 04:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778585330; x=1779190130; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2v4JWikQJ07SSn2brZjE+kujpKuq8tmqWZaKK1Ws2Ck=;
        b=LkDFx+NtGXW4S1egJeUYVj7dY8UM5TlpKYKRNTx5n2uCst2QKfMJOe6Z+156/qBtVj
         VRVS4Ex0qPNOhkPg3gMBhyio6NV/PDlz3QuRZwIuJ6ceBCD4E2AM0zCLX0MwJUwEZI5O
         6+k4d8WbIdbckFA7cs4apeilNPcPdUYCD0kg9T7l1k0pP0D67N+95ed+rnX4PuXwwlhx
         2AQGFH73GR/TYCdtdwinAnILMfgqLs0KaDj69dsG9yx/VK0Ikgu28JVaFNEKmXsvli90
         ENNVoeq5ohmkc2C+yb4OgySzbKVjCdTRCkVzoJgUWb3qSsWXFrIA48Eir+uZalt7bsB2
         EOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778585330; x=1779190130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2v4JWikQJ07SSn2brZjE+kujpKuq8tmqWZaKK1Ws2Ck=;
        b=QJsUJbr5caD3DVXLmpQ6lH7BTOUUAlcWRyb1J5idv4qnWH1oWb+Sa6oKOtR6EuXoJ8
         +8TgISrnpzYH9SU/LL35N36pObTec5UBYKKmc/dunrTnEIZRmVTEDy6L7UIOo2DU4UP2
         +YudOO3VW7YC/B6/60cLRMslCCf+hVHSqU5Xqb+BAPSXb/zlTUA6jB686uYKN7NQfXbP
         AJnSYPkAze6aRk+5iM1wVEhB6FRbugGXeM/GvfNEJL12XbA/AIL0QbxjnqvxP4i7OO5u
         x6OoMkUvhwR52K3kCwepMSuQxh+gHGtLUTYPlneFYte9qRgj9azS7/OdTYf22HDYJZsb
         ZYvA==
X-Forwarded-Encrypted: i=1; AFNElJ9ipq1bYxJfFzuSdIILkucDV9UTNfb1N9gC7z5TIAjx3obfPyc2fKZ5MFMVXnwRGm9MdD3JxWDGPFXf@vger.kernel.org
X-Gm-Message-State: AOJu0YxoIB3JQIUkQx00qwOGjlR92wE6a+oCfoPHn21uql7fhWLSptxy
	B+3TBVUOiiyXifYh2ooTyrKcUGwPffmuWRVWsyuK8vdeRwGl/yWqjiBSFDzcYB+EhGO7zgeGKkh
	mF2Hq0oGiN4/G/P8FEdEZnIVly69DIWHe4/HdPIz/HkbqJfbU2/eHe158PBjhnN0s
X-Gm-Gg: Acq92OFwY7AiDK6unkHVrGLWuQ69e7GBhO9A4v11tLUUuPxnCDR266/jng1aXBjZGKV
	B4vNFE03WQLFHK6myvrPeXOc4kUN9kV2gHLy61HYmblQetd7Ccip1Ed3jSfo1JUle3S99t34Bu7
	NL8e2B4uMJOexeJZKPWaaiy887BPRXTe9rWbrFB2DELew/xaxMwpNezsKEwQwUc8DUsUJ5/hI6P
	2CMdJfzVxTNUr1am+TrPWTniufzP7pQFGNkifu2Z+eFM4LlkhcqtvTsjjlZPDJk8RI9f1K9jkTX
	ylPDufeq1wmWRKrNPuCS5zeOdTKI9dLpGQQLCN8I6KkWbhtze84ZzreWEKVTco4tnkaYLlQqKqJ
	6f1g5rL57R1zqMuKeH1Yh32DBFR6Lu4qS/4x6YfJz/P9pPvGE9HcMCB4gNPmdJTLQobV+JA9IaS
	ZE4vE=
X-Received: by 2002:a05:622a:1811:b0:509:219f:8e34 with SMTP id d75a77b69052e-514622f5065mr274543631cf.0.1778585329578;
        Tue, 12 May 2026 04:28:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1811:b0:509:219f:8e34 with SMTP id d75a77b69052e-514622f5065mr274543201cf.0.1778585329135;
        Tue, 12 May 2026 04:28:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b3bb2asm4776531a12.6.2026.05.12.04.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 04:28:47 -0700 (PDT)
Message-ID: <71eee892-1c0b-49e7-a82d-9016c56e8592@oss.qualcomm.com>
Date: Tue, 12 May 2026 13:28:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: dts: qcom: monaco: add AEST error nodes
To: Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
 <20260505-aest-devicetree-support-v1-8-d5d6ffacf0a5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505-aest-devicetree-support-v1-8-d5d6ffacf0a5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: X3zPZFr8p7_UABTmQMk5dv2vH26qamYQ
X-Authority-Analysis: v=2.4 cv=CeM4Irrl c=1 sm=1 tr=0 ts=6a030ef2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=LELUAEsiHl5uogXv60kA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDExOCBTYWx0ZWRfX+RE4hqZ+mKu9
 rKR6TNE/UE6Qp8dzdbGCGAbvDFg0H1LOW4NZVsnuRMyeJzDCPKdxNFsKL1Eiup1JYyXq7TtzMVV
 /CwPG+4TPaL4xyifW219CpYdjDputfISZTHOh9S0m4Mvijk4sjentmUWLlE9aCrfL7qTltHLYmd
 fZPMKn4K278+ETKtnUd7HXu5LCm5g6RBmxBQ13QplYvzqAvUY/36jXC0DDo9zOaihUNSEhWbPSM
 skx09mYL7hVnDMkCnVDha1hcHm3Bknh6OFbePyG2dY2EFtM//eh/aO/ZpsJ8I6r/i39BdWddYDh
 vtr9L+mS9LNHaOjc6plam86H7xRe2ReAUDlXJscMhWAjsRc+uf8PlaY8odZSfayZQfs+T+DDMw3
 CGQWhyL5weo4/AIdHRdInvyaVv1Mk/DW+ZHsennyAggR9wFSXul7neR88KbQ3axhnd8JQEF7vY1
 DCuLG047Cnd3t5Hcz6Q==
X-Proofpoint-GUID: X3zPZFr8p7_UABTmQMk5dv2vH26qamYQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120118

On 5/5/26 2:23 PM, Umang Chheda wrote:
> Add AEST RAS error source nodes for the Monaco SoC.
> 
> The DT describes a processor error source covering all CPU cores and a
> shared L3 cache error source for the cluster. These nodes model the
> hardware error reporting blocks and associated interrupts as required
> by the Arm AEST specification.
> 
> Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 41 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index 7b1d57460f1e..8e43ceed7d84 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <dt-bindings/arm/aest.h>
>  #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
>  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> @@ -29,6 +30,46 @@ / {
>  	#address-cells = <2>;
>  	#size-cells = <2>;
>  
> +	aest {
> +		compatible = "arm,aest";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;

These 3 properties aren't necessary if none of the subnodes have a
'reg' property

Konrad
