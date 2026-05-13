Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8825540FD81
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778683341; cv=none; b=dY2GomBBP10f55SSNZH63qvWP3sOB1P9BNXJTl2S+hseBwj/4lKrknR1abgxz/5VSRcCa2a3lhffwa5rnF5PN6y6R0XuxIA38A+PKRHEfugstNC4T2vZABZ2K5XKxaLyPQZDkE73jN/Q7rPeBBQViqmOjg90wjr2gpI/rzUMD4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778683341; c=relaxed/simple;
	bh=tGdnqMGFE29Kwir5rpTWZUKDAhFPZlJYlrh+cb+F644=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NPbbG/pRFUF4AUFQYHvOvm/pekbMODWMMlmSaRHEDoaEUn/JJh7mUgJXm3hvnkxwH5zM0N74ga3lIZ+koKU2Y9BV57S+p59BQrmv5TkQIxK0qONtGMO1aW9sDPzcqDXAU8bA4BPh793lVpZoNhagFVl2WeNl9tL5DA0xhXHwfh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JGvJTuK9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpVG04VP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JGvJTuK9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpVG04VP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9jkaf3007701
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rrOKSfpZ1ABLMmdFMzeEe6He
	BQksg/j7nPk9sHESuLo=; b=JGvJTuK9biK6gkW+gDhs+ITPw9y+olcCPMpNbtBI
	Szl2HhGGJMlWyNCeuOk/w7BVSqcqbJZs/JivE7vtC36la2rQs9U5J+cIQr+C740T
	gGNLY62iveIi95ece2c+uN3ZSQ2+ADqicpJudEEHLAjOstW65X/vjy/UeDDlCqV7
	3bZ9Sg/YvpMpKEV1r+FmXgg65nTwuAh8UjfYu37zz36S+7TOIYu6XeUfKlXRRJQQ
	Uqb5qChyJ+whZM2KvvTYD6tW8ed89vkFObxBvwv66ufGlUPKwTghR70+ZRmR4HfL
	LssA9xWyxVJeWlEYiPV5HCRHDYYMvVjxr+JvDhYcIcziLg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0h325-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:42:17 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6343b1bcbe8so2455557137.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778683337; x=1779288137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rrOKSfpZ1ABLMmdFMzeEe6HeBQksg/j7nPk9sHESuLo=;
        b=RpVG04VPz41nnMltJUJqYSAcSYSlnbZyuyG6vGl3dxdJ6UA3UPb8lcgCOe7QvrVScH
         1c8jd7VJsqYhJOcybfr3PKbuXJiFku9U8BMCyUuWs6tbXnaYtTNBKYGUVvGMxm9UwPIC
         /JHr5TDdBYwXg8j50f4LyQwSfxXVc8rbuAtA0e4T+Gnunwmseide+mYzql8wK2zlsO7S
         122nirbvp++taOjmrL6+4IHbm2G1bkvj/RU31eShpzd7WTBezvppwFvLyndcQPVWq84u
         zLCuEhFRnMT52NmKtz7Mcl9QfMzwZh8lZarMhVv7J5D2lufIpCVd2Wop9yqIy1Qm/xqS
         aR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778683337; x=1779288137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrOKSfpZ1ABLMmdFMzeEe6HeBQksg/j7nPk9sHESuLo=;
        b=TQy+lDY1FMVfgE+NfdqWQVDIR5lPj9f8+WaqEn7m/TK0746/XScGptpkumoJ70qpWr
         59doFO2ZeFiNnRG6Pzlk8EpHFscTu40qBrtVeYpDVSuzKD90SmtLE23pksyG3ogLqdlk
         LZgO0fo7r+cWw94ocuPLs5M2XrMAzi+KHKYHK0JpHOi0AkxetUOpFXwxJnOzJ4asZXfG
         rF7NIe9IWro2cDRRef0xkj+J/XW6q/AdbWWFeGqhNihCf44lIbEHLyWm5hAe74UY/isl
         oy+KzlMLoK+KJ2NNZop5TGryHV+IuRcSZJvOcl0Q8Er1CanjqwBc/nus1/tGKZ0jGZB8
         msQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Z3bVC0lxQ2famLEnctsnaqPyIwyZ+Bu27gDJBYd2XrfzSGogm9x/RraxA7wUMmwcLFQtr/0qAlYBZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu1rqyK3ii276ET1sDscbN/jLp0dhyXUlFDrhFBlrq+Ub+dl15
	YlkCcgsFiXRbualTOsucTsmpyapVo8Xqu+s6HEaWEZ1LDBoSQmxnAXAjNdecseiIAxkyZ33XK+7
	65njYbcWjl0kyXLJIk+AKEJvo6FlNe0lGR+pVKCFC3PoUtytU9cEWRP3Ap7ffSHPO
