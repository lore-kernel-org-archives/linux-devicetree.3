Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862166;
	b=Vi9S6Wde3ArvU7g8W4CLxHxOBNTgO00GiLD+yFtyJnEkIgDqfogJKMq8wdWevoSmnfFd
	 95RLRMG2S6QFQmhLcOkGyVptFR1tLOnVsvI/ed8DjkkMqfpynPbRkY/dqjs+3Z5oVqNMn
	 uESQZhk0kbodZSBrtfPvcKDlv8Ct1gDI9sq0H6lE1JQILXWLcO7MSgNKjMac8u6uXTU/m
	 VvF/4r+MTbapFKh92stCwEh22OoKTm5jFVGt5hfXNODqLFt8uUpLknjXTx8236Lh96yuv
	 U0dNPdZmURDLcjnzNnhlLwgvSpTYQ7vtkIGZi/zHWya+qvtyk5fEAyT9c8Xncd8qgIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862166;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Up0BSC+gGD3bqKoHXKxOsgvvCI5jPh02tY5XUosqXqc=;
	b=H0NqdwunVgTMsQijjCI7s4yX2R92EzTimCmLBdS155vGjbbt/fsJidWpq97v/kY+02gz
	 n3H6wwDMrecRbTKFPjhdpHX5x3tp9tUqGLv54bD/tB8gzwD2J5LE347/aK7NiGiF8Al1s
	 dFpjGKQSe3XZGfdv8fE/olhcrVYaf5Fj2i2LeLrpSLSfMGDZXQ/LmI0NDDrdaJAvt4pLn
	 zuhFkPrnOlUM90vg/Jr+i0oSBQR+TPLRTZc0Rd/YP7xrgtcFDLKDg8ejYll3PdDQ/4yku
	 6zE9zqPkUIbSU1qaQfT2lxTLskxdGeCYZMk1ir/fS8gDiH1jOTerRdjLSoxTGGix8Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HaTRmN9m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Yd/ZOfK6";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6217A606A32C
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 07:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6217A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HaTRmN9m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yd/ZOfK6
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56U5SJ565147
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 07:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Up0BSC+gGD3bqKoHXKxOsgvvCI5jPh02tY5XUosqXqc=; b=HaTRmN9mgQns1ziY
	GryUaCo1bcgp/beaRFEQbm9a8noMrVMpnKC5MuZk4ymkHzvKnsr1XLOXM8vfwUkS
	REKlpJPVjr/FPDNd7yJ/nos60C9u9E7Lco6GL452/3R9I+owJuJq21Mf5SL3oAu0
	/rlqSBERS7z/HFlQdedMnZjxFg6hiLzC/dJc8MmNgUlbvsmeFpaf6e+fwrphUevL
	VX5npKNn6WkEjOSWDamFEiSvukAic5BT3bByKkdeAKC6CLbvIV2yjXj1zEwWQP5X
	LacGlIqGgbYOErOKOdFKv/O1MHwUlnJVlDlzHywmT03l5YzZL7QfYdU9OHA0fSZO
	8hfXwA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaq8ekh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 07:02:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eac6e96bd4so25437225ad.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 23:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793862163; x=1794466963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Up0BSC+gGD3bqKoHXKxOsgvvCI5jPh02tY5XUosqXqc=;
        b=Yd/ZOfK6xMElJxhS8L4XWRmVE4grAzi1CFKlprDeJBuZMxDM7oa0Z7BgcCuIvWbH7e
         xArh5+hZyD6YcGuncSq6cBthmvz22tgPfWW9yeS0JwciVfijGPY47XrKu2QaDK6rIDOR
         YBN/NHPSU4JBJzpo0jXQh3SI9UbDr4Om+aaRZeovVxqR88KymKKTzRCDn8iDD8hYRDSW
         6fgM+ZJblEfKSQIH7DU9tv5FKWKWTcjVM/XtKJiZ67q/sLC0Xo9nMgtR5JG6CB9hkZ9d
         a7Un30JfGc9uWlfugHCJafj6xsg3kV9VuL9XMsHYQoRQaIzeCAdsmYMyj7fL71dBS/q3
         lwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862163; x=1794466963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Up0BSC+gGD3bqKoHXKxOsgvvCI5jPh02tY5XUosqXqc=;
        b=gRnhvcF5uAiWerwJZ4LBVWa6l67DJM7CXk5eRsi9m372cTqupVXxBFDIYxdq/RcKQl
         US2ueIwzG+xD93sAsHjcJWcGpd/5zprpYfLrufS3sqWEgBkvN6bBMDaH596YjZLcHG2F
         VM09DdcKd//uXzthyzC8Sca0yVYQjjKVvsqgTc/bs/x1h4QfYrbZDVeK92lCOne7caI2
         MSQNmEZ2SnXkdbTfeVJcT1pq1YW9fvR6jZszGaaKFjZ1pIhZTO+I15txkBWYXyYr51h2
         qu7PfEaf+KQveEB1SNfPYESU/WffP2e46Df6sOMr0oiBG2sD4j1taocDs0bo1vNoddHZ
         4r6g==
