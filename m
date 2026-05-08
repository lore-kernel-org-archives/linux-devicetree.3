Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBC62F8EB8
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 19:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778267789; cv=none; b=HW1G6P7OmN5Vw/jaefvLdDVxqz8ljwSDJJQ5D7jDzK9DTbL453ZNoCddvVuLglJh9kTDXUeeR72uCTmpd1AuZ88fT1s5vcXM5npyREhOgGSowrfiFF4luFhpicK5m2NlclEh5JCh2IZ/RMv722jeLAH0RYYywj2YOx2/s2Z+0hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778267789; c=relaxed/simple;
	bh=8BmL+CWOecwAJ530xbi5ghoHg+OfAxe8bxaz1uRjde8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QcTbtxGtKSnRs0JzPM3+C50GnZ/XeOebZQJNpKIhUZqFGCFH15RSGZq6gjeegQkRbkH8s98xvx8/XJOGXwpeOgh8mKoL6Pc6DY0bT1E9ykJFpQiJINEuYl+H79SwRAaCNGbb32ruE38wFWfCP7e3xFjcSLQ89xO5CmXw/5Kbl7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ClFrJTdu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V3gpjkcM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ClFrJTdu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V3gpjkcM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648Hehxi1662612
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 19:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sVlipysOkBuAV8gAYceMqlYw
	RvO7SmJQFQT+Lf3VYoc=; b=ClFrJTduf/AGwgBQNiSB07zBanK5DmhZ8zKq7Ci1
	0eLDZcWPp0c0IMQexFI4rKvvTgy2YveLru9UPZkW5UTl9AVX9lZrzfJJAO2R0nGV
	GG9Z3OcuLv+ywcUuiBccd+uTYT1VSCP7JKHpOcbTysXNH97329IpUXyhoxLWhShU
	ALFCgxrZR370tZvuFOBmMQUHR63LqzzoVnRCM1l//SM0KapM33fj9mWEJfbayIr1
	qKsq8Y6ZYDuTw8s5olbA20p/muWhYyjZHMl5iOgTatOILO+y3C09HHJHMcbNQ7ZV
	GnaxW+pGi9zRgzUhpsunAOPlulejlPoHvZ8DJNxTEuA8Tw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1men0adu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 19:16:26 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-61010bc9c12so1529329137.2
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 12:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778267786; x=1778872586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sVlipysOkBuAV8gAYceMqlYwRvO7SmJQFQT+Lf3VYoc=;
        b=V3gpjkcM2RJaktflq4JhghhY7RlOSII+qwnP7phl7ryQiHqyU0n4nxLx38DymnOkMR
         1YN/W6YAy9nVn0GX7r8EDZOBrM5pdcNXa9hlFbO/J4omqTxYDxfTDrC1MfGO/Cmjf91A
         OCmNtNCCBBvOZhQTgfZYgIpXXaUJZQj+Ta1C23a8kbgY0TjnTtAj37BsBhLoc+oS2Sdv
         8yFqU/ssAhbA/Je5D6awrpYC3BYosFCUy8e2Op0osjGcz99lGgTCts+m5+MVlR84WyQ8
         mVWFfRWnBfvTu/saa+G+MK6KUiHgYmZe+RxyfaAmCmZnJTKGBOuW5SNw7MUxAZfzKD3a
         qOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778267786; x=1778872586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVlipysOkBuAV8gAYceMqlYwRvO7SmJQFQT+Lf3VYoc=;
        b=O5r/4rTArUBh8AREUcDpTHPAMqS0aGwUOii5cp6LPkudwWYDelQdkJU4zSe/TMPhfb
         segZDcI0iAa5waLjyhFWAYlma0zFj/qDFvQwOHxSlxOqpSCk3EWjYU1tUl0o+iwKxpWB
         PRF/xmi8DhhF3hgbbIqqMIaNDp+WPotxKYhv28s8tMLLBnd46vLUo+u8Wq3QhZy+momv
         lFAtsJLg3kUX7UTe9Mox0+BFxxbHJe7qB7wCE04LNDA5/JsWzeaAdbcUFEyjsofW+nna
         PnXcetn830krNftsHUz3DWg0O3Peh9ghng/E1ATGNS76VtQ7gFyo6AhANB6tB/uADajK
         k+1g==
X-Forwarded-Encrypted: i=1; AFNElJ9XZY5XKrPaIWl954hD3BImWwFfIOVPOg6Qd/u1m1eIIc53mSkFDYmjCy5y7JXUIyVx9xBFE5Bclroc@vger.kernel.org
X-Gm-Message-State: AOJu0YyAuxWNQ8tyHH52JotQhjdbHPqvEqsJ8LGgVXbB7w/KTlk51tgJ
	jC0JiIOs/1mGOIRRsWXP/MCnGjdyg6dGnxB9rVncPSjZqqZ4WCyBQdcAvQyRL4GGi19YxpCXfXJ
	tU4M7+vPimsesQUid20w1L4IxP8kL8JRx6OtKGlqeGqExcQVKuLIT5eM23hkC1U4i
