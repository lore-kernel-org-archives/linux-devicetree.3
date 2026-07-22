Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD70D3B6C05
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784710852; cv=none; b=Xn5Aj9nhBhDhdDUhtqUc8l9QFJpcF3E46xgU4o/0pHA9ZOvcc7A3w6SmPWruokgXRhpHoQEN5jYMkGUCG7vXtfUzKJ7v6ZfFW+QFuXH2i9reec+JwrgfXy4ie7nVt5m9V9KuZAQcCibTCUgEsNCHbGZ0C/z1OnsYU1Rqgrb4sP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784710852; c=relaxed/simple;
	bh=5pJuTCP7sU+4IEJexJigKVVU/zFhh7PKLKwPDLEVMz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YOGFgoW5sw1KeycwXv7JXSJa2aEsWVtuDPvb6b2hPIGLXx9KqMX/wr/YDmKAqSCorw79CE1NicIgxX4geRZ9AYfa8EWh9mOxiZPIVu+HgfHL9lAmcv1pG1RyHyy4JA3C6+NGg6FXh9QzWWot+lCP5w5/Q0snii1bj0FA+D6JmNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PrB530u3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QQrYp8o4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PrB530u3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QQrYp8o4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xdga123847
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PqyCT9Iq0DxPGfOdiNjUipdB
	Gd6ZzRa4dkeRNbbVexo=; b=PrB530u3HOg2VClclqSZ5w6KVDmDc1YlTmje/sb7
	HT1OxOsb4mJ57P1AGUAjYaosaquV5lcA65OmQY0iQ0gfpzr0kktBTdFom5rCKXdZ
	sdy9F9+9nFWy0wAnLzyCYBvd9SHIpNK5FNw/cikpEjnhCWfrlf82dpaY1cYrKkIO
	VrB7TkHnagDKzZ+cs8VSY18z5DemTh1AD923r28N8bf1AU5I9Hgjctb6QTHqwku2
	x2s1XV73b6u+nyePUPgsl2bLzAMlWSSsUAbIL601Gz944uZjujizErXWyJjm5aIH
	U3xwRds9e7+sx/5kO9d+M9/hERkXxzOqLpc4OOMEqb8vNQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjnu4s8he-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:00:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccafc5e82cso119515585ad.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 02:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784710849; x=1785315649; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PqyCT9Iq0DxPGfOdiNjUipdBGd6ZzRa4dkeRNbbVexo=;
        b=QQrYp8o4wf6g3/1YnL01Y/ZJfXgCEqWuw7xOmT++abu/sUSpndRXoTrL6Q1g7jF9nO
         BrsyssSKSXyypnBDVVgQOUb3+Ykb4VvA+sZkI1itITY0yWxkpWtkVq5WYb+a9OOyJwxV
         ePP9lLzDIVhjTMLckWCccBUcMLeDFoaBpPXsf0W0S72DIZN3OoeQaCZigAzIC03lpaMt
         koOo5aM3JdX11Bq65UlaTBQSq9awCvfVLL7F1N+7nABTJlQlIanWXQV2TT+au7ns3b6i
         ovCSmmdE73PMbFDMt7r9xZHE5CrOBNuROZ2uBiSnyK1iESlSMctSdCgZvdJep80Ptw1e
         XcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784710849; x=1785315649;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PqyCT9Iq0DxPGfOdiNjUipdBGd6ZzRa4dkeRNbbVexo=;
        b=d+lCmDBewi7Fp8BV1T39vHktu7pPBPMHbMoZDwDeZDGpuoXMMUnZTXGG+KGEUooqkG
         MkSf32yqJUVeZpYEo5S6Zhe07vVQ9sbGO6wbMB3mxNe2QPSpOeHb1/SBsxXIAdq8kld6
         CULtwPfHvgSj8B7h1iHgyWrFtujfi7YRsnefG+1DG3Tg/0MQ+bHSJ78vPpsX1klHM1Vs
         C+hGLyy/MdlLAPik9fQo74UoLJyNYqtrbY8/bgVyLHGg4uMsnG1kbkp6KrCN1am669QX
         X9vKdzJoiV0XFuC8tXiLiU2Z/K1QbM8Ss3YLyZ+R+xpK8YQKYd6P7hb7d+t4fI2ZM52I
         OtCA==