X-Forwarded-Encrypted: i=1; AKwUvByEoQj3QPlyPJerOidNA3fjXsHoQDT/blt627jSqo7Qv0ZIeSr41a6gOLGNi04/t0P201EL4W4LZotu@vger.kernel.org
X-Gm-Message-State: APuU4Z/9attzQQWMKkBqJ7ba7JKtRHulEcJVQ9OyB0kF3zLwX6FQkPyw
	eViJEJEycEy3DezwbAnQ9+ZuzN69akFUldoGNx5n0gwAwY0ISSj3coEH5Itfn7coXcgIpBC8Ij0
	N/wcIiEtF/mvm9hqxGMgMTHvwWWm3xQKY0WqhkeNWsMY6LekbmDValOVj7HQ5sue0
X-Gm-Gg: AYBFou1+TOhXkgpFN04tZQMzCM55KHntxGgTv2zKTxQt3RXQVEBxNT4X3kM5qYoSQyx
	Qd0p2QjGHx5MYsmCfxwpKtr8Y9aCuWFIrSm8sRoC/8CXeG7pYdcmHwklv72DndMLGHgbLXm20+X
	sfMRBb7QMBBCLP/NIt1Fw9tVxeHAq0BidGVrPckUvlCUhdCSaw2smiv49SHmvcnKXZUjDEU9cWI
	Q87CdbFV4DOzZAIy4DhsOGxw5wpyZD4tc7DsZU5OTToPos/oXvn5+NWAseQOjdFo7cOZkeAkW8X
	6GeIbm4jYW8k3OkQjyOAQrGsBjcX1pfvrz7Y5SnaO99nyCKhR4tXd+4LVJwpIqwtJ6dGAhgXEl+
	1DfFiwKnB3fqcriU9InU/Pm4hbCsUmbHdsvK7FPwkHHPKbLAh/Hslo2kwUB1RAXLQUQvxMZcSeB
	ouoPAgS2SUh/23rejaBJ9gbZFVJ4lsatR0HBwx1aVL3oHKfWz1l3cLyszz2EB+uXgRYMw=
X-Received: by 2002:a17:903:1c1:b0:2e5:98d7:8202 with SMTP id d9443c01a7336-2eb364941e6mr160055725ad.13.1793862162897;
        Wed, 04 Nov 2026 23:02:42 -0800 (PST)
X-Received: by 2002:a17:903:1c1:b0:2e5:98d7:8202 with SMTP id d9443c01a7336-2eb364941e6mr160055495ad.13.1793862162370;
        Wed, 04 Nov 2026 23:02:42 -0800 (PST)
Received: from [10.79.117.66] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe1e5fsm14061475ad.23.2026.11.04.23.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 23:02:41 -0800 (PST)
Message-ID: <649f57c9-b1ff-4b59-8be8-a701bf393cc8@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 12:32:36 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
 <20260929-kuno-soc-support-v7-2-530f62dc4020@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260929-kuno-soc-support-v7-2-530f62dc4020@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: v5z8XzEnzJbASHdowR158jKseoZkaohl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAyNyBTYWx0ZWRfX6F/ec8cC08+h
 DNEvJwEPoeOxATL5TKwdV5K2nozud1MB7slR72rptTy8IjhNkje7xg/lOXeif/pEAOeruNoTmHF
 8PGcfLl3OtuFyF02TnFc73AtYpngQOE=
