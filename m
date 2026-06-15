Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A14F3C277F
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781511608; cv=none; b=Aa6UEMmV/S8sDfP6sFl4Euk4EaAvvbzr7UrFpzyqUCWSgYtZxHn1XGDwLpLFa6OzcBVtdUSSNu70EvF7+j/qD15CeZtq62CgHf+Czb/cCc0gd9wowUogVSDKJGj6oNRbLs2CN127vi4hTlWHASZact3r9uyWKBW9Ob0GFLX/AwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781511608; c=relaxed/simple;
	bh=BcsoRJJJr94RK3ZQ1PAyh5yUGBsio1LqGXK+pTGkhtw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UH/uulH8/rcZ2OXLi3ox2yQIgYC7RmxcyjDz22reWTcmFwkaIp8ulxm37TAkzLu/QH4vUAzph4mY4Kd2V3B0tBCEyLOR2Z5gYy/S7qejYPQ8zdwxKXOMLHMw9G6cgmJ3SbSwsrm6RVsKpy326+bNVGdjoaAiutLqDZ/wZsS/4L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y9p3z8++; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y9p3z8++"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45ef5146b56so2443735f8f.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 01:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781511604; x=1782116404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRdqyuyDGGJfjNGHQR60Ezn1wGrIuwVcTwNXW3AYFSU=;
        b=y9p3z8++YuT3/GdYoiS6vNP2Soi1VHwbmiphjtvJBidp41t5fBocskIoyBrAJpx88f
         bYxlDGvzHhPWiiTm8Ing8kMhw30DEQj4td8calsQNWOO7C7Ozo+PijNEpkvOPU2nYco3
         rIYACB3W33DZuBRXqzzTZvuocWF+SVJof09soM9e+bgVO2+Y0NvpWE0M9lEeOxmNHhVA
         FG8/+zjT58LAwtIpVV0V1okpaiCjySBbRCQ70oln4mvS/rLyVQOBECQzypvjapFvh050
         e8HCAjMKukgcD/Sbnaql4nkhgnyFJiQpujPEunzbfdjrFg1jWDKeumsd3l6QhDtP7ZcM
         k06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781511605; x=1782116405;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mRdqyuyDGGJfjNGHQR60Ezn1wGrIuwVcTwNXW3AYFSU=;
        b=Z0Gbs5zLoWzplQfgf5sPpHGzZPo61jpLmdq/yWcFadHgmJEQE1mdNXYup3nwQfFN51
         yD2oXKx2FbXbaOit2A/SeR7pb784Su7lFuLrgOL56DQgD0AfhnLgl+p/Cgmdk29pPg86
         WfOjcUdPS56ZmNTimxEuCnzzNF/FGL3kfcJFJ1z1QOUn5uuMAev9gIielUd5Mem002/j
         P6Y4lMNtzpqd0vwbh2MYhuEWZ94TRekLirlmZssG6Q6LerDZ0lJMTj9SHwE3MnK5uSB6
         OUqVl+f58DAelTyREGf5AjycQyEACPbpHNMe6KtMdAgVOlMwDsd8GVMMs1ToRNWmBFXO
         xYLg==
X-Forwarded-Encrypted: i=1; AFNElJ/9OwJdjASGC2YAIGjHrric1O77XyP/PFEwzjQqvt5wkJPGtWfNexRlWN4VW070LUo1HiDDk7/ZoSri@vger.kernel.org
X-Gm-Message-State: AOJu0YzDUILnG3UAR2CF0trw/Ktx4FR4gTlMgCkxtz7GRuCwy2yh1V3H
	W88faGuRBww8XXyI710p8cw+Ze4SQoUNi2wFxYiKiYehuKZXfze2RaXPqiUkpdRFY6I=
