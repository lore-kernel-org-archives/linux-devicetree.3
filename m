Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCF61FBEA8
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779112514; cv=none; b=OyargjDBoRSItE4ZVklr2ll3FVQTrwW8QPj22YCwM3Y5mq6J8CVHColTp5m0tum/zl26da0ROSw+hk0ICHUmBkOzC4QGBpYDHLGMR+qeZGzG8BS88++M+ljgcnpAh1bB4rK9mN/cNpBNkIwkkgTjtMFNamAWlMZyTt8gBOWLb7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779112514; c=relaxed/simple;
	bh=P7oW2bYCUlCoyZ+ZiTLkTs/xSYEAHWrhOhuQCckOmqw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=miYpKI2INxszETEogbJ3rjGWUo7wTRE4igBE9q/b4A5UlEDBOPiS3D/Na6sSFqrGMd8/4s0YGL4ZONQ0wp3L8ZQyYar7HijmVmur/xqoL24yCMlUNYof3+I/XAi+UxS0jdDtjGx71uwA7YTmW7qiQzYpWZ7tScqqc5mDJBQJjfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XLZ2COCD; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XLZ2COCD"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4585a116a4aso1877647f8f.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 06:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779112510; x=1779717310; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WcE1LzzSO9MDu9gxSK1yf7AYxljj2oykOT7K6n+Do0=;
        b=XLZ2COCDgyCsMWIjH7IQoNTNU2BnrahQSmkYj7JzoLM6CVTunt7B7bdeeQnPscJ4jd
         nBB0maJ0t2iLNKmtrPtf8r7MeIsQylVArmLR21HVV5dcvTdTl143WOLvpn6RuZZiETU/
         fBIuoytpJSBqtkU0ZGdCZUqojYgAco7ay/pzObsG/Gm26FquYsu4XlxXi5sWJ42Jy8sw
         U1eMDhBvxMoboNO8velGoIxDsWso+Km9O1mOy0OpZCEf/isOgqdzwswnxnlbngYmA9P8
         AVJ7MwQMkyxORhISBGhEmvi69izAbdkjyC/noSlSQQ2aevkC1bqe24Ff/c/SPnpzXsId
         TGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779112510; x=1779717310;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WcE1LzzSO9MDu9gxSK1yf7AYxljj2oykOT7K6n+Do0=;
        b=dk1tzpsHjUHfk2rTIOEoQLQvjg1LLjd/DKW3GTHY7YcTqQcxG3braJnPRA6yPxvH+m
         IF66SEBWip2BrdNkn6a2dpnlRh6aTuXHYpGs8d8wtxfedyvdMtkSmMWGg7RqkUWtsGwV
         Kat8E+VAsg7Kcnzb91gEOWDbFux/AjxWKfjjPj8hUnAnl3St/JlOfXbMSOJqgZu20mTZ
         du3VRPfOJS4DSHvUtrxQEJOMBdk8cu7mnClsyKf0hah8ezCkJnjAH2Bb68W5x4GeSKKH
         N7CAmQnpOg9kcIvADQDrTZj1pVyJwyHZPA0p9BeMmtWQh7WF5gNoz66Swfq8kvI9m6Jt
         M/+g==
X-Gm-Message-State: AOJu0YzQ1l7IVAavSezE7rjgLOh7SE9KwPle1HG+emVSGwol1Xf97pg8
	dM82Ndjw6MFt/w17zG0XjwumPdKgaOS8D/zCI2lnS9A/qL89GQ2dSv29lD5561b9cDo=
X-Gm-Gg: Acq92OHmk4XjL5IMz2lcQfxiMt1OX1OI9vtgWKVd5ucz0kT9C0+w0HycQ0ZOi36xnJH
	AniOoFo401jMzszIxbhErHKMJLomcUuEa+Y9xbF3u4nUYMRuWRCdN97Qw/kp+EZC5hJXPM1bYlt
	5hUl7tUNm5gcIIpvWpXHTK/YJWyrAsvNLboLSy2n2ST59pb7A71FZdLs+FJsqGMUUEAOyGnkvwy
	VSnqc+fGVHCmpSm6Pk1V9isXWIqgxhgqpSfuq6LJbbN7cdSerburAJn43nQUN2fdqpmsh1hcJ/O
	YuVYL8sacBVHLTM0ZHuHKimwMVzVpKV6olwcBQS9JV78IzcmY9JDVP0v/xRY/WisOq92ZbkfbQH
	c2QD9znP1Fqvv9aZ7gRw8Nq/E6YQ8krCp4kQow8WIPyd2qDLBKzVM+xDOFIZz9NNbuZBVwV0hVF
	CWNb847mwlmWIGbHksX6abo3dO+RORutAQ7jhbTIYFG6QB46/vRLFsjdC2+2GAYgvwac4WGGK/B
	ds4ifg=
