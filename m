Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8418352F95
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120529; cv=none; b=jAHhML1izWzXCLrwO/lGwoqGTq9v1dMKwrZKevTDv/fmzcYbt5G+LtqWvk/inHoJVZK/60txUayM02O4C7jpZ9xF+B6DhqxBW9uohIx/4j4Rlxun+2J9jz8ofd7yYinLnNJsgBybuSbiVxiDyJSsRxXtt0iWtKAllCvkgB0L2rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120529; c=relaxed/simple;
	bh=ICHWJpAlkm6n6QwJfFmZ5UtiesPfPoqH/DXRRLMS9Og=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oH9NwU5VxF2QnzdJJORyaU0m+P5/69PwaIwkXXXad2ZW3eDJ8EUoR5asY04HJw5XN/MNI3/3jc5FMkzr2JWh+BJ95PGw/iL0sbD0/Wrn8USLf8BdAoCAiA3DQI6Al7aVXQxJvPsvlMsVqredTqLGPE2bIPoylut1VLYbgpQG8gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eFQxgu5e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xv4asWoZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eFQxgu5e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xv4asWoZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G29u4D3902249
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E9EZlze25ChU5gV3GfJ6FNyucDYA2Rt1XM4XFJ5+ogA=; b=eFQxgu5eKHJPVOjQ
	OTdVTDcoYpY1iQE9eG6RGkXq9ygwUTYcfnhaqGDFt7APCKm5J6vf87x1q6FolvRn
	mdB1X2PpojBuV/san0MtGjqTwD9rkUX3WQFeIZZGkDVsPEqT2A4K9/EANyYLIxOi
	RHdLVx/yHUApYhR5F/JSguWpLf1o+avcsQTvjVb0Hp5EMrB4k2V6UhZ2xjIliJUA
	M6beGFAMg3JGzxD0qQsYgyMd3hc8eBnodK/n12SAER+odaU/grxZuc4uSoG4KyBF
	SpRBbHvxh8uCBPEX5Tbpd1gIxjP9gumVjBq4X6AMJejjynKGd0k5yj+6dPQqKVsH
	/itPgA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sesrp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:15:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso12153068eec.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 20:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120525; x=1792725325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9EZlze25ChU5gV3GfJ6FNyucDYA2Rt1XM4XFJ5+ogA=;
        b=Xv4asWoZbOFpJA2D8M3nXvy7ra7t/tua9GALgDXAYwAsWDsNDnklF7jFXv+CcP339l
         Jr79FiCO8RSiKY88K8tkrYelsn+gzSXldJfijljcL2JMFMWjYLpvTatjlp2AkufBD5fK
         qNequTeG2YNxp4SZv6+FfAQPfcQ4UNyvangP8dEM90/KJS4vXMbzMl4JD2BpR63ou3LY
         UVWzhZCikFS4MChQ9ULh3o3U7YzZkyQz8vKdNwILOTrlJXzbjMQlfa9rt+I9MurlRGFe
         kEmM36QsH7Jv5JZNMqFpT3ES7rKJMF5FPtFL5MSIl/azbVszracWfqBAu46H4OYT/rRH
         bkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120525; x=1792725325;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9EZlze25ChU5gV3GfJ6FNyucDYA2Rt1XM4XFJ5+ogA=;
        b=YFzmDTkwA5ym76zf8e8fECDEUV/qhiLilcqcmdMqayK1/Hj/5TDoDK03S9vN41jTfj
         UBCqpL0H0KcrPU826lBEgNvquDU55Xa2gDk5rou7Q7Mr7nCemB2sRh7/8TDIS1iQuShK
         zGPqsp7QXalLKgVKCGxm/Z732DYrtm/KctGQ9ZmMpwwfMNVWxdLvJtDODjUr3U3wpreI
         Q0h5t295AkHPLeQIM6jgGvE8rybePgfELYd2GHzC+IPAg5taBlUKb+QyMfOkG/Cei8dJ
         uD8YQIIwkx4xAXLvnrD6CIxKoJpzOysmJ9VOFk5DMIPr4EoQ8JEyzJdLht7QO+b2RFU0
         zybQ==
