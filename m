Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D1D17A300
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 18:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776883844; cv=none; b=FaCGvuH89YX4dFKUQ/r1iFkuYJuiwGjPkKVl9heVQXOl4nQftN7K3CgEvvagwhQ4oigx88hjZ+JYv/uq+FJoJEE0RgCZ2qCM7mbx10LMpRD3kV52X6VMGI1nYEoLfWu8vxanFtIXeH7uE0bDWaiBMgf4BrzKd63Hfg/vd2PntK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776883844; c=relaxed/simple;
	bh=4nUXqK0dRuQTMdmumNhGfh25kFM3AShgdiBY77gsqNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iY8rwxs5HdwsxyNy4I7OZG/WOGOUGszePJfI71pBM9bbnqFUZqTWuBpd5lOjs4SybFL9XyCoN8Gt1iUJYAWQUDKxmhEi4NbhCkRmjAP2BweXSIy3evC/Bvw34Um/+A2O8zomPNFPsbKUWsEcxrKrb7sshp8ZxcDXGpMpr7uhWXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fBMdUNDl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fnYdndzS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fBMdUNDl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fnYdndzS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG4k8B1587779
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 18:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZZ/rC3G2Otsg3yWgS1m94gZy
	k3jVpDtL9qpL7MYYVFw=; b=fBMdUNDlDFh3BWJHOXQoSG/Cg2ltA7AtAuYWv3+z
	igyN1Z7Vimi22NF3HbMiXWWSuBQD73itn86oFwAek8XO5i3APWSrLgSDwkmtJASq
	fA6LB18rQbmMUPzhmBbo+wYqW2pzlqVdbombN8U3yT8Cq2v9eyrd8jP18Xqrq/wF
	fksatdw22wbMgSDl6qW4ppLw4a7+6TC4P8mWyIhJ1SUDiRaEAArQgsRNhiwDD1X4
	dKgtIipMQaNNJCzk+qIY8JY3pn/1EFfk6mySsjwlUOWFZjqaHT9se4Ak+fYSsed6
	EReyrImYUWRRtvTgELbQX1PNHv8l9PiNu4HSpr0Hy2JStw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1hq0jy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 18:50:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fbc70cfbdso45503541cf.2
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 11:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776883842; x=1777488642; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZ/rC3G2Otsg3yWgS1m94gZyk3jVpDtL9qpL7MYYVFw=;
        b=fnYdndzSBGrLonFLAXnwe4MBQnXqipQQ8PL50yRb7BTGFTUaCb57Xtg5MxtkVnETcT
         ZeOiWfryqX0/cZPPuvrq7Ka+dCvSerGeXuXW8Tf+SKxHuP4/gmOe0+RgR2tG5O6vD9jp
         TNfgbqqTi6DmCy4o4NPC11y/TvmVKCngCMpjCM8Ru/9PYvf2IHCaYpIVmEJdRyJXgTAd
         iUKZJsw7BiwIlytua4EzKIa8iZX5GrjZq91b4yOSj9kOq+31N73sr/SQT/5tXeAlW7A5
         kHyelCnLGMXHl6U6CoUAIkgkanUCweNKAsOoEElm3i2PpiGO6q/RQC92TieiDG1LRp3n
         f2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776883842; x=1777488642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZ/rC3G2Otsg3yWgS1m94gZyk3jVpDtL9qpL7MYYVFw=;
        b=LybGbsregVibMFOhBnaj5UV5PkrmMQxNR0NU97FU8roXNhrVejhjfqxtCJIIJ7Kdg1
         nWDxkjA9TMIq1un1GnxgNCe25j6yK614xkAGiKifv5JfY7DmiMwnqM3+kkFDHVv6+B6Y
         g/N5j+5YdkpxsbFI3fT+h5aLayP3MB1upComU4zfeWtzMkwJlU1Zv6hrZ4x4rw8h/Mg1
         ban3TZeKB9Y+DtiH3MPWkwk5ir3QtXkeVz0/RhjosbFYOg9GBxqPSpGyd1BjWkUIVx7o
         Vu+QsJTHoZ0YxHCg/2uObxpOEsmmMryDY4VMBwnBQcZwZwUOSup6TpHbkgwVIazkGzGn
         2LUg==
