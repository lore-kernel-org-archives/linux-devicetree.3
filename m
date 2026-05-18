Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D5F481226
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779112247; cv=none; b=CPfXT4G+FrlrCaCFgwm2SWLiOjh/rPqAXq403LO6iLqcAM8K+QzcGFPz8MDITiYC2iZ2P+oUNhTo8Q20p1BZ/P3dBiQZam4NTpCwieqKEwxIoZwxISLSJv5fhGwNKx7tWQE7ugZ6M36zntUrl5cXL59UM+c1Hf9g7FL48Ko/TY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779112247; c=relaxed/simple;
	bh=2t+QsW4kfA07vDQxGzyN9fHwm30qqtMPJ7sB9rskw5U=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lqrhln27b+st3aWsuoUGzD2L/P+E8DybI8CUfBhW+gkX2ZZcMf/25BhnxPwPQqcxH5KM47yX35zMroAAjnogktkD3m3hMUso80oJVFutc4Niakh8HXQUrdzcqC+m3dLZ3HJ5qanZ6dU0kIaTc/Zkz9XnqX7QUCXl9Kq830I2uM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OrvzO/mh; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OrvzO/mh"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45ae6a0e523so1128850f8f.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 06:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779112243; x=1779717043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/bHSg+CsXEQuQyIGygKlX3vGV6VbhcTXpINe47Kmze4=;
        b=OrvzO/mh++OHNycGtPP+hkJ/rP662JgFeRL0oOWW2GFPDocOsMxezKsVf5YWY+aMDx
         qLIQDDB/jP6Z1rjgLR1+uB5fHkGzflr9sMbs5uUpBzqf3dkrzAhc04sahAe4776glohc
         4Rt5MeIcNPIj1NpsReFkm9bEeb2GgOtqCTjIKfMLFuRNPdu7nOZSTknKFjDrHy5xLLUp
         UGLLTxljjaKr8b2tlBcYg2diraORe3vuoeMRYUr2wIZg29gpEydMD5vvNUE91/4pxmak
         YaS5vOnthD3rA4S0HYGDJCRE40ktW29lF28kPViv/l2UtQ34gBkmQyJjXj+hVYIvkXTD
         odLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779112243; x=1779717043;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/bHSg+CsXEQuQyIGygKlX3vGV6VbhcTXpINe47Kmze4=;
        b=GBjoM7D9SElfw5Y9pZUhBGxCSmlE3nur8WKInhYl3JjXKkoVLLE//gWxeKFpQAJFSW
         c2hbkcBwyDw5QhPJqRBSVALIO/yZW46Y7fHGVfYQAp3akyKu6aGuu+wlymuZqAvPKH0d
         0nrN0nB/n6JgYPWaOHCHBFQOazEU4E/wtaOxvu0byYKR0ODwZnk8ZIlxLSmxessuK8Ln
         Y7z6E8Wa1aZmPHTQAXIzO3q+j3KGApoDPfWaQQvRTldRXnb1wGNEgX+QlXa6B+zRCH+q
         dAgu3d//m7zvRhEftFckXPyhxfon/r4fjg5gO4EQSlK5Ei7+oHfSvaDYhHi1lc2aEFxy
         aa5g==
X-Forwarded-Encrypted: i=1; AFNElJ8sYzZsLfLXx4/YrGMWsZyfzZEMty0K+RlzLbsKgJwAt7DfydO6Bc83gLyXyHvBvNPqo2Z6Zlr3rF8o@vger.kernel.org
X-Gm-Message-State: AOJu0YxJC26Tn63X94ZOwdvXb4J6IAkSmmrP1MCA1XLYpZlrPVGSm9f9
	GZe79xqWqvTIqGRBy9jYyQm17dy3zoM9VpO20YRIK3H656cJU0APaPBqKwfvJ/byPyw=