X-Gm-Gg: Acq92OGB/h/EwcZ4qxpf1ysNmzC2TOvnr1d5x3mL+tNRUC6HS0Y/FZeqOzYzBccKjYC
	6FJDucKN4lqdV3s8C5pwOovTmIn3+Vl5LQqZb6TPFFLHyx426o9Q3eDUJFt5h6eJA+aNiCUzh7Z
	wqZuWG9c0J1nHpSkHPFlRLCHB86fnfcDAnDY9RfMwv1Iadi7c2XcCq2AdKPYJgAF2y7NdcmjNFZ
	qEBVSWnWHluSKQWl1pb5w9pu78P5F+gz9W3Et5CjbAmFTdBVHaCLPTZj9TsztnCMaJ8v1MqFhdU
	0RRkxeDsdfyCvfEjaMsWcsBPz+LlbTXpRZ8bcvKCHnSK4rCtUti/Vhs7UXrYtTcFJ1uCJZbAe7Q
	JbdDQcWT6SFY1OIqEIqcLpn2KSU14H2KKukyTYDsr+a9JFeWGh/Hh7ickwhsggxvO48vdA9satT
	InrAgEv/iM5GioLciPCF7g+W8K+zLSAuu2ZXE=
X-Received: by 2002:a05:6102:5813:b0:62f:3713:92bd with SMTP id ada2fe7eead31-630f901b14fmr6998020137.6.1778267783642;
        Fri, 08 May 2026 12:16:23 -0700 (PDT)
X-Received: by 2002:a05:6102:5813:b0:62f:3713:92bd with SMTP id ada2fe7eead31-630f901b14fmr6997639137.6.1778267781168;
        Fri, 08 May 2026 12:16:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a9515444sm723771e87.9.2026.05.08.12.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:16:19 -0700 (PDT)
Date: Fri, 8 May 2026 22:16:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 01/14] media: iris: Add iris vpu bus support
Message-ID: <brt5t4b2eaudpb76rfdutfpe2p3rgjjyyrezcpsarqvuzsvvru@fgf22ttmijfs>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-1-7fbb340c5dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509-glymur-v5-1-7fbb340c5dbd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MiBTYWx0ZWRfX/yfXh0dvdUiy
 LdHkmdWmg0TATiQzat5MzxAkONrG+KiEzmRzbd7sdwJp8fCvLpYJQ//riWl0O2luWNHFBopn3Vf
 kD9qbeAmMLg1LCjY/jXdZv+e3W70Z7/iyuJ4GaQ19YDhEJ5YhCZ2F57RPxKbTr1IlZLa+unkIPk
 uauG8V4rnS9ypgbpr/hAycwf7bfYYzPcPyF/hcNd5y4UhkG2vkShOUj+tWlrPneTWHW2OvaoWNl
 vGzHMg9tqXcbJHIMK8kXkQ06Vsjzh233It8FI1OC3gqYFtCoxG09rKy4FlhXt+Vy92QCi4kIgmN
 zHG59Yoix+UoWcKe4z1WI3wwzDTR/z5iDQjCLse2yQtAR5lpVGubxgPC+B3oxomzQw/hmwyZrLO
 d0r89Pw7D6xK1VqTXr10yZtNq+nQEDP9FvPMssdVbQ8Qa3jWQWmlwuk2BKTNXRoNRm/p39BDyce
 Q8ir+mNzsY5pKqFovyg==
X-Authority-Analysis: v=2.4 cv=LORWhpW9 c=1 sm=1 tr=0 ts=69fe368a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=9yz3bF2usBS2VQdoGnQA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: eTTNaSoHlUi46QWkUhwCaXTrRGUPJHAG
X-Proofpoint-GUID: eTTNaSoHlUi46QWkUhwCaXTrRGUPJHAG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080192

