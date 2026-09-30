Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFEC25B099
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769762; cv=none; b=dbBKM6kxa5Du8iHKRVeGRrPiIH55KRhTW5VpYqHODHIXDVKG/Z9uj8jQBsSl8QKsOtJsQ3fRsmus5CesT5QFOcQCtjMV0x2SIISax5jdbpIh6wQQUVuP63YsdfIfKS94py2LnfewhKmYMRyq7s7dXn5K2FASLuCzVIBZBM97cfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769762; c=relaxed/simple;
	bh=WbeuGSintsEDrEtjATq9sCPnSgowCN7ABUs20ou/YrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Czj/MiGIUrVrnXEC5CvqgoSRxfMbiTBSPQVswJxOGJJJGiYtjv/AgDf799Rb+9suF57mpL+SqY2/K9/r/ZGqfQ9qj+Ng9xekCQZ43/mdjXB6pEtRg9UQYIIsR2YNGfH8Wdq0cwtopcvsaOdVLKGj7QFvL1M1pt6l7I4aXTqIpOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GpRrXG+P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NtdvTKLN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GpRrXG+P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NtdvTKLN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7b0Q3135720
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X91DOgHPekg2+dX/FkyABqyHuRohIOR0R97sk1R/5C4=; b=GpRrXG+P8Hm9NOvp
	YYACYhUM/ZuMqav6YSCx6Lq5r7C05voBGz+caLBBNWsYNtD0PV+zE3NVzCl0KOuc
	7qKW87vKy8vEValbeOU+LaYv2sISkzfiBmlpnKFUO/OnUNtvTh+/Hy8b8MwLmoxn
	Tn9GEAuMlfCYrVljn/FE6sEyzuTWPx+JuHh2hh8RqSSNvO3VaUqCleBu3s4EQPFX
	ou1Y/h7BoG08s+hY4QWjBan9wvnrfvmXQkAJFZ0Scwhwe2W0QvMdlPvo+yfAwqAu
	MFbYYiJi/JISbWJmwip7BgfGhBmckUSrwvgFqxdelXqPANOMO+4UnxzpzptH5rzh
	jgRZNw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x27h7r4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:02:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbf293831so8062108a91.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 05:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790769758; x=1791374558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X91DOgHPekg2+dX/FkyABqyHuRohIOR0R97sk1R/5C4=;
        b=NtdvTKLNK6HMAP2+LXQx+5mJgnDGtaLiPFuBKfX6J7zdOzPqO/cLmpkfmD4tLN1//b
         lRHVk2jfDazL0m7ZMWH91wzjXU4u5G1uhdyDCZJ9V8QUfw3ln+oxhXhbpv4+UCOMZRPR
         /VIRzKqnF4Y9cFMNrLVOCZVJeqe6DKwKF8dup63PA3ps00GOA/szmWD7me1rolg98W68
         zYAPmJoxUfXhkgpwCsfR2nnL/t6T6EUdAQzeMPiO3vi/jolod1/JS9tlk4YlLilEoB4f
         GrSHfc9bgxAMfYAzb0MScco6yAueAwgHbuSxujkgDLyWloZphzXTTScjN3e/HGxtXmne
         C7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769758; x=1791374558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X91DOgHPekg2+dX/FkyABqyHuRohIOR0R97sk1R/5C4=;
        b=NRjJVtrQ9F0e79u0rfC9wIflwuRYcsg/xSX+USoZkwC3ZBa4j3uumKeKjuT5C4cGAl
         nH8dzccR4O2MJYiT4jqTwA10o9ACRAKerC9Mp0rqIVFiSfWqllDB0KAlmmkMOH+nn2BW
         Nm0uHFr1GbagMI18MHCzJBwLJnmS7lKzk/pEVwRMkoRz46lMWOuIr2oo7f0mRv7YAYLI
         4P7E90i5uZdK9QzcUh+3tvG/5JJJaXd+RoQF9VFy1bGu9StNEzGtLyOPdrb0FHLyW5nh
         yfZ3O+AyXT8oIpLgRPPHPxMy2Y4vQdORcuzd3UQBsSd6vDm2Jy+yH3gunsDIm9eZONbX
         ohvQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9s38rCvvn4+p0FqNG4RJrQs+dWT7YFKDWjx2jXGTv7kFSctLF2q47vsUO4d3YhO0sNpNyNM3Mj8gJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJfzrKNtenFXKbmIRse1C/LCoOzbH0XFHVaXcmLYzzldyoYG6Hv
	cSMHILwDYqAtuefW3pDSMJbgXplQA8NgCePoLOTwi2OfcK4vFuum8fteW5J3+ZdefnoDsFhrW5c
	jPpmKhi6J3PTDmPJhl6rKnOmrh3gslkindLDye9wnSlp8Ieg6FTyCzSuhhnRP9yxT