X-Gm-Gg: Acq92OFPGm47rS2ydhcEz2EVyHOeRBFzdWyBjeM7NR96rAC5aaH/6wFUHEp2fDUztNg
	2KV21wcpmhkek8AOPVSAbQOQ+lh0lMZSi5Qy/8+TYYxvKoopfUzXIA/erC+Mr/vlBbOpj+ZDcNR
	fnYuizO+xG4YwdmLlyoW7ET3HJ0IXIqDJD0JYMXVIs15dqzlRxtizK02cBgbD/aerk71hLCoSI8
	NIHRt9ApVAM4er/XIl0fDWxz1zwtBGhJ34zFikYKABoA2Am/Ky8H8kDewfmT5RfrmlJKKmzgeb/
	2siY4nxUaCzf8XO4Iuum+4lraJ21xNdPxvwb/F8CKHdevz8RBqWPA7/rV+oexLVV0aXYv4X/qtD
	WyYeCvqlgtfiowm5jo3GgGM+jWDNeD9PZdGmOiXaIA+3se1jLtrWdgX/1bZ3bv+3XnUAOBbfZr/
	zXjmgtxQVhuLEwre18RJA/J5Xs5/ZU/uL0sWBIrqaP5xyqMNC/1aUYOCE0dUNpvbECoY3+LNy73
	Sjb9z6HB5ZobaL8QA==
