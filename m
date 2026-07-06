Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EA8349CFC
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 19:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783366980; cv=none; b=nRP1Usjr1MMzIXYTjthoB0pCsXW8vi85ctJF+EjPVdnx+XBvN38vGzOqGW50BV+fZc7aj3aFk53B2K5PhkQLnp2ul0sOsfIPIt3GVtvcHzDeDv+9Cu2WdsDrb6fSxyeQbEi0cx3S+jm46kn8x+XwVvbF/iPz5dsgI3LNZBKBQEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783366980; c=relaxed/simple;
	bh=ScLIuDvnUG9BCA1E6lrVpX2QUPXRIKVPiwRJpUJaWEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8Rj4xz72kznzLw69XC4EVSyGenVH+VrfcQNLGUCiejtVLlLtXp+UCVhzGOB14XERDVCZduVKRyXZS3SvEdSRGYy1IRG/AMS9yNr8mP/SiOKU/1FElR+PqxPsGYbsJfvqGAJD3LfaaC3iziWk2GHZkVJiKfteHIzpY5jRNuNuTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBgZQxgd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SAqszupc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBgZQxgd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SAqszupc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF8Ug982455
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 19:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6d3J4Mk83rpjnD1CFpHeRcri
	IFoaOdNUEoJK7UMDJfA=; b=SBgZQxgd8ZeVN0lEXedVcI3xWejSTJkdMTZDeinK
	T1PKPNJD2aqUlNOjV+Kh5onS9L58tq1s8oJoRliqL5FndtpVrotpmxhegvwtjdbO
	nRYATc7TTqCif6Ri7mss3fipRpRWzfO1BC1wB0YknOGxPv81ynV69eIu1rjJ4ykn
	zm3XMrkjHtplFNhCxoQK44jEYgv5fITM1MGTrug/cJamck+IwHaJ0bItomzYOpzM
	p+OhHU+dUXipImAN22mUCMR0Xi4VZ+guS4ErtBA1R8xORzIQYeJJVDdjue+i7FRl
	Q+pPMUooSA/cQO3O5m0kvjcYzu3hbV5DEuswmd0MESDlRw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpjqr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 19:42:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e4f946461so367590185a.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783366978; x=1783971778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6d3J4Mk83rpjnD1CFpHeRcriIFoaOdNUEoJK7UMDJfA=;
        b=SAqszupcBdbP+2GgXnHf1RtkS0IYVzpI6zfMZv8Lls+JO4K7r2oKPx/Jartxrj9aTH
         ckagKifqXyaYxK2v9Z0d9W34x8WNo4qZvcRdy3yeZhAO6IoW28zNbHVU8jcJxFr/qp5Y
         GuHjUw8ADzJXDh11hcUMHp235BdKWo93KNJfUYkg3HPAlaunCYeRC+Wnw/P5PhNr4bEg
         vT32a3K2n/lW29PUgIgrXyAZpw5EnVq/mT3+k5bRS6n6VjR85w47Eq69QkVyt3EIbSCH
         Tmwp/JhWQGgqAsUSo6bKn5AlNNjbs7HRJxCYLVJMUpWeJ5yQ0PW8ou4nyG+WRXLwTCIG
         z7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783366978; x=1783971778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6d3J4Mk83rpjnD1CFpHeRcriIFoaOdNUEoJK7UMDJfA=;
        b=Tx1lQvYixoJErPBr0TMa9MlEqXL5dZzTJBqTRseESfcP53pFQYlMjGCCWFN8iiS7ZP
         XExXdju7iWP55u1nAxzUXdG2jCh40H0ryJVCXf8AafjXXPt+Yie+24rdBqDYReAUdgaf
         68Qeg30W7omg2DVFD75Tiu2X2YLISt6i+A/bS4Z2zC+I/sFEQYZTn+lZ3YxVweaPG5FU
         4nQHBwU2uSwyVyjGlpc17wMf1MQP+wAzM117KbYeVU2vLpcsYYoqAgLI9Bx4Abu5ZOV1
         v1dwLZdt0kPCI1luMQoZIfIxxrTrAVZ+5ZvKsufgzlHQq2/ix0Tc4fJI8mrDPNLf9Muf
         YR5g==
X-Forwarded-Encrypted: i=1; AHgh+Ro/nVCKxa9DkLQkV4vFCMMVFfelTq768JIbVL76Iz7MwmOEXo7CH7e1H3TCmXTy/Ibp4CloHjQKiyEk@vger.kernel.org
X-Gm-Message-State: AOJu0YyKACRB094ry4dK6jbEUcsOkuEtRJ+cv3OlXaH4KHjNVUGRO5BJ
	XhpPzZNJs7hs9GyeR16kEu33ZqZYIskarXiHWAQFDkt3Zyrjp0lQAc3MFf8JVE3SX6yYRRB0xHY
	e+H6lZzdtIIpuGDlW7CgNoevjIoxKJJC3K3NbrPtw91SJ/+i7JHqN1XEhQI+g1kvC
X-Gm-Gg: AfdE7clfTVaa4HAaPZHK4Y0I2V+2rBE0n4pmEtYG4HQtjz1XSSj0VQ67ZJqYx3ZqS8E
	bYiQ6LV0xVmmuBJjKBpu+rINrAOH5gB3DqiH1OStkePRR23iBBYIEhoJGnRgQY0qhnkgHaNaPdq
	IP90QTuEB72GzJzNNooDdVfy01I5/QnwRqstUbuuHEfyio7lQ5qf4PxIj8kltjmzfu40m8vcNqX
	xsxudtFHMtHLSHm4DzKkDaRqgc9TRJk3H9RFmOgj1eRmSju+DahXIEupsKDM3uCKuMMwUwTP0CG
	6dE5bdb4jycrL7KhXBGKgO/1s1vvuyL9JJvqyQCIX72ejyfSgVIqs6w262ylpNQTcLuOihyXVoK
	B2UlAbRzbGMB7oJZMUkNU0ioeKX/eKaXHugWLYeFyTykSrI8qId+8IeTWjkA8EqQwnLaZmOZaJG
	CIrcfuMJfe0pr1dd5C3wSMi0ov