X-Received: by 2002:a05:6000:2f87:b0:43d:740:fb37 with SMTP id ffacd0b85a97d-45e5c5bed83mr25682280f8f.24.1779112510256;
        Mon, 18 May 2026 06:55:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1029:e3c5:362e:1250? ([2a01:e0a:106d:1080:1029:e3c5:362e:1250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767d0bsm35960896f8f.3.2026.05.18.06.55.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 06:55:09 -0700 (PDT)
Message-ID: <c5ea73cc-ac1f-43ba-bcf1-0083a59bbef9@linaro.org>
Date: Mon, 18 May 2026 15:55:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH V2 4/6] drm/panel: anbernic-td4310: Add RG Vita Pro panel
To: Chris Morgan <macroalpha82@gmail.com>, linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, xsf@rock-chips.com, sre@kernel.org,
 simona@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, jesszhan0024@gmail.com, heiko@sntech.de,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
References: <20260515221947.299229-1-macroalpha82@gmail.com>
 <20260515221947.299229-5-macroalpha82@gmail.com>
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
In-Reply-To: <20260515221947.299229-5-macroalpha82@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/26 00:19, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The panel used by Anbernic in the RG Vita-Pro is a DSI panel based
> on the TD4310 controller IC. It measures approximately 5.5 inches
> diagonally and is 1080x1920 in resolution.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>   drivers/gpu/drm/panel/Kconfig                 |  10 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   drivers/gpu/drm/panel/panel-anbernic-td4310.c | 291 ++++++++++++++++++
>   3 files changed, 302 insertions(+)
>   create mode 100644 drivers/gpu/drm/panel/panel-anbernic-td4310.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index d592f4f4b939..61dd00297ecc 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -17,6 +17,16 @@ config DRM_PANEL_ABT_Y030XX067A
>   	  Y030XX067A 320x480 3.0" panel as found in the YLM RG-280M, RG-300
>   	  and RG-99 handheld gaming consoles.
>   
> +config DRM_PANEL_ANBERNIC_TD4310
> +	tristate "Anbernic TD4310 LCD panel"
> +	depends on GPIOLIB && OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here to enable support for Anbernic designed panels with the
> +	  TD4310 panel controller such as the ones used on the Anbernic RG
> +	  Vita Pro.
> +
>   config DRM_PANEL_ARM_VERSATILE
>   	tristate "ARM Versatile panel driver"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index a4291dc3905b..9d8f70c9de3e 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -1,5 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   obj-$(CONFIG_DRM_PANEL_ABT_Y030XX067A) += panel-abt-y030xx067a.o
> +obj-$(CONFIG_DRM_PANEL_ANBERNIC_TD4310) += panel-anbernic-td4310.o
>   obj-$(CONFIG_DRM_PANEL_ARM_VERSATILE) += panel-arm-versatile.o
>   obj-$(CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596) += panel-asus-z00t-tm5p5-n35596.o
>   obj-$(CONFIG_DRM_PANEL_AUO_A030JTN01) += panel-auo-a030jtn01.o
> diff --git a/drivers/gpu/drm/panel/panel-anbernic-td4310.c b/drivers/gpu/drm/panel/panel-anbernic-td4310.c
> new file mode 100644
> index 000000000000..733c68ff9771
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-anbernic-td4310.c
> @@ -0,0 +1,291 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for Anbernic panels with TD4310 panel controller.
> + *
> + * Copyright (C) 2026 Chris Morgan <macromorgan@hotmail.com>
> + *
> + */
> +
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
> +struct anbernic_panel_td4310_info {
> +	const struct drm_display_mode *display_modes;
> +	unsigned int num_modes;
> +	u16 width_mm;
> +	u16 height_mm;
> +	u32 bus_flags;
> +	unsigned long mode_flags;
> +	u32 format;
> +	u32 lanes;
> +	u16 prepare_delay;
> +	u16 reset_delay;
> +	u16 init_delay;
> +	u16 enable_delay;
> +	u16 disable_delay;
> +	u16 unprepare_delay;
> +};
> +
> +struct anbernic_panel_td4310 {
> +	struct device *dev;
> +	struct mipi_dsi_device *dsi;
> +	struct drm_panel panel;
> +	const struct anbernic_panel_td4310_info *panel_info;
> +	struct gpio_desc *reset_gpio;
> +	struct gpio_desc *enable_gpio;
> +	struct regulator *vdd;
> +	enum drm_panel_orientation orientation;
> +};
> +
> +static inline struct anbernic_panel_td4310 *panel_to_anbernic_panel_td4310(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct anbernic_panel_td4310, panel);
> +}
> +
> +static int panel_anbernic_td4310_prepare(struct drm_panel *panel)
> +{
> +	struct anbernic_panel_td4310 *ctx = panel_to_anbernic_panel_td4310(panel);
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
> +	int ret;
> +
> +	ret = regulator_enable(ctx->vdd);
> +	if (ret)
> +		return ret;
> +
> +	if (ctx->enable_gpio) {

Drop the if, gpiod_set_value_cansleep will check a return if the gpio desc is NULL.

> +		ret = gpiod_set_value_cansleep(ctx->enable_gpio, 1);
> +		if (ret)
> +			goto err_enable;
> +	};
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	mipi_dsi_msleep(&dsi_ctx, 10);
> +
> +	ret = gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	if (ret)
> +		goto err_reset;
> +	if (ctx->panel_info->reset_delay)
> +		mipi_dsi_msleep(&dsi_ctx, ctx->panel_info->reset_delay);
> +	ret = gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	if (ret)
> +		goto err_reset;
> +
> +	if (ctx->panel_info->enable_delay)
> +		mipi_dsi_msleep(&dsi_ctx, ctx->panel_info->enable_delay);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 100);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 100);
> +
> +	return dsi_ctx.accum_err;
> +
> +err_reset:

