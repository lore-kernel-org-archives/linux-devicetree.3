Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C763793DD
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 12:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780317624; cv=none; b=Ds6HxhCo3SgNJYyAuQ9JfWLxYf6ium0Uep0UQT/CmiWEddveWQZL8ogHrGKSGnl264u2pndmYjobyNMWp8jvYy+Kw2EekO6gkKZhRDTnXr4Gj5AvHU6EzUv1bPWh+iAkuxmhn8tPaxUHCDDneiCiMj46haQbkOcl+n6/C8a068Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780317624; c=relaxed/simple;
	bh=+4xvN6jPzRNsEI6bBJ+FxzqSF1/BI4dtW8HSpmcwHwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HHSxOr8rDdK8OtQ7JbfgFaFm4H8WtcK7D5dJZ9lM7XmzsEQ9fpGlqUOe+/QDdT34cooxSJcgeIOHWjiZC7u2mUJJuKVpqugdMGregakMANQTMzRsEq6w0UrcubygXYgIhOeMUDbG5YugtqaHfIGAfutnDmt2liXPDl2PIEjyQAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xfkdz/iq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/ISekY7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xfkdz/iq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/ISekY7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518dVDv3563643
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 12:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g/yD0wV2bl/lxzrc2fW+99SQslSGMVWbU97D32Jk++g=; b=Xfkdz/iqeyD9u/6o
	9+9W8V0cJ15P0IHtSF514Ktkgs/HcqtNEhXKQ5x7GhajXuLtwS2DWmFddDEIl9oG
	qmq9NxnEaAkgmyFo8ZlzjFEKNb/otCtX2aAPiA6tPpIfCUq0AG6ePDOFyyBd7KJs
	yd6c+TojxPThAApHR/e5x0bAPL8VALxekMgB6FNz1EfjM24WCYG7l/vmHRrTbcE+
	Q+linwEYAjK8U+NZTWcNOliXZdqJzggWy4HF2vJPlcXbrs/+/qOP2dvhekL77ORG
	rHEaDVHn0k/h/Q3Yu1VoWj2qOTUAa/wSQZVSZBXG/ggfkW+po2WJizFPuKWf1zvr
	CPrlIw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6rxs031-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 12:40:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423899d6f8so1083812b3a.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 05:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780317619; x=1780922419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g/yD0wV2bl/lxzrc2fW+99SQslSGMVWbU97D32Jk++g=;
        b=P/ISekY7ylZOnr6GZbe5kqHtjXMXPHz5+141bAwpAq3hkqEHjMmu4zeCESASodUiqA
         u0sPkMZY8HiLyhJ9gwPpfPT5oYsFaS5wtgnWR1dTz4S6GxYcbA1VzhY0z6/2VDvoW61j
         d+QoWCcG4oNjKtAOS4qT8splwF2/7Vc1X9vqd2LYbyPnwKSY/68JLutkwQ9R/rnue1ns
         45ATcWeQtzTOrIdOrUgA9p849u0wvRmFGGRNk/b4pwjYe6OkpRxR22FupCPVGe7dXfDk
         yIWxKTbiJJQ/ivdMxjJWnDBrnJALxVMH/BZYABIBzey2JA++r6qmf82nfKS2LK8qxz/d
         JBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780317619; x=1780922419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/yD0wV2bl/lxzrc2fW+99SQslSGMVWbU97D32Jk++g=;
        b=ff5AMywc63Unak4IrilfjQL8EdKzp/b9m2seDSLJvtkfjcag2FoOvKo559Ie3oZlgZ
         5sMjUbboAwWR1k7rzaUKZwJ+X7L1bfirFgnN6/cSOBMwvfJDdkDqsKIA0mmGqYsh9158
         dSwMp874IlxIujlHIb0QAhrcJuh4hyRnguH5S0yo2UgaZRFqvoa6qybzeJfbBKK4cFX1
         oDx3EnXTow1JirPZtMOkTrYMhZ6pmnMJOO/HPmtjet4jy4hljsn8YyD2WEvxNLdgPODM
         Ov1+Phhpato9pM/YyBYPwSc+teKaf+XlQfnLpc1BFNNc0YO8ch6etjAynfK4KCA3WoSs
         UC4g==
X-Forwarded-Encrypted: i=1; AFNElJ+4z+1FOt6k2DPq1YZzLQQUhIdgGkTeVBfUyaEO5f1qx7+ZceHhPLUSTzvV7Y3yWtJ+4K/1DiQkwmVO@vger.kernel.org
X-Gm-Message-State: AOJu0YwgskERfkWXOCDZ+ostCMoqhEayiYQZ3Ta8L3ydTxK0fAIj5U3T
	5sl3viazGzs6YldM4FPzJBm6qKX5EOfOJ7MKf3x0C9OMjDvLD9QUiwxKM9fAAug4zSOu7WE/qys
	7hTnWKfRhRJ4RRm9gXFxOCVKq+52ueRzVPoNbYGATp6uEOVy5QO1PHkuRcgC8IRox
