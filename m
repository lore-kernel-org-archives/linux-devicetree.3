Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10223672B7
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 01:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782350091; cv=none; b=nw+ylMFtC8/9hbIgFl62vAhfto1sOwCLlGyJjxkvJLXP6XOgAK5Q/p5Yzx3/tyyzZW1k7hdRAP9eGpx0iFCONspLs+cQULHtfZrGxPpTbiubHhGb7XuzXRL85NGcPb+g9Q4pa5oY2IFbxE2vjUHQ7NnKcL9owc6tV1MaI2tMzB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782350091; c=relaxed/simple;
	bh=CISY4UQP+z7PqN8AZdD6Qaz4dG0qqWxFgMBTel2BPy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n1ZWX9nks5U28GMfDwsSBjJ3Fmh0Vc0cquM3ntsF9CdQTV4lJRu+C+OiDrVBdcyBmO7+7BBS5w/sOMgSPMtpSQCeVvar0qXX0xyffN6gmIq3oImxIktAWJz7+BxbT8Yq7uiRjtkNDkcidOpT3P3ctucuWvJ0mfwubhVw7XFmW7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KF+eD7jD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dtOROqZM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KF+eD7jD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dtOROqZM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OLqTPG451092
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 01:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AipFGjYh8Cvc0+Iuc+GbopNsXObtl5GIW33Z8XQPoL8=; b=KF+eD7jD4v0Kdcxw
	MyTtQr4wuFrnp1ECw6RKkz2YBsk6Rm8/CYlWuiVXo1zMQcaukyHCEL+vTGBRjrzV
	FRyd6oG0YcF+sO/lB1O4zsdV/Q6bT0mBuntUUlwdur9sUb3dsKotjEgXi3yCjJ6q
	ZEBOXTopSc7DpAhclh/oZwF43eDoYUnxROn9aDZjpk9ns9X2HqTz3vcGht8s3VqJ
	yVvg+k96tVd8iQI0Xg53cZSk1jFuLMs0/npQSfQfvkA387VwFcYDKucFAI5Dnp2y
	REd2IMeqDUvpKtrRaiFAVeXfZG390RwB0NblsJxi5E/dZ8j8RxYMffGeAkOwJnFY
	eAyIOA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ajmw6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 01:14:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c7c7fdca0cso18026815ad.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 18:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782350087; x=1782954887; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AipFGjYh8Cvc0+Iuc+GbopNsXObtl5GIW33Z8XQPoL8=;
        b=dtOROqZMIqGnY+fqZmbSSCOhTJWxCSfQOyjTO+SAfBMmHtd6siOLyPYVtiD6vKFrHU
         f+QDaxysK23zXPoPnq47/hRNSMUEKLWO+MLxVuVbL+ZTs4sP4ENBmPzz1LMyVtku8k7c
         CByH++KPVdtZ8pDONi7rX9FnAgdyM9fNDmtiJvI79iN5P5H7yN4HKFxDNjddBFyGM3nt
         UctvaDslSk66bsP+h22fZG3kvAPctqXZIbDZJCzJd+3V4UaRziuPibrS7N2QZ9wU0I1k
         q4FHiNiHfda44ZMoafQ5RxpBTSNoOZt76zh0nidQATnLdj74w2ln/0AbUN8zZQ78T5jz
         TDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782350087; x=1782954887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AipFGjYh8Cvc0+Iuc+GbopNsXObtl5GIW33Z8XQPoL8=;
        b=M7MmcgJSKf89+FkxXKrb1WaPYFa2LD69TIwcRlJ/u55cXe/isD5X1DKWr/bjW/5fKW
         cOia7TLu5ooWWWzVSiTuwkRnkaBSe1UAiQqEboYnJzGuWuMUvfpS4EvFrzZn+NYOUuJL
         4vs1S5hdqz+jFOxD4C004d9joA5mglWS9OlXCJM+ZPjS52zy8EHbW31yxnoBrp/CumSE
         ru40PN+PrWWFK9V0fb/3tjbuH/2KABGVv3nbFnDef2TbrLAe17x3a1JEWnUOIsvqHifQ
         oDaQbPY9raDu4cqXPHeoBE7uzK9tyuTvtdwrMMprUG+4XN/JCR7dxkpIYIxUVknA8tOI
         BmuA==
X-Forwarded-Encrypted: i=1; AHgh+RrYLuoIPXClRxf+87XcnOogan7KZBHUV53RUe7zmvIUguQ7GCEyv7/sQ86qCmShZEnVwi1QQdYyl5qG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2OtDEsTMIfQxjru997EEJPXewZT8cHiFqEN6ZKDb9ayqkyjcP
	RoSFklDSEevgj/I3OcjTuMeiZiDm/+7gyMl0oJ5UuvKXg4Ry1NXp+lRkaTFNikWIu0F9w2GUVS1
	LWo5pjbLwbS7237XcHitKuuYKAP3HryNrslDje/RQ0APb8hr4qUU4a4WYBCHeqyNn
