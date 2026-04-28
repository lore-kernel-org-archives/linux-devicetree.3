Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B532DF701
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 07:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777362573; cv=none; b=BItsjvipkrI9dAGA8eucWcwEBBQvMdbnS1gPh07qG6XO9JGbLw3JBB6+ZZb43JrgFrZj2h+ThlRC5wjQJujLBYTprdr1xjxm2q+ZtKA90LTbcSRO4TIduO21PIXm8rCzFcEuUELl8lWAC+MesLk/E8lHJ3GLw85L8bPSFsWLxlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777362573; c=relaxed/simple;
	bh=+ZgAxXyzb8CNeXJWPqlD2glwHPR0PCwCe1KuCtyJGFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZqWnpCZhRqLrzF5FgRU1qbOoIhGjNx3FvYO6dgoX+XdYv0wKsOEF1VYwZXS3NwggACm13B7lSmkCo5z2y9pnrCT+5b55/mOGKFLIVKaVisOSwigbU3s9YT00HzQ4k4Yw2dMRMF43HjWj3XLLC+byk6oFAouuCnU0nt5gZWiArI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvvo+9fH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ixQCtb77; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvvo+9fH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ixQCtb77"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S42vFI1329554
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 07:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uWuz92n86FxORmdDcAoKhR/R
	d5+JAjTjibu5p1/dF2I=; b=lvvo+9fHgS0xUl4yeN55ueCi1i89tVyxMf78aE5e
	Qqd9jsZH/bgfQSX/8fTmbjgTk9NQPJ+us8+rPfrom9oZ0lj+b3HQEc3WiRbQp2V8
	UMAhswQ58PMYWhkqNbBsiRUlGhpcD14Y7bazECp5SAlgwxJpjEXi5hmIi9NsS2zi
	hbpHcWo/In4piEaUNUbER2YS8pTNS7nNEb3QBJiDh1QGS2vwdUPbL6xVJYRXiBr/
	3o13Ni5uWgESmBL/0ASUmHGAuBc+RMq8Ew3/Ct4BRysSqFYBx13qimPjQO9r+MFC
	eGQjMUtqMXisMgWn3uM9lWLsdzEMgGUeqjSBjV9SUSgfKQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtnhags00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 07:49:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e2592ea3bso118800881cf.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 00:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777362568; x=1777967368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uWuz92n86FxORmdDcAoKhR/Rd5+JAjTjibu5p1/dF2I=;
        b=ixQCtb770h+XwSGpo1z6CUjgLLTPj67DtUzhNJqtFkXem79hqkQiiEwYPVKZERo9+R
         z3DiQQAwmqK9ngxmQCT8n32TNoxqlyY3XSXERCkiGXlgowdzi/YybZKNprcB9Dl7uBPq
         uKZyGZnRz+gp/p2wJvvh+ax9ra0UiylND54TG56cjyDXEdxmyS650Vfs8GGhhKeg1e5X
         daVX7yL4AwRiJCGnaOgDtyEmfEPH+l7uEKpj/3osks0JPu49uSVCYjfhmW0ExM+h8z2s
         g1eyXIJV0AC0EY5gnckbOC3LHCq7wsEVt7SfxFHI/m3RJQUoHUWQ/bIkMaji24MIaiPj
         xs4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777362568; x=1777967368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uWuz92n86FxORmdDcAoKhR/Rd5+JAjTjibu5p1/dF2I=;
        b=A53jOuAfQN8QkhEqRZ0wt27DpiRFkKMKldGfDINpjMsRjlqaC7tbf8IEtPQlqjas9m
         NOjeiuMC73S8YcIIl25rtx+NHLsxlnEqYy2UIolC1suPfI7qRAUbXUdJWtZ8+99szja5
         THNKO06o55Po+NmH2s/60PzKo2U0Z8+wdFa5oQb1YdJgCCae7x+B/tRbeIX0nQsTcjy6
         MoACQ7gK5rc12e60NrykYxXWjLRlEwMyDphhhfiStgJsbkPBVC22ceTD0VXK7VEjeRtN
         UubZ2+q5QdbyluPQF5yd0WOf3hUaexUq3AHl1vyviWE9j3r3TscyjQ7pLNNeAMiuuVxv
         nnXQ==
