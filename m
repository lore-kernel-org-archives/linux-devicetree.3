Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34041288C08
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 12:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776687517; cv=none; b=QXnEy1METDTmL86K6OxHt/rdZJ4rZaGGl4lHCuT1m0+0nwcdCpXrHnXRBELQDyXXXWip6FjTl+I8WYxPAnZLzNTHA2ngmlivfVMK0dz/FTkdRsjCXFVcujg+1sc24Qzym77rFuqHTMFzxQ+Am2mupk15h4APepj3gGajzKSqZMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776687517; c=relaxed/simple;
	bh=ZSdJvN4vUVCTLqvRWdUfQUDAvogcOD29Qkz6Sy3OaEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDgsU6QBnQS14bznmIMZt2muWk/5FbW/udWVlOc1UiK/jQwr8wfw67enYYcHw5WLvVJWHPKgBhs/lY0ferwUKKLW4oxy3lc7DTJbnFUHcA1QCr6HykGqx+ZdyF7vIUK6yhw0NbgC+FcSBx5t2Y3WjS2veqOuiKH2hBJEyFzfN7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Msj6DzpL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OzWumrIH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Msj6DzpL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OzWumrIH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K97trI1600341
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 12:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iTn3g9OljRwS+69xXAgsA0/l
	y3ncg4RI15LB2J74MJM=; b=Msj6DzpLHzPsfXretUAIOj1mHRlb96+ZepBAA4sd
	Ms98qlAHXFmd1mA5igilQOl64IoJkwldDHMTgPBLE8oEdePYhfCtCvEPJH43FYa3
	vrlDC3JmW9q2XTnRdo4xcrpQWoL1ccc+uHoHkRfdZCSwZh/BT39rvIj0Jrf0RUiS
	QpYF+KYdINBd+jNfxhWNkAH4xHgMAeAy2UJdR+cqnHvGiybgX1BF8Q1mASiLyWNI
	p15iOhEA5szVj3w/D/yhO2SpMu0Zl6W7l6D6+DBhW/is8V1ic8nauAWq71WWe82w
	WYbr95Kmvy7/jbpLnn0Fpk5zuH6v3p9w4KHo0wTZ5Xyf2w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh898mac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 12:18:33 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-953cccadb32so2964490241.2
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 05:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776687512; x=1777292312; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iTn3g9OljRwS+69xXAgsA0/ly3ncg4RI15LB2J74MJM=;
        b=OzWumrIHfPjPaaMbNjysksDKBnBPgZe5iZe2byYSOpwx9Rmp1AajMeKTPvnw8F0vKt
         4v/7xydAAW/t9jBi8WNoSNlUek4YvrASLEjqcSq/Xiug31FAF0Ht3w6sMOLjmeCb2UxW
         vkPTaKGwaSDG9nC7vST31h3K//YUSatB7JWJGqbz+n4Q18+NaDer6mKjVvHHB3giH5hA
         hNE/fAMq4xgFLpN22NtfCnvLWhv/HLipxaIhbx4msuoPmNPc3g7VyAsFdxK93msNsDDu
         Bw66/R0FA+yO00+/lMoK5/O1ORheT2a7zso+m1thNpt7CuaXupQbEnrbm9lZPGVU/NFj
         qWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776687512; x=1777292312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTn3g9OljRwS+69xXAgsA0/ly3ncg4RI15LB2J74MJM=;
        b=YLki8+u9I3g05Lr1asSu7VblhGpd9QC7zoUD1nacF+pvubWalORzcapO7XZzK/ptxj
         pBpjT8Mjpol71w25x5LSb1KjXZGJ56JXC29xMOKo+5nuqzkHg3QXpiYy0k1R0vyVQ0Mj
         GHpaI3EQd0tlU2HCRNUQNul5h2rR0vT5B7BREX4kTEyE4+7pic4W8HdZ2ZOUIbEJiKib
         13f65FGjlhyiOxZVzC2k+7vumX1qSz5PRa3AvcktGOYsCc/pR/mKh+GcLEYgEnmsOVB2
         59eS8yckOUCfFYB4MpSqadENt6KFoKKayw352Nu6PzHHasPUMbwIRySDnNpIjTQ5Rwru
         29Qg==
X-Forwarded-Encrypted: i=1; AFNElJ9IAJ/UrbRHt++vxChTNXSffe0Vbg9px+zE6FHDWKJQ0N/pC0v7oOmImR92cCkhRO7Q+aOI+eMbIMdY@vger.kernel.org
X-Gm-Message-State: AOJu0YxvAQ6mbZzcnFIpir74LsQDYFnbC0LF0lAFMlOUfwdWkPw9OeD4
	k0tskjnyk74+gQ42W7w2b+n9BYqNttmlbmHROIhbSvqvWNgK+KyaF1q/S8DsiBTbQKfGjMFO4jL
	TRLEneQK3WiHCEn4JVlVkPepMmt3LxOMnp7UJVExeMlEWrgK5LtyAod5fu73CKi4h
X-Gm-Gg: AeBDiesq/jYFQUCjqRaSIUIANO6MRup8vyTnB3NVhk+kXwYM+RLyB8eHnVBl/EqQ9p9
	MtbkmGSAA9FQ0Tfm58Ak3G1+YPPtOx4Vg5Oj8X6+FG4isXIkUqt9roi9gHIkp4FYRNhL0vQB3KR
	QSMusxe5Vi2TFbKgQ7w3ORHYAXYUT8BibTYbsHR5v81IlWY2vBSDrr0hu7zmVcPm6n/weIkIgLq
	8Ppx6E2IW3UyyWSN9zuY9ux2wOCtLefk/saPvfRJc/RY/pxdgRljn5T3IN2Uiu/bQGybj7rFQRS
	BSJkE4W6NRWNdGYuTChCqxQChbORGRWJZYxe7oSoWVhJZOalugkm/wBhOQu2pUCEYwgxxbyi/Co
	DoBqQQnGexay0YkDk141RGV71C1lPHn6iEsJI4TsLdQazfibNh/2RKqcXdaGZLc1N+7tMcTrZSy
	yR1v2LExL1UkNom/uGQY59Lq+Jk3GMn2cwJPAO07ww+zzkFw==
X-Received: by 2002:a05:6102:dcd:b0:610:6e69:5235 with SMTP id ada2fe7eead31-616f71f0a70mr5538730137.22.1776687511985;
        Mon, 20 Apr 2026 05:18:31 -0700 (PDT)
X-Received: by 2002:a05:6102:dcd:b0:610:6e69:5235 with SMTP id ada2fe7eead31-616f71f0a70mr5538683137.22.1776687511229;
        Mon, 20 Apr 2026 05:18:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb724929sm23803131fa.32.2026.04.20.05.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:18:30 -0700 (PDT)
Date: Mon, 20 Apr 2026 15:18:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: syyang@lontium.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org,
        maarten.lankhorst@linux.intel.com, rfoss@kernel.org,
        mripard@kernel.org, Laurent.pinchart@ideasonboard.com,
        tzimmermann@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        yangsunyun1993@gmail.com, xmzhu@lontium.corp-partner.google.com
Subject: Re: [PATCH v3 2/2] drm/bridge: This patch add new DRM bridge driver
 for LT9611C(EX/UXD) chip