X-Gm-Gg: Acq92OFUumKrdYKX7tFaJ0A2S8fGOpE7qpAbkGqbJQtK6KklILKieFPYFzkyZwFkuHw
	j7vHeh2VPFvCop7W2LlZyGf9lzvFkqVsFqyakwKlFDY8Fu1Kg56Jp+fvtiEOsGUH3YOl+0iSBW9
	/NjG6OUHmd5c0d1EcEwHLcphc0Cjma+xtQs42x1dqjGlTgwf7dobYczJU0iBOm4LbR0MPrX0/T9
	rIySRc6PUqOlRo1TdjGIoI/M8ye8i14wAIOIK3C5Fjg9HGunIB2dFFZwH5SvHLGIRE74xyNnkKY
	UkvR241hmQyCbqHZlR4qqNowikT2gOS+w2LYOae41x6NWiwvpWc8o5UbUoPhT0tMHE5gyPsxpJU
	Fsck89fR3DNI/BtaBtt/fA/f6vH5EgwGKL0HFhK/bacf2OR7JtSCtY+GWnuEDOggxTdlKOKBkeH
	eW07pgeiwHnxIiAOL+X1Eu18FJQqQwngSJYBU=
X-Received: by 2002:a05:6102:304e:b0:631:26f6:701a with SMTP id ada2fe7eead31-637755ed861mr1784676137.29.1778683336670;
        Wed, 13 May 2026 07:42:16 -0700 (PDT)
X-Received: by 2002:a05:6102:304e:b0:631:26f6:701a with SMTP id ada2fe7eead31-637755ed861mr1784664137.29.1778683336077;
        Wed, 13 May 2026 07:42:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c42b0f7fsm2639513e87.17.2026.05.13.07.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:42:13 -0700 (PDT)
Date: Wed, 13 May 2026 17:42:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, KancyJoe <kancy2333@outlook.com>
Subject: Re: [PATCH v3 2/2] drm: panel: add support for the Renesas R63419
 based dual-DSI video mode Display Panels
Message-ID: <tuw3b6ow3onllt4swtksqgujnhch7w2cf6zd4bymvwqddylyyh@am2lv6b767ok>
References: <20260504-topic-sm8650-ayaneo-pocket-s2-r63419-v3-0-9f61cf24aebf@linaro.org>
 <20260504-topic-sm8650-ayaneo-pocket-s2-r63419-v3-2-9f61cf24aebf@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-topic-sm8650-ayaneo-pocket-s2-r63419-v3-2-9f61cf24aebf@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1MSBTYWx0ZWRfX6Dls1pqJWqXC
 hBACi5fwRjRBtX541boLLDRgorn1bGMFJ1HmpCY/b2Sz5r5UeBl0TOXIeqhJO4YtrZaQoWFM65L
 ACk93ZqN4BA2S52fzOK3IMoCoxjm7o/Jay/k1WoILDRMR+mPoQfb384JghtKczUAtza3pA5trrY
 KHHgWiIBgnkjKTOqSVt3QToErZc0ckyICg6WKcx/08OpJpcnmoiPYl4ky+kmg16AeNi7fkmZ5W6
 BmZ1Jqtnw+Y5AjPsQGlAwURcY0ow8r5S31H4C7FRW0t0f+jNXD8PcdR/cw/6zkZ3WPLO+UPFV9M
 JZdMXyos1X/aYxX7p8FAVkpm9YYeVnmS/2ACJPcyz3H2B6rUSDeGtP4em0s9mpF1GdVnyUrAFxi
 xgqwJVRLAqKOukCDkRqg1L8VN8XEqucn/jF0AhU4N+BwkZ/92HzpMoG27mp05Xtp1WgkPrqYVOD
 0A1grHKSqpGbevHxs9A==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a048dc9 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=UqCG9HQmAAAA:8
 a=KKAkSRfTAAAA:8 a=D019lJVASnwp9djqiF0A:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: J-MrNVuQQeJziJiZoFmzTS-x6vQM9Hyr
