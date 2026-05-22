Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325041A680A
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451904; cv=none; b=FSHjQIzmnKurIqNBiaMWqg14tPU8XwMPt4Jfu/IkCw0x1C/lRwxHeg2igu+2wj3zsobq4LczcGZ4YSZEPcV8uMVQzrNFCd6tyrH5ehF4C46tcKe1jXKWu2ezKZkJYw/XaxL1KsBpXZFKe6ogp5uo27aYWABQ8nfg6Oup3M4ZbEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451904; c=relaxed/simple;
	bh=3+IOP/mxJIPSboya/uDHb5AZreUEK9vbHDPE0fXIMjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WrG2wstxMPTdodqdxOeTlqKVljRMM9nttMiKjtAsk47SUdb7qIosO3ABhxzNZtsPF6VABsz0zM+HNXO2GM3RsGsVF9yMaAYwtq6bj22CyKE8/7LWpQeAZWMae9p+HqBcxSxN6H693xVTo/JLdnYsjTZQcPK0I4Whm/p1Axv0Dhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jC82rPya; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ll6VfQu/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jC82rPya";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ll6VfQu/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MAIoaJ1800948
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FTx2CPMC8PurFQGE95PsVAqqRdhK+3iRWo2FJQH+dKo=; b=jC82rPya1uOW75/c
	S3OiUI2bjZ87v4f0qfo/I/KdTkAtp+CjDHuFv/+mUm4cGlFbYSDuqQ6yMbCbBvBZ
	7zwCMgnQTt/9AMrYLgpUlPi9HJpYtoGqGGaOPIwa/Ct42FKIklkTAA1z4ZDGabpG
	EsSvNc36+nLAgA0yeimbfsm8hjqG1mwS7MS4Z1S4LpRU4zk35WJ/OTzT1RhoxgJ2
	tEgNhz6RpCkjTvwQoBC589ZMV7mmh16+IpUg19kYclYEDT26QXXQOCRBmO/k5zin
	7yR6IFd2tC4c0cgLbHsS2BeiC+x4dRAMNfeiICx3G9zcS/xN8gvDls2rK/6LOXQh
	evsUQQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean9g0bvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:11:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-914b79adeb6so17840185a.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 05:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779451901; x=1780056701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FTx2CPMC8PurFQGE95PsVAqqRdhK+3iRWo2FJQH+dKo=;
        b=Ll6VfQu/oNQ9JKiy+zvlQi5pIl/tpWSYPtJRzFqldOepvvFgFLFo2cF0W1yMOX8qCF
         cKwpwE1e/y84+P0MdCBLUH0EmbUbvXNfUaT7l3ED7fYTCTvaJeO0H7O4a9IBHAgLeQx0
         yisWkyC/jM6M1RyhBADYnr/BNz5WCDgEDcMTl+ZKc7NIQ1XX7CjMVXUwR/87yF5TjN6F
         HRNORXIzBBTML+ifG+dphYeeBKBPRUwVYAh4wIC5SUHECVYS922FAb45FVEA10+J7bn6
         Y07pe9GOz8i0fAcoLEUgpIzeQC30j8ryl45tX5mJMqNcCldMtg0dF58fj8+62Rk2gTr5
         0Mew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779451901; x=1780056701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FTx2CPMC8PurFQGE95PsVAqqRdhK+3iRWo2FJQH+dKo=;
        b=b32hJzXyA0frXIpnMA3UTeH9xbRamTO2TyN4286ghq+ZISzh1V21izPx5ldOBUWn9L
         vG4xRQWYy/z2nYwPSit9Ocjw48vEOXoa7YUuMY3pCVlEvumvOIibuzxo6fKnU8e/CLql
         X+Ti1M//neWtzrHn0/dgs0/6YvpZmNBfhESxlx0g7rKZKtCWiPzazr+NVpnPhdhPKJZn
         LXZpH5Xsxb0PoD3/tZ838XytFpvRDrkVxh/lzNHhY35jgvsPUFg10F6UkoKHaIKmJPvo
         Ei1q7frmW8Nnl6M2ydBVUWn3s+4c/o8BFgR4fgiYfreD/M0b2je08jFWXAZe25argkLx
         pcyg==
X-Forwarded-Encrypted: i=1; AFNElJ+ushqw5MAkPYyyuyuPuEuaoc+/0hGA8fnQcQrlNhvnUk7g/TGDoUWrD9DOEzuX3OQvOaXIXSztv899@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7uXZPZZYQ+NQ9AiYGZdsQGTFOr8vwDOxv6Z5a04mk80zEqKw5
	pZoMXOPEzCLzMwYis74ZxhrLh/n+uVdnKsxx33z4sBsME9z2bcUmnyxIWi6HqomGg6RIiYIpMGI
	q9E0EKt7zV7L+l23OD96CMBjQGgjQeXv1lLhtqiY5zmrvBwGQ6Eww4Lh4r6T7YqY+