X-Received: by 2002:a05:620a:4621:b0:92e:87a8:6f15 with SMTP id af79cd13be357-92ebb5c8cd8mr281833085a.69.1783366977562;
        Mon, 06 Jul 2026 12:42:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4621:b0:92e:87a8:6f15 with SMTP id af79cd13be357-92ebb5c8cd8mr281829285a.69.1783366976935;
        Mon, 06 Jul 2026 12:42:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1377024sm3110522e87.26.2026.07.06.12.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:42:55 -0700 (PDT)
Date: Mon, 6 Jul 2026 22:42:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v9] arm64: dts: qcom: kodiak: Add EL2 overlay
Message-ID: <zj7y2enw2owu4oidbxc5qhilmbb7uzp2fhlawapuqlvhh45omi@5j25uydqolks>
References: <20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4c0542 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=EnRuTfNfpS18YwFKnmsA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: sq3CfdHRcr0VKjfyz0VYejAepg1tt2ig
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE5OSBTYWx0ZWRfX5KbDfDhBg3Sk
 JUnxpaAaYyW39V00+dIEbhsZasTVjOqIVN1XKbQcsiw2ePru1yBYzmLejYsuxVRXrg1riHcW/Dx
 5Tem5mfDZVotIQcc6ULB6amDJZrhNti4aqiobzk2yvguw6WLX2Mk6LxWeFNSbFv5waCjU4mlGtC
 I9Bp6iUosXg1LiHFNmIBb/On2U7xnTZL0+Rzcny7mX2dE1BMc9clbeEOP9Sk/JcujCg7NoR6S0b
 d/MKksDSEJuN240+LF+Mitx2ihBT4HYzy7MyhrTbiODEOVu95/j2V4Cyg/yoNMmweaTzlRUCgVR
 fN3MSiwrV4gsJJrG5+/V6Ycr7/OjZiknXPesmO79FWTteBDcvApkwfOiGvo49W3WZgF/S2lOJnS
 ChXWusPe6wyb4v2biV9dbf7Tr35FFV8tBE98EpG2Yvqhyf8baFJuJS3xZol3Wn/e5bg/1a8HaEb
 e1go5FRAhP6kSrF9EnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE5OSBTYWx0ZWRfX/97L8i8H+3TX
 WvpW9BFVeT3nAnFe2nTmIHfYlNiBiHg7M2jdCVUYHEXeCN9jK987KFr3iAzr/sX+F22ARkxfIF8
 dVRpWbU/csxGO1b5IZlDZyWlJgbV2Oc=
X-Proofpoint-GUID: sq3CfdHRcr0VKjfyz0VYejAepg1tt2ig
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060199

On Mon, Jul 06, 2026 at 09:44:28PM +0530, Mukesh Ojha wrote:
> All the existing Kodiak board variants run the Gunyah hypervisor, which
> means Linux can only boot at EL1 on those devices. It is possible to
> boot Linux at EL2 on these devices [1].
> 
> When running under Gunyah, remote processor firmware IOMMU streams are
> controlled by Gunyah. Without Gunyah, the IOMMU is managed by the
> consumer of the DeviceTree. Describe the firmware streams for each
> remote processor in the EL2 overlay.
> 
> Add an EL2-specific DT overlay and apply it to Kodiak IoT variant devices
> to create -el2.dtb for each alongside the standard dtb.
> 
> Note that modem and media subsystems are not yet supported due to
> missing support are not there. For GPU to work, zap shader is
> disabled. In EL2 mode the kernel owns the hardware watchdog,
> which is enabled here. For WiFi, the wlan_ce_mem and wlan_fw_mem
> regions are needed by the WCN6750 firmware.
> 
> Remove the erroneous deletion of wlan_ce_mem from qcm6490-idp.dts
> and qcs6490-rb3gen2.dts as this is device memory and should be
> present even for EL1 configurations, whether or not the
> underlying OS uses it.
> 
> [1] https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> 
> Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v9: https://lore.kernel.org/lkml/20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com/
>  - Remove reserve memory change of adding copy engine device
>     memory back in el2  overlay file instead do not remove
>      wpss ce device memory from el1 configurations for idp 
>      or rb3gen2 device tree. [Miaoqing ]
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak-el2.dtso b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> new file mode 100644
> index 000000000000..37a906218d17
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> @@ -0,0 +1,41 @@
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
> +&venus {
> +	status = "disabled";
> +};
> +
> +&watchdog {
> +	status = "okay";
> +};
> +
> +&wifi {
> +	status = "okay";

Hmm, don't. The platforms doesn't necessarily has the WiFi enabled.

> +
> +	wifi-firmware {
> +		iommus = <&apps_smmu 0x1c02 0x1>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index bdc02260f902..6ab1bbdc0a62 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -25,7 +25,6 @@
>  /delete-node/ &adsp_mem;
>  /delete-node/ &cdsp_mem;
>  /delete-node/ &video_mem;
> -/delete-node/ &wlan_ce_mem;

Separate commit.

>  /delete-node/ &wpss_mem;
>  /delete-node/ &xbl_mem;
>  

-- 
With best wishes
Dmitry