X-Proofpoint-GUID: J-MrNVuQQeJziJiZoFmzTS-x6vQM9Hyr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130151

On Mon, May 04, 2026 at 10:02:06AM +0200, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
> 
> Implement support for the Renesas 63419 based dual-DSI video mode
> Display Panels found in the Ayaneo gaming handled devices.
> 
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/panel/Kconfig                |  12 +
>  drivers/gpu/drm/panel/Makefile               |   1 +
>  drivers/gpu/drm/panel/panel-renesas-r63419.c | 357 +++++++++++++++++++++++++++
>  3 files changed, 370 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index d6863b28ddc5..5404d918677f 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -755,6 +755,18 @@ config DRM_PANEL_RENESAS_R61307
>  	  This panel controller can be found in LG Optimus Vu P895 smartphone
>  	  in combination with LCD panel.
>  
> +config DRM_PANEL_RENESAS_R63419
> +	tristate "Renesas R63419 dual-DSI video mode panels"
> +	depends on OF && GPIOLIB
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for Ayaneo WT0600 and WT0630
> +	  1440x2560 60Hz dual-DSI video mode display panels with Renesas
> +	  R63419 IC.
> +
> +	  These panels are used in Ayaneo handheld gaming devices.
> +
>  config DRM_PANEL_RENESAS_R69328
>  	tristate "Renesas R69328 720x1280 DSI video mode panel"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index a4291dc3905b..b498ee9b5929 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -75,6 +75,7 @@ obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
>  obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM692E5) += panel-raydium-rm692e5.o
>  obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM69380) += panel-raydium-rm69380.o
>  obj-$(CONFIG_DRM_PANEL_RENESAS_R61307) += panel-renesas-r61307.o
> +obj-$(CONFIG_DRM_PANEL_RENESAS_R63419) += panel-renesas-r63419.o
>  obj-$(CONFIG_DRM_PANEL_RENESAS_R69328) += panel-renesas-r69328.o
>  obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS581VF01) += panel-samsung-ams581vf01.o
> diff --git a/drivers/gpu/drm/panel/panel-renesas-r63419.c b/drivers/gpu/drm/panel/panel-renesas-r63419.c
> new file mode 100644
> index 000000000000..2432a238cef1
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-renesas-r63419.c
> @@ -0,0 +1,357 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * DRM driver for Renesas R63419 based dual-DSI video mode panels
> + *
> + * Copyright (c) 2025, Kancy Joe <kancy2333@outlook.com>
> + * Copyright (C) 2026 Linaro Limited
> + * Author: Neil Armstrong <neil.armstrong@linaro.org>
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_connector.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +struct renesas_r63419_panel {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi[2];
> +	const struct panel_desc *desc;
> +
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data *vdd_supplies;
> +	struct regulator_bulk_data *vcc_supplies;
> +	enum drm_panel_orientation orientation;
> +};
> +
> +/* VDDIO/VDD Supplies */
> +static const struct regulator_bulk_data renesas_r63419_vdd_supplies[] = {
> +	{ .supply = "vddio" },
> +	{ .supply = "vdd" },
> +};
> +
> +/* VSP/VSN/VCI Supplies */
> +static const struct regulator_bulk_data renesas_r63419_vcc_supplies[] = {
> +	{ .supply = "vsp" },
> +	{ .supply = "vsn" },
> +	{ .supply = "vci" },
> +};
> +
> +struct panel_desc {
> +	const struct drm_display_mode *mode;
> +	unsigned int lanes;
> +	unsigned long mode_flags;
> +	enum mipi_dsi_pixel_format format;
> +	u16 height_mm;
> +	u16 width_mm;

Drop, use those from the drm_display_mode.

> +	const struct mipi_dsi_device_info dsi_info;
> +};
> +
> +static const struct drm_display_mode wt0600_mode = {
> +	/* Dual dsi */
> +	.clock = 2 * (720 + 100 + 8 + 40) * (2560 + 15 + 2 + 8) * 60 / 1000,
> +	.hdisplay = 2 * 720,
> +	.hsync_start = 2 * (720 + 100),
> +	.hsync_end = 2 * (720 + 100 + 8),
> +	.htotal = 2 * (720 + 100 + 8 + 40),
> +	.vdisplay = 2560,
> +	.vsync_start = 2560 + 15,
> +	.vsync_end = 2560 + 15 + 2,
> +	.vtotal = 2560 + 15 + 2 + 8,
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static struct panel_desc wt0600_desc = {
> +	.lanes = 4,
> +	.width_mm = 74,
> +	.height_mm = 131,
> +	.mode = &wt0600_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +		      MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.dsi_info = {
> +		.type = "wt0600-2k",
> +		.channel = 0,
> +		.node = NULL,
> +	},

I'd store just the name here and create dsi_info on stack.

> +};
> +
> +static struct panel_desc wt0630_desc = {
> +	.lanes = 4,
> +	.width_mm = 78,
> +	.height_mm = 140,
> +	.mode = &wt0600_mode,  /* wt0600 only has different screen size */
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +		      MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.dsi_info = {
> +		.type = "wt0630-2k",
> +		.channel = 0,
> +		.node = NULL,
> +	},
> +};
> +

[...]

> +static int renesas_r63419_get_modes(struct drm_panel *panel,
> +				    struct drm_connector *connector)
> +{
> +	struct drm_display_mode *mode;
> +	struct renesas_r63419_panel *ctx = to_renesas_r63419_panel(panel);
> +
> +	mode = drm_mode_duplicate(connector->dev, ctx->desc->mode);
> +	if (!mode)
> +		return -ENOMEM;
> +
> +	/* Update panel size */
> +	mode->width_mm = ctx->desc->width_mm;
> +	mode->height_mm = ctx->desc->height_mm;
> +
> +	drm_mode_set_name(mode);
> +	connector->display_info.width_mm = mode->width_mm;
> +	connector->display_info.height_mm = mode->height_mm;
> +	drm_mode_probed_add(connector, mode);

return drm_connector_helper_get_modes_fixed().

> +
> +	return 1;
> +}
> +
> +static enum drm_panel_orientation
> +renesas_r63419_get_orientation(struct drm_panel *panel)
> +{
> +	struct renesas_r63419_panel *ctx = to_renesas_r63419_panel(panel);
> +
> +	return ctx->orientation;
> +}
> +
> +static const struct drm_panel_funcs renesas_r63419_panel_funcs = {
> +	.disable = renesas_r63419_disable,
> +	.prepare = renesas_r63419_prepare,
> +	.unprepare = renesas_r63419_unprepare,
> +	.get_modes = renesas_r63419_get_modes,
> +	.get_orientation = renesas_r63419_get_orientation,
> +};
> +
> +static int renesas_r63419_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct renesas_r63419_panel *ctx;
> +	struct device_node *dsi1_node;
> +	struct mipi_dsi_host *dsi1_host;
> +	int ret, i;
> +
> +	ctx = devm_drm_panel_alloc(dev, struct renesas_r63419_panel, panel,
> +				   &renesas_r63419_panel_funcs, DRM_MODE_CONNECTOR_DSI);
> +	if (IS_ERR(ctx))
> +		return PTR_ERR(ctx);
> +
> +	ctx->desc = of_device_get_match_data(dev);
> +	if (!ctx->desc)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "Failed to get panel description\n");
> +
> +	ret = devm_regulator_bulk_get_const(&dsi->dev,
> +					    ARRAY_SIZE(renesas_r63419_vdd_supplies),
> +					    renesas_r63419_vdd_supplies, &ctx->vdd_supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = devm_regulator_bulk_get_const(&dsi->dev,
> +					    ARRAY_SIZE(renesas_r63419_vcc_supplies),
> +					    renesas_r63419_vcc_supplies, &ctx->vcc_supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +				     "Failed to get reset gpio\n");
> +
> +	/* Get second DSI host */
> +	dsi1_node = of_graph_get_remote_node(dsi->dev.of_node, 1, -1);
> +	if (!dsi1_node)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "Failed to get remote node for second DSI\n");
> +
> +	dsi1_host = of_find_mipi_dsi_host_by_node(dsi1_node);
> +	of_node_put(dsi1_node);
> +	if (!dsi1_host)
> +		return dev_err_probe(dev, -EPROBE_DEFER,
> +				     "Failed to find second DSI host\n");
> +
> +	/* Register the second DSI device */
> +	ctx->dsi[1] = devm_mipi_dsi_device_register_full(dev, dsi1_host,
> +							 &ctx->desc->dsi_info);