X-Forwarded-Encrypted: i=1; AKwUvBzs85fq3QOa923NHqEhpNNc/OAznHWaeGywkHd5aBLpd/FoRhULRQ9I5dd28obiLXXS8KcvD/xqYQTt@vger.kernel.org
X-Gm-Message-State: AFq9FYLTT5/VNlWmAJhrPJZxBgmModHQ03i66QK0f45VwYrXNmXfz0oV
	0bV+uJu54FQk445ozMQFQ1D3+WPBB/DYrjqRbTTlAbN/dZb/l1Vxs9VC/+y0LmhpBN/cKLgmYDR
	LSye8emgvAX9nY+3iECxpeAsSY+KfwIgM+Iztb5xazFkEiC0lgDoBDocMMaTzDxK9
X-Gm-Gg: AYBFou3pHtruQIgCReSaY8OnCUAr1TUz7IlmuYYEVZIzRZ2Gi2LNhoMZWqZLf8vEOE1
	NBf6VGNshRgCbOx9HqAotK2BHnjk5ZGlK0h/4ewrhA5Rzy9uA8rk9iZjisO4s8xniH7AFm84beB
	t2vmBoYC7ZZO8HnRAuWkwIKNvmiPcyESqheB3r3TQhM6/knaG+0LrkQ7RbK/n6oiHv+Yr3hl6QO
	kP0zpZBBmetXBo+cuZj7cU+1iDeASrpdiuU6ZLbV2j5CeFUC44w3D1saBtRQlebM1+F6bRyusqQ
	mckj55r8qzN2mbyP8KuV07AyBwHFQvMrjxWpCAP5AnAOFzf6Lp36jRsZxBQqUJlUdz356x8ctjH
	xxUhGVrCHhv2C6uUTDZFpgIz0pRfY1w==
X-Received: by 2002:a05:693c:88d5:10b0:35e:5ca:e0df with SMTP id 5a478bee46e88-35e05cae713mr9104380eec.35.1792120525278;
        Thu, 15 Oct 2026 20:15:25 -0700 (PDT)
X-Received: by 2002:a05:693c:88d5:10b0:35e:5ca:e0df with SMTP id 5a478bee46e88-35e05cae713mr9104323eec.35.1792120524210;
        Thu, 15 Oct 2026 20:15:24 -0700 (PDT)