X-Forwarded-Encrypted: i=1; AHgh+RpdE8pkXxJZh9vn1cwYdLPNXOMeiVsc70Qey+PAwTUmCtqvmbSnqi0Ej1sFO7FQJ7iv6KuZa0f3KeOh@vger.kernel.org
X-Gm-Message-State: AOJu0YwN8NWP6FE+RF1948aDzQFoo81nkhu/kXojXTZeWlqbMSRh5eSh
	tEfZBp1aepA1QEotLSg2dyz25pMrBO5HQDiiwYUsFcBltkPSZdNTI8rZ3SkFIjAwC5IfWnJxt6c
	/KNY6fP1T/trPu2d5ui91cgiSQyOLjpRx72kwAMNCe6IbbB5uijaX5EneZPdppw0P
X-Gm-Gg: AR+sD12IysxvFHIWzRwDNX+xF5qYCPje5GvvjEFe4wSIfO7tv/CRRycDF85cMfoF2TG
	U40Ekpm8j5mfhzHjSPAXoKPjDDMtdKeWWVy0ajy7e9lzFbR8rMyiLoKduqG/qznYfJXGetqPTo7
	v6kFWnVzXjSQ70obSy7taq7TdJL5ivA0mvE+lyKUR6SKl+pT3bqAEkCTYtrQcKSg061h2qsfJPc
	iZbMw6aNUN4EDcplF6ljK3NC95ZnuTcE9FDvwcafPFdPVF2sjrC1RQFwBgNn7aShs3Qw3AQamAK
	yHmmnuzqSGeAIm9Quf7L88ZZxtZxNo3bqU0dqXZMTJxJdHodygvPUJ1ezuwqpFlP73yJKvk9VNc
	RcKP3kS2lUEDMPZL0dYIeAMvNI3Xvt5EmFA==
X-Received: by 2002:a17:903:291:b0:2ca:eea:eb5c with SMTP id d9443c01a7336-2cf348acaedmr221823875ad.18.1784710848423;
        Wed, 22 Jul 2026 02:00:48 -0700 (PDT)
X-Received: by 2002:a17:903:291:b0:2ca:eea:eb5c with SMTP id d9443c01a7336-2cf348acaedmr221822565ad.18.1784710847561;
        Wed, 22 Jul 2026 02:00:47 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1b99esm7167019eec.3.2026.07.22.02.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:00:47 -0700 (PDT)
Date: Wed, 22 Jul 2026 14:30:35 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v23 07/13] power: reset: Add psci-reboot-mode driver
Message-ID: <7b1dad52-b9d3-44a7-aedb-62911778f3ad@quicinc.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-7-e7453c548c21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-7-e7453c548c21@oss.qualcomm.com>
X-Proofpoint-GUID: YvT6UwgOM6cRdtVgEH9EkMEfGinWLX8p
X-Authority-Analysis: v=2.4 cv=KLhqylFo c=1 sm=1 tr=0 ts=6a6086c1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jeYV839nRbxY1CX0_0kA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA4NCBTYWx0ZWRfX2XFxV1eqJ5Mu
 6h1EE1zjQPxjqDKyHYBBlCB593YSakpIte76WfBW5ADt/2BvePLxJ2CuJCOtifyQ7LBk21Ng8vd
 4bHlqQJZYVLsXU6sxWRJZIoM29PWpTDHfTZLUhmKZ7qP8mBCzTht2HyOwOP/0jE1QwuIK6j51pf
 L5MuzgoD+EFA2zcIYquGWiIRCgF8wJZhOB8Z2PA79pxSyi6e78vVWDYSnnGS+1tm+YFhEydDwPw
 lPv7SEAt2rTIiSPjwd4zct+L+bEa3JuOTgNnKHRWpejx94bVXOoxc9Yd2teMhMXQ0qQ75GlcmH/
 GinEvdgK7SfVWsE6j0D2TiRXyekOjxXWUDjhir0bx0lMnl2gu0LyzKXgMPA1jEJiCW3hX9Toz7W
 Vr19yaSzfPlvafFgAWQDDxVE8cQoIbqgqpILPMNuN5RiElAVQZXlfMz5NkmcMMHqyxn8K8u0fOk
 PExxcyuSftDQsQGnP+Q==