Message-ID: <stkoeboxioodtki3nyksdglihgze243u25ui7dbyac4tuuobgx@ncl4j6l4vfqh>
References: <20260420061644.1251070-1-syyang@lontium.com>
 <20260420061644.1251070-3-syyang@lontium.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420061644.1251070-3-syyang@lontium.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyMCBTYWx0ZWRfX6vQpxNJfZTQl
 8vPexVGpmFhWdJmLDih5VjwyRbOxJtbjLIU+TDAQCRcOaL8tukWOygZYtXmDaZ6jlpamQkHJwDV
 HShCd0ojG0YSV3VtAfEf8w/ZixU8V4dfQFBYIw6XNuirtwxLcPQZYUOxoXNxR/6xufvT4l6c2A/
 RrKdn46+5zRXeU7yW2a5zOuhApQl3E7GAK5H0aqbhopvv2fYSMuVPXdQ/iIygCuagNNr5gXp3or
 RJHHWMRIJUbBxEmkdCBEV9FxuFnlHxhcgQKgoDnCTR/JZua6cl0Oi/H/wOkj52VWXwN51sBKR+8
 V1rmTq2J84Ep7fVyvUOr2Hm0OfF05IU8DtlG5qh62B7iDId+mIMTpHAxQ8xJhoQuE9Gf4B9jrqG
 dVaWlwztIgHeZANQcDGGWAGlc1UmpGe0NkawiTNrwEwGYUEEc3JtwofabFoQYTn2821mhpeNMGL
 J4WGQ/PMl2enzRI39fQ==
X-Authority-Analysis: v=2.4 cv=D6B37PRj c=1 sm=1 tr=0 ts=69e61999 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=Kz8-B0t5AAAA:8
 a=_rjM46munADLNFW82UwA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-ORIG-GUID: v_EdVTpQ5ZTVkTOsvl4Y8SiBu7iFCBLY
X-Proofpoint-GUID: v_EdVTpQ5ZTVkTOsvl4Y8SiBu7iFCBLY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200120

On Mon, Apr 20, 2026 at 02:16:44PM +0800, syyang@lontium.com wrote:
> From: Sunyun Yang <syyang@lontium.com>
> 
> LT9611C(EX/UXD) is a high performance Single/Dual-Port MIPI to
> HDMI 1.4/2.0 converter:
> 
> -Single/Dual-port MIPI DSI Receiver
>  1. Compliantwith D-PHY1.2&DSI-2 1.0
>  2. 1/2configurable ports
>  3. 1 clock lane and 1/2/3/4 configurable data lanes per port
>  4. 80Mbps~2.5Gbps per data lane
>  5. Support RGB666, loosely RGB666, RGB888, RGB565,16-bit YCbCr4:2:2
> 
> -HDMI 1.4/2.0 Transmitter
>  1.Data rate up to 6Gbps
>  2.Support HDCP1.4/2.3
>  3.Support CEC,HDR10
>  4.Support lane swap
> 
> -audio
>  1.sample rates of 32~192 KHz and sample sizes 
>    of 16~24 bits
>  2.SPDIF interface supports PCM, Dolbydigital, DTS digital audio 
>    at up to 192KHz frame rate
> 
> -Miscellaneous
>  1.CSC:RGB<->YUV444<->YUV422
> 
> Signed-off-by: Sunyun Yang <syyang@lontium.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig           |   18 +
>  drivers/gpu/drm/bridge/Makefile          |    1 +
>  drivers/gpu/drm/bridge/lontium-lt9611c.c | 1365 ++++++++++++++++++++++
>  3 files changed, 1384 insertions(+)
>  create mode 100755 drivers/gpu/drm/bridge/lontium-lt9611c.c
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index c3209b0f4678..32b85a2a65d9 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -177,6 +177,24 @@ config DRM_LONTIUM_LT9611
>  	  HDMI signals
>  	  Please say Y if you have such hardware.
>  
> +config DRM_LONTIUM_LT9611C
> +	tristate "Lontium LT9611C DSI/HDMI bridge"
> +	select SND_SOC_HDMI_CODEC if SND_SOC
> +	depends on OF
> +	select CRC8
> +	select FW_LOADER
> +	select DRM_PANEL_BRIDGE
> +	select DRM_KMS_HELPER
> +	select DRM_MIPI_DSI
> +	select DRM_DISPLAY_HELPER
> +	select DRM_DISPLAY_HDMI_STATE_HELPER
> +	select REGMAP_I2C
> +	help
> +	  Driver for Lontium DSI to HDMI bridge
> +	  chip driver that converts dual DSI and I2S to
> +	  HDMI signals
> +	  Please say Y if you have such hardware.
> +
>  config DRM_LONTIUM_LT9611UXC
>  	tristate "Lontium LT9611UXC DSI/HDMI bridge"
>  	select SND_SOC_HDMI_CODEC if SND_SOC
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index beab5b695a6e..92688be9692f 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -16,6 +16,7 @@ obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
>  obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
>  obj-$(CONFIG_DRM_LONTIUM_LT9211) += lontium-lt9211.o
>  obj-$(CONFIG_DRM_LONTIUM_LT9611) += lontium-lt9611.o
> +obj-$(CONFIG_DRM_LONTIUM_LT9611C) += lontium-lt9611c.o
>  obj-$(CONFIG_DRM_LONTIUM_LT9611UXC) += lontium-lt9611uxc.o
>  obj-$(CONFIG_DRM_LONTIUM_LT8713SX) += lontium-lt8713sx.o
>  obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> new file mode 100755
> index 000000000000..a6d11d0bddf5
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> @@ -0,0 +1,1365 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026 Lontium Semiconductor, Inc.
> + */
> +
> +#include <linux/crc8.h>
> +#include <linux/firmware.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include <drm/display/drm_hdmi_audio_helper.h>
> +#include <drm/display/drm_hdmi_state_helper.h>
> +#include <sound/hdmi-codec.h>
> +
> +#define FW_SIZE (64 * 1024)
> +#define LT_PAGE_SIZE 256
> +#define FW_FILE  "LT9611C.bin"

lt9611c_fw.bin