X-Gm-Gg: AfdE7cmjXyygRfEl71lqw6cwj8HlQuzuNqEusgqgI7yAaVlH84pUSmiJtdfOMTbLlqr
	XAaRi4x7cm/yavMIuYparpqAOmBkAGPB3opCwHO678VnSe8OuIyPg/TQXWh7psh6U7aHrLTBtDl
	JYNkz6PaTZjwqYNzfni1K9LeevdB/J9xZt6jringHIaeeQvzO8t18cRTdp4gBiBrYgcLkMYedxD
	G/D0hh2JefRsffI20zDESWYC/JlrsbMNp/I/kLXtl0aproTp7Z14u6t6OLRUPEuDJv8Wdt8OgGU
	sfU5O1hJswyxDF3Gn2JvjbB5odeVDXSBKIlarJz+KNdPGQvVT6KQUnVmLbqPIDX0sqW1Fq1XYOR
	BdCQAFrLsbdB/ujmDQNMd4Vg7KgiqLXSOSvrJ/XipkOZ7ZyQhiUNq+pq6k6ZVTpU/00T/gPReYq
	FXJxGmyeE=
X-Received: by 2002:a17:902:e847:b0:2bf:281f:19ec with SMTP id d9443c01a7336-2c7fc6f498cmr5814155ad.24.1782350086723;
        Wed, 24 Jun 2026 18:14:46 -0700 (PDT)
X-Received: by 2002:a17:902:e847:b0:2bf:281f:19ec with SMTP id d9443c01a7336-2c7fc6f498cmr5813875ad.24.1782350086168;
        Wed, 24 Jun 2026 18:14:46 -0700 (PDT)
Received: from [10.133.33.196] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63b2e18sm8071305ad.41.2026.06.24.18.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 18:14:45 -0700 (PDT)
Message-ID: <8fbfa82f-aae7-48d6-9406-d04e719f028d@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 09:14:41 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] arm64: dts: qcom: kodiak: Add EL2 overlay
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDAwOCBTYWx0ZWRfX0cdDjFtm+Gjw
 nOF/k9tu1S/xhBBwCDn1ymWqyTJC4Od6r5iNXCwAnITy9De5ord2pJVbZ1v/dyLijPcIdywL8ho
 JVZonWHn5ti3QS9IFfrhsrJjQJK8vOA=
X-Proofpoint-GUID: YpZlQnOFPiHV7YZLyYEaQDIks8igIkhm
X-Proofpoint-ORIG-GUID: YpZlQnOFPiHV7YZLyYEaQDIks8igIkhm
X-Authority-Analysis: v=2.4 cv=DbUnbPtW c=1 sm=1 tr=0 ts=6a3c8107 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=FWf3DjJPLhuRtTups_oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDAwOCBTYWx0ZWRfX3jUZ2rO2onmJ
 wUQYJAZfGxk2mvEQ4kmJxPbPXDa9ktXUeYtutSY78caxGn5gcPNGLSRQxBDMImaKbjWZ/G3TD4l
 GjIL55O+Ulaw+m4VOVpM8+l9vxGM9Q2xNui9+N2jsxvBXGeu15WJchyuPK8URVbIreju1EN8+KK
 HVS8A3WVNccxzhml1nTuG8TZaeQzILgHwNEJd13RurGb55K861Y6mSd2mRxXAOhtlzQ90QCtgOJ
 ru1l1LVRox32SdKIp8rDLFIOqFpWWpItWJzgg3qED0KE2Ycw6GMXYV4ws4hzWxtxFO9oTn9bS9I
 hS9xyBcLVkp3IGeRPnYunpFGDSsXvC+Wd8O3OoxpLfrKt5BohqXojl3aeVFH9+r/djq8hOI+5k1
 M+sdnFCQ4V5E2d4NLcEOQVJAV7TFqsCdEY7snWd8ag/37t/7KShLJcLAAIkU7ufaO5AiGJWaiLp
 Wuukq4myrj72WJthZCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250008