X-Gm-Gg: Acq92OFwNbJTcMShvBayHleyq2hv2yPFeJ4ADOaDFBH+WjRvYHgzixWiICnmX4XckDH
	hCYJoHX8QM65qZ0xxTMHKeDwnpBFjlZx07ffzr4RwzzHDoPkpiDpK3rDejP89yz9gTxXNnvpVBA
	cxxugWh1tkcubaRwJm65g4p6ICYqEGpjI3/sQBuyo6dZnhoImjCfHl78IShmgaZBBJ739YIglgx
	PMcIxfkngp/HvkQuCHnjr2tSv+ywYHTkTchl0NKvwkIe9bENcWRbgr40v9/ITjvfCZ4X8EcEOb2
	Bkb/I8Z66iSVfxjiIXtSszu0iRnLoVMGHt0RQellOsq48WQsG00cUZ911WPB4nl7wHWxCbbUc/A
	xK79f/noaYF56nn1R0I3R3I+OSts7/c+SwRfQOgS8bMKZyK5yN5a5YRIH2cXl
X-Received: by 2002:a05:6a00:987:b0:82f:4f67:1ff6 with SMTP id d2e1a72fcca58-8422534302fmr10319758b3a.4.1780317619419;
        Mon, 01 Jun 2026 05:40:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:987:b0:82f:4f67:1ff6 with SMTP id d2e1a72fcca58-8422534302fmr10319723b3a.4.1780317618859;
        Mon, 01 Jun 2026 05:40:18 -0700 (PDT)
Received: from [10.219.56.230] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842222e2394sm8411523b3a.2.2026.06.01.05.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 05:40:18 -0700 (PDT)
Message-ID: <db343bab-c274-437b-8042-3508b85cdc2b@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 18:10:12 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] arm64: dts: qcom: Add QUPv3 configuration for
 Shikra
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Xueyao An <xueyao.an@oss.qualcomm.com>
References: <20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com>
 <20260530-shikra-dt-m1-v2-3-6bb581035d13@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260530-shikra-dt-m1-v2-3-6bb581035d13@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: W7OGIx61SD2v23ja-vvxFvxHqRq17j_X
X-Authority-Analysis: v=2.4 cv=dsfrzVg4 c=1 sm=1 tr=0 ts=6a1d7db4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5iICPckp_3-IrkfDOHUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEyNiBTYWx0ZWRfXzX0/C1Eh8O4D
 xrbLfmJhCZTyTndAIFwJMM0TWyykXQmJhcQmOvU6Mg3P2qWnAldz6zkqFVGXSI4hQvkkax1vRG4
 aNvz04bTRwat0BH9tQVlHU8sChUH9eNbAx1HlwPEta9IopIgQbISfiYDhls3Ef61vSi/x1J7yPR
 ljSsAJTFesXO2EcXe2bl1kn9SODNFgf5kX55aLLVXMGlbqj5IC+J0xA1tZlMMtItt3tPR2gdx+7
 /4HH8jUIFKE+b/eyM7olvLbBTbY5e8qD1V3NjlSwf01+Vmw9oi5qvvuuRUEFaDF8XJ09UdXYkLb
 5AwYjyboFlKdTvJxIPr0FMc0HZcbZ1F7axysVdGW5TbdUh/gy358/N0vivI4SsBThQ5R+CqaZfl
 Fl5jpRFJWu+EuAzALlxPVtZsv66Mdt6kfnhj1fzJzXwx3RKbP+RRHHxEBHM9gW7f/liEPT+tsTd
 QE8lnWa0gUWdIOp4ckw==
X-Proofpoint-ORIG-GUID: W7OGIx61SD2v23ja-vvxFvxHqRq17j_X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010126

On 5/30/2026 11:57 PM, Komal Bajaj wrote:
> From: Xueyao An <xueyao.an@oss.qualcomm.com>
>
> Add device tree support for QUPv3 serial engine protocols on Shikra.
> Shikra has 10 QUP serial engines under a single QUP wrapper, all with
> support of GPI DMA engines.
>
> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/shikra.dtsi | 951 +++++++++++++++++++++++++++++++++++
>   1 file changed, 951 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index a4334d99c1f3..2751b4f89678 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -6,6 +6,7 @@
>   #include <dt-bindings/clock/qcom,rpmcc.h>
>   #include <dt-bindings/clock/qcom,shikra-gcc.h>
>   #include <dt-bindings/interconnect/qcom,icc.h>
> +#include <dt-bindings/dma/qcom-gpi.h>
>   #include <dt-bindings/interconnect/qcom,rpm-icc.h>
>   #include <dt-bindings/interconnect/qcom,shikra.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -348,6 +349,161 @@ tlmm: pinctrl@500000 {
>   			gpio-ranges = <&tlmm 0 0 165>;
>   			wakeup-parent = <&mpm>;
>   
> +			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
> +				/* SDA, SCL */
> +				pins = "gpio2", "gpio3";
> +				function = "qup0_se0";
> +				drive-strength = <2>;
> +				bias-pull-up;

[...]

>   
> +		gpi_dma0: dma-controller@4a00000 {
> +			compatible = "qcom,shikra-gpi-dma", "qcom,sm6350-gpi-dma";
> +			reg = <0x0 0x04a00000 0x0 0x60000>;
> +
> +			interrupts = <GIC_SPI 511 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 512 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 519 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 522 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 523 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 524 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 525 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 526 IRQ_TYPE_LEVEL_HIGH>;

Ignore this series.
Missed updating interrupt cells to 4. Will fix this in next revision.

Thanks
Komal

> +
> +			dma-channels = <16>;
> +			dma-channel-mask = <0xff>;
> +			#dma-cells = <3>;
> +

[...]