X-Forwarded-Encrypted: i=1; AFNElJ8xBJnE1qYAJA7XrQFEVtyXLWBD/HWhaxdiFQ4QgxjBvytBGyWzePHP1oT4VIbKIx63DlNidzO/cDI3@vger.kernel.org
X-Gm-Message-State: AOJu0YzLdSmOnWNU0X+T/ICVQsvcEs0zCEecOmOWmhahHKf0W58TFtB8
	HsQBb42DAKJv4UDPMO3J6ChOiuE9vvT5vwwPFv7/H8fnq3H8pMDkIxFk2ExZc3VjsIq5FU2Kesk
	VusOaBOEJ0BXOuSyDsWSAQvVvWkJW7Y2eA/qsM8ukBMqiltGWTafXBDCoqKazNAfP
X-Gm-Gg: AeBDiesg+R66nbUcQ2Ng6TBep+eXFAHtNuv4SyHLEL0uDferKjYAY0EHBkYXQlA9KEK
	4E+5Ft3B2Gcpvw7XPQ1qoxC8KKumF+fCU2FdfrAsTSZ6tpgJhp64jITcMivqdjCADITUPlJlgI6
	8YlB1F9TX5sv0NkGkbsDTeM/DBp/+BGeHSQXVWzGN61LkCia0Qv4dGgNzlWcvXUcekAmszoN04Q
	49IF8rG/moOhlQewKZpS2GgjnqzF+pTgbC7kxVriuJgd0i2XNd9NJnPLP2ElChvxK+mt00kBBYk
	Wd7C9Q0h7BgdWwkkHlrGI9M2n0qNBbniU+g+wxfrdxQjPm6Vy9s2Whh74Zwj5fY2lJWhU3bXQrM
	pOSK6+c93co2fX3xJQItRapPrt6vIWZ82hB9ewUykTf5viDL8f3S/S1dkTzpnefivx4QPc2mzYY
	j8VmQF/hLse9rJqForx59xRJO7oCX1TuELe/k3v7g1513dXQ==
X-Received: by 2002:a05:622a:5147:b0:50e:631c:c38d with SMTP id d75a77b69052e-50e631cc483mr180983451cf.46.1776883841650;
        Wed, 22 Apr 2026 11:50:41 -0700 (PDT)
X-Received: by 2002:a05:622a:5147:b0:50e:631c:c38d with SMTP id d75a77b69052e-50e631cc483mr180982871cf.46.1776883841185;
        Wed, 22 Apr 2026 11:50:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ebef9sm4587237e87.77.2026.04.22.11.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 11:50:40 -0700 (PDT)
Date: Wed, 22 Apr 2026 21:50:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: webgeek1234@gmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Teguh Sobirin <teguh@sobir.in>
Subject: Re: [PATCH v6 2/2] drm/panel: Add panel driver for ChipWealth
 CH13726A based panels
Message-ID: <57jvp4yi6mhut7yveoq25qgxowc747mu6x47xf4kicdm73dpur@s76omxabsga5>
References: <20260422-ch13726a-v6-0-03680d6673ff@gmail.com>
 <20260422-ch13726a-v6-2-03680d6673ff@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422-ch13726a-v6-2-03680d6673ff@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE4MyBTYWx0ZWRfX6LeJOHFV38iI
 l0996mcNfyHNj8aXR9juev60tZtay3QmkoKTgu+ulXEtfv3B5B+eSzj9XAyJIiO2kaG2nIGff2I
 xruSkjPMpJ33anbGW4Hp6+0zEQIHiGyFkuwVSHKz/VmnYNaXXwDDElnBtRxEKer/hs2trZQlcGA
 1n/9+ZCbnI8PCRFxdI+m5oM7sQPrcGOgmGojsjb14PAyr9qRPYBmp5vcyjBQ6PpXotzA8VuKXSh
 cdWGT1lOKtKaxEbpSWYBMU/+qaJuTvl2noEgDoS5wiFB/hfC9Pf+RR/fbLE6U8LPEaisYO9rfgM
 SZ9TUJV2wnjyCLEjTaEuArNCADCVs0c9SnhydW7hTanU8C/P8XggbPzZXZ8lUbdJ+PvqcFEJEWS
 trx2BA12F5Neos5tq4UaJ8fWjFhq7ghDAuq8PKjz122C0Pd9aL8QDdiP6eIPTq/ynXcZxc8Ci9F
 uO56pCJWdjw+LTXw6Kw==
