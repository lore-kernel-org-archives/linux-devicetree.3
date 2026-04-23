Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F197C3BD654
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 11:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776942335; cv=none; b=YgVTbWmlEhSGaCO11zWaSedslLexDEWR+inzb9i45su75PBwUcmAEq34t8jqMWuVJbTCykTkTW7wAMppy2QfNC8DyPHdz7u3bDRW8155xO+fQBKtFCSlce6L6mN5gnn4hB53hxymZeNlY3A7YydHWP6h6x2CtNnU5yiTvjYSlII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776942335; c=relaxed/simple;
	bh=qI2Id4P0fbBofLccnuj4bcYqhbv2Jhxv46vFPW1y1B8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VnqCU3bURlXmdwESG8b0qfimtPZSXTKO0mV3E96txclsiUZn08pMkXlhSN3usgV6aJ21ABxydV6d33EQh6IaP52WOp0OmDvDe2ea5RvvH3ejd/hjzaIYky4gsUOp9O9lVmB9AXlbGYx+DzyS75xozygFJGaCh3z2/OACzEAr3Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WkD+Ip5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hjAV/Puo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WkD+Ip5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hjAV/Puo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uPtK1565879
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 11:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oym2NRz+YmrUEODJiSP1u6acTfO1/H2Al0orTnseQZw=; b=WkD+Ip5D7gAl2ImO
	RKdM/lxBMV70OUpU3JbsxreCbr2PbC0jiH1u8n7phijgp3e70B+bLCYlkGizUKUr
	fTqJcPBt1ZwlEtw4czY6yFOIApRknEUR2QnN407N0fQ+OjCCZJO0+eFmBdAP+OZM
	b+bh9Lgb5onJPnrm0p/ahRGLLa3iBG8s6q0P17IV5Pi3MBhk3JOrlFj5A8EzBd08
	eNdKSk80RNn0bjG+NOSQTj20dNUPej/NQzKIsT/f+f3zPyw+DEMTEj6iQO0CgmmX
	JaBEge6WNW1pKVTEg58aH0jvG2zkOfwmSEJccs5sVoru7HF0nT/ZjqJwQI/n1dSW
	VyOh/Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16wunfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 11:05:32 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-605a1faa7f3so417592137.2
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 04:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776942332; x=1777547132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oym2NRz+YmrUEODJiSP1u6acTfO1/H2Al0orTnseQZw=;
        b=hjAV/Puov14TD/CCPpzHXW5wK96oN2kXCElCKtCAycNxxzIaLi7BHAIlKFq8pMZUGO
         rqnHxbyosLAuUe0wdgw/dLJOQqX5J5Zl9Bx0S2BqJWxnUZdLqKTpPz8FsblvGnbc+MpI
         RsKakeBWJxvLM/ZG0wfH871UdzCWPtPxminDtNY9MUVkzZAi33DSYIyOw/fCuXsqThH5
         9+Ptu6MY9yH41vR7j86TqvPAMiEjDAiVaA69sNXp+rGU/U3Nph2xDL9HvFisLk9oOWst
         IoDjqgbv3c4kMOHdrSIO+Zr806SlPtyYON98oIe+rZMaYE2yb/isHOiwe8Z76c00UJ2W
         ZVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776942332; x=1777547132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oym2NRz+YmrUEODJiSP1u6acTfO1/H2Al0orTnseQZw=;
        b=WCX4kDt02itgBC1wceWnbS1JwnXXfto0XZaI0raS5abHPHBaQSfX6vcrmz+AaG3dPm
         9lUpljn9nAB2BnAS+7yRSucu1Kkl32f38/EO+yjHLMtNZVmBPr4ag0l9ywIJGLyIaUSH
         TdqcZ3ivGVzSfrneKNRkqB6ydmekmiULADcDSk5/osIQpMizGNER/YCOiFWcP2pfBwxy
         uitmVO2mlcdODpql93stSBHDEUoXCJQ/H8A+HHBL8adSf37VS2L8CBUpfMfvfCsc5YnT
         i12q7UGvb0qX9fM8J2B+BeIGeP4XoDF4Vvf+RIPZ/SNMyXQpA0b4ntJRn0y3uAQk+krF
         /nSQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fs98dPjlPPq1tYoiwMZdmSU4Xb5+0JViH7oO/gmKAdmtPcQxPPIokjz6obJuTspH33KzLmi0rvYk2@vger.kernel.org