X-Proofpoint-ORIG-GUID: YvT6UwgOM6cRdtVgEH9EkMEfGinWLX8p
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA4NCBTYWx0ZWRfX1Hp1Yjv8zftL
 8GiQCbJsLVd5TK9yyCoKkvKBLgYSvgPCMnrENgZwvBG7Amm+63wlnu2yNV0ApM0b8efW3EYm1c9
 E7a3oqkWvy9uK05WPMpqXUs0u1qtt20=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220084

On Tue, Jul 14, 2026 at 10:46:35PM +0530, Shivendra Pratap wrote:
> PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
> ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
> there is no common driver that handles all supported psci resets at one
> place. Additionally, there is no common mechanism to issue the supported
> psci resets from userspace.
> 
> Add a psci-reboot-mode driver, and define two types of PSCI resets,
> predefined-resets and vendor-specific resets. Predefined-resets are
> defined by psci driver and vendor-specific resets are defined by SoC
> vendors, under the psci:reboot-mode node of SoC device tree.
> 
> Register the driver with the reboot-mode framework to interface these
> resets to userspace. When userspace initiates a supported command, pass
> the reset arguments to the PSCI driver to enable command-based reset.
> 
> This change allows userspace to issue supported PSCI reset commands
> using the standard reboot system calls while enabling SoC vendors to
> define their specific resets for PSCI.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  MAINTAINERS                            |  1 +
>  drivers/power/reset/Kconfig            | 10 +++++
>  drivers/power/reset/Makefile           |  1 +
>  drivers/power/reset/psci-reboot-mode.c | 78 ++++++++++++++++++++++++++++++++++
>  4 files changed, 90 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e1ed6abef62a..4910abafa170 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21576,6 +21576,7 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/arm/psci.yaml
>  F:	drivers/firmware/psci/
>  F:	drivers/mfd/psci-mfd.c
> +F:	drivers/power/reset/psci-reboot-mode.c
>  F:	include/linux/psci.h
>  F:	include/uapi/linux/psci.h
>  
> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index 124afb99febe..93e4029d9506 100644
> --- a/drivers/power/reset/Kconfig
> +++ b/drivers/power/reset/Kconfig
> @@ -348,6 +348,16 @@ config NVMEM_REBOOT_MODE
>  	  then the bootloader can read it and take different
>  	  action according to the mode.
>  
> +config PSCI_REBOOT_MODE
> +	bool "PSCI reboot mode driver"
> +	depends on OF && (ARM_PSCI_FW || COMPILE_TEST)
> +	select REBOOT_MODE
> +	help
> +	  Say y here will enable PSCI reboot mode driver. This gets
> +	  the PSCI reboot mode arguments and passes them to psci
> +	  driver. psci driver uses these arguments for issuing
> +	  device reset into different boot states.
> +

Since we have added predefined-resets support, why are we forcing this
driver to depend on OF?

For example, `reboot psci-system-reset2-arch-warm-reset` gives me
warm reset on non-DT systems, correct?

>  config POWER_MLXBF
>  	tristate "Mellanox BlueField power handling driver"
>  	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
> diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
> index d7ae97241a83..02948622fe3d 100644
> --- a/drivers/power/reset/Makefile
> +++ b/drivers/power/reset/Makefile
> @@ -40,5 +40,6 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
>  obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
>  obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
>  obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
> +obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
>  obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
>  obj-$(CONFIG_POWER_RESET_QEMU_VIRT_CTRL) += qemu-virt-ctrl.o
> diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
> new file mode 100644
> index 000000000000..955ed68f1402
> --- /dev/null
> +++ b/drivers/power/reset/psci-reboot-mode.c
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/psci.h>
> +#include <linux/reboot-mode.h>
> +#include <linux/types.h>
> +
> +static const struct reboot_mode_entry psci_resets[] = {
> +	{
> +		.name  = "psci-system-reset",
> +		.magic = { 0, PSCI_SYSTEM_RESET_COLD_RESET },
> +		.count = 2,
> +	},
> +	{
> +		.name  = "psci-system-reset2-arch-warm-reset",
> +		.magic = { 0, PSCI_SYSTEM_RESET2_ARCH_WARM_RESET },
> +		.count = 2,
> +	},
> +};
> +

Thanks,
Pavan