Received: from [192.168.50.84] ([76.176.60.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608297f4f7sm2228750eec.23.2026.10.15.20.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 20:15:23 -0700 (PDT)
Message-ID: <46432502-b2a1-4e7e-b3d9-447a3e239fd5@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 20:15:21 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: Add device tree for Lemans
 GearVM variant
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-6-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
In-Reply-To: <20261015023711.721837-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: N9-FhJ4mjI9dle96phjUpPd9pscu1UPo
X-Proofpoint-GUID: N9-FhJ4mjI9dle96phjUpPd9pscu1UPo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX903sQ99Jn0Ty
 s9ScaEUYrxoMsMFnY5fKokyWlBPB20yTTVf8AJpqeacmevnje5Ive970y2qrjOi/3IbPmeoUu7C
 Gbts/5XqEFeMMN+CCK7Yt9SDLjEfh2k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX2sMHJe+AHzVh
 2QCh4YdUpbuVTQYADSYS343oou2wjhT2Nn9iKjlgyWDgK2INynLRRWAvOMO2SKLBcMMAen2fZi+
 Pkt4MM7cpKjUvdbJTMzgmb83dC0TdUQxOZwk+Qrp8hc0HLv+PbNLGIgeE1pWSqDF0XE8qE1spc4
 0es//kTHiSqTCM+wqwc2lBqso1AkSlDYWBu0q7JDXQ29gC3/C0RFFJIahoqf1v8w4bf+URT1a94
 VtIaYw76F2CltyJzRzKWPMSBVxJfSvqgJwMB6ZRZf0rfzLOtgVpR7I6SKkjDT/3AMjYKyjsk5zb
 Qbi/0CRDAl0Id/4RohtenHELXf1o64C+tvCFC0i6OKXWJGfh4K7PBdBt1XVQ/dHGPHULPDJcsy3
 8zrLI9mpfYEgy0G26sBcyU9XC62NAmusaVuDYPakanOvhW0KAN4ERGbi2NCULr7WlKXB5hAMn9v
 Qcv/QiVeJSC0DaQMVmg==
X-Authority-Analysis: v=2.4 cv=Se1i5fRu c=1 sm=1 tr=0 ts=6ad196ce cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=0ISbvMpsx/t7i6H15JfNAA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=viPkIkau9hFIgBHGpf8A:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012



On 10/14/2026 7:37 PM, Shawn Guo wrote:
> Add lemans-gearvm.dtsi for Lemans GearVM variant (SA8255P) that utilizes
> firmware to configure platform resources such as clocks, interconnects
> and TLMM.
> Device drivers request these resources through the SCMI power, reset and
> performance protocols.  Assign each device driver a dedicated SCMI
> channel and Tx/Rx doorbells to support parallel resource requests and
> aggregation in the SCMI platform server.  Operate the SCMI server stack
> in an SMP-enabled VM using the Qualcomm SMC/HVC transport driver for
> communication.
> 
> Group resource operations to improve abstraction and reduce the number of
> SCMI requests.  Follow the SCMI-based resource management approach
> demonstrated by Qualcomm at Linaro Connect 2024 [1].
> 
> [1] https://resources.linaro.org/en/resource/wfnfEwBhRjLV1PEAJoDDte
> 
> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi | 3232 +++++++++++++++++++
>  1 file changed, 3232 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> new file mode 100644
> index 000000000000..4c155cbc7975
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> @@ -0,0 +1,3232 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include "lemans.dtsi"
> +
> +/delete-node/ &xbl_boot_mem;
> +/delete-node/ &pil_adsp_mem;
> +/delete-node/ &q6_adsp_dtb_mem;
> +/delete-node/ &q6_gdsp0_dtb_mem;
> +/delete-node/ &pil_gdsp0_mem;
> +/delete-node/ &pil_gdsp1_mem;
> +/delete-node/ &q6_gdsp1_dtb_mem;
> +/delete-node/ &q6_cdsp0_dtb_mem;
> +/delete-node/ &pil_cdsp0_mem;
> +/delete-node/ &pil_gpu_mem;
> +/delete-node/ &q6_cdsp1_dtb_mem;
> +/delete-node/ &pil_cdsp1_mem;
> +/delete-node/ &pil_cvp_mem;
> +/delete-node/ &pil_video_mem;
> +/delete-node/ &scmi_mem;
> +/delete-node/ &firmware_reserved_mem;
> +
> +/ {
> +	clocks {
> +		bi_tcxo_div2: bi-tcxo-div2-clk {
> +			compatible = "fixed-factor-clock";
> +			clocks = <&xo_board_clk>;
> +			clock-mult = <1>;
> +			clock-div = <2>;
> +			#clock-cells = <0>;
> +		};
> +
> +		gpll0_board_clk: gpll0-board-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +
> +		xo_board_clk: xo-board-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +	};
> +};
> +
> +&adreno_smmu {
> +	power-domains = <&scmi15_pd 0>;
> +};
> +
> +&cpufreq_hw {
> +	clocks = <&bi_tcxo_div2>, <&gpll0_board_clk>;
> +	clock-names = "xo", "alternate";
> +};
> +
> +&firmware {
> +	scm {
> +		memory-region = <&tz_ffi_mem>;
> +	};
> +
> +	scmi0: scmi-0 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem0>;
> +

As bootloader updates the irq, we can add a comment here.

> +		interrupts = <GIC_SPI 963 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi0_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi0_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi0_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi1: scmi-1 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem1>;
> +
> +		interrupts = <GIC_SPI 964 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;

Thanks,
Deepti