> +#define LT9611C_CRC_POLYNOMIAL 0x31
> +#define LT9611C_PAGE_CONTROL 0xff
> +
> +struct lt9611c {
> +	struct device *dev;
> +	struct i2c_client *client;
> +	struct drm_bridge bridge;
> +	struct drm_bridge *next_bridge;

Use drm_bridge::next_bridge instead.

> +	struct regmap *regmap;
> +	/* Protects all accesses to registers by stopping the on-chip MCU */
> +	struct mutex ocm_lock;
> +	struct work_struct work;
> +	struct device_node *dsi0_node;
> +	struct device_node *dsi1_node;
> +	struct mipi_dsi_device *dsi0;
> +	struct mipi_dsi_device *dsi1;
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data supplies[2];
> +	u32 chip_type;

Define a enum. Having if (chip_type == 2) doesn't help readability.

> +	const struct firmware *fw;

Please drop it from the global struct. It is not necessary once the
bridge is up and running.

> +	int fw_version;
> +	u8 fw_crc;
> +	bool hdmi_connected;

You've lost the imortant comment here.

> +};
> +
> +DECLARE_CRC8_TABLE(lt9611c_crc8_table);
> +
> +static const struct regmap_range_cfg lt9611c_ranges[] = {
> +	{
> +		.name = "register_range",
> +		.range_min =  0,
> +		.range_max = 0xffff,
> +		.selector_reg = LT9611C_PAGE_CONTROL,
> +		.selector_mask = 0xff,
> +		.selector_shift = 0,
> +		.window_start = 0,
> +		.window_len = 0x100,
> +	},
> +};
> +
> +static const struct regmap_config lt9611c_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0xffff,
> +	.ranges = lt9611c_ranges,
> +	.num_ranges = ARRAY_SIZE(lt9611c_ranges),
> +};
> +
> +static int lt9611c_read_write_flow(struct lt9611c *lt9611c, u8 *params,
> +				   unsigned int param_count, u8 *return_buffer,
> +				   unsigned int return_count)
> +{
> +	int count, i;
> +	unsigned int temp;
> +
> +	regmap_write(lt9611c->regmap, 0xe0de, 0x01);
> +
> +	count = 0;
> +	do {
> +		regmap_read(lt9611c->regmap, 0xe0ae, &temp);
> +		usleep_range(1000, 2000);
> +		count++;
> +	} while (count < 100 && temp != 0x01);

read_poll_timeout()

> +
> +	if (temp != 0x01)
> +		return -1;

-ETIMEDOUT

> +
> +	for (i = 0; i < param_count; i++) {
> +		if (i > 0xdd - 0xb0)

0xe0dd - 0xe0b0 at least.

> +			break;
> +
> +		regmap_write(lt9611c->regmap, 0xe0b0 + i, params[i]);
> +	}
> +
> +	regmap_write(lt9611c->regmap, 0xe0de, 0x02);
> +
> +	count = 0;
> +	do {
> +		regmap_read(lt9611c->regmap, 0xe0ae, &temp);
> +		usleep_range(1000, 2000);
> +		count++;
> +	} while (count < 100 && temp != 0x02);

Again, read_poll_timeout().

> +
> +	if (temp != 0x02)
> +		return -2;

-ETIMEDOUT

> +
> +	regmap_bulk_read(lt9611c->regmap, 0xe085, return_buffer, return_count);
> +
> +	return 0;
> +}
> +
> +static int lt9611c_prepare_firmware_data(struct lt9611c *lt9611c)
> +{
> +	struct device *dev = lt9611c->dev;
> +	int ret;
> +	u8 *buffer;
> +	size_t total_size = FW_SIZE - 1;
> +
> +	ret = request_firmware(&lt9611c->fw, FW_FILE, dev);
> +	if (ret) {
> +		dev_err(dev, "failed load file '%s', error type %d\n", FW_FILE, ret);
> +		return -EPROBE_DEFER;
> +	}
> +
> +	if (lt9611c->fw->size > total_size) {
> +		dev_err(dev, "firmware too large (%zu > %zu)\n", lt9611c->fw->size, total_size);
> +		release_firmware(lt9611c->fw);
> +		lt9611c->fw = NULL;
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(dev, "firmware size: %zu bytes\n", lt9611c->fw->size);
> +
> +	buffer = kzalloc(total_size, GFP_KERNEL);
> +	if (!buffer) {
> +		release_firmware(lt9611c->fw);
> +		lt9611c->fw = NULL;
> +		return -ENOMEM;
> +	}
> +
> +	memset(buffer, 0xff, total_size);
> +	memcpy(buffer, lt9611c->fw->data, lt9611c->fw->size);
> +
> +	lt9611c->fw_crc = crc8(lt9611c_crc8_table, buffer, total_size, 0);
> +
> +	dev_dbg(dev, "firmware crc: 0x%02x\n", lt9611c->fw_crc);
> +
> +	kfree(buffer);
> +	return 0;
> +}
> +
> +static void lt9611c_config_parameters(struct lt9611c *lt9611c)
> +{
> +	const struct reg_sequence seq_write_paras[] = {
> +		REG_SEQ0(0xe0ee, 0x01),
> +		REG_SEQ0(0xe103, 0x3f), //fifo rst
> +		REG_SEQ0(0xe103, 0xff),
> +		REG_SEQ0(0xe05e, 0xc1),
> +		REG_SEQ0(0xe058, 0x00),
> +		REG_SEQ0(0xe059, 0x50),
> +		REG_SEQ0(0xe05a, 0x10),
> +		REG_SEQ0(0xe05a, 0x00),
> +		REG_SEQ0(0xe058, 0x21),
> +	};
> +
> +	regmap_multi_reg_write(lt9611c->regmap, seq_write_paras, ARRAY_SIZE(seq_write_paras));
> +}
> +
> +static void lt9611c_wren(struct lt9611c *lt9611c)
> +{
> +	regmap_write(lt9611c->regmap, 0xe05a, 0x04);
> +	regmap_write(lt9611c->regmap, 0xe05a, 0x00);
> +}
> +
> +static void lt9611c_wrdi(struct lt9611c *lt9611c)
> +{
> +	regmap_write(lt9611c->regmap, 0xe05a, 0x08);
> +	regmap_write(lt9611c->regmap, 0xe05a, 0x00);
> +}
> +
> +static void lt9611c_erase_op(struct lt9611c *lt9611c, u32 addr)
> +{
> +	const struct reg_sequence seq_write[] = {
> +		REG_SEQ0(0xe0ee, 0x01),
> +		REG_SEQ0(0xe05a, 0x04),
> +		REG_SEQ0(0xe05a, 0x00),
> +		REG_SEQ0(0xe05b, (addr >> 16) & 0xff),
> +		REG_SEQ0(0xe05c, (addr >> 8) & 0xff),
> +		REG_SEQ0(0xe05d, addr & 0xff),
> +		REG_SEQ0(0xe05a, 0x01),
> +		REG_SEQ0(0xe05a, 0x00),
> +	};
> +
> +	regmap_multi_reg_write(lt9611c->regmap, seq_write, ARRAY_SIZE(seq_write));
> +}
> +
> +static void read_flash_reg_status(struct lt9611c *lt9611c, unsigned int *status)
> +{
> +	const struct reg_sequence seq_write[] = {
> +		REG_SEQ0(0xe103, 0x3f),
> +		REG_SEQ0(0xe103, 0xff),
> +		REG_SEQ0(0xe05e, 0x40),
> +		REG_SEQ0(0xe056, 0x05),
> +		REG_SEQ0(0xe055, 0x25),
> +		REG_SEQ0(0xe055, 0x01),
> +		REG_SEQ0(0xe058, 0x21),
> +	};
> +
> +	regmap_multi_reg_write(lt9611c->regmap, seq_write, ARRAY_SIZE(seq_write));
> +
> +	regmap_read(lt9611c->regmap, 0xe05f, status);
> +}
> +
> +static void lt9611c_crc_to_sram(struct lt9611c *lt9611c)
> +{
> +	const struct reg_sequence seq_write[] = {
> +		REG_SEQ0(0xe051, 0x00),
> +		REG_SEQ0(0xe055, 0xc0),
> +		REG_SEQ0(0xe055, 0x80),
> +		REG_SEQ0(0xe05e, 0xc0),
> +		REG_SEQ0(0xe058, 0x21),
> +	};
> +
> +	regmap_multi_reg_write(lt9611c->regmap, seq_write, ARRAY_SIZE(seq_write));
> +}
> +
> +static void lt9611c_data_to_sram(struct lt9611c *lt9611c)
> +{
> +	const struct reg_sequence seq_write[] = {
> +		REG_SEQ0(0xe051, 0xff),
> +		REG_SEQ0(0xe055, 0x80),
> +		REG_SEQ0(0xe05e, 0xc0),
> +		REG_SEQ0(0xe058, 0x21),
> +	};
> +
> +	regmap_multi_reg_write(lt9611c->regmap, seq_write, ARRAY_SIZE(seq_write));
> +}
> +
> +static void lt9611c_sram_to_flash(struct lt9611c *lt9611c, size_t addr)
> +{
> +	const struct reg_sequence seq_write[] = {
> +		REG_SEQ0(0xe05b, (addr >> 16) & 0xff),
> +		REG_SEQ0(0xe05c, (addr >> 8) & 0xff),
> +		REG_SEQ0(0xe05d, addr & 0xff),
> +		REG_SEQ0(0xe05a, 0x30),
> +		REG_SEQ0(0xe05a, 0x00),
> +	};
> +
> +	regmap_multi_reg_write(lt9611c->regmap, seq_write, ARRAY_SIZE(seq_write));
> +}
> +
> +static void lt9611c_block_erase(struct lt9611c *lt9611c)
> +{
> +	struct device *dev = lt9611c->dev;
> +	int i;
> +	unsigned int block_num;
> +	unsigned int flash_status = 0;
> +	u32 flash_addr = 0;
> +
> +	for (block_num = 0; block_num < 2; block_num++) {
> +		flash_addr = (block_num * 0x008000);
> +		lt9611c_erase_op(lt9611c, flash_addr);
> +		msleep(100);
> +		i = 0;
> +		while (1) {
> +			read_flash_reg_status(lt9611c, &flash_status);
> +			if ((flash_status & 0x01) == 0)
> +				break;
> +
> +			if (i > 50)
> +				break;
> +
> +			i++;
> +			msleep(50);
> +		}
> +	}
> +
> +	dev_dbg(dev, "erase flash done.\n");
> +}
> +
> +static int lt9611c_write_data(struct lt9611c *lt9611c, size_t addr)
> +{
> +	struct device *dev = lt9611c->dev;
> +	int ret;
> +	unsigned int page = 0, num = 0, i = 0;
> +	size_t size, index;
> +	const u8 *data;
> +	u8 value;
> +
> +	data = lt9611c->fw->data;
> +	size = lt9611c->fw->size;
> +	page = (size + LT_PAGE_SIZE - 1) / LT_PAGE_SIZE;
> +	if (page * LT_PAGE_SIZE > FW_SIZE) {
> +		dev_err(dev, "firmware size out of range\n");
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(dev, "%u pages, total size %zu byte\n", page, size);
> +
> +	for (num = 0; num < page; num++) {
> +		lt9611c_data_to_sram(lt9611c);
> +
> +		for (i = 0; i < LT_PAGE_SIZE; i++) {
> +			index = num * LT_PAGE_SIZE + i;
> +			value = (index < size) ? data[index] : 0xff;
> +
> +			ret = regmap_write(lt9611c->regmap, 0xe059, value);
> +			if (ret < 0) {
> +				dev_err(dev, "write error at page %u, index %u\n", num, i);
> +				return ret;
> +			}
> +		}
> +
> +		lt9611c_wren(lt9611c);
> +		lt9611c_sram_to_flash(lt9611c, addr);
> +
> +		addr += LT_PAGE_SIZE;
> +	}
> +
> +	lt9611c_wrdi(lt9611c);
> +
> +	return 0;
> +}
> +
> +static int lt9611c_write_crc(struct lt9611c *lt9611c, size_t addr)
> +{
> +	struct device *dev = lt9611c->dev;
> +	int ret;
> +	u8 crc;
> +
> +	crc = lt9611c->fw_crc;
> +	lt9611c_crc_to_sram(lt9611c);
> +	ret = regmap_write(lt9611c->regmap, 0xe059, crc);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to write crc\n");
> +		return ret;
> +	}
> +
> +	lt9611c_wren(lt9611c);
> +	lt9611c_sram_to_flash(lt9611c, addr);
> +	lt9611c_wrdi(lt9611c);
> +
> +	dev_dbg(dev, "crc 0x%02x written to flash at addr 0x%zx\n", crc, addr);
> +
> +	return 0;
> +}
> +
> +static int lt9611c_firmware_upgrade(struct lt9611c *lt9611c)
> +{
> +	struct device *dev = lt9611c->dev;
> +	int ret;
> +
> +	ret = lt9611c_prepare_firmware_data(lt9611c);
> +	if (ret < 0)
> +		return ret;
> +
> +	dev_dbg(dev, "starting firmware upgrade, size: %zu bytes\n", lt9611c->fw->size);
> +
> +	lt9611c_config_parameters(lt9611c);
> +	lt9611c_block_erase(lt9611c);
> +
> +	ret = lt9611c_write_data(lt9611c, 0);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to write firmware data\n");
> +		return ret;
> +	}
> +
> +	release_firmware(lt9611c->fw);
> +	lt9611c->fw = NULL;
> +
> +	ret = lt9611c_write_crc(lt9611c, FW_SIZE - 1);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to write firmware crc\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int lt9611c_upgrade_result(struct lt9611c *lt9611c)
> +{
> +	struct device *dev = lt9611c->dev;
> +	unsigned int crc_result;
> +
> +	regmap_write(lt9611c->regmap, 0xe0ee, 0x01);
> +	regmap_read(lt9611c->regmap, 0xe021, &crc_result);
> +
> +	if (crc_result != lt9611c->fw_crc) {
> +		dev_err(dev, "lt9611c fw upgrade failed, expected crc=0x%02x, read crc=0x%02x\n",
> +			lt9611c->fw_crc, crc_result);
> +		return -1;
> +	}
> +
> +	dev_dbg(dev, "lt9611c firmware upgrade success, crc=0x%02x\n", crc_result);
> +	return 0;
> +}
> +
> +static struct lt9611c *bridge_to_lt9611c(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct lt9611c, bridge);
> +}
> +
> +/*read only*/
> +static const struct lt9611c *bridge_to_lt9611c_const(const struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, const struct lt9611c, bridge);
> +}
> +
> +static void lt9611c_lock(struct lt9611c *lt9611c)
> +{
> +	mutex_lock(&lt9611c->ocm_lock);
> +	regmap_write(lt9611c->regmap, 0xe0ee, 0x01);
> +}
> +
> +static void lt9611c_unlock(struct lt9611c *lt9611c)
> +{
> +	regmap_write(lt9611c->regmap, 0xe0ee, 0x00);
> +	mutex_unlock(&lt9611c->ocm_lock);
> +}
> +
> +static irqreturn_t lt9611c_irq_thread_handler(int irq, void *dev_id)
> +{
> +	struct lt9611c *lt9611c = dev_id;
> +	struct device *dev = lt9611c->dev;
> +	int ret;
> +	unsigned int irq_status;
> +	u8 cmd[5] = {0x52, 0x48, 0x31, 0x3a, 0x00};
> +	u8 data[5];
> +
> +	mutex_lock(&lt9611c->ocm_lock);

Where applicable (like here) please switch to
guard(mutex)(&lt9611c->ocm_lock);

> +
> +	regmap_read(lt9611c->regmap, 0xe084, &irq_status);
> +	if (!(irq_status & BIT(0))) {
> +		mutex_unlock(&lt9611c->ocm_lock);
> +		return IRQ_HANDLED;
> +	}
> +
> +	ret = lt9611c_read_write_flow(lt9611c, cmd, 5, data, 5);

Here and in all other places. Switch to ARRAY_SIZE instead of specifying
lengths directly.

> +	if (ret) {
> +		dev_err(dev, "failed to read HPD status\n");
> +	} else {
> +		lt9611c->hdmi_connected = (data[4] == 0x02);
> +		dev_dbg(dev, "HDMI %s\n", lt9611c->hdmi_connected ? "connected" : "disconnected");
> +	}
> +
> +	schedule_work(&lt9611c->work);
> +
> +	/*clear interrupt*/
> +	regmap_write(lt9611c->regmap, 0xe0df, irq_status & BIT(0));
> +	//hardware need delay
> +	usleep_range(10000, 12000);
> +	regmap_write(lt9611c->regmap, 0xe0df, irq_status & (~BIT(0)));
> +
> +	mutex_unlock(&lt9611c->ocm_lock);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void lt9611c_hpd_work(struct work_struct *work)
> +{
> +	struct lt9611c *lt9611c = container_of(work, struct lt9611c, work);
> +	bool connected;
> +
> +	mutex_lock(&lt9611c->ocm_lock);
> +	connected = lt9611c->hdmi_connected;
> +	mutex_unlock(&lt9611c->ocm_lock);
> +
> +	drm_bridge_hpd_notify(&lt9611c->bridge,
> +			      connected ? connector_status_connected :
> +			      connector_status_disconnected);
> +}
> +
> +static void lt9611c_reset(struct lt9611c *lt9611c)
> +{
> +	gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> +	msleep(20);
> +
> +	gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
> +	msleep(20);
> +
> +	gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> +	msleep(400);
> +
> +	dev_dbg(lt9611c->dev, "lt9611c reset");
> +}
> +
> +static int lt9611c_regulator_init(struct lt9611c *lt9611c)
> +{
> +	struct device *dev = lt9611c->dev;
> +	int ret;
> +
> +	lt9611c->supplies[0].supply = "vcc";
> +	lt9611c->supplies[1].supply = "vdd";
> +
> +	ret = devm_regulator_bulk_get(dev, 2, lt9611c->supplies);
> +
> +	return ret;
> +}
> +
> +static int lt9611c_regulator_enable(struct lt9611c *lt9611c)
> +{
> +	int ret;
> +
> +	ret = regulator_enable(lt9611c->supplies[0].consumer);
> +	if (ret < 0)
> +		return ret;
> +
> +	usleep_range(5000, 10000);
> +
> +	ret = regulator_enable(lt9611c->supplies[1].consumer);
> +	if (ret < 0) {
> +		regulator_disable(lt9611c->supplies[0].consumer);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int lt9611c_regulator_disable(struct lt9611c *lt9611c)
> +{
> +	int ret;
> +
> +	ret = regulator_disable(lt9611c->supplies[0].consumer);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regulator_disable(lt9611c->supplies[1].consumer);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static struct mipi_dsi_device *lt9611c_attach_dsi(struct lt9611c *lt9611c,
> +						  struct device_node *dsi_node)
> +{
> +	const struct mipi_dsi_device_info info = { "lt9611c", 0, NULL };
> +	struct mipi_dsi_device *dsi;
> +	struct mipi_dsi_host *host;
> +	struct device *dev = lt9611c->dev;
> +	int ret;
> +
> +	host = of_find_mipi_dsi_host_by_node(dsi_node);
> +	if (!host) {
> +		dev_err(dev, "failed to find dsi host\n");
> +		return ERR_PTR(-EPROBE_DEFER);

here and futher, in the probe path use `return dev_err_probe()`.

> +	}
> +
> +	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
> +	if (IS_ERR(dsi)) {
> +		dev_err(dev, "failed to create dsi device\n");
> +		return dsi;
> +	}
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +			 MIPI_DSI_MODE_VIDEO_HSE;
> +
> +	ret = devm_mipi_dsi_attach(dev, dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to attach dsi to host\n");
> +		return ERR_PTR(ret);
> +	}
> +
> +	return dsi;
> +}
> +
> +static int lt9611c_bridge_attach(struct drm_bridge *bridge,
> +				 struct drm_encoder *encoder,
> +				 enum drm_bridge_attach_flags flags)
> +{
> +	struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> +
> +	return drm_bridge_attach(encoder, lt9611c->next_bridge, bridge, flags);
> +}
> +
> +static enum drm_mode_status
> +lt9611c_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
> +				  const struct drm_display_mode *mode,
> +				  unsigned long long tmds_rate)
> +{
> +	const struct lt9611c *lt9611c = bridge_to_lt9611c_const(bridge);
> +
> +	if (lt9611c->chip_type == 2) {
> +		/*lt9611uxd use*/
> +		if (tmds_rate > 600000000)
> +			return MODE_CLOCK_HIGH;
> +
> +	} else {
> +		if (tmds_rate > 340000000)
> +			return MODE_CLOCK_HIGH;
> +	}
> +
> +	if (tmds_rate < 25000000)
> +		return MODE_CLOCK_LOW;
> +
> +	return MODE_OK;
> +}
> +
> +static void lt9611c_video_setup(struct lt9611c *lt9611c,
> +				const struct drm_display_mode *mode)
> +{
> +	struct device *dev = lt9611c->dev;
> +	int ret;
> +	u32 h_total, hactive, hsync_len, hfront_porch, hback_porch;
> +	u32 v_total, vactive, vsync_len, vfront_porch, vback_porch;
> +	u8 video_timing_set_cmd[26] = {0x57, 0x4d, 0x33, 0x3a};
> +	u8 return_timing_set_param[3];
> +	u8 framerate;
> +	u8 vic = 0x00;
> +
> +	mutex_lock(&lt9611c->ocm_lock);
> +
> +	h_total = mode->htotal;
> +	hactive = mode->hdisplay;
> +	hsync_len = mode->hsync_end - mode->hsync_start;
> +	hfront_porch = mode->hsync_start - mode->hdisplay;
> +	hback_porch = mode->htotal - mode->hsync_end;
> +
> +	v_total = mode->vtotal;
> +	vactive = mode->vdisplay;
> +	vsync_len = mode->vsync_end - mode->vsync_start;
> +	vfront_porch = mode->vsync_start - mode->vdisplay;
> +	vback_porch = mode->vtotal - mode->vsync_end;
> +	framerate = drm_mode_vrefresh(mode);
> +	vic = drm_match_cea_mode(mode);
> +
> +	dev_dbg(dev, "hactive=%d, vactive=%d\n", hactive, vactive);
> +	dev_dbg(dev, "framerate=%d\n", framerate);
> +	dev_dbg(dev, "vic = 0x%02x\n", vic);
> +
> +	video_timing_set_cmd[4] = (h_total >> 8) & 0xff;
> +	video_timing_set_cmd[5] = h_total & 0xff;
> +	video_timing_set_cmd[6] = (hactive >> 8) & 0xff;
> +	video_timing_set_cmd[7] = hactive & 0xff;
> +	video_timing_set_cmd[8] = (hfront_porch >> 8) & 0xff;
> +	video_timing_set_cmd[9] = hfront_porch & 0xff;
> +	video_timing_set_cmd[10] = (hsync_len >> 8) & 0xff;
> +	video_timing_set_cmd[11] = hsync_len & 0xff;
> +	video_timing_set_cmd[12] = (hback_porch >> 8) & 0xff;
> +	video_timing_set_cmd[13] = hback_porch & 0xff;
> +	video_timing_set_cmd[14] = (v_total >> 8) & 0xff;
> +	video_timing_set_cmd[15] = v_total & 0xff;
> +	video_timing_set_cmd[16] = (vactive >> 8) & 0xff;
> +	video_timing_set_cmd[17] = vactive & 0xFF;
> +	video_timing_set_cmd[18] = (vfront_porch >> 8) & 0xff;
> +	video_timing_set_cmd[19] = vfront_porch & 0xff;
> +	video_timing_set_cmd[20] = (vsync_len >> 8) & 0xff;
> +	video_timing_set_cmd[21] = vsync_len & 0xff;
> +	video_timing_set_cmd[22] = (vback_porch >> 8) & 0xff;
> +	video_timing_set_cmd[23] = vback_porch & 0xff;
> +	video_timing_set_cmd[24] = framerate;
> +	video_timing_set_cmd[25] = vic;
> +
> +	ret = lt9611c_read_write_flow(lt9611c,
> +				      video_timing_set_cmd, 26,
> +				      return_timing_set_param, 3);
> +	if (ret)
> +		dev_err(dev, "video set failed\n");
> +	mutex_unlock(&lt9611c->ocm_lock);
> +}
> +
> +static void lt9611c_bridge_atomic_enable(struct drm_bridge *bridge,
> +					 struct drm_atomic_state *state)
> +{
> +	struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> +	struct drm_connector *connector;
> +	struct drm_connector_state *conn_state;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_display_mode *mode;
> +
> +	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
> +	if (WARN_ON(!connector))
> +		return;
> +
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	if (WARN_ON(!conn_state))
> +		return;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> +	if (WARN_ON(!crtc_state))
> +		return;
> +
> +	mode = &crtc_state->adjusted_mode;
> +
> +	lt9611c_video_setup(lt9611c, mode);
> +}
> +
> +static enum drm_connector_status
> +lt9611c_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
> +{
> +	struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> +	struct device *dev = lt9611c->dev;
> +	int ret;
> +	bool connected = false;
> +	u8 cmd[5] = {0x52, 0x48, 0x31, 0x3a, 0x00};
> +	u8 data[5];
> +
> +	mutex_lock(&lt9611c->ocm_lock);
> +
> +	ret = lt9611c_read_write_flow(lt9611c, cmd, 5, data, 5);
> +	if (ret)
> +		dev_err(dev, "failed to read HPD status (err=%d)\n", ret);
> +	else
> +		connected = (data[4] == 0x02);
> +
> +	lt9611c->hdmi_connected = connected;
> +
> +	mutex_unlock(&lt9611c->ocm_lock);
> +
> +	return connected ? connector_status_connected :
> +				connector_status_disconnected;
> +}
> +
> +static int lt9611c_get_edid_block(void *data, u8 *buf,
> +				  unsigned int block, size_t len)
> +{
> +	struct lt9611c *lt9611c = data;
> +	struct device *dev = lt9611c->dev;
> +	u8 cmd[5] = {0x52, 0x48, 0x33, 0x3a, 0x00};
> +	u8 packet[37];
> +	int ret, i, offset = 0;
> +
> +	if (len != 128)
> +		return -EINVAL;
> +	mutex_lock(&lt9611c->ocm_lock);
> +
> +	for (i = 0; i < 4; i++) {
> +		cmd[4] = block * 4 + i;
> +		ret = lt9611c_read_write_flow(lt9611c, cmd, sizeof(cmd),
> +					      packet, sizeof(packet));
> +		if (ret) {
> +			dev_err(dev, "Failed to read EDID block %u packet %d\n",
> +				block, i);
> +			mutex_unlock(&lt9611c->ocm_lock);
> +			return ret;
> +		}
> +
> +		memcpy(buf + offset, &packet[5], 32);
> +		offset += 32;
> +	}
> +
> +	mutex_unlock(&lt9611c->ocm_lock);
> +
> +	return 0;
> +}
> +
> +static const struct drm_edid *lt9611c_bridge_edid_read(struct drm_bridge *bridge,
> +						       struct drm_connector *connector)
> +{
> +	struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> +
> +	return drm_edid_read_custom(connector, lt9611c_get_edid_block, lt9611c);
> +}
> +
> +static void lt9611c_bridge_hpd_notify(struct drm_bridge *bridge,
> +				      struct drm_connector *connector,
> +				      enum drm_connector_status status)
> +{
> +	const struct drm_edid *drm_edid;
> +
> +	if (status == connector_status_disconnected) {
> +		drm_connector_hdmi_audio_plugged_notify(connector, false);
> +		drm_edid_connector_update(connector, NULL);
> +		return;
> +	}
> +
> +	drm_edid = lt9611c_bridge_edid_read(bridge, connector);
> +	drm_edid_connector_update(connector, drm_edid);
> +	drm_edid_free(drm_edid);
> +
> +	if (status == connector_status_connected)
> +		drm_connector_hdmi_audio_plugged_notify(connector, true);
> +}
> +
> +static int lt9611c_hdmi_write_audio_infoframe(struct drm_bridge *bridge,
> +					      const u8 *buffer, size_t len)
> +{
> +	struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> +	u8 audio_infoframe_cmd[16] = {0x57, 0x48, 0x35, 0x3a, 0x02};
> +	u8 data[5];
> +	int i, ret;
> +
> +	for (i = 0; i <  len; i++)
> +		audio_infoframe_cmd[i + 5] = buffer[i];
> +
> +	mutex_lock(&lt9611c->ocm_lock);
> +
> +	ret = lt9611c_read_write_flow(lt9611c, audio_infoframe_cmd, sizeof(audio_infoframe_cmd),
> +				      data, sizeof(data));
> +	mutex_unlock(&lt9611c->ocm_lock);
> +
> +	if (ret < 0) {
> +		dev_err(lt9611c->dev, "write audio infoframe failed!\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int lt9611c_hdmi_clear_audio_infoframe(struct drm_bridge *bridge)
> +{
> +	return 0;

Hmm? What if we need to clear the infoframe?

> +}
> +
> +static int lt9611c_hdmi_write_avi_infoframe(struct drm_bridge *bridge,
> +					    const u8 *buffer, size_t len)
> +{
> +	struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> +	u8 avi_infoframe_cmd[16] = {0x57, 0x48, 0x35, 0x3a, 0x01};
> +	u8 data[5];
> +	int i, ret;
> +
> +	for (i = 0; i <  len; i++)
> +		avi_infoframe_cmd[i + 5] = buffer[i];
> +
> +	mutex_lock(&lt9611c->ocm_lock);
> +
> +	ret = lt9611c_read_write_flow(lt9611c, avi_infoframe_cmd, sizeof(avi_infoframe_cmd),
> +				      data, sizeof(data));
> +	mutex_unlock(&lt9611c->ocm_lock);
> +
> +	if (ret < 0) {
> +		dev_err(lt9611c->dev, "write avi infoframe failed!\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int lt9611c_hdmi_clear_avi_infoframe(struct drm_bridge *bridge)
> +{

The same question.

> +	return 0;
> +}
> +
> +static int lt9611c_hdmi_write_spd_infoframe(struct drm_bridge *bridge,
> +					    const u8 *buffer, size_t len)
> +{
> +	struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> +	u8 spd_infoframe_cmd[16] = {0x57, 0x48, 0x35, 0x3a, 0x04};
> +	u8 data[5];
> +	int i, ret;
> +
> +	for (i = 0; i <  len; i++)
> +		spd_infoframe_cmd[i + 5] = buffer[i];
> +
> +	mutex_lock(&lt9611c->ocm_lock);
> +
> +	ret = lt9611c_read_write_flow(lt9611c, spd_infoframe_cmd, sizeof(spd_infoframe_cmd),
> +				      data, sizeof(data));
> +	mutex_unlock(&lt9611c->ocm_lock);
> +
> +	if (ret < 0) {
> +		dev_err(lt9611c->dev, "write spd infoframe failed!\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int lt9611c_hdmi_clear_spd_infoframe(struct drm_bridge *bridge)
> +{
> +	return 0;
> +}
> +
> +static int lt9611c_hdmi_write_hdmi_infoframe(struct drm_bridge *bridge,
> +					     const u8 *buffer, size_t len)
> +{
> +	struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> +	u8 spd_infoframe_cmd[16] = {0x57, 0x48, 0x35, 0x3a, 0x05};
> +	u8 data[5];
> +	int i, ret;
> +
> +	for (i = 0; i <  len; i++)
> +		spd_infoframe_cmd[i + 5] = buffer[i];
> +
> +	mutex_lock(&lt9611c->ocm_lock);
> +
> +	ret = lt9611c_read_write_flow(lt9611c, spd_infoframe_cmd, sizeof(spd_infoframe_cmd),
> +				      data, sizeof(data));
> +	mutex_unlock(&lt9611c->ocm_lock);
> +	if (ret < 0) {
> +		dev_err(lt9611c->dev, "write hdmi infoframe failed!\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int lt9611c_hdmi_clear_hdmi_infoframe(struct drm_bridge *bridge)
> +{
> +	return 0;
> +}
> +
> +static int lt9611c_hdmi_audio_prepare(struct drm_bridge *bridge,
> +				      struct drm_connector *connector,
> +				      struct hdmi_codec_daifmt *fmt,
> +				      struct hdmi_codec_params *hparms)
> +{
> +	struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> +	u8 audio_cmd[6] = {0x57, 0x48, 0x36, 0x3a};
> +	u8 data[5];
> +	int ret;
> +
> +	/* Validate sample rate and width (LT9611C auto-detects but we still check) */

What for? You don't trust ASoC / ALSA core that the rates would match
HDMI_RATES?

> +	switch (hparms->sample_rate) {
> +	case 32000:
> +	case 44100:
> +	case 48000:
> +	case 88200:
> +	case 96000:
> +	case 176400:
> +	case 192000:
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	switch (hparms->sample_width) {
> +	case 16:
> +	case 18:
> +	case 20:
> +	case 24:

and no support for 32?

> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	switch (fmt->fmt) {
> +	case HDMI_I2S:
> +		audio_cmd[4] = 0x01;
> +		break;
> +	case HDMI_SPDIF:
> +		audio_cmd[4] = 0x02;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	audio_cmd[5] = hparms->channels;
> +
> +	mutex_lock(&lt9611c->ocm_lock);
> +	ret = lt9611c_read_write_flow(lt9611c, audio_cmd, sizeof(audio_cmd),
> +				      data, sizeof(data));
> +	mutex_unlock(&lt9611c->ocm_lock);
> +
> +	if (ret < 0) {
> +		dev_err(lt9611c->dev, "set audio info failed!\n");
> +		return ret;
> +	}
> +
> +	return drm_atomic_helper_connector_hdmi_update_audio_infoframe(connector,
> +									&hparms->cea);

Please check the indentation.

> +}
> +
> +static void lt9611c_hdmi_audio_shutdown(struct drm_bridge *bridge,
> +					struct drm_connector *connector)
> +{
> +	drm_atomic_helper_connector_hdmi_clear_audio_infoframe(connector);
> +}
> +
> +static int lt9611c_hdmi_audio_startup(struct drm_bridge *bridge,
> +				      struct drm_connector *connector)
> +{
> +	return 0;
> +}
> +
> +static const struct drm_bridge_funcs lt9611c_bridge_funcs = {
> +	.attach = lt9611c_bridge_attach,
> +	.detect = lt9611c_bridge_detect,
> +	.edid_read = lt9611c_bridge_edid_read,
> +	.hpd_notify = lt9611c_bridge_hpd_notify,
> +	.atomic_enable = lt9611c_bridge_atomic_enable,
> +
> +	.hdmi_tmds_char_rate_valid = lt9611c_hdmi_tmds_char_rate_valid,
> +	.hdmi_write_audio_infoframe = lt9611c_hdmi_write_audio_infoframe,
> +	.hdmi_clear_audio_infoframe = lt9611c_hdmi_clear_audio_infoframe,
> +	.hdmi_write_avi_infoframe = lt9611c_hdmi_write_avi_infoframe,
> +	.hdmi_clear_avi_infoframe = lt9611c_hdmi_clear_avi_infoframe,
> +	.hdmi_write_spd_infoframe = lt9611c_hdmi_write_spd_infoframe,
> +	.hdmi_clear_spd_infoframe = lt9611c_hdmi_clear_spd_infoframe,
> +	.hdmi_write_hdmi_infoframe = lt9611c_hdmi_write_hdmi_infoframe,
> +	.hdmi_clear_hdmi_infoframe = lt9611c_hdmi_clear_hdmi_infoframe,

You implemented all these callbacks, but you haven't tested them. They
won't be called as is. You would need to set one more DRM bridge OP. And
once set, you can drop the .hpd_notify, it will be handled by the
generic code.

> +	.hdmi_audio_startup = lt9611c_hdmi_audio_startup,
> +	.hdmi_audio_prepare = lt9611c_hdmi_audio_prepare,
> +	.hdmi_audio_shutdown = lt9611c_hdmi_audio_shutdown,
> +};
> +
> +static int lt9611c_parse_dt(struct device *dev,
> +			    struct lt9611c *lt9611c)
> +{
> +	lt9611c->dsi0_node = of_graph_get_remote_node(dev->of_node, 0, -1);
> +	if (!lt9611c->dsi0_node) {
> +		dev_err(dev, "failed to get remote node for primary dsi\n");
> +		return -ENODEV;
> +	}
> +
> +	lt9611c->dsi1_node = of_graph_get_remote_node(dev->of_node, 1, -1);
> +
> +	return drm_of_find_panel_or_bridge(dev->of_node, 2, -1, NULL, &lt9611c->next_bridge);
> +}
> +
> +static int lt9611c_gpio_init(struct lt9611c *lt9611c)
> +{
> +	struct device *dev = lt9611c->dev;
> +
> +	lt9611c->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(lt9611c->reset_gpio)) {
> +		dev_err(dev, "failed to acquire reset gpio\n");
> +		return PTR_ERR(lt9611c->reset_gpio);
> +	}
> +
> +	return 0;
> +}
> +
> +static int lt9611c_read_version(struct lt9611c *lt9611c)
> +{
> +	u8 buf[2];
> +	int ret;
> +
> +	ret = regmap_write(lt9611c->regmap, 0xe0ee, 0x01);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_bulk_read(lt9611c->regmap, 0xe080, buf, 2);
> +	if (ret)
> +		return ret;
> +
> +	return (buf[0] << 8) | buf[1];
> +}
> +
> +static int lt9611c_read_chipid(struct lt9611c *lt9611c)
> +{
> +	struct device *dev = lt9611c->dev;
> +	u8 chipid[2];
> +	int ret;
> +
> +	ret = regmap_write(lt9611c->regmap, 0xe0ee, 0x01);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_bulk_read(lt9611c->regmap, 0xe100, chipid, 2);
> +	if (ret)
> +		return ret;
> +
> +	if (chipid[0] != 0x23 || chipid[1] != 0x06) {
> +		dev_err(dev, "ChipID: 0x%02x 0x%02x\n", chipid[0], chipid[1]);
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> +static ssize_t lt9611c_firmware_store(struct device *dev, struct device_attribute *attr,
> +				      const char *buf, size_t len)
> +{
> +	struct lt9611c *lt9611c = dev_get_drvdata(dev);
> +	int ret;
> +
> +	lt9611c_lock(lt9611c);
> +
> +	ret = lt9611c_firmware_upgrade(lt9611c);
> +	if (ret < 0) {
> +		dev_err(dev, "upgrade failure\n");
> +		goto out;
> +	}
> +	lt9611c_reset(lt9611c);
> +	ret = lt9611c_upgrade_result(lt9611c);
> +	if (ret < 0)
> +		goto out;
> +
> +out:
> +	lt9611c_unlock(lt9611c);
> +	lt9611c_reset(lt9611c);
> +	if (lt9611c->fw) {
> +		release_firmware(lt9611c->fw);
> +		lt9611c->fw = NULL;
> +	}
> +
> +	return ret < 0 ? ret : len;
> +}
> +
> +static ssize_t lt9611c_firmware_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct lt9611c *lt9611c = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "0x%04x\n", lt9611c->fw_version);
> +}
> +
> +static DEVICE_ATTR_RW(lt9611c_firmware);
> +
> +static struct attribute *lt9611c_attrs[] = {
> +	&dev_attr_lt9611c_firmware.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group lt9611c_attr_group = {
> +	.attrs = lt9611c_attrs,
> +};
> +
> +static const struct attribute_group *lt9611c_attr_groups[] = {
> +	&lt9611c_attr_group,
> +	NULL,
> +};
> +
> +static int lt9611c_probe(struct i2c_client *client)
> +{
> +	const struct i2c_device_id *id = i2c_client_get_device_id(client);
> +	struct lt9611c *lt9611c;
> +	struct device *dev = &client->dev;
> +	bool fw_updated = false;
> +	int ret;
> +
> +	crc8_populate_msb(lt9611c_crc8_table, LT9611C_CRC_POLYNOMIAL);
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> +		dev_err(dev, "device doesn't support I2C\n");
> +		return -ENODEV;
> +	}
> +
> +	lt9611c = devm_drm_bridge_alloc(dev, struct lt9611c, bridge, &lt9611c_bridge_funcs);
> +	if (IS_ERR(lt9611c))
> +		return PTR_ERR(lt9611c);
> +
> +	lt9611c->dev = dev;
> +	lt9611c->client = client;
> +	lt9611c->chip_type = id->driver_data;
> +	mutex_init(&lt9611c->ocm_lock);
> +
> +	lt9611c->regmap = devm_regmap_init_i2c(client, &lt9611c_regmap_config);
> +	if (IS_ERR(lt9611c->regmap)) {
> +		dev_err(dev, "regmap i2c init failed\n");
> +		return PTR_ERR(lt9611c->regmap);
> +	}
> +
> +	ret = lt9611c_parse_dt(dev, lt9611c);
> +	if (ret) {
> +		dev_err(dev, "failed to parse device tree\n");
> +		return ret;
> +	}
> +
> +	ret = lt9611c_gpio_init(lt9611c);
> +	if (ret < 0)
> +		goto err_of_put;
> +
> +	ret = lt9611c_regulator_init(lt9611c);
> +	if (ret < 0)
> +		goto err_of_put;
> +
> +	ret = lt9611c_regulator_enable(lt9611c);
> +	if (ret)
> +		goto err_of_put;
> +
> +	lt9611c_reset(lt9611c);
> +
> +	lt9611c_lock(lt9611c);
> +
> +	ret = lt9611c_read_chipid(lt9611c);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to read chip id.\n");
> +		lt9611c_unlock(lt9611c);
> +		goto err_disable_regulators;
> +	}
> +
> +retry:
> +	ret = lt9611c_read_version(lt9611c);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to read fw version\n");
> +		lt9611c_unlock(lt9611c);
> +		goto err_disable_regulators;
> +
> +	} else if (ret == 0) {
> +		if (!fw_updated) {
> +			fw_updated = true;
> +			ret = lt9611c_firmware_upgrade(lt9611c);
> +			if (ret < 0) {
> +				lt9611c_unlock(lt9611c);
> +				goto err_disable_regulators;
> +			}
> +
> +			lt9611c_reset(lt9611c);
> +
> +			ret = lt9611c_upgrade_result(lt9611c);
> +			if (ret < 0) {
> +				lt9611c_unlock(lt9611c);
> +				goto err_disable_regulators;
> +			}
> +
> +			goto retry;
> +
> +		} else {
> +			dev_err(dev, "fw version 0x%04x, update failed\n", ret);
> +			ret = -EOPNOTSUPP;
> +			lt9611c_unlock(lt9611c);
> +			goto err_disable_regulators;
> +		}
> +	}
> +
> +	lt9611c_unlock(lt9611c);
> +	lt9611c->fw_version = ret;
> +
> +	dev_dbg(dev, "current version:0x%04x", lt9611c->fw_version);
> +
> +	INIT_WORK(&lt9611c->work, lt9611c_hpd_work);
> +
> +	ret = devm_request_threaded_irq(&client->dev, client->irq, NULL,
> +					lt9611c_irq_thread_handler,
> +					IRQF_TRIGGER_FALLING |
> +					IRQF_ONESHOT |
> +					IRQF_NO_AUTOEN,
> +					"lt9611c", lt9611c);
> +	if (ret) {
> +		dev_err(dev, "failed to request irq\n");
> +		goto err_disable_regulators;
> +	}
> +
> +	lt9611c->bridge.of_node = client->dev.of_node;
> +	lt9611c->bridge.ops = DRM_BRIDGE_OP_DETECT |
> +			DRM_BRIDGE_OP_EDID |
> +			DRM_BRIDGE_OP_HPD |
> +			DRM_BRIDGE_OP_HDMI_AUDIO;
> +	lt9611c->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
> +
> +	lt9611c->bridge.hdmi_audio_dev = dev;
> +	lt9611c->bridge.hdmi_audio_max_i2s_playback_channels = 8;
> +	lt9611c->bridge.hdmi_audio_dai_port = 2;
> +
> +	drm_bridge_add(&lt9611c->bridge);
> +
> +	/* Attach primary DSI */
> +	lt9611c->dsi0 = lt9611c_attach_dsi(lt9611c, lt9611c->dsi0_node);
> +	if (IS_ERR(lt9611c->dsi0)) {
> +		ret = PTR_ERR(lt9611c->dsi0);
> +		goto err_remove_bridge;
> +	}
> +
> +	/* Attach secondary DSI, if specified */
> +	if (lt9611c->dsi1_node) {
> +		lt9611c->dsi1 = lt9611c_attach_dsi(lt9611c, lt9611c->dsi1_node);
> +		if (IS_ERR(lt9611c->dsi1)) {
> +			ret = PTR_ERR(lt9611c->dsi1);
> +			goto err_remove_bridge;
> +		}
> +	}
> +
> +	lt9611c->hdmi_connected = false;
> +	i2c_set_clientdata(client, lt9611c);
> +	enable_irq(client->irq);
> +	lt9611c_reset(lt9611c);
> +
> +	return 0;
> +
> +err_remove_bridge:
> +	free_irq(client->irq, lt9611c);
> +	cancel_work_sync(&lt9611c->work);
> +	drm_bridge_remove(&lt9611c->bridge);
> +
> +err_disable_regulators:
> +	regulator_bulk_disable(ARRAY_SIZE(lt9611c->supplies), lt9611c->supplies);
> +
> +err_of_put:
> +	of_node_put(lt9611c->dsi1_node);
> +	of_node_put(lt9611c->dsi0_node);
> +	if (lt9611c->fw) {
> +		release_firmware(lt9611c->fw);
> +		lt9611c->fw = NULL;
> +	}
> +
> +	return ret;
> +}
> +
> +static void lt9611c_remove(struct i2c_client *client)
> +{
> +	struct lt9611c *lt9611c = i2c_get_clientdata(client);
> +
> +	free_irq(client->irq, lt9611c);
> +	cancel_work_sync(&lt9611c->work);
> +	drm_bridge_remove(&lt9611c->bridge);
> +	mutex_destroy(&lt9611c->ocm_lock);
> +	regulator_bulk_disable(ARRAY_SIZE(lt9611c->supplies), lt9611c->supplies);
> +	of_node_put(lt9611c->dsi1_node);
> +	of_node_put(lt9611c->dsi0_node);
> +}
> +
> +static int lt9611c_bridge_suspend(struct device *dev)
> +{
> +	struct lt9611c *lt9611c = dev_get_drvdata(dev);
> +	int ret;
> +
> +	dev_dbg(lt9611c->dev, "suspend\n");
> +	disable_irq(lt9611c->client->irq);
> +	ret = lt9611c_regulator_disable(lt9611c);
> +	gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
> +
> +	return ret;
> +}
> +
> +static int lt9611c_bridge_resume(struct device *dev)
> +{
> +	struct lt9611c *lt9611c = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = lt9611c_regulator_enable(lt9611c);
> +	enable_irq(lt9611c->client->irq);
> +	lt9611c_reset(lt9611c);
> +	dev_dbg(lt9611c->dev, "resume\n");
> +
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops lt9611c_bridge_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(lt9611c_bridge_suspend,
> +				lt9611c_bridge_resume)
> +};
> +
> +static struct i2c_device_id lt9611c_id[] = {
> +	/* chip_type */
> +	{ "lontium,lt9611c", 0 },
> +	{ "lontium,lt9611ex", 1 },
> +	{ "lontium,lt9611uxd", 2 },
> +	{ /* sentinel */ }
> +};
> +
> +static const struct of_device_id lt9611c_match_table[] = {
> +	{ .compatible = "lontium,lt9611c" },
> +	{ .compatible = "lontium,lt9611ex" },
> +	{ .compatible = "lontium,lt9611uxd" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, lt9611c_match_table);
> +
> +static struct i2c_driver lt9611c_driver = {
> +	.driver = {
> +		.name = "lt9611c",
> +		.of_match_table = lt9611c_match_table,
> +		.pm = &lt9611c_bridge_pm_ops,
> +		.dev_groups = lt9611c_attr_groups,
> +	},
> +	.probe = lt9611c_probe,
> +	.remove = lt9611c_remove,
> +	.id_table = lt9611c_id,
> +};
> +module_i2c_driver(lt9611c_driver);
> +
> +MODULE_AUTHOR("SunYun Yang <syyang@lontium.com>");
> +MODULE_DESCRIPTION("Lontium lt9611c mipi-dsi to hdmi driver");

MIPI, DSI, HDMI

> +MODULE_LICENSE("GPL v2");


I think, checkpatch.pl should have flagged this.

> +
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
