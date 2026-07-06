Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C68423395F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329829; cv=none; b=MZztOrGA4gIYY5Yy1C0QvvNOfmHzuZ0lRPLVLW81E61X0uy/0pwt+4rVumhZMQSJontutT3uWB42qtc9yFGOfrz7PWYSLU4hKtmkV2Bcnmub2Yw6Z7ac2Mql+RbgDLpETD+DHhtScnHOIAysLyZnF3YKDddAbzVIeMwhGxBPY7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329829; c=relaxed/simple;
	bh=ta/083cJNwexlguKfK+EHKUcfFJeFqmXCag4fL8jt3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gwsRtj7+OSkuNET63oaot6LhVBxiByIqFKoiWLEqmzc7/WLImce1GRZjbB9vkQ4dKry8hfTTWjaMEz5FIOSylZygEwoaZ7SejfkxzVWE25Df+FZnpMIou3/7aRoPghNt6kjneCRPByVEjxKTk1KH9E0S2RC1OVieUu2PJgUQ1dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXgoB+ta; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jr+Reg9N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXgoB+ta";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jr+Reg9N"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66694WQh136211
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OImVgVIwtgnBedVYuc3BUAu5DOrIIVBJ0jcP9WGFxOk=; b=VXgoB+takwi9VbkD
	byz17TrsHT9KgWvlwC4YpUw7dgBiB4tLCkfd8x/fLV6lD/5gfA1+fZh6muWnqfYR
	IiFf6p6DSvCkWLQ3b6tmn6hN+I6anXp5CjF3V9xiORX/0kOQOSvBDM+VLskrvsYs
	z4bhYDAmYsWBpuF64QOc/iG18qviEasZYch0uVPfM56fxz2OYeK+haxpJAwq+TAf
	nyD1ofYhmP5u7ft1LeMwgg8itO88qFRGt0COKG4g/jlmKfiCxPEed+jb123MiXEB
	aO8aWvCBxaw7PEWU49gtKIMdc3C4aaYWeuFNYjm4873XqDBMqJvy9Lj59z+sFzyp
	FhytUw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64nmya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:23:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-384419c6c74so2100055a91.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783329823; x=1783934623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OImVgVIwtgnBedVYuc3BUAu5DOrIIVBJ0jcP9WGFxOk=;
        b=Jr+Reg9NWBMY+12U4jQH0jr3fnapbVO0nwEAbSjwCQZtDV4VSWvnwyjzhAt1sKO4gG
         GZCMsD2tmyWipCCPOhmCuu4k61941uyFgX6jtNVplT3oyX3YBluvjtZMs3jGGA727TUU
         AssAgvxtPmy7zZFfv2LshaN6Mcvyq1wdUGdxeaNrXFXcYVKBwrbsBXio1tXPKBT18sXM
         4eWs3KIXRvjo0ZgzRilqi7l+b+JwqP5taB/tAdrmG2kkSADdWQx3F3h9uQ0gin6C+7fw
         x3DTIcJe1Bf92gxqvPvhet5FTsNYClLLjnTT+L8L/gktcGWF3qayvTABaduE0MHdMLmv
         /9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329823; x=1783934623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OImVgVIwtgnBedVYuc3BUAu5DOrIIVBJ0jcP9WGFxOk=;
        b=cEXzcycw4ZTzoU9KyCQ+nZN5Yz5YBlEyrBvScPkI6LDYk8Z+E/va/uspDrMfZUWvFd
         5YO2i3vEnhSEpdg0eEOxahb51eM0ltqXTwEvC88Xih0KSq0KhUPekUAhzZnNpkNG9Xzd
         DHiMMCSqod0yhfIGktaggfblkGAgZ87WdYpp0BnEPrU2+j5lQsccgjp7npRhnve30Ucn
         81/DdLgTrWBuxDLerm9vZbIZGI8k1lqVtrUOPOndmRf3aucwpGKAaQVogyCK3VCHtnbu
         Ilq1NCBXo65PcR0sO9r7ZfAhQFFcn3ZSYv0vGFJGeVjNF8337/pG+32RgabOJjfEz2Hc
         2dNw==
X-Forwarded-Encrypted: i=1; AHgh+RrdX9LSFNyqJSjT4EzKpfwY+7OfjB+RbIfntkssl+nEm/hkKrT9izJyZdE3lfULDeD6tGQEU6bWe1mW@vger.kernel.org
X-Gm-Message-State: AOJu0YyrrqNhq0U0NI8lAvCEwd85S8uu2yd0iqS7jCOfX/FPsB0CxJPB
	7cANXOFVBkNRXcJchYlayiiNtxXvVvRbVWRVsn8w+Nh+6uLYqBzbjtCNucp89rWLQAWpJOsWtJc
	yK8YHCq8LUTqq+d28jUsCDunG8NdHr3h3D6wBvC3URfLpUEpI7JobDSUUjmcu+rpD