And you don't check it here

> +	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
> +err_enable:
> +	regulator_disable(ctx->vdd);
> +	return ret;
> +}
> +
> +static int panel_anbernic_td4310_unprepare(struct drm_panel *panel)
> +{
> +	struct anbernic_panel_td4310 *ctx = panel_to_anbernic_panel_td4310(panel);
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
> +
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	if (ctx->enable_gpio)

Ditto

> +		gpiod_set_value_cansleep(ctx->enable_gpio, 0);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +
> +	regulator_disable(ctx->vdd);
> +
> +	return 0;
> +}
> +
> +static int panel_anbernic_td4310_get_modes(struct drm_panel *panel,
> +				    struct drm_connector *connector)
> +{
> +	struct anbernic_panel_td4310 *ctx = panel_to_anbernic_panel_td4310(panel);
> +	const struct anbernic_panel_td4310_info *panel_info = ctx->panel_info;
> +	struct drm_display_mode *mode;
> +	unsigned int i;
> +
> +	for (i = 0; i < panel_info->num_modes; i++) {
> +		mode = drm_mode_duplicate(connector->dev,
> +					  &panel_info->display_modes[i]);
> +		if (!mode)
> +			return -ENOMEM;
> +
> +		drm_mode_set_name(mode);
> +
> +		mode->type = DRM_MODE_TYPE_DRIVER;
> +		if (panel_info->num_modes == 1)
> +			mode->type |= DRM_MODE_TYPE_PREFERRED;
> +
> +		drm_mode_probed_add(connector, mode);
> +	}

Can you add support for a sinlge mode right now, call drm_connector_helper_get_modes_fixed()
and implement support for multiple modes when a panel needs it ?

> +
> +	connector->display_info.bpc = 8;
> +	connector->display_info.width_mm = panel_info->width_mm;
> +	connector->display_info.height_mm = panel_info->height_mm;
> +	connector->display_info.bus_flags = panel_info->bus_flags;
> +
> +	return panel_info->num_modes;
> +}
> +
> +static enum drm_panel_orientation panel_anbernic_td4310_get_orientation(struct drm_panel *panel)
> +{
> +	struct anbernic_panel_td4310 *ctx = panel_to_anbernic_panel_td4310(panel);
> +
> +	return ctx->orientation;
> +}
> +
> +static const struct drm_panel_funcs panel_anbernic_td4310_funcs = {
> +	.prepare = panel_anbernic_td4310_prepare,
> +	.unprepare = panel_anbernic_td4310_unprepare,
> +	.get_modes = panel_anbernic_td4310_get_modes,
> +	.get_orientation = panel_anbernic_td4310_get_orientation,
> +};
> +
> +static int panel_anbernic_td4310_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct anbernic_panel_td4310 *ctx;
> +	int ret;
> +
> +	ctx = devm_drm_panel_alloc(dev, struct anbernic_panel_td4310, panel,
> +				   &panel_anbernic_td4310_funcs,
> +				   DRM_MODE_CONNECTOR_DSI);
> +	if (IS_ERR(ctx))
> +		return PTR_ERR(ctx);
> +
> +	ctx->dev = dev;
> +
> +	ctx->panel_info = of_device_get_match_data(dev);
> +	if (!ctx->panel_info)
> +		return -EINVAL;
> +
> +	ret = of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to get panel orientation\n");
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +				     "Cannot get reset gpio\n");
> +
> +	ctx->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ctx->enable_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->enable_gpio),
> +				     "Cannot get enable gpio\n");
> +
> +	ctx->vdd = devm_regulator_get(dev, "vdd");
> +	if (IS_ERR(ctx->vdd))
> +		return dev_err_probe(dev, PTR_ERR(ctx->vdd),
> +				     "Failed to request vdd regulator\n");
> +
> +	ctx->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	dsi->lanes = ctx->panel_info->lanes;
> +	dsi->format = ctx->panel_info->format;
> +	dsi->mode_flags = ctx->panel_info->mode_flags;
> +
> +	ret = drm_panel_of_backlight(&ctx->panel);
> +	if (ret)
> +		return ret;
> +
> +	drm_panel_add(&ctx->panel);