X-Proofpoint-ORIG-GUID: v5z8XzEnzJbASHdowR158jKseoZkaohl
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aec2a13 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=RjJHtU_CfQutE43OvKQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAyNyBTYWx0ZWRfX3XnbU94j1PMI
 9YJPQzEFkpX1RCtVAq8SxmrwDKs6S9aJPxr5ybCzf/GU+Dgnp5MvViZ0dWS+lkRn39e8zXbrIWB
 YzPsw9CFk54Fs5/hDBmlMrp4Ex3CNwYMUafi2bvGCm/0ImPGKqK+tq3kbrbJBi1L63ZY/0ajYdO
 Y8d0aEtrX5VxA7daQRdXFUGNn9mOgdziNyGpqc2McD64NzZtX3SxaOPYyhjcuMoFyxCJXSPtIl4
 OftYPZVxhR+Kc3/iWSVSX26JFPNIE+kAxhpAZCxEHJHoEgzlwRjO2I2uNNC+l77mGpzx/Uxacgl
 RqoK2EfmXft+XVgueopCGw8lOQooa5AYW6zEgZ75xtUKlGimp+audEpeVlvP86rRcVnYgWqFCnG
 Fov9paLKmadMaeb4xel3VaKuZdUP212VKIqY1M7t38/aohKmoiYvRm/6V8n8S2/bIblL3Fkw0E1
 mAVFdgQTWbfluXLXnvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050027