X-Forwarded-Encrypted: i=1; AFNElJ82l5OoydMVH0PikW6tXePXn8fOGmBPIkKF/WSZwlVODcfVPtOgb2Xt+bG/H0rQcs3T3TYB8Vf8k27J@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/uqAeRyjFNK47Xy9lSPsnVExd5PWVk306DCCbs1Hw++toTf4x
	29L8CaRimfU+htzaUfCcjMytyokBzwaArtCCCrcxdebqmYWYPYn6xU6t3zG2NDJfHdleeQhSmkm
	1gZ3NuJbMVmS0pOqaopsxqbBoyRotxB89AwwyJcuP68RrbktfME0DO2ZM1IOQnPBn
X-Gm-Gg: AeBDieuPGM42pcLW0yMvZFyR+cG2ouZMbLvB8xhy7mGmESGpGWxP1ts2CjR7/ZiRWUz
	qzP0shsf9A0zckI0WIaedXWMWBG5T9dsoYTqvzTfCLOtq51OCw7l7dyRbu1hgpMFZ76i8g/PLsW
	QUZ8S2MsOlZq4X41o3jUc2VLbeR8HSBFEP3H/bSFJI+InDxL8pAcq0Ox56UvIrJ4+yNEha87nip
	XHz0dvi+ZB2/9fjAHptnep63ErCiv45kFIY1yP1CbLxOZOWWoRNe2+U6b1gDCawAl16SgOmQiAf
	ZRK20NMu4aLpIB/naqi1VqluySJpAZVnkKch7v/3SZYrqR/BF33r3ur72Al5H0uFL2lbTpK1Oc4
	mjA1gTxyvcjKgfSiI1gPSb/48wCtYOwYUmPmHCGZV5etokN08IbVYP/dIzfBGKtkdEVm7StTDjX
	mHSYtrsxq3IV3+9gJcn9LL+w3G++RWcxWISjHe0R7yGLezZA==
X-Received: by 2002:ac8:5807:0:b0:50b:37a6:4f0a with SMTP id d75a77b69052e-5100e1ea433mr26199841cf.57.1777362567751;
        Tue, 28 Apr 2026 00:49:27 -0700 (PDT)
X-Received: by 2002:ac8:5807:0:b0:50b:37a6:4f0a with SMTP id d75a77b69052e-5100e1ea433mr26199531cf.57.1777362567239;
        Tue, 28 Apr 2026 00:49:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7463f5de1sm418871e87.40.2026.04.28.00.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 00:49:26 -0700 (PDT)
Date: Tue, 28 Apr 2026 10:49:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: syyang@lontium.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org,
        maarten.lankhorst@linux.intel.com, rfoss@kernel.org,
        mripard@kernel.org, Laurent.pinchart@ideasonboard.com,
        tzimmermann@suse.de, jonas@kwiboo.se, jernej.skrabec@gmail.com,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, yangsunyun1993@gmail.com,
        xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com,
        rlyu@lontium.com, xbpeng@lontium.com
Subject: Re: [PATCH v1 2/2] drm:bridge: Add Lontiun LT7911EXC eDP to MIPI DSI
 bridge
Message-ID: <ygxqqtql2puvej5bkmac3vhlwd4lv2f4mcjim2ornq5gj7rsoo@6zfnqckp2d7a>
References: <20260428063224.3316655-1-syyang@lontium.com>
 <20260428063224.3316655-3-syyang@lontium.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428063224.3316655-3-syyang@lontium.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA3MSBTYWx0ZWRfX7moll5ZyWZvP
 ssS/Wj80Cg/L1vI1sxiXijeqeKDsXqYH8ZQO5yHlRRiu2sHRSy+njHtGOOYSnCowDEZkumqhXdX
 X6M8EvgNuTLSWR5Iuf0BjU8qBiID3+fNJ+BLpid4PyNVeV/YxbwaOw4/nLTmBSM+HrPUcfFAENO
 kuRd9DPnNyDDMQtH+l9GQH8CcViTgZiAED9u1Twd9KCRQtJKc60JYat+kOKi9ITAYZIe3l6clkV
 +7spHD9wpBvxQ4g5hsPE15VuOtBNEIH3YqzPXFZLVjsXYNM1sWKIpR8WbP+DlSA29bHQIUC1RPR
 WKDYF/eLxN6HIBZh0lTdY5PqOmmFZlqqb7MftY8rE97YVIf9UycP0vjmFLG2AgABVAMHOjUUAGq
 h9fwd1gZ057D3sbnUE3KecXWtdVPGhNA24rvu3MXA7iUmfqvH0Iz+sYvTDEizPp7qmfSLF0ktvV
 fjR8MmMDrE4Vw7O2n4Q==