X-Gm-Gg: AYBFou39ls8atHiOWJxCOmKlVtaFR3Vc3Uun6bXIg5VF4cvVCM2iu4S/FgzJNDyw1dX
	QmKIN3e+GJiPxm3lo6Q3Zcoyqg1tXTBj3oKL28srdXqROigVSfbKTJGhug1UW8E6/RDJpki5xYG
	ESrGt7DSqJUd2CQKjsb6hpuaTOGEh6NPoBXBtiFc7AvfDSh0WWx+QubcjF3A3yMLuHG67po4I+9
	gE6YbGpsv2NyHY+wyGLuWpHMSBZ0R9KDkIi8SzPJa2KMWqvq8KvO9GD2RJjggPaF0ZDkNukeFAg
	sHuhBhYkcWPU9eKFxnh78ol/SA0Dqj7VyqCeYqBuDtRlUnetYcarzcTmP2hnJ0TTikj4QkUzjK2
	JlHksFJWOZmcWgloktuVvxTzf/4PdriwKkr4QEw==
X-Received: by 2002:a17:90b:4b8c:b0:3a0:d5a9:d15 with SMTP id 98e67ed59e1d1-3a4d192a4a4mr1144480a91.57.1790769757990;
        Wed, 30 Sep 2026 05:02:37 -0700 (PDT)
X-Received: by 2002:a17:90b:4b8c:b0:3a0:d5a9:d15 with SMTP id 98e67ed59e1d1-3a4d192a4a4mr1144429a91.57.1790769757265;
        Wed, 30 Sep 2026 05:02:37 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ce15ddd6sm3277420a91.7.2026.09.30.05.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 05:02:36 -0700 (PDT)
Message-ID: <bc63e435-859c-4e00-bdbc-131908852a8b@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 17:32:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc
 SMMU mappings
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
References: <20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfXw2IrXzLQBA0i
 MD4VntI+iBtalMzO/OMHVsdjo0hcRjW3RPPgfS4Y0zXNwCwLEaAhRqHLC6yex2MMbDyDWzf7pTU
 C0gfrorUQAMqaAZvlpWmuNPlroTxC1o=
X-Proofpoint-GUID: MvDCszN3CRlhWYZkcGyKTUF_-cWxwtct
X-Authority-Analysis: v=2.4 cv=W9GtxhWk c=1 sm=1 tr=0 ts=6abcfa5f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vgmkJc1NjztBKi0f-cAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfXy1Lkp2KOD+nq
 qPbeFiX6rsHnKgyDhtg0FkoXXBhnMwTeUUf7oSTmHFzw+MupbKJW9WwvmugUxOeywRuWzz3mrse
 o+UR2igdlWyOyQSgUrNhMiym1HfRht62A/GPT3ERIlTZo9QXHiNDenAajPxNWGqr7FglVTUYP6s
 rNIbz2gGelCx8NsfyH3N42/9ZsDVSXiXUvwyZRSp9UJnDXrJN1uXZP2QPEkrbxaiPJ/4ETzr+XC
 BrDScUv4yHzpVEID5fWcYQOc4hUhJws+NpU9OtjELI413HZMazI6DSyYZKZyAtfa/CLFDFMuCC9
 UdtRRNvCkZH2NbbQTDwHjYAmrYV/j+MWXs5jJLvRVCcNP4SqIBGSL9Bl0jJUepztO9YrVvraQRz
 T89QKX8nvJUOZ++koRFOZt1HZhSP1yonXtxFgc2nDEvpZtcTfQKT7yRKbeQveMz1Q1Sc8rGhClx
 EoKw3v7Nwf12++wBDCw==
