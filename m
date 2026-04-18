Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B49248F7C
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 01:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776475245; cv=none; b=b9c9XsF+JlAmuJ0OwppD84uOfTUZhMiXnGtmpAmQgLBCV5Ra6SACCruvYnw25q857bKRuMnVOZIKkWqMZA/TvIKLo4SKkfKJclGqyk+F3wjNwfzLO/lMnS5Nlv9EC+a+qeZ0n8if3fn6TGVB0hEaMk+8TuZfWQlQKyfQF8ZclEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776475245; c=relaxed/simple;
	bh=7O8VU3Wkp0Ll6Io/oNxgeHGlwIlafNOpIPahfj5AFX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z9ZbfG4rKiIZyWAl++BJJpYHZDUAamJPxkkmz9mLTJUVVqiFlgLkF1tJglnqNoLaiurLLKPvZUphkKVSZ79SUs6ES4pSKDnqs1W1D5hWlKVg/9LE9UWZf9koVNNidvVSzon2v8+UH9O4Mm7LrrEXdXCv/+iH5SeJVDxzjOOVv2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eV0LHy/V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KX4aWdTB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eV0LHy/V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KX4aWdTB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4DwE4044166
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 01:20:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/PuuxQyzQEh40fZ/zgKVyvnjh/htTyjAlo98pLfejys=; b=eV0LHy/VO8q9fgLy
	LmA7KKlbEEMH2LddEUcGoga7+MHvA8FSpUHV2DdeDyv3y5dWqUOIVsUJpQ3wLZi/
	ZOsLAIVu2dsdSI0BYAaC7tXK2iU1vAInr9rOktubrHZW7rPxamJtcJvzzqvqIvKN
	R7b3+Ai0spUzis2FsaFGkWB0NCho4diM7KPs2Y90AWUvxwpzrl4SIrgXTojaKOKE
	Nh/M77rI/8APbUXLfLg2LsKxol7BpUkWXnwxhNvHPdHHnLG+iPkBGx2gUJccdnSV
	7MSvzOkLmS10fZ4t2raTzQQSUJSACyTCjOntaqlhaQ9d+GQvwGX3Sl6xDhh0oDo6
	8u9Y/w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkqumhchr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 01:20:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35fb969a4c0so1454967a91.3
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 18:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776475243; x=1777080043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/PuuxQyzQEh40fZ/zgKVyvnjh/htTyjAlo98pLfejys=;
        b=KX4aWdTBtyb8Hheta9s64KKAtbZfHY1GyjxkwNY7fg6ZtI396TJWivqm7HPzos+Qk4
         Myq77jqB6t5doJC6vr3MUZ67H+07rx6XwlnHMgGu8vPPELmD54+Stn5sCSXqlUDml3aX
         XKtfDdZFBSjOya2IdG1QRx2HRl65dAnO0mQPx1lDseH49HncxiFERkDF3aqzPUbymY9U
         g3I7x7hj0OFL5qQ1lwO5csSwzOmvirPUe201ILrs5luA7xyVOSKF4COsSy7zmHucWA2w
         YsjnFxjRap67Z6KPc1kXcMlzSgfSFkKuP7eoBnqkOyI48EHtDaKc6jBblR53BzZX3/lV
         3reA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776475243; x=1777080043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/PuuxQyzQEh40fZ/zgKVyvnjh/htTyjAlo98pLfejys=;
        b=i1Y5i/j5lhb8f6vtewx5qt6vWVlX/Gj8aGdhIzJVw8G+sQgRz2zUYvcWBMQp4baTf6
         QaRKCwYHV+h68L0G2RSiD9Te51WPrY/EMbtFKtgAzd8v4MJSz5XDj6riQ3mWIsOblJ59
         9MHV+3mte4bRqZaNpIAgRBduCFhrF28YkA/g85xakQRJsCULMk8Tpvf+qWu9Zi4qiYKN
         6XufR++JrQ91TyUeAS++cAvDiPma39yIX34pgfp4nyrsapchqMS4gIR5a5lmXsHmZkit
         FBF/nhpn+XsYCS94rkcD03i0wjJYwY5wl3goitmVoc1oKur/cIcwHj5rpi/Qo+Iu6qFb
         +5eA==
X-Forwarded-Encrypted: i=1; AFNElJ9QYFTo7pWLSKiJmymWJbIWYec+QrDr2r5IWySgVdSjWQGwvjIUf69/3ZGo5qK5GoP/sm9rwYbgcZ5V@vger.kernel.org
X-Gm-Message-State: AOJu0YwUorP7SEgvw6/HOVxJU08pjqciLKlSeOeVuTvCc4ys8nURyr5x
	EixAzAov/mAXhXiVXU6UYHq8kpNtznkOaSNZzQWrjlCbIz+W9jcj8Wq722q+lzmTR8NuNte7awD
	KwY3CWRAy5MNjL4PsTW7uD3QbzbZcR45s7Rjyy0z1mN+dkmlWn9tFbuucSZtO8daB