X-Received: by 2002:a05:6000:2283:b0:439:c18f:5aaf with SMTP id ffacd0b85a97d-45e5c595637mr24189566f8f.34.1779112242262;
        Mon, 18 May 2026 06:50:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1029:e3c5:362e:1250? ([2a01:e0a:106d:1080:1029:e3c5:362e:1250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3b18fsm34800203f8f.11.2026.05.18.06.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 06:50:41 -0700 (PDT)
Message-ID: <2c522467-98df-4467-af43-83af4286c86b@linaro.org>
Date: Mon, 18 May 2026 15:50:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: add Ilitek ILI7807S panel driver
To: Arpit Saini <arpit.saini@oss.qualcomm.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
References: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>
 <20260518-ili7807s-panel-v1-2-d7b048163b1c@oss.qualcomm.com>
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
In-Reply-To: <20260518-ili7807s-panel-v1-2-d7b048163b1c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 5/18/26 13:04, Arpit Saini wrote:
> Add a DRM panel driver for the DLC DLC0697 1080x1920@60Hz MIPI DSI
> panel based on the Ilitek ILI7807S display controller.
> 
> Backlight brightness is controlled by sending DCS commands
> directly over DSI using mipi_dsi_dcs.
> 
> The panel operates in video burst mode with four data lanes using
> RGB888 pixel format.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/panel/Kconfig                 |  12 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   drivers/gpu/drm/panel/panel-ilitek-ili7807s.c | 328 ++++++++++++++++++++++++++
>   3 files changed, 341 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 307152ad7759..226e4923aa3a 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -228,6 +228,18 @@ config DRM_PANEL_HYDIS_HV101HD1
>   
>   	  If M is selected the module will be called panel-hydis-hv101hd1
>   
> +config DRM_PANEL_ILITEK_ILI7807S
> +	tristate "Ilitek ILI7807S-based panels"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y if you want to enable support for panels based on the
> +	  Ilitek ILI7807S display controller, such as the DLC DLC0697
> +	  1080x1920 MIPI DSI panel.
> +
> +	  If M is selected the module will be called panel-ilitek-ili7807s.
> +
>   config DRM_PANEL_ILITEK_IL9322
>   	tristate "Ilitek ILI9322 320x240 QVGA panels"
>   	depends on OF && SPI
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index aeffaa95666d..13bd324e17a8 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -23,6 +23,7 @@ obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112A) += panel-himax-hx83112a.o
>   obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112B) += panel-himax-hx83112b.o
>   obj-$(CONFIG_DRM_PANEL_HIMAX_HX8394) += panel-himax-hx8394.o
>   obj-$(CONFIG_DRM_PANEL_HYDIS_HV101HD1) += panel-hydis-hv101hd1.o
> +obj-$(CONFIG_DRM_PANEL_ILITEK_ILI7807S) += panel-ilitek-ili7807s.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9805) += panel-ilitek-ili9805.o
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili7807s.c b/drivers/gpu/drm/panel/panel-ilitek-ili7807s.c
> new file mode 100644
> index 000000000000..09288b602a94
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili7807s.c
> @@ -0,0 +1,328 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
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
> +#include <drm/drm_probe_helper.h>
> +
> +struct panel_desc {
> +	const struct drm_display_mode *mode;
> +	unsigned int lanes;
> +	enum mipi_dsi_pixel_format format;
> +	unsigned long mode_flags;
> +	void (*init)(struct mipi_dsi_multi_context *dsi_ctx);
> +};
> +
> +struct ili7807s {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	const struct panel_desc *desc;
> +
> +	struct regulator_bulk_data *supplies;
> +	struct gpio_desc *reset_gpio;
> +	struct gpio_desc *backlight_en_gpio;
> +};
> +
> +static const struct regulator_bulk_data ili7807s_supplies[] = {
> +	{ .supply = "vddi" },
> +	{ .supply = "avdd" },
> +	{ .supply = "avee" },
> +};
> +
> +static inline struct ili7807s *to_ili7807s(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct ili7807s, panel);
> +}
> +
> +static void ili7807s_reset(struct ili7807s *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(10000, 11000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +}
> +
> +static void dlc0697_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
> +{
> +	mipi_dsi_dcs_soft_reset_multi(dsi_ctx);
> +	mipi_dsi_msleep(dsi_ctx, 120);
> +
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x78, 0x07, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x35, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x5e, 0x09, 0x99);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x53, 0x24);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x55, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x51, 0x3f, 0xff);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(dsi_ctx);
> +	mipi_dsi_msleep(dsi_ctx, 120);
> +
> +	mipi_dsi_dcs_set_display_on_multi(dsi_ctx);
> +	mipi_dsi_msleep(dsi_ctx, 20);
> +}
> +
> +static int ili7807s_on(struct ili7807s *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	ctx->desc->init(&dsi_ctx);
> +
> +	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int ili7807s_off(struct ili7807s *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 20);
> +
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int ili7807s_enable(struct drm_panel *panel)
> +{
> +	struct ili7807s *ctx = to_ili7807s(panel);
> +
> +	if (ctx->backlight_en_gpio)

Drop the check, if backlight_en_gpio is NULL (since optional), set_value will be a no-op.

> +		gpiod_set_value_cansleep(ctx->backlight_en_gpio, 1);
> +
> +	return 0;
> +}
> +
> +static int ili7807s_disable(struct drm_panel *panel)
> +{
> +	struct ili7807s *ctx = to_ili7807s(panel);
> +
> +	if (ctx->backlight_en_gpio)

Ditto

> +		gpiod_set_value_cansleep(ctx->backlight_en_gpio, 0);
> +
> +	return 0;
> +}
> +
> +static int ili7807s_prepare(struct drm_panel *panel)
> +{
> +	struct ili7807s *ctx = to_ili7807s(panel);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ili7807s_supplies), ctx->supplies);
> +	if (ret < 0) {
> +		dev_err(ctx->panel.dev, "failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	msleep(20);
> +
> +	ili7807s_reset(ctx);
> +
> +	ret = ili7807s_on(ctx);
> +	if (ret < 0) {
> +		dev_err(ctx->panel.dev, "failed to initialise panel: %d\n", ret);
> +		goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +
> +	regulator_bulk_disable(ARRAY_SIZE(ili7807s_supplies), ctx->supplies);
> +	return ret;
> +}
> +
> +static int ili7807s_unprepare(struct drm_panel *panel)
> +{
> +	struct ili7807s *ctx = to_ili7807s(panel);
> +	int ret;
> +
> +	ret = ili7807s_off(ctx);
> +	if (ret < 0)
> +		dev_err(ctx->panel.dev, "failed to disable panel: %d\n", ret);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +
> +	regulator_bulk_disable(ARRAY_SIZE(ili7807s_supplies), ctx->supplies);
> +
> +	return 0;
> +}
> +
> +static int ili7807s_get_modes(struct drm_panel *panel,
> +			      struct drm_connector *connector)
> +{
> +	struct ili7807s *ctx = to_ili7807s(panel);
> +
> +	return drm_connector_helper_get_modes_fixed(connector, ctx->desc->mode);
> +}
> +
> +static const struct drm_panel_funcs ili7807s_panel_funcs = {
> +	.prepare   = ili7807s_prepare,
> +	.unprepare = ili7807s_unprepare,
> +	.enable    = ili7807s_enable,
> +	.disable   = ili7807s_disable,
> +	.get_modes = ili7807s_get_modes,
> +};
> +
> +static int ili7807s_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness = backlight_get_brightness(bl);
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;

Add back MIPI_DSI_MODE_LPM before checking ret like :


+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+	if (ret < 0)
+		return ret;

> +
> +	return ret;
> +}
> +
> +static const struct backlight_ops ili7807s_bl_ops = {
> +	.update_status = ili7807s_bl_update_status,
> +};
> +
> +static struct backlight_device *ili7807s_create_backlight(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	const struct backlight_properties props = {
> +		.type           = BACKLIGHT_RAW,
> +		.brightness     = 0x3fff,
> +		.max_brightness = 0x3fff,
> +	};
> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +					      &ili7807s_bl_ops, &props);
> +}
> +
> +static const struct drm_display_mode dlc0697_mode = {
> +	.clock = 131911,
> +
> +	.hdisplay    = 1080,
> +	.hsync_start = 1080 + 18,
> +	.hsync_end   = 1080 + 18 + 2,
> +	.htotal      = 1080 + 18 + 2 + 16,
> +
> +	.vdisplay    = 1920,
> +	.vsync_start = 1920 + 26,
> +	.vsync_end   = 1920 + 26 + 4,
> +	.vtotal      = 1920 + 26 + 4 + 20,
> +
> +	.width_mm  = 0,
> +	.height_mm = 0,
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct panel_desc dlc0697_desc = {
> +	.mode       = &dlc0697_mode,
> +	.lanes      = 4,
> +	.format     = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST,
> +	.init       = dlc0697_init_sequence,
> +};
> +
> +static int ili7807s_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	const struct panel_desc *desc;
> +	struct ili7807s *ctx;
> +	int ret;
> +
> +	ctx = devm_drm_panel_alloc(dev, struct ili7807s, panel,
> +				   &ili7807s_panel_funcs,
> +				   DRM_MODE_CONNECTOR_DSI);
> +	if (IS_ERR(ctx))
> +		return PTR_ERR(ctx);
> +
> +	desc = of_device_get_match_data(dev);
> +	ctx->desc = desc;
> +
> +	ret = devm_regulator_bulk_get_const(dev, ARRAY_SIZE(ili7807s_supplies),
> +					    ili7807s_supplies, &ctx->supplies);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to get regulators\n");
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +				     "failed to get reset gpio\n");
> +
> +	ctx->backlight_en_gpio = devm_gpiod_get_optional(dev, "backlight-en",
> +							 GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->backlight_en_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->backlight_en_gpio),
> +				     "failed to get backlight-en gpio\n");
> +
> +	ctx->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	dsi->lanes      = desc->lanes;
> +	dsi->format     = desc->format;
> +	dsi->mode_flags = desc->mode_flags;
> +
> +	ctx->panel.prepare_prev_first = true;
> +
> +	ctx->panel.backlight = ili7807s_create_backlight(dsi);
> +	if (IS_ERR(ctx->panel.backlight))
> +		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
> +				     "failed to create backlight\n");
> +
> +	drm_panel_add(&ctx->panel);

Switch to devm_drm_panel_add()

> +
> +	ret = devm_mipi_dsi_attach(dev, dsi);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to attach dsi\n");
> +
> +	return 0;
> +}
> +
> +static void ili7807s_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct ili7807s *ctx = mipi_dsi_get_drvdata(dsi);
> +
> +	drm_panel_remove(&ctx->panel);
> +}

And drop remove

> +
> +static const struct of_device_id ili7807s_of_match[] = {
> +	{ .compatible = "dlc,dlc0697", .data = &dlc0697_desc },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ili7807s_of_match);
> +
> +static struct mipi_dsi_driver ili7807s_dsi_driver = {
> +	.probe  = ili7807s_probe,
> +	.remove = ili7807s_remove,
> +	.driver = {
> +		.name           = "panel-ilitek-ili7807s",
> +		.of_match_table = ili7807s_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(ili7807s_dsi_driver);
> +
> +MODULE_AUTHOR("Arpit Saini <arpit.saini@oss.qualcomm.com>");
> +MODULE_DESCRIPTION("Panel driver for Ilitek ILI7807S LCD DSI panel");
> +MODULE_LICENSE("GPL");
> 

Thanks,
Neil