X-Gm-Gg: Acq92OGnmO5ns//nEwE71+mO2wjybMXIb2IMFYvrvn5PdC6vOiguEy88kfnm6FdrUzw
	1b9iBHFtsMv+ZXlBJt/5Htf6s6F8wcL64lnQOsWRTzE5bDZg3tw88QkBwk/Q0Mgq9/0LGLWygu7
	6ekXZoweIuS5b+rMzKjVouDYSGX8/i5iTQZ4ap+Xw045/bFnk3A1iHCq5ZB14XwOndLDKf5se1N
	PUBj12cbXXWRFzuwSYeI5lpqGW2/tOJuQJDuY2JlJS38/eipwbo96E4X7+mS5ANahxWG/Fh+sQO
	AAvKFDKWI1YggotBWEpRfzJawv/6FHi8kNBkckrPuh1/vvoHLfiHC6HW/hGgcXveAAwAI8gW7pl
	yYJA7n9YnOMxxXwwBslf+mYuHePISmXAbokg7FPrL3w8ch7KWF0scksMcU7sHGZw0syttZVNIUy
	tjYjlpMhsKeX0OgTE841uhShZEsslPJpXPsownWsBj0Cm0hkzxDvB6K6GMOEQvx+jvrLEG/kw3E
	2yYqkU=