devm_drm_panel_add()

> +
> +	ret = mipi_dsi_attach(dsi);

devm_mipi_dsi_attach()

> +	if (ret < 0) {
> +		dev_err(dev, "mipi_dsi_attach failed: %d\n", ret);
> +		drm_panel_remove(&ctx->panel);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void panel_anbernic_td4310_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct anbernic_panel_td4310 *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> +
> +	drm_panel_remove(&ctx->panel);
> +}

And drop remove completely

> +
> +static const struct drm_display_mode anbernic_vitapro_modes[] = {
> +	{
> +		.clock = 140020,
> +		.hdisplay = 1080,
> +		.hsync_start = 1080 + 50,
> +		.hsync_end = 1080 + 50 + 4,
> +		.htotal = 1080 + 50 + 4 + 50,
> +		.vdisplay = 1920,
> +		.vsync_start = 1920 + 15,
> +		.vsync_end = 1920 + 15 + 4,
> +		.vtotal = 1920 + 15 + 4 + 32,
> +		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +	},
> +};
> +
> +static const struct anbernic_panel_td4310_info anbernic_vitapro_info = {
> +	.display_modes = anbernic_vitapro_modes,
> +	.num_modes = ARRAY_SIZE(anbernic_vitapro_modes),
> +	.width_mm = 69,
> +	.height_mm = 121,
> +	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET |
> +		      MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.lanes = 4,
> +	.prepare_delay = 50,
> +	.reset_delay = 220,
> +	.enable_delay = 120,
> +	.disable_delay = 50,
> +	.unprepare_delay = 20,
> +};
> +
> +static const struct of_device_id panel_anbernic_td4310_of_match[] = {
> +	{
> +		.compatible = "anbernic,panel-vita-pro",
> +		.data = &anbernic_vitapro_info,
> +	},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, panel_anbernic_td4310_of_match);
> +
> +static struct mipi_dsi_driver anbernic_panel_td4310_driver = {
> +	.driver = {
> +		.name = "panel-anbernic-td4310",
> +		.of_match_table = panel_anbernic_td4310_of_match,
> +	},
> +	.probe	= panel_anbernic_td4310_probe,
> +	.remove = panel_anbernic_td4310_remove,
> +};
> +module_mipi_dsi_driver(anbernic_panel_td4310_driver);
> +
> +MODULE_AUTHOR("Chris Morgan <macromorgan@hotmail.com>");
> +MODULE_DESCRIPTION("DRM driver for Anbernic TD4310 MIPI DSI panels");
> +MODULE_LICENSE("GPL");

Thanks,
Neil
