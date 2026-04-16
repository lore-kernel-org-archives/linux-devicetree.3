Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B343BA225
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776346481; cv=none; b=gr0+hJtU0K4ZuUVyzcB3sjMu1ZdGGpyzUxDE6wQLDgwFHpmhruPf2AStPPP2HYrvSZPAPRqsMYv1/VB7a5VM4v/Q+nsR8N9U+P2fc59lNGXPFeWVWf6medOk+YfJP9b2CZw7q1sz1lVoCF8D6tZBg+fza5/19NFnvTMwxzj3L3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776346481; c=relaxed/simple;
	bh=0JE/aX79bsd/ZzLDRMFo/ItbT3LO+4StCT/90CBIeAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=No2PzLJHBuyi5EaZ/8CL/QPEgWKcyjOCpizAbF29qpIe6aPMTr55kdXfF3/km+OzIBz37F78+MF8XytQMI5DVu3u5HyTRVe4x7Q0Px93N8PrMHxjxH8IrHB9bGukvi2twLojEk1WcMvaMYlLiMwp9xGkydOhFLcG2nHr/Lt9PVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmaMs8oU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f68Qn+mH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmaMs8oU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f68Qn+mH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GAXwG21245168
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KCrqC415T8c8q59xLap8KU/BogOcT4Z9lLC8RL07uzA=; b=kmaMs8oUDEkVtrfI
	lt6E8z6MQCoN7R6adin1rfVwnLVVeNZXhC+GgXrkLdzyN6xjulJ/HLlluQIBEKQX
	iW7KyJdDq/xEZwWmrdM2TKJmfTG+aWTE7I4q1PnykeGbSl+k/Nhpm0lTtXHREMhz
	1mfH1cq5qcJjRHY94VUhi+g2iYRgBPSrCBFO6dSpwr1mZG0iESPCBVC+QKPHvBXZ
	uHasj6TZNrnqvjJ5T2s7cc/eVFH8X4i/5567p9+MG1+yRnXUiqtfIo6zsOg2fFP9
	oZR8f+QiM/IwkkbrkculD1fGViFne09SEanCc4LO/i/Xn1txlGSYKiUCjJcoRxOU
	uMXBVQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djx4k8hde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:34:39 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-611bf61a809so283273137.3
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 06:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776346479; x=1776951279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KCrqC415T8c8q59xLap8KU/BogOcT4Z9lLC8RL07uzA=;
        b=f68Qn+mHj+NTL+5APgKcNfsZO+J7JCmHvtXwSeOMjBGEt1lxGAGk3bPuaM89IZvSG+
         /ScyfiFZet/Gg2helpFqV2jHRWFKCx7U6T/syLpCUGjmMYV5WSYvi9TMTh8hj7vRhoTM
         hkkWrKPO9e1CfaS9pVHr7S/Js+HtKVB+3yEeFkMKZdvbuqu42iyvE2WLfG7G5PKgCS23
         9fuiGRO4n4hK5m+Z3g0R44QtkKSB33I3NII2p44bNpX3SvN5bWGBXOt9s8jTK6Znw5ul
         DCdRrVAgKouDLkL+svi6hsGyCvJZ/phiDkaExNsCYCRrwArR3+hI1tBUC7ziSlKI1M7c
         WKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776346479; x=1776951279;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCrqC415T8c8q59xLap8KU/BogOcT4Z9lLC8RL07uzA=;
        b=c6WV3p0asJ+2GV9Aw1ehgvvqZbmZs+jo3mir/97W5dNB6DWt4cYtbbc5JWJonE3jWJ
         QU67nx2d8JjIV0/4OnK0NBFsdHWm6WhSl/5G+bCMbiq/fRT5449Moo0l1aZ8eP1j20gM
         8L4brTybQRELXF7jwFIDZWqSm0W1ABGnKQ1d1+0PJ35t4PbUgqP8HrT+xkvSPpThh/3c
         ve5Q+kEZA2c0Z/OhRjkEXt6lIsMzElCn8SJ5HY4SbHVYUHTYntUjpQ+bW3Mgj580ADvq
         iGveYz62RNyWd3KL+NFlDi+yNRKxrpGw8WCAvrRZxnsr8Vrg6wMspX4GaHDrK3SZWder
         n8OA==
X-Forwarded-Encrypted: i=1; AFNElJ9kgl0iYfPf+ebKS0eyV32e1Y8bvwxRavYa6KwjqgzEuTum2dVDfE6c/zabEqwlxZzNl/Tt3r5PZ3M+@vger.kernel.org
X-Gm-Message-State: AOJu0Yxstd1yhlVLVxppXqscpKu0C5LgJZCJ59TAwwpndmvHyMZig7Sq
	+vs+trt9rKtMa+XxJjQ73gKpxnAuWn2nett3ajE69piIEFp3RhIW6WAMO8Wdfpa5xIidhenCeic
	iWGR6AVuv129Y6QspGB9s34bp/EynMRdYo/Q82mQKxL5DgqkUy81Z/wU2yz51Ns7e