X-Gm-Gg: AeBDiesNz4tLfGCxz87nqc+8GHYkGdYQ3CAlGBq5YuflRw+hAXjGGHhL3zNzifHc25u
	UriQZ5ThFHDEPUWz1G8shMuIg5YzA9wy7C8475ktHFm5CenC+YgPVpWAKY2vmy0baL/99DcwucJ
	ClXtDqX31+Y5RJsJmfXfQMx77b5LL4myg3JBPA9kKC5fa9eTalcCBbEUwPOcxNFu8j3+HBSqKa9
	hyIIHYanMoIioKUqns2pGcnn5LiinxYhPMSoTRUxJi0uOaUklhdNvQF/yPEHUG5XSbDlVBVOkrG
	Mrgptboo13/9O0JpokHFpm3GTFUpLJ816JLxamcayTVx/7qN0t2328/5bPZMvbayNBGJ3lxZSfF
	Zzgo+4sud3bT7tA+mj1VEub0rmtNmRXt6E+h7b8M0TMH550i/DrFBGmLWA1FTFaMb
X-Received: by 2002:a17:90b:2604:b0:35d:a6eb:197f with SMTP id 98e67ed59e1d1-36140226cfamr5172411a91.0.1776475242900;
        Fri, 17 Apr 2026 18:20:42 -0700 (PDT)
X-Received: by 2002:a17:90b:2604:b0:35d:a6eb:197f with SMTP id 98e67ed59e1d1-36140226cfamr5172383a91.0.1776475242412;
        Fri, 17 Apr 2026 18:20:42 -0700 (PDT)
Received: from [192.168.1.10] ([122.179.227.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa16e72sm32535725ad.19.2026.04.17.18.20.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 18:20:42 -0700 (PDT)
Message-ID: <668783d5-69b3-4107-85e4-c7450cce27c4@oss.qualcomm.com>
Date: Sat, 18 Apr 2026 06:50:37 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sdm630: assign adsp_mem region to
 ADSP FastRPC node
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-4-03b475b29554@mainlining.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-4-03b475b29554@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BbfjnWtAov6o_Mn19aMcJoUmDKSniCCx
X-Proofpoint-GUID: BbfjnWtAov6o_Mn19aMcJoUmDKSniCCx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDAxMCBTYWx0ZWRfX0NfxDKxTArlZ
 JJFhCSe0A6twZtHUHsmMlvl43kFx4y9o0NgCxBGnYcPPJoPPcKDUzsp6WUTSuIh0Pw+9ftqjX1l
 6CMtgqFKxfwmCz1gcWJcyNMutsdY0lfzw57efAwv4h6kMNdz9g//LGGHlsusCt1jVCH71bjXUu0
 zkux8XaRCO06Q+RRCwosi6cSgSTK/vtF3/T0w4P+19ZGxCLqsJInL2H5HZ3GH9P46u+3Q20fBl2
 T3IALjxoQS9ctfATGiLOTtrFd++U57KGp/oBOpNzLJbQBFMvrWptitPoOF0TDlrHJiRwBR76TV8
 3PRK7+kQFEyOKgbDen4tShAeI76WwMQNA2hUrKBwjWrNlbf+/C1UAqN/R00hUHBzhB/h6MPflWF
 MSSUKAIRmNS73ygVhrAIMC/CpHZgo/XcxCvuGpqCYLbyKBS0Hg7WblK4xoQ0FjBTehfpaelmyLy
 IGE2cSH/1KqwwlRvIeQ==
X-Authority-Analysis: v=2.4 cv=PKw/P/qC c=1 sm=1 tr=0 ts=69e2dc6b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xJoAcIQ2wYp4krwY+vXiHQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Gv3PURsRAAAA:20 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8 a=hLo_e59RRG6X6sE6NakA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180010

On 15-04-2026 15:10, Nickolay Goppen wrote:
> Downstream [1] ADSP FastRPC node has the adsp_mem region assigned, so
> assign it to the ADSP FastRPC node.
> 
> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1693
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 13094b5e9339..19d80fbba57d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -2456,6 +2456,7 @@ fastrpc {
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
> +					memory-region = <&adsp_mem>;
This memory-region won't really be useful without proper VMID
configuration. Please add LPASS and ADSP_HEAP VMIDs.

Ref:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/lemans.dtsi#n7501

//Ekansh
>  					qcom,non-secure-domain;
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> 