X-Received: by 2002:a05:6000:4804:b0:45e:daa9:f34c with SMTP id ffacd0b85a97d-4606d0399d2mr17110895f8f.26.1781511604271;
        Mon, 15 Jun 2026 01:20:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:fdaf:c588:880d:106a? ([2a01:e0a:106d:1080:fdaf:c588:880d:106a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c3fcfsm28553672f8f.26.2026.06.15.01.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 01:20:03 -0700 (PDT)
Message-ID: <063b4bb4-5ba8-4095-b407-145bd9b548c8@linaro.org>
Date: Mon, 15 Jun 2026 10:20:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/2] drm/panel: Add panel driver for Chipone ICNA35XX
 based panels
To: webgeek1234@gmail.com, Jessica Zhang <jesszhan0024@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260607-icna35xx-v4-0-64de514add34@gmail.com>
 <20260607-icna35xx-v4-2-64de514add34@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260607-icna35xx-v4-2-64de514add34@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/7/26 22:11, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> This adds support for the ICNA3512 and ICNA3520 DDICs used in both the
> AYN Odin 2 Portal and Ayaneo Pocket DS top panel respectively and for
> for both the AYN Odin 3 and the AYN Thor top panel respectively.
> 
> These all have unique compatibles because the panels themselves are
> likely unique hardware with only the ddic's and thus api and driver
> handling shared.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>   drivers/gpu/drm/panel/Kconfig                  |  11 +
>   drivers/gpu/drm/panel/Makefile                 |   1 +
>   drivers/gpu/drm/panel/panel-chipone-icna35xx.c | 422 +++++++++++++++++++++++++
>   3 files changed, 434 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 7450b27622a233..1368b5a0b6c912 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -105,6 +105,17 @@ config DRM_PANEL_BOE_TV101WUM_LL2
>   	  Say Y here if you want to support for BOE TV101WUM-LL2
>   	  WUXGA PANEL DSI Video Mode panel
>   
> +config DRM_PANEL_CHIPONE_ICNA35XX
> +	tristate "Chipone ICNA35XX panel driver"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select DRM_DISPLAY_HELPER
> +	help
> +	  Say Y here if you want to enable support for the panels built
> +	  around the Chipone ICNA3512 and ICNA3520 display controllers,
> +	  such as some Tianma panels used in AYN Odin2 Portal and Thor.
> +
>   config DRM_PANEL_CHIPWEALTH_CH13726A
>   	tristate "CHIPWEALTH CH13726A-based DSI panel"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index c2c5cf81711633..d39a8f82fa8c06 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_DRM_PANEL_BOE_TD4320) += panel-boe-td4320.o
>   obj-$(CONFIG_DRM_PANEL_BOE_TH101MB31UIG002_28A) += panel-boe-th101mb31ig002-28a.o
>   obj-$(CONFIG_DRM_PANEL_BOE_TV101WUM_LL2) += panel-boe-tv101wum-ll2.o
>   obj-$(CONFIG_DRM_PANEL_BOE_TV101WUM_NL6) += panel-boe-tv101wum-nl6.o
> +obj-$(CONFIG_DRM_PANEL_CHIPONE_ICNA35XX) += panel-chipone-icna35xx.o
>   obj-$(CONFIG_DRM_PANEL_CHIPWEALTH_CH13726A) += panel-chipwealth-ch13726a.o
>   obj-$(CONFIG_DRM_PANEL_DSI_CM) += panel-dsi-cm.o
>   obj-$(CONFIG_DRM_PANEL_LVDS) += panel-lvds.o
> diff --git a/drivers/gpu/drm/panel/panel-chipone-icna35xx.c b/drivers/gpu/drm/panel/panel-chipone-icna35xx.c
> new file mode 100644
> index 00000000000000..86d096455caa1c
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-chipone-icna35xx.c
> @@ -0,0 +1,422 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Chipone ICNA35XX Driver IC panels driver
> + *
> + * Copyright (c) 2025 Teguh Sobirin <teguh@sobir.in>
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
> +#include <drm/display/drm_dsc.h>
> +#include <drm/display/drm_dsc_helper.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +struct panel_info {
> +	struct drm_panel panel;
> +	struct drm_connector *connector;
> +	struct mipi_dsi_device *dsi;
> +	struct panel_desc *desc;
> +	enum drm_panel_orientation orientation;
> +
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data *supplies;
> +};
> +
> +struct panel_desc {
> +	unsigned int width_mm;
> +	unsigned int height_mm;
> +
> +	unsigned int bpc;
> +	unsigned int lanes;
> +	unsigned long mode_flags;
> +	enum mipi_dsi_pixel_format format;
> +
> +	const struct drm_display_mode *modes;
> +	unsigned int num_modes;
> +	int (*init_sequence)(struct panel_info *pinfo);
> +
> +	struct drm_dsc_config dsc;
> +};
> +
> +static const struct regulator_bulk_data panel_supplies[] = {
> +	{ .supply = "vdd" },
> +	{ .supply = "vddio" },
> +	{ .supply = "vci" },
> +	{ .supply = "disp" },
> +	{ .supply = "blvdd" },
> +};
> +
> +static inline struct panel_info *to_panel_info(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct panel_info, panel);
> +}
> +
> +static int icna3512_init_sequence(struct panel_info *pinfo)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = pinfo->dsi };
> +	struct drm_dsc_picture_parameter_set pps;
> +
> +	pinfo->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x9C, 0xA5, 0xA5);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xFD, 0x5A, 0x5A);
> +
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x53, 0xE0);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x35, 0x00);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x9F, 0x0F);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xCE, 0x22);
> +
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x9F, 0x01);
> +
> +	/* 165 hz */
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x48, 0x20);
> +
> +	drm_dsc_pps_payload_pack(&pps, &pinfo->desc->dsc);
> +	mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 20);
> +
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int icna3520_init_sequence(struct panel_info *pinfo)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = pinfo->dsi };
> +	struct drm_dsc_picture_parameter_set pps;
> +
> +	pinfo->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x9C, 0xA5, 0xA5);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xFD, 0x5A, 0x5A);
> +
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x53, 0xE0);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x35, 0x00);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	/* 120 hz */
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x48, 0x00);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x9F, 0x00);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xB3,
> +		0x00, 0xD8, 0x00, 0x1C, 0x00, 0x4C);
> +
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x9F, 0x01);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xB2, 0x00);
> +
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x9F, 0x0D);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xB2, 0x27);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xB6, 0x03);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xBB, 0x01);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xB2, 0x24);
> +
> +	drm_dsc_pps_payload_pack(&pps, &pinfo->desc->dsc);
> +	mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 20);
> +
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static const struct drm_display_mode odin2portal_modes[] = {
> +	{
> +		/* 165Hz */
> +		.clock = (1080 + 98 + 1 + 23) * (1920 + 20 + 1 + 15) * 165 / 1000,
> +		.hdisplay = 1080,
> +		.hsync_start = 1080 + 98,
> +		.hsync_end = 1080 + 98 + 1,
> +		.htotal = 1080 + 98 + 1 + 23,
> +		.vdisplay = 1920,
> +		.vsync_start = 1920 + 20,
> +		.vsync_end = 1920 + 20 + 1,
> +		.vtotal = 1920 + 20 + 1 + 15,
> +	}
> +};
> +
> +static const struct drm_display_mode thor_top_modes[] = {
> +	{
> +		/* 120Hz */
> +		.clock = (1080 + 24 + 1 + 24) * (1920 + 28 + 1 + 28) * 120 / 1000,
> +		.hdisplay = 1080,
> +		.hsync_start = 1080 + 24,
> +		.hsync_end = 1080 + 24 + 1,
> +		.htotal = 1080 + 24 + 1 + 24,
> +		.vdisplay = 1920,
> +		.vsync_start = 1920 + 28,
> +		.vsync_end = 1920 + 28 + 1,
> +		.vtotal = 1920 + 28 + 1 + 28,
> +	}
> +};
> +
> +static struct panel_desc odin2portal_desc = {
> +	.modes = odin2portal_modes,
> +	.num_modes = ARRAY_SIZE(odin2portal_modes),
> +	.width_mm = 160,
> +	.height_mm = 89,
> +	.bpc = 8,
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_CLOCK_NON_CONTINUOUS |
> +			MIPI_DSI_MODE_LPM,
> +	.init_sequence = icna3512_init_sequence,
> +	.dsc = {
> +		.dsc_version_major = 0x1,
> +		.dsc_version_minor = 0x1,
> +		.slice_height = 20,
> +		.slice_width = 540,
> +		.slice_count = 2,
> +		.bits_per_component = 8,
> +		.bits_per_pixel = 8 << 4,
> +		.block_pred_enable = true,
> +	},
> +};
> +
> +static struct panel_desc thor_top_desc = {
> +	.modes = thor_top_modes,
> +	.num_modes = ARRAY_SIZE(thor_top_modes),
> +	.width_mm = 136,
> +	.height_mm = 68,
> +	.bpc = 8,
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags =  MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_CLOCK_NON_CONTINUOUS |
> +			MIPI_DSI_MODE_LPM,
> +	.init_sequence = icna3520_init_sequence,
> +	.dsc = {
> +		.dsc_version_major = 0x1,
> +		.dsc_version_minor = 0x1,
> +		.slice_height = 12,
> +		.slice_width = 540,
> +		.slice_count = 2,
> +		.bits_per_component = 8,
> +		.bits_per_pixel = 8 << 4,
> +		.block_pred_enable = true,
> +	},
> +};
> +
> +static void icna35xx_reset(struct panel_info *pinfo)
> +{
> +	gpiod_set_value_cansleep(pinfo->reset_gpio, 0);
> +	usleep_range(20000, 21000);
> +	gpiod_set_value_cansleep(pinfo->reset_gpio, 1);
> +	usleep_range(20000, 21000);
> +	gpiod_set_value_cansleep(pinfo->reset_gpio, 0);
> +	usleep_range(20000, 21000);
> +}
> +
> +static int icna35xx_prepare(struct drm_panel *panel)
> +{
> +	struct panel_info *pinfo = to_panel_info(panel);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(panel_supplies), pinfo->supplies);
> +	if (ret < 0) {
> +		dev_err(panel->dev, "failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	icna35xx_reset(pinfo);
> +
> +	ret = pinfo->desc->init_sequence(pinfo);
> +	if (ret < 0) {
> +		regulator_bulk_disable(ARRAY_SIZE(panel_supplies), pinfo->supplies);
> +		dev_err(panel->dev, "failed to initialize panel: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int icna35xx_disable(struct drm_panel *panel)
> +{
> +	struct panel_info *pinfo = to_panel_info(panel);
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = pinfo->dsi };
> +
> +	pinfo->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 50);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int icna35xx_unprepare(struct drm_panel *panel)
> +{
> +	struct panel_info *pinfo = to_panel_info(panel);
> +
> +	gpiod_set_value_cansleep(pinfo->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(panel_supplies), pinfo->supplies);
> +
> +	return 0;
> +}
> +
> +static int icna35xx_get_modes(struct drm_panel *panel,
> +			       struct drm_connector *connector)
> +{
> +	struct panel_info *pinfo = to_panel_info(panel);
> +
> +	return drm_connector_helper_get_modes_fixed(connector, pinfo->desc->modes);
> +}
> +
> +static enum drm_panel_orientation icna35xx_get_orientation(struct drm_panel *panel)
> +{
> +	struct panel_info *pinfo = to_panel_info(panel);
> +
> +	return pinfo->orientation;
> +}
> +
> +static const struct drm_panel_funcs icna35xx_panel_funcs = {
> +	.disable = icna35xx_disable,
> +	.prepare = icna35xx_prepare,
> +	.unprepare = icna35xx_unprepare,
> +	.get_modes = icna35xx_get_modes,
> +	.get_orientation = icna35xx_get_orientation,
> +};
> +
> +static int icna35xx_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness = backlight_get_brightness(bl);
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return ret;
> +}
> +
> +static int icna35xx_bl_get_brightness(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness;
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_get_display_brightness_large(dsi, &brightness);
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return ret < 0 ? ret : brightness;
> +}
> +
> +static const struct backlight_ops icna35xx_bl_ops = {
> +	.update_status = icna35xx_bl_update_status,
> +	.get_brightness = icna35xx_bl_get_brightness,
> +};
> +
> +static struct backlight_device *icna35xx_create_backlight(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	const struct backlight_properties props = {
> +		.type = BACKLIGHT_RAW,
> +		.brightness = 4096,
> +		.max_brightness = 4096,
> +	};
> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +					      &icna35xx_bl_ops, &props);
> +}
> +
> +static int icna35xx_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct panel_info *pinfo;
> +	int ret;
> +
> +	pinfo = devm_drm_panel_alloc(dev, __typeof(*pinfo), panel,
> +				     &icna35xx_panel_funcs,
> +				     DRM_MODE_CONNECTOR_DSI);
> +	if (IS_ERR(pinfo))
> +		return PTR_ERR(pinfo);
> +
> +	ret = devm_regulator_bulk_get_const(dev, ARRAY_SIZE(panel_supplies),
> +					    panel_supplies, &pinfo->supplies);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to get regulators\n");
> +
> +	pinfo->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(pinfo->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(pinfo->reset_gpio), "failed to get reset gpio\n");
> +
> +	pinfo->desc = (struct panel_desc *)of_device_get_match_data(dev);
> +	if (!pinfo->desc)
> +		return -ENODEV;
> +
> +	pinfo->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, pinfo);
> +
> +	ret = of_drm_get_panel_orientation(dev->of_node, &pinfo->orientation);
> +	if (ret < 0) {
> +		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, ret);
> +		return ret;
> +	}
> +
> +	pinfo->panel.prepare_prev_first = true;
> +
> +	pinfo->panel.backlight = icna35xx_create_backlight(dsi);
> +	if (IS_ERR(pinfo->panel.backlight))
> +		return dev_err_probe(dev, PTR_ERR(pinfo->panel.backlight),
> +				     "Failed to create backlight\n");
> +
> +	ret = devm_drm_panel_add(dev, &pinfo->panel);
> +	if (ret)
> +		return ret;
> +
> +	pinfo->dsi->lanes = pinfo->desc->lanes;
> +	pinfo->dsi->format = pinfo->desc->format;
> +	pinfo->dsi->mode_flags = pinfo->desc->mode_flags;
> +	pinfo->dsi->dsc = &pinfo->desc->dsc;
> +
> +	return devm_mipi_dsi_attach(dev, dsi);
> +}
> +
> +static const struct of_device_id icna35xx_of_match[] = {
> +	{ .compatible = "ayaneo,pocketds-panel-top", .data = &odin2portal_desc },
> +	{ .compatible = "ayntec,odin2portal-panel", .data = &odin2portal_desc },
> +	{ .compatible = "ayntec,odin3-panel", .data = &thor_top_desc },
> +	{ .compatible = "ayntec,thor-panel-top", .data = &thor_top_desc },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, icna35xx_of_match);
> +
> +static struct mipi_dsi_driver icna35xx_driver = {
> +	.probe = icna35xx_probe,
> +	.driver = {
> +		.name = "panel-chipone-icna35xx",
> +		.of_match_table = icna35xx_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(icna35xx_driver);
> +
> +MODULE_AUTHOR("Teguh Sobirin <teguh@sobir.in>");
> +MODULE_DESCRIPTION("DRM driver for Chipone ICNA35XX based MIPI DSI panels");
> +MODULE_LICENSE("GPL");
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