On 9/29/2026 3:18 PM, Hardeep Sharma wrote:
> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
>
> Peripherals included in this initial set:
>    - Single Cortex-A7 CPU with PSCI idle states
>    - RPMh RSC with clock controller, power domains, and BCM voter
>    - GCC (Global Clock Controller)
>    - TLMM pin controller (110 GPIOs)
>    - Interconnect (aggre-noc, cnoc-main)
>    - GENI UART console (QUP SE3)
>    - SMEM, hardware spinlocks (TCSR mutex)
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>   arch/arm/boot/dts/qcom/Makefile          |   1 +
>   arch/arm/boot/dts/qcom/qcom-kuno-idp.dts |  25 ++
>   arch/arm/boot/dts/qcom/qcom-kuno.dtsi    | 444 +++++++++++++++++++++++++++++++
>   3 files changed, 470 insertions(+)
>
> diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
> index 026d5b682b2b..7327a7b8180e 100644
> --- a/arch/arm/boot/dts/qcom/Makefile
> +++ b/arch/arm/boot/dts/qcom/Makefile
> @@ -26,6 +26,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>   	qcom-ipq4019-ap.dk07.1-c2.dtb \
>   	qcom-ipq8064-ap148.dtb \
>   	qcom-ipq8064-rb3011.dtb \
> +	qcom-kuno-idp.dtb \
>   	qcom-msm8226-microsoft-dempsey.dtb \
>   	qcom-msm8226-microsoft-makepeace.dtb \
>   	qcom-msm8226-microsoft-moneypenny.dtb \
> diff --git a/arch/arm/boot/dts/qcom/qcom-kuno-idp.dts b/arch/arm/boot/dts/qcom/qcom-kuno-idp.dts
> new file mode 100644
> index 000000000000..c2f6650d3fe6
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/qcom-kuno-idp.dts
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +
> +#include "qcom-kuno.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. Kuno IDP";
> +	compatible = "qcom,kuno-idp", "qcom,kuno";
> +
> +	aliases {
> +		serial0 = &uart3;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&uart3 {
> +	status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/qcom/qcom-kuno.dtsi b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
> new file mode 100644
> index 000000000000..9b111525e12b
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
> @@ -0,0 +1,444 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <dt-bindings/clock/qcom,kuno-gcc.h>
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/power/qcom,rpmhpd.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	interrupt-parent = <&intc>;
> +
> +	clocks {
> +		xo_board: xo-board {
> +			compatible = "fixed-clock";
> +			clock-frequency = <38400000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +			#clock-cells = <0>;
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +			cpu-idle-states = <&little_cpu_sleep_0>,
> +					  <&little_cpu_sleep_1>;
> +			power-domains = <&cpu_pd0>;
> +			power-domain-names = "psci";
> +		};
> +
> +		idle-states {
> +			entry-method = "psci";
> +
> +			little_cpu_sleep_0: cpu-sleep-0 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "standalone-pc";
> +				entry-latency-us = <350>;
> +				exit-latency-us = <450>;
> +				min-residency-us = <1774>;
> +				arm,psci-suspend-param = <0x40000003>;
> +				local-timer-stop;
> +			};
> +
> +			little_cpu_sleep_1: cpu-sleep-1 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "pc";
> +				entry-latency-us = <550>;
> +				exit-latency-us = <750>;
> +				min-residency-us = <6700>;
> +				arm,psci-suspend-param = <0x40000004>;
> +				local-timer-stop;
> +			};
> +		};
> +
> +		domain-idle-states {
> +			cluster_sleep_0: cluster-sleep-0 {
> +				compatible = "domain-idle-state";
> +				idle-state-name = "cx-min";
> +				entry-latency-us = <750>;
> +				exit-latency-us = <2350>;
> +				min-residency-us = <9144>;
> +				arm,psci-suspend-param = <0x40000008>;
> +			};
> +		};
> +	};
> +
> +	firmware {
> +		scm {
> +			compatible = "qcom,scm-kuno", "qcom,scm";
> +		};
> +	};
> +
> +	memory {
> +		device_type = "memory";
> +		/* Bootloader will fill base and size */
> +		reg = <0x0 0x0>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +
> +		cpu_pd0: power-domain-cpu0 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&cluster_pd>;
> +		};
> +
> +		cluster_pd: power-domain-cluster {
> +			#power-domain-cells = <0>;
> +			domain-idle-states = <&cluster_sleep_0>;
> +		};
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		quickboot@82100000 {
> +			reg = <0x82100000 0x100000>;
> +			no-map;
> +		};
> +
> +		aop-image@82200000 {
> +			reg = <0x82200000 0x20000>;
> +			no-map;
> +		};
> +
> +		aop-cmd-db@82220000 {
> +			compatible = "qcom,cmd-db";
> +			reg = <0x82220000 0x20000>;
> +			no-map;
> +		};
> +
> +		aop-config@82240000 {
> +			reg = <0x82240000 0x20000>;
> +			no-map;
> +		};
> +
> +		uefi-log@82260000 {
> +			reg = <0x82260000 0x10000>;
> +			no-map;
> +		};
> +
> +		ipa-fw@82270000 {
> +			reg = <0x82270000 0x10000>;
> +			no-map;
> +		};
> +
> +		smem@82280000 {
> +			compatible = "qcom,smem";
> +			reg = <0x82280000 0xc0000>;
> +			hwlocks = <&tcsr_mutex 3>;
> +			no-map;
> +		};
> +
> +		tme-crashdump@82340000 {
> +			reg = <0x82340000 0x40000>;
> +			no-map;
> +		};
> +
> +		tme-log@82380000 {
> +			reg = <0x82380000 0x4000>;
> +			no-map;
> +		};
> +
> +		access-control-db@82384000 {
> +			reg = <0x82384000 0x40000>;
> +			no-map;
> +		};
> +
> +		secdata@823c4000 {
> +			reg = <0x823c4000 0x1000>;
> +			no-map;
> +		};
> +
> +		modem-efs@823c5000 {
> +			reg = <0x823c5000 0x10000>;
> +			no-map;
> +		};
> +
> +		cpucp-fw@82400000 {
> +			reg = <0x82400000 0x80000>;
> +			no-map;
> +		};
> +
> +		xbl-dt-log@824c0000 {
> +			reg = <0x824c0000 0x20000>;
> +			no-map;
> +		};
> +
> +		qtee@82500000 {
> +			reg = <0x82500000 0x180000>;
> +			no-map;
> +		};
> +
> +		trusted-apps@82680000 {
> +			reg = <0x82680000 0x600000>;
> +			no-map;
> +		};
> +
> +		mpss-audio@82e00000 {
> +			reg = <0x82e00000 0x5a00000>;
> +			no-map;
> +		};
> +	};
> +
> +	soc: soc {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		gcc: clock-controller@80000 {
> +			compatible = "qcom,kuno-gcc";
> +			reg = <0x00080000 0x1f4200>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> +				 <&sleep_clk>,
> +				 <0>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		qup0: geniqup@9c0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0x009c0000 0x2000>;
> +			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
> +				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
> +			clock-names = "m-ahb", "s-ahb";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			uart3: serial@98c000 {
> +				compatible = "qcom,geni-debug-uart";
> +				reg = <0x0098c000 0x4000>;
> +				interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
> +				clock-names = "se";
> +				pinctrl-0 = <&uart_console_active>;
> +				pinctrl-1 = <&uart_console_sleep>;
> +				pinctrl-names = "default", "sleep";
> +
> +				status = "disabled";
> +			};
> +		};
> +
> +		cnoc_main: interconnect@1580000 {
> +			compatible = "qcom,kuno-cnoc-main";
> +			reg = <0x01580000 0x19200>;
> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		aggre_noc: interconnect@1640000 {
> +			compatible = "qcom,kuno-aggre-noc";
> +			reg = <0x01640000 0x33400>;
> +			clocks = <&gcc GCC_SYS_NOC_USB_SF_AXI_CLK>,
> +				 <&rpmhcc RPMH_IPA_CLK>;
> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		tcsr_mutex: hwlock@1f40000 {
> +			compatible = "qcom,tcsr-mutex";
> +			reg = <0x01f40000 0x40000>;
> +			#hwlock-cells = <1>;
> +		};
> +
> +		pdc: interrupt-controller@b220000 {
> +			compatible = "qcom,kuno-pdc", "qcom,pdc";
> +			reg = <0x0b220000 0x10000>;
> +			qcom,pdc-ranges = <1 148 6>,
> +					  <9 156 2>,
> +					  <17 164 7>,
> +					  <26 173 1>,
> +					  <29 176 1>,
> +					  <40 187 1>,
> +					  <46 193 6>,
> +					  <52 266 32>,
> +					  <84 249 1>,
> +					  <85 256 1>,
> +					  <86 315 4>,
> +					  <90 43 1>,
> +					  <91 45 1>,
> +					  <92 154 2>,
> +					  <94 158 6>,
> +					  <100 171 2>,
> +					  <102 174 1>,
> +					  <103 23 7>,
> +					  <110 147 1>,
> +					  <111 31 4>,
> +					  <115 175 1>,
> +					  <116 177 10>,
> +					  <126 188 5>;
> +			#interrupt-cells = <2>;
> +			interrupt-parent = <&intc>;
> +			interrupt-controller;
> +		};
> +
> +		restart@c264000 {
> +			compatible = "qcom,pshold";
> +			reg = <0x0c264000 0x1000>;
> +		};
> +
> +		tlmm: pinctrl@f000000 {
> +			compatible = "qcom,kuno-tlmm";
> +			reg = <0x0f000000 0x400000>;
> +			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&tlmm 0 0 110>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			wakeup-parent = <&pdc>;
> +
> +			uart_console_active: uart-console-active-state {
> +				pins = "gpio8", "gpio9";
> +				function = "qup0_se3_mira";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			uart_console_sleep: uart-console-sleep-state {
> +				pins = "gpio8", "gpio9";
> +				function = "gpio";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +		};
> +
> +		intc: interrupt-controller@17000000 {
> +			compatible = "qcom,msm-qgic2";
> +			reg = <0x17000000 0x1000>,
> +			      <0x17002000 0x1000>;
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +		};
> +
> +		timer@17020000 {
> +			compatible = "arm,armv7-timer-mem";
> +			reg = <0x17020000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			frame@17021000 {
> +				reg = <0x17021000 0x1000>,
> +				      <0x17022000 0x1000>;
> +				frame-number = <0>;
> +				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +		};
> +
> +		apps_rsc: rsc@17040000 {
> +			compatible = "qcom,rpmh-rsc";
> +			reg = <0x17040000 0x10000>,
> +			      <0x17050000 0x10000>,
> +			      <0x17060000 0x10000>;
> +			reg-names = "drv-0",
> +				    "drv-1",
> +				    "drv-2";
> +			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +				     /* drv-1: placeholder (unused) */
> +				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> +			qcom,tcs-offset = <0xd00>;
> +			qcom,drv-id = <2>;
> +			qcom,tcs-config = <ACTIVE_TCS 2>,
> +					  <SLEEP_TCS 3>,
> +					  <WAKE_TCS 3>,
> +					  <CONTROL_TCS 1>;
> +			power-domains = <&cluster_pd>;
> +
> +			rpmhcc: clock-controller {
> +				compatible = "qcom,kuno-rpmh-clk";
> +				clocks = <&xo_board>;
> +				clock-names = "xo";
> +				#clock-cells = <1>;
> +			};
> +
> +			rpmhpd: power-controller {
> +				compatible = "qcom,kuno-rpmhpd";
> +				#power-domain-cells = <1>;
> +				operating-points-v2 = <&rpmhpd_opp_table>;
> +
> +				rpmhpd_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					rpmhpd_opp_ret: opp1 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
> +					};
> +
> +					rpmhpd_opp_min_svs: opp2 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +					};
> +
> +					rpmhpd_opp_low_svs: opp3 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +					};
> +
> +					rpmhpd_opp_svs: opp4 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +					};
> +
> +					rpmhpd_opp_svs_l1: opp5 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +					};
> +
> +					rpmhpd_opp_nom: opp6 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +					};
> +
> +					rpmhpd_opp_nom_l1: opp7 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +					};
> +
> +					rpmhpd_opp_nom_l2: opp8 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
> +					};
> +
> +					rpmhpd_opp_turbo: opp9 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +					};
> +
> +					rpmhpd_opp_turbo_l1: opp10 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +					};
> +				};
> +			};
> +
> +			apps_bcm_voter: bcm-voter {
> +				compatible = "qcom,bcm-voter";
> +			};
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv7-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
> +	};
> +};


Hi Bjorn

could you please pick this patch ?

Best Wishes

Hardeep Sharma