On 6/24/2026 2:39 PM, Mukesh Ojha wrote:
> All the existing variants Kodiak boards are using Gunyah hypervisor
> which means that, so far, Linux-based OS could only boot in EL1 on those
> devices.  However, it is possible for us to boot Linux at EL2 on these
> devices [1].
>
> When running under Gunyah, the remote processor firmware IOMMU
> streams are controlled by Gunyah. However, without Gunyah, the IOMMU is
> managed by the consumer of this DeviceTree. Therefore, describe the
> firmware streams for each remote processor.
>
> Add a EL2-specific DT overlay and apply it to Kodiak IOT variant
> devices to create -el2.dtb for each of them alongside "normal" dtb.
>
> Note that modem and media subsystems haven't been supported yet due
> to missing dependencies. For GPU to work, zap shader is disabled and
> in EL2 mode the kernel owns hardware watchdog which is enabled here.
> And for wifi to work wpss copy engine memory need to be mapped for
> WPSS firmware to work which is aligning with sc7280 chrome.
>
> [1]
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
>
> Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v8: https://lore.kernel.org/lkml/20260522115936.201208-2-sumit.garg@kernel.org/
>   - Added a wpss copy engine memory similar to chrome for Wifi to work.
>   - WPSS does not have firmware Stream, so that was removed.
>   - Added wifi streams similar to chrome for wifi to work.
>   - Removed this patch from Generic Pas patch series, can be followed
>     separately.
>   - Moved Sumit as co-author as part of modification done to the patch
>     in the past.
>   - Added some more kodiak's board variants in the makefile.
>
> Changes in v1-v7:
>   - mpss was disabled and will be enabled once the dependencies patches
>    get merged.
>
>   arch/arm64/boot/dts/qcom/Makefile        | 12 ++++++
>   arch/arm64/boot/dts/qcom/kodiak-el2.dtso | 52 ++++++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/kodiak.dtsi     |  2 +-
>   3 files changed, 65 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6f33c4e2f09c..d2cee1190954 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -164,7 +164,11 @@ purwa-iot-evk-el2-dtbs	:= purwa-iot-evk.dtb x1-el2.dtbo
>   
>   dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk-el2.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-fairphone-fp5.dtb
> +
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-idp.dtb
> +qcm6490-idp-el2-dtbs := qcm6490-idp.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-idp-el2.dtb
> +
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-particle-tachyon.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
> @@ -176,12 +180,20 @@ qcs615-ride-el2-dtbs := qcs615-ride.dtb talos-el2.dtbo
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride-el2.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-radxa-dragon-q6a.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> +qcs6490-rb3gen2-el2-dtbs := qcs6490-rb3gen2.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-el2.dtb
>   
>   qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
>   qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
>   
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
> +qcs6490-rb3gen2-industrial-mezzanine-el2-dtbs := qcs6490-rb3gen2-industrial-mezzanine.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine-el2.dtb
> +
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
> +qcs6490-rb3gen2-vision-mezzanine-el2-dtbs := qcs6490-rb3gen2-vision-mezzanine.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine-el2.dtb
> +
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-minipc-g1iot.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
> diff --git a/arch/arm64/boot/dts/qcom/kodiak-el2.dtso b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> new file mode 100644
> index 000000000000..91e4cda45b49
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * Kodiak specific modifications required to boot in EL2.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&gpu_zap_shader {
> +	status = "disabled";
> +};
> +
> +&remoteproc_adsp {
> +	iommus = <&apps_smmu 0x1800 0x0>;
> +};
> +
> +&remoteproc_cdsp {
> +	iommus = <&apps_smmu 0x11a0 0x0400>;
> +};
> +
> +&remoteproc_mpss {
> +	status = "disabled";
> +};
> +
> +&reserved_memory {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	wlan_ce_mem: wlan-ce@4cd000 {
> +		no-map;
> +		reg = <0x0 0x004cd000 0x0 0x1000>;
> +	};
> +};
> +
Is it necessary to redefine |wlan_ce_mem|? Can we consider updating 
|qcs6490-rb3gen2.dts|?
I have verified that with the following changes, *NON-KVM works fine*, 
and |wlan_ce_mem| is only used by the WCN6750 firmware.

--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -26,7 +26,6 @@
/delete-node/ &adsp_mem;
/delete-node/ &cdsp_mem;
/delete-node/ &video_mem;
-/delete-node/ &wlan_ce_mem;
/delete-node/ &wpss_mem;
/delete-node/ &xbl_mem;

@@ -1686,7 +1685,6 @@ &venus {
};

&wifi {
-       memory-region = <&wlan_fw_mem>;
         qcom,calibration-variant = "Qualcomm_rb3gen2";


> +&venus {
> +	status = "disabled";
> +};
> +
> +&watchdog {
> +	status = "okay";
> +};
> +
> +&wifi {
> +	memory-region = <&wlan_fw_mem>, <&wlan_ce_mem>;
> +	status = "okay";
> +
> +	wifi-firmware {
> +		iommus = <&apps_smmu 0x1c02 0x1>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index fa540d8c2615..2486d15fa2ba 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -91,7 +91,7 @@ sleep_clk: sleep-clk {
>   		};
>   	};
>   
> -	reserved-memory {
> +	reserved_memory: reserved-memory {
>   		#address-cells = <2>;
>   		#size-cells = <2>;
>   		ranges;