X-Proofpoint-ORIG-GUID: 2aV3guoJhavRcAUy1D79oNmmz-LPR8WC
X-Proofpoint-GUID: 2aV3guoJhavRcAUy1D79oNmmz-LPR8WC
X-Authority-Analysis: v=2.4 cv=TJt1jVla c=1 sm=1 tr=0 ts=69e91882 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=-GCnFWqknJ9Tug8pFpUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220183

On Wed, Apr 22, 2026 at 02:43:25AM -0500, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> This is used by the AYN Thor for the bottom panel.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                     |  11 +
>  drivers/gpu/drm/panel/Makefile                    |   1 +
>  drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c | 333 ++++++++++++++++++++++
>  3 files changed, 345 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index d6863b28ddc559..e2c00f08f4507d 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -105,6 +105,17 @@ config DRM_PANEL_BOE_TV101WUM_LL2
>  	  Say Y here if you want to support for BOE TV101WUM-LL2
>  	  WUXGA PANEL DSI Video Mode panel
>  
> +config DRM_PANEL_CHIPWEALTH_CH13726A
> +	tristate "CHIPWEALTH CH13726A-based DSI panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_HELPER
> +	help
> +	  Say Y here if you want to enable support for ChipWealth
> +	  CH13726A-based display panels.
> +
>  config DRM_PANEL_EBBG_FT8719
>  	tristate "EBBG FT8719 panel driver"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index a4291dc3905bed..343d283d1620fb 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_DRM_PANEL_BOE_TD4320) += panel-boe-td4320.o
>  obj-$(CONFIG_DRM_PANEL_BOE_TH101MB31UIG002_28A) += panel-boe-th101mb31ig002-28a.o
>  obj-$(CONFIG_DRM_PANEL_BOE_TV101WUM_LL2) += panel-boe-tv101wum-ll2.o
>  obj-$(CONFIG_DRM_PANEL_BOE_TV101WUM_NL6) += panel-boe-tv101wum-nl6.o
> +obj-$(CONFIG_DRM_PANEL_CHIPWEALTH_CH13726A) += panel-chipwealth-ch13726a.o
>  obj-$(CONFIG_DRM_PANEL_DSI_CM) += panel-dsi-cm.o
>  obj-$(CONFIG_DRM_PANEL_LVDS) += panel-lvds.o
>  obj-$(CONFIG_DRM_PANEL_SIMPLE) += panel-simple.o
> diff --git a/drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c b/drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c
> new file mode 100644
> index 00000000000000..175f40e752126f
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c
> @@ -0,0 +1,333 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ChipWealth CH13726A MIPI-DSI panel driver
> + * Copyright (c) 2024, Teguh Sobirin <teguh@sobir.in>.
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +
> +#include <video/mipi_display.h>
> +
> +static const struct regulator_bulk_data ch13726a_supplies[] = {
> +	{ .supply = "vdd1v2", },
> +	{ .supply = "vddio", },
> +	{ .supply = "vdd", },
> +	{ .supply = "avdd", },
> +};
> +
> +struct ch13726a_panel {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct regulator_bulk_data *supplies;
> +	struct gpio_desc *reset_gpio;
> +	struct ch13726a_desc *desc;
> +	enum drm_panel_orientation orientation;
> +};
> +
> +struct ch13726a_desc {
> +	unsigned int width_mm;
> +	unsigned int height_mm;
> +	unsigned int bpc;
> +
> +	const struct drm_display_mode *modes;
> +	unsigned int num_modes;
> +};
> +
> +static inline struct ch13726a_panel *to_ch13726a_panel(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct ch13726a_panel, panel);
> +}
> +
> +static void ch13726a_reset(struct ch13726a_panel *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(10000, 11000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(10000, 11000);

This looks like the active-low reset. Should it be rather described as
GPIO_ACTIVE_LOW in the DT?

> +}
> +

Other than that:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