X-Gm-Gg: AfdE7cl3gkkEpgr0XCYoj8QsUEIN6qqc7YH+7D5GEXg+THTakGxL2+NZIM1xd+wVbLD
	hZukW7ioAAVaMAKx7TWQbkkx5bEMhhtT8dw/SM/M6OdY2U5sMl4t0/cGh7sVcXNrlwiBfH1nYJv
	QgCpx9eAh/+DttuSUPzRZZWW0DWo7k8RW1ZvuAOKwKnG/I+7n3lqSEIUaTb6QfFsHFCA7tAS+N7
	jngCGavlu7Ku+yv4/TyC88mP1z0t3OqwCw9s/Hske1ldCd5oknyWQiM3MDr3IMo8VXSTxic0+DO
	6938Cz8wl160iQ+7twT33VncdigpR043TMLYL042il1wrB+LtUHEno0pSSHB4zp/bWs9topdIgU
	MGDhVoCSG6/Z8SlDoPeg/IhShPzLiRlnRbz2CstUu
X-Received: by 2002:a17:90b:17c1:b0:380:105f:8ffd with SMTP id 98e67ed59e1d1-3829ef0523emr9218770a91.16.1783329823399;
        Mon, 06 Jul 2026 02:23:43 -0700 (PDT)
X-Received: by 2002:a17:90b:17c1:b0:380:105f:8ffd with SMTP id 98e67ed59e1d1-3829ef0523emr9218741a91.16.1783329822937;
        Mon, 06 Jul 2026 02:23:42 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127ae1333sm4619853a91.4.2026.07.06.02.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:23:42 -0700 (PDT)
Message-ID: <93513477-d606-4881-b5f2-0e04e3a4146d@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:53:38 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: shikra: Add LPM stats support for
 subsystems
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
 <20260703-shikra_stats-v1-3-0aa0ec1fa83e@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20260703-shikra_stats-v1-3-0aa0ec1fa83e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NSBTYWx0ZWRfXwviRjZW2cmyT
 r+K7wnpbjataGE8K6/iZjecsEVO4ckv8n3/jrC2DuNKOvGjkq3U5L5yJH7unR+7iQ5819mDDGwz
 pgbOzCjhKG1B1Hnr0Kou0xRzBlRNR8JDLRRm5PXG8s8yuofxq4TIMTMGXdKcEUSfGynZisEXiRD
 Tj5qx/0vsuV4R38kizcsSfYG5nvCnyu3sc1QDwLXf39Yxe8iAFfBIeIYOJdbYhiq8VZB+yLGOtt
 F3cPTpy2KHWli90dDOKvUbnuPgI2Mk9/xQHhkQFoH4US3JsMGoysiV1mU5eZkwYzlYkorFKTaHl
 p4WLbrpw1oUh8rGJtWLieFDx736zPL719htZk8LN1dnYkdnfnXoLnHjO1JXrI52SyjUCvWXB/2p
 +isonVBMYikr+kgxXet6hynZSqJSVxwenCdWz4ixtjWm9+5dJ1qaNMnJgFozHq4Vj1si9YIFYgj
 u8zbgV59MU7j3MoxA2w==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4b7420 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=AHioofpCCd08mFT-JmcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: G7tb7i-cyGp8QB8wa2RpgwvdIoMbcw3f
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NSBTYWx0ZWRfX3z/g7JaQdGgJ
 zBJKHFzx+BTAAsNVlGLqWV56GmuduBL7xaAnD32bWCb6Mude5lCCWXH86BxbCpzpjj/fRN5NCdF
 O19iBdVlud6Aq5ojjWC7GkiEBxC70Lo=
X-Proofpoint-GUID: G7tb7i-cyGp8QB8wa2RpgwvdIoMbcw3f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060095



On 7/3/2026 4:43 PM, Sneh Mankad wrote:
> Add support to display subsystem level LPM stats for shikra.

Instead of,
arm64: dts: qcom: shikra: Add LPM stats support for subsystems

Below better explains,

arm64: dts: qcom: shikra: Update rpm-stats compatible to SoC specific

Generic qcom,rpm-stats only reads SoC level low power modes like vmin and vlow.

Shikra SoC specific compatible allows reading individual subsystem level low power mode stats
along with SoC level low power modes. Change it.

> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..53f40283a3b70bccdc510716b39251d377be7d24 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -535,7 +535,7 @@ apss_mpm: sram@1b8 {
>  		};
>  
>  		sram@4690000 {
> -			compatible = "qcom,rpm-stats";
> +			compatible = "qcom,shikra-rpm-stats";
>  			reg = <0x0 0x04690000 0x0 0x14000>;
>  		};
>  
> 