X-Proofpoint-ORIG-GUID: MvDCszN3CRlhWYZkcGyKTUF_-cWxwtct
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300047

On 9/18/2026 6:04 PM, Komal Bajaj wrote:
> Shikra boards currently boot Linux under a hypervisor, where the
> remote processor firmware IOMMU streams are managed by the hypervisor.
> When booting Linux directly at EL2 without the hypervisor, the IOMMU
> is instead managed by the consumer of this DeviceTree, so the firmware
> streams for each remote processor need to be described explicitly.
>
> Add an EL2-specific DT overlay and apply it to all Shikra EVK variants
> devices to produce an -el2.dtb alongside the "normal" dtb.
>
> Co-developed-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
> All existing Shikra EVK board variants boot Linux under a hypervisor,
> which means Linux typically runs at EL1. For EL2 boot without the
> hypervisor, remote processor firmware IOMMU streams must be described in
> the DeviceTree consumed by Linux.
>
> Add a Shikra EL2-specific DT overlay and wire it up in the Makefile to
> produce -el2.dtb artifacts for the Shikra EVK variants alongside the
> regular dtbs.
>
> Komal Bajaj (1):
>    arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings
>
>   arch/arm64/boot/dts/qcom/Makefile        | 12 ++++++++++++
>   arch/arm64/boot/dts/qcom/shikra-el2.dtso | 23 +++++++++++++++++++++++
>   2 files changed, 35 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/shikra-el2.dtso
> ---
>   arch/arm64/boot/dts/qcom/Makefile        | 12 ++++++++++++
>   arch/arm64/boot/dts/qcom/shikra-el2.dtso | 23 +++++++++++++++++++++++
>   2 files changed, 35 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 5c19f945c785..686d37cab02f 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -359,8 +359,20 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
> +
> +shikra-cqm-evk-el2-dtbs	:= shikra-cqm-evk.dtb shikra-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-el2.dtb
> +
>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
> +
> +shikra-cqs-evk-el2-dtbs	:= shikra-cqs-evk.dtb shikra-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-el2.dtb
> +
>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
> +
> +shikra-iqs-evk-el2-dtbs	:= shikra-iqs-evk.dtb shikra-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-el2.dtb
> +
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
> diff --git a/arch/arm64/boot/dts/qcom/shikra-el2.dtso b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
> new file mode 100644
> index 000000000000..d2f3186bd47d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * Shikra specific modifications required to boot in EL2.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&gpu_zap_shader {
> +	status = "disabled";
> +};
> +
> +&remoteproc_cdsp {
> +	iommus = <&apps_smmu 0x0200 0x0>;
> +};
> +
> +&remoteproc_lpaicp {
> +	iommus = <&apps_smmu 0x0360 0x0005>,
> +		 <&apps_smmu 0x0366 0x0000>,
> +		 <&apps_smmu 0x00e7 0x0000>;
> +};

Please ignore this patch. With this change, DT schema validation error 
is being reported:

   from schema $id: 
http://devicetree.org/schemas/remoteproc/qcom,shikra-pas.yaml
   arch/arm64/boot/dts/qcom/shikra-cqs-evk-el2.dtb:
   remoteproc@b800000 (qcom,shikra-lpaicp-pas): iommus: [[41, 864, 5], 
[41, 870, 0], [41, 231, 0]] is too long

I have posted a v2 [1] of the patch series to address DT schema 
validation warning.

[1] 
https://lore.kernel.org/all/20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com/

Thanks
Komal

>
> ---
> base-commit: e657a464aba873f5eaf3ca821b6e4016674492d6
> change-id: 20260918-shikra-el2-ea8969385c3c
>
> Best regards,