On Sat, May 09, 2026 at 12:29:50AM +0530, Vishnu Reddy wrote:
> From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> On glymur platform, firmware loading needs a separate IOMMU mapping with
> its own stream ID. This stream ID is defined in the device tree with the
> assosiated firmware function ID in the iommu-map property. To create this
> mapping, a separate child device is needed so the firmware memory can be
> isolated in its own IOMMU context.
> 
> Introduced a new bus called iris-vpu-bus. This creates a dynamic device,
> and its dma_configure() callback calls of_dma_configure_id() with the
> function ID provided by the client to map the corresponding stream ID.
> This sets up a dedicated IOMMU context for the child device.
> 
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Kconfig        |  4 ++
>  drivers/media/platform/qcom/iris/Makefile       |  1 +
>  drivers/media/platform/qcom/iris/iris_vpu_bus.c | 69 +++++++++++++++++++++++++
>  include/linux/iris_vpu_bus.h                    | 25 +++++++++
>  4 files changed, 99 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
> index 5498f48362d1..025280ef1221 100644
> --- a/drivers/media/platform/qcom/iris/Kconfig
> +++ b/drivers/media/platform/qcom/iris/Kconfig
> @@ -1,3 +1,6 @@
> +config QCOM_IRIS_VPU_BUS
> +        bool
> +
>  config VIDEO_QCOM_IRIS
>          tristate "Qualcomm iris V4L2 decoder driver"
>          depends on VIDEO_DEV
> @@ -6,6 +9,7 @@ config VIDEO_QCOM_IRIS
>          select QCOM_MDT_LOADER
>          select QCOM_SCM
>          select VIDEOBUF2_DMA_CONTIG
> +        select QCOM_IRIS_VPU_BUS
>          help
>            This is a V4L2 driver for Qualcomm iris video accelerator
>            hardware. It accelerates decoding operations on various
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 2abbd3aeb4af..79bc67980339 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -31,3 +31,4 @@ qcom-iris-objs += iris_platform_gen1.o
>  endif
>  
>  obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
> +obj-$(CONFIG_QCOM_IRIS_VPU_BUS) += iris_vpu_bus.o
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
> new file mode 100644
> index 000000000000..15ba4d9c563e
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/iris_vpu_bus.h>
> +#include <linux/of_device.h>
> +
> +static int iris_vpu_bus_dma_configure(struct device *dev)
> +{
> +	const u32 *iommu_fid = dev_get_drvdata(dev);

This should be drm_get_platdata() rather than _drvdata().

> +
> +	return of_dma_configure_id(dev, dev->parent->of_node, true, iommu_fid);
> +}
> +
> +const struct bus_type iris_vpu_bus_type = {
> +	.name = "iris-vpu-bus",
> +	.dma_configure = iris_vpu_bus_dma_configure,
> +};
> +EXPORT_SYMBOL_GPL(iris_vpu_bus_type);
> +
> +static void release_iris_vpu_bus_device(struct device *dev)
> +{
> +	kfree(dev);
> +}
> +
> +struct device *create_iris_vpu_bus_device(struct device *parent_device, const char *name,
> +					  u64 dma_mask, const u32 *iommu_fid)
> +{
> +	struct device *dev;
> +	int ret;
> +
> +	dev = kzalloc_obj(*dev);
> +	if (!dev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dev->release = release_iris_vpu_bus_device;
> +	dev->bus = &iris_vpu_bus_type;
> +	dev->parent = parent_device;
> +	dev->coherent_dma_mask = dma_mask;
> +	dev->dma_mask = &dev->coherent_dma_mask;
> +
> +	dev_set_name(dev, "%s", name);
> +	dev_set_drvdata(dev, (void *)iommu_fid);
> +
> +	ret = device_register(dev);
> +	if (ret) {
> +		put_device(dev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return dev;
> +}
> +EXPORT_SYMBOL_GPL(create_iris_vpu_bus_device);
> +
> +static int __init iris_vpu_bus_init(void)
> +{
> +	int ret;
> +
> +	ret = bus_register(&iris_vpu_bus_type);
> +	if (ret) {
> +		pr_err("iris-vpu-bus registration failed: %d\n", ret);

Just 'return bus_register();'

> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +postcore_initcall(iris_vpu_bus_init);
> diff --git a/include/linux/iris_vpu_bus.h b/include/linux/iris_vpu_bus.h
> new file mode 100644
> index 000000000000..7437a2ba411c
> --- /dev/null
> +++ b/include/linux/iris_vpu_bus.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _LINUX_IRIS_VPU_BUS_H
> +#define _LINUX_IRIS_VPU_BUS_H
> +
> +#include <linux/device.h>
> +
> +#ifdef CONFIG_QCOM_IRIS_VPU_BUS
> +extern const struct bus_type iris_vpu_bus_type;
> +
> +struct device *create_iris_vpu_bus_device(struct device *parent_device, const char *name,
> +					  u64 dma_mask, const u32 *iommu_fid);
> +#else
> +static inline struct device *create_iris_vpu_bus_device(struct device *parent_device,

You are adding globally visible API without _any_ sensible prefix. It
should be named other way: iris_vpu_bus_create_device().

> +							const char *name, u64 dma_mask,
> +							const u32 *iommu_fid)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +#endif
> +
> +#endif /* _LINUX_IRIS_VPU_BUS_H */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