X-Gm-Gg: Acq92OGR+v+03mMM3SfgKr/+TncJcU36WAXwO2XaM5eOMwPAg0qCmtvuFPl7NTrt2oS
	uaCEHINtTCQiF9sNGBLPWqIoXewHar1JT4weCCgWXEolNaQ/RMw5Kl1z/Qy0bMdCHxOdm8R2pmZ
	ADRFewOu3csdKteFcUvPewV9ch6nZLTBzhh//iCT4oxW3WyN4xRXAuryyhaVHqY2wdf3TJjc8qH
	JVsHcge/Ff77TvLCEc20cHBKcIfD3jcrXVE8vC3sx3c6og34eqUQ2+bAcHBcLEvySAxtt2I+Ehd
	6QvNf5igTwdYbncApfsK4zYElm68xxzH7TB4AAJQZVMK30z63kRuUkRi96wMINwLd4kgLacrmJ5
	XqGMf2IhPmRhBRpkTzTAf0bSeg83jE5it9T1M2iP7uAqlNQ==
X-Received: by 2002:a05:620a:6603:b0:911:e556:c7c5 with SMTP id af79cd13be357-914b4a3db29mr334116985a.8.1779451901509;
        Fri, 22 May 2026 05:11:41 -0700 (PDT)
X-Received: by 2002:a05:620a:6603:b0:911:e556:c7c5 with SMTP id af79cd13be357-914b4a3db29mr334114085a.8.1779451901167;
        Fri, 22 May 2026 05:11:41 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264dd50sm48019066b.4.2026.05.22.05.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:11:40 -0700 (PDT)
Message-ID: <786f5464-d151-4c49-81c3-62cbb0a148b5@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:11:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add Eliza CQS EVK board
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com>
 <20260519-eliza-dts-qcs-evk-v2-3-ad7303659d24@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-eliza-dts-qcs-evk-v2-3-ad7303659d24@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QDctpq2ox1kJ4_f3kUK3F94AGCbLx2aM
X-Authority-Analysis: v=2.4 cv=B/qJFutM c=1 sm=1 tr=0 ts=6a1047fe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=rhxeU_tLo1NPM2GSdgkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: QDctpq2ox1kJ4_f3kUK3F94AGCbLx2aM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyMiBTYWx0ZWRfX8ILKiTJlCibe
 O47WCL7/RFz6CV8nI2uLvkdZ4hygXPX2JorsrrfgKnn91HOnHDf8hDeDqaoPt5p6X/tIOLtaRtp
 lcBauIagYy2AROrdnNMZ4ko77zSd53/87zvf581IjjgHOvC3nZflYlrawDWtpr/o0V1aTiTjZzM
 p1j9AG6+OBvUGXac7kSSKuJuMdDggfiR5B4Wg3jP1DebMTld0vhZaUp/znJClngZPuK5hZI0zQx
 t9azRo6dGneITdpaCAOYvWmvUnpFleIFxhpqIdwxyTykXCa+B5qxPcn6eGW3AZKLBOd66A740e1
 CLvlysOYfPe6TR81s78/wooaqToe0kp0x1EMd+eBTN05H14G7BNYbkMD89RqPicPTraRO84BJtC
 H1QTT6H+PkLkkxBMVwZHtUh0B71EP1C13AAE93ge+JiKGKtIakruM/Y8wTaqBuV/Zs9+7rgRVmA
 pZfMYV5YNYAU7bIqK4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220122

On 5/19/26 6:09 PM, Abel Vesa wrote:
> The Eliza CQS EVK board combines the CQ7790S-based (Eliza) SoM with the
> common Eliza EVK base board, which provides connectors for different
> peripherals.
> 
> Add a common Eliza EVK dtsi for the base board bits that can be reused
> alongside other Eliza SoM variants. Then, add the final Eliza CQS EVK dts,
> including the CQS SoM and common EVK dtsi.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile          |  1 +
>  arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 20 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/eliza-evk.dtsi    | 20 ++++++++++++++++++++
>  3 files changed, 41 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 795cee4757ab..e244e808a647 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -14,6 +14,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
> diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
> new file mode 100644
> index 000000000000..d1cf08ce19d1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +
> +#include "eliza-cqs-som.dtsi"
> +#include "eliza-evk.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
> +	compatible = "qcom,eliza-cqs-evk", "qcom,eliza-cqs-som", "qcom,eliza";
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
> +			       <111 2>,  /* WCN UART1 */
> +			       <118 1>;  /* NFC Secure I/O */

Are these going to be specific to the CQS-EVK?

Otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