X-Gm-Gg: AeBDiethqNddrzijzpuEx+HUqgwSDiL2KrLyRSAvqNPgJRw0BsQL2NnOB39zjRx81+B
	XC9ClrCgAHFWows5u8M0tvEtItIRiwiWE1FAym/N4uyb9yrKRthBT57c+bMzKmEQ8mPNwqmj5wo
	8vGvIYKxxIQ7iGZFtljuVM4IbZ1ugshufcLQJrvSJ9DfzYb/Ifzh5ELvPXknCyMptFtpoy3bP+7
	+0ezg3eun091JhVxAPsny9j+UAJHtGV9fdF2waw51ZV4rJYnVtYLifYqgqOSDOg6b/rdwcb0VPF
	fy4/+DoS7SPukM3qwCLa5y8SDaXM8L4nU0YkOLXp+qMr9I8plQjoaXoRBrtJp7NQ3UVN4db/OvM
	O8cCu8DR296BdApaSpmOuRrEJGCPR0mXVmQR9RYyup7z3dQw5let4OT3XENf0Y3hWGtDULh1dY6
	IESKYAxWyFz2seLQ==
X-Received: by 2002:a05:6102:374d:b0:5f8:d54c:18c9 with SMTP id ada2fe7eead31-612b753d417mr1597224137.3.1776346478879;
        Thu, 16 Apr 2026 06:34:38 -0700 (PDT)
X-Received: by 2002:a05:6102:374d:b0:5f8:d54c:18c9 with SMTP id ada2fe7eead31-612b753d417mr1597187137.3.1776346478446;
        Thu, 16 Apr 2026 06:34:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1773c3826sm167011966b.33.2026.04.16.06.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 06:34:37 -0700 (PDT)
Message-ID: <ba6b62ee-3e75-4437-95d0-3604583f2cbf@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 15:34:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sdm632: Correct power domains
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
 <20260327-sdm632-rpmpd-v1-7-6098dc997d66@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-sdm632-rpmpd-v1-7-6098dc997d66@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LCv6Tx-h21okeLxdGUtmwdE9jzWy7Fgn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEyOSBTYWx0ZWRfXyopQyzMyUaGu
 ftdQM9+EQHrb1xJ6o1KiambqF+tEGHUNV17RWCG6yOI/btEiN0WGnuLh7mifM2S0atvCR8em1bC
 w4lac+prlFaortBR/tBUK5ML/9MDYOTr6V6LiptNO6WiZfq7C6J+vilqd6inS2x+PUg4ycQBgbA
 NhRrLJ8jOXi74Cm2uLUADXk/AaJ/sRSWd7QTIlmBL9AK1GYk7t0m4pXgULys9UvA0w2XQpYvKw9
 0AtH6ZZRusgU3RIMsR/sqHf44reQ5K8UA1/mCh1aNbPDBAnCF6nU0G0ppxssNA6Yza6rwpIFXXH
 qOq+GAPkgXS8zrODOhOtjDdBD66SnB9YdBCiue1GJ2r0hb1Frwd7vuRmdSysgcVxELVEVG8YIKf
 jtjvJn4A9CT4Drs+HdeyfKRjCC0zVkLHTVHiQdYQtnqGRcqvPl0BVcBD7b/hYlxgNRzseT5p1Gf
 TtpAOqQJiNWDDeX2zeg==
X-Authority-Analysis: v=2.4 cv=H47rBeYi c=1 sm=1 tr=0 ts=69e0e56f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=h7EPssPr47kph8xlZiMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: LCv6Tx-h21okeLxdGUtmwdE9jzWy7Fgn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160129

On 3/27/26 9:11 PM, Barnabás Czémán wrote:
> SDM632 is using different pm domains from MSM8953 override them
> where it is needed.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm632.dtsi | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm632.dtsi b/arch/arm64/boot/dts/qcom/sdm632.dtsi
> index 40d86d91b67f..b1dbcffd51b6 100644
> --- a/arch/arm64/boot/dts/qcom/sdm632.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm632.dtsi
> @@ -87,3 +87,34 @@ opp-725000000 {
>  		required-opps = <&rpmpd_opp_turbo>;
>  	};
>  };
> +
> +&lpass {
> +	power-domains = <&rpmpd SDM632_VDDCX>;
> +	power-domain-names = "cx";
> +};
> +
> +&mpss {
> +	compatible = "qcom,sdm632-mss-pil";
> +	power-domains = <&rpmpd SDM632_VDDCX>,
> +			<&rpmpd SDM632_VDDMX>,
> +			<&rpmpd SDM632_VDDMD>;
> +	power-domain-names = "cx", "mx", "mss";

nit: one a line would be perfect

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