X-Authority-Analysis: v=2.4 cv=JoDBas4C c=1 sm=1 tr=0 ts=69f06688 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=Kz8-B0t5AAAA:8
 a=w7maeejPXaM3MacE_7AA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-GUID: 0JrmqdupF10KyoaYfvYiuW_sqllIBX41
X-Proofpoint-ORIG-GUID: 0JrmqdupF10KyoaYfvYiuW_sqllIBX41
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280071

On Tue, Apr 28, 2026 at 02:32:24PM +0800, syyang@lontium.com wrote:
> From: Sunyun Yang <syyang@lontium.com>
> 
> The LT7911EXC is an I2C-controlled bridge that Receiver eDP1.4
> and output signal/dual port mipi.
> 
> Signed-off-by: Sunyun Yang <syyang@lontium.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig             |  13 +
>  drivers/gpu/drm/bridge/Makefile            |   1 +
>  drivers/gpu/drm/bridge/lontium-lt7911exc.c | 497 +++++++++++++++++++++
>  3 files changed, 511 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/lontium-lt7911exc.c
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index c3209b0f4678..8cff2bf15b09 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -132,6 +132,19 @@ config DRM_ITE_IT6505
>  	help
>  	  ITE IT6505 DisplayPort bridge chip driver.
>  
> +config DRM_LONTIUM_LT7911EXC
> +	tristate "Lontium eDP/MIPI bridge"
> +	depends on OF
> +	select CRC32
> +	select FW_LOADER
> +	select DRM_PANEL
> +	select DRM_KMS_HELPER
> +	help
> +	  DRM driver for the Lontium LT7911EXC bridge chip.
> +	  The LT7911EXC converts eDP input to single/dual port
> +	  MIPI DSI output.
> +	  Please say Y if you have such hardware.
> +
>  config DRM_LONTIUM_LT8912B
>  	tristate "Lontium LT8912B DSI/HDMI bridge"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index beab5b695a6e..70ddca75dd3a 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o
>  obj-$(CONFIG_DRM_INNO_HDMI) += inno-hdmi.o
>  obj-$(CONFIG_DRM_ITE_IT6263) += ite-it6263.o
>  obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
> +obj-$(CONFIG_DRM_LONTIUM_LT7911EXC) += lontium-lt7911exc.o
>  obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
>  obj-$(CONFIG_DRM_LONTIUM_LT9211) += lontium-lt9211.o
>  obj-$(CONFIG_DRM_LONTIUM_LT9611) += lontium-lt9611.o
> diff --git a/drivers/gpu/drm/bridge/lontium-lt7911exc.c b/drivers/gpu/drm/bridge/lontium-lt7911exc.c
> new file mode 100644
> index 000000000000..85cb6cedbfa3
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/lontium-lt7911exc.c
> @@ -0,0 +1,497 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026 Lontium Semiconductor, Inc.
> + */
> +
> +#include <linux/crc32.h>
> +#include <linux/firmware.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_of.h>
> +
> +#define FW_SIZE (64 * 1024)
> +#define LT_PAGE_SIZE 32
> +#define FW_FILE  "lt7911exc_fw.bin"

Do you plan to submit the referene image to linux-firmware?

> +#define LT7911EXC_PAGE_CONTROL 0xff
> +

[...]

> +
> +static void lt7911exc_remove(struct i2c_client *client)
> +{}

If it's empty, it should be dropped. .remove is an optional callback.

> +
> +static const struct i2c_device_id lt7911exc_i2c_table[] = {
> +	{"lontium, lt7911exc"},

Drop  the "lontium, " part. The I2C ids (unlike OF ids) don't have the
vendor part.

> +	{/* sentinel */}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, lt7911exc_i2c_table);
> +

-- 
With best wishes
Dmitry