This way we are not passing the OF node for the second DSI device...

> +	if (IS_ERR(ctx->dsi[1]))
> +		return dev_err_probe(dev, PTR_ERR(ctx->dsi[1]),
> +				     "Failed to register second DSI device\n");
> +
> +	ctx->dsi[0] = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	/* Get panel orientation */
> +	ret = of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
> +	if (ret < 0 && ret != -ENODEV)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to get panel orientation\n");
> +
> +	ctx->panel.prepare_prev_first = true;
> +
> +	ret = drm_panel_of_backlight(&ctx->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get backlight\n");
> +
> +	drm_panel_add(&ctx->panel);

devm_drm_panel_add()

> +
> +	/* Configure and attach both DSI devices */
> +	for (i = 0; i < ARRAY_SIZE(ctx->dsi); i++) {
> +		ctx->dsi[i]->lanes = ctx->desc->lanes;
> +		ctx->dsi[i]->format = ctx->desc->format;
> +		ctx->dsi[i]->mode_flags = ctx->desc->mode_flags;
> +
> +		ret = mipi_dsi_attach(ctx->dsi[i]);

devm_mipi_dsi_attach()

> +		if (ret < 0) {
> +			drm_panel_remove(&ctx->panel);
> +			return dev_err_probe(dev, ret,
> +					     "Failed to attach DSI device %d\n", i);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void renesas_r63419_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct renesas_r63419_panel *ctx = mipi_dsi_get_drvdata(dsi);
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(ctx->dsi); i++)
> +		mipi_dsi_detach(ctx->dsi[i]);
> +
> +	drm_panel_remove(&ctx->panel);
> +}
> +
> +static const struct of_device_id renesas_r63419_of_match[] = {
> +	{
> +		.compatible = "ayaneo,wt0600-2k",
> +		.data = &wt0600_desc,
> +	},
> +	{
> +		.compatible = "ayaneo,wt0630-2k",
> +		.data = &wt0630_desc,
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, renesas_r63419_of_match);
> +
> +static struct mipi_dsi_driver renesas_r63419_driver = {
> +	.probe = renesas_r63419_probe,
> +	.remove = renesas_r63419_remove,
> +	.driver = {
> +		.name = "panel-renesas-r63419",
> +		.of_match_table = renesas_r63419_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(renesas_r63419_driver);
> +
> +MODULE_AUTHOR("Kancy Joe <kancy2333@outlook.com>");
> +MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
> +MODULE_DESCRIPTION("DRM driver for Renesas R63419 based dual-DSI video mode panels");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