X-Gm-Message-State: AOJu0YxGpYavgdZqIvCXOy4PfFQm1xn1yl9iR5+/+9bm77D67c2TI5Oh
	6Fb2/spbsM8NsEpSMjajrLOCN/C6g1XoSjSx5yaudGgmbh46H1UHS+VpNIThTJXJF8LyXJx2ySv
	Wo0Pq8qZvBsyIJgFUZRDijIvahW5aMlUnsrOBL1i3qyjSslDxxN5aeMVn62SZ2oLc
X-Gm-Gg: AeBDiesmtP050+aIfKs6zVpkIxluMM+iN/6oCtyl7MrA4MC8kRLDf/x9GQNdJdfydV3
	RvGzhnusz4QzlmiJgKVVGxdnyVV/wmVRie/i7xc494GZ/aWJC7E9H/lGUrjNEkUfL202UTwDga+
	vyV504NLXYSv0xN1OoARsl+3vWlE1T577yJMlUf5oyAqe4M0DDErx207/WDVJGPTUaH2SOR1DUI
	FkqZT+J/vsQ4kR+Q4QW7L3cSIoQcQu0NQRLa+4f16zMLtAphrnqlMz/vCfgUO3R03qadBfBvCCQ
	wRCJwa01oXKPFwlKtNhnDl2N0CeUtvfIf+sN9kS0HH02R/0VRni8M68G0VnH4+wl6FUI+RVaccm
	ryXpYSMTfz+C31XeZD9bosWGQTkebPp+L0Y+mjdbVRKa9fkDEjg6ZT+Luy4S3VaE9HMK+vwpI0M
	zFdEgxr8FgUZPSYQ==
X-Received: by 2002:a05:6102:1609:b0:611:82b:add6 with SMTP id ada2fe7eead31-617003c48edmr5182218137.8.1776942332194;
        Thu, 23 Apr 2026 04:05:32 -0700 (PDT)
X-Received: by 2002:a05:6102:1609:b0:611:82b:add6 with SMTP id ada2fe7eead31-617003c48edmr5182210137.8.1776942331797;
        Thu, 23 Apr 2026 04:05:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f652asm40152231fa.12.2026.04.23.04.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 04:05:30 -0700 (PDT)
Message-ID: <0d411167-caad-4f6e-b52b-de7caeaf2333@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 13:05:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sdm630: assign adsp_mem region
 to ADSP FastRPC node
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-4-274ba3715db0@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-4-274ba3715db0@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEwOSBTYWx0ZWRfXyIBBOz1xr8bT
 8FVBThfaDaiuOFEOIMS8QN+pH4fvF1yhbI16f5pa0JciHOQpb2Ng9Vr9orIYAn/vogaUiNA+TPd
 ek9JzIZsnbfgDfERKm5YVZgjYRZ7l/P04SPI4LYk8BXgl2JdLSR61Kt5RXv1MEsQvNYAE8IX690
 74ewgLhA61L9TPB6ZMUE4eqkk+ZcPnh02iJ2BoNh0zgnTJeWI7iVTLJlBVsxbb9V3Cc4xgXICGB
 0kKzmTSgGzJgCFyS6gxWlu30Gun3x4kU//gnb+GrOXVgY94bMBnfP+AnosyZhEIPMIqg9ocGoUx
 g8/XbYPQjq48kgoWT1wFxzymXAOgCfapFb9hDzNcKN8jii0HIzDQkVwQy/RFOO0nU/m+YwH7v0r
 Pttrs8M262FfIqAoGRyMWoXpsfOXRWKOcnz7UouQi4nZzyGy3gixYSzmkX/OCgO01wHsluaR9GZ
 lyWj4SjaSDFyjaelLNQ==
X-Authority-Analysis: v=2.4 cv=dL+WXuZb c=1 sm=1 tr=0 ts=69e9fcfc cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Gv3PURsRAAAA:20 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=1l1YoXn3vtdfKgcNvScA:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: YujD1-Vfv7oLfd6BRN9krzaxk-2PlWmM
X-Proofpoint-ORIG-GUID: YujD1-Vfv7oLfd6BRN9krzaxk-2PlWmM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230109

On 4/22/26 5:39 PM, Nickolay Goppen wrote:
> Downstream [1] ADSP FastRPC node has the adsp_mem region assigned, so
> assign it to the ADSP FastRPC node.
> 
> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1693
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 36b419dea153..af2bc29ccdad 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -2458,6 +2458,9 @@ fastrpc {
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
> +					memory-region = <&adsp_mem>;
> +					qcom,vmids = <QCOM_SCM_VMID_LPASS
> +						      QCOM_SCM_VMID_ADSP_HEAP>;

Please double-check that, the VMID used to be different on
older SoCs

Konrad
