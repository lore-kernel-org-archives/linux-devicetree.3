Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC4A3D75DE
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738027; cv=none; b=TqfT1GRc8KcDIuapr+6N5rmhQogUpQG+95MukVsIciVgqvT8oj7E5HIQ6yLB7xkfR3/+9soXBKF6qcTwhyINo/8o9S2fvRgkGavYjydwEHX+A4f4OLgdw9DLbU2BcTmf/bGTLbDz8kxX/RgSfRZ4Ckdnz/mJW0AvAv8Z96QYNvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738027; c=relaxed/simple;
	bh=Gye6YWIAKvRB9mCP9EIEHU0+JzycJOTIxJlgT0u7bRI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pMygdl0T8BFjB0OjvIyV6ih0+Z5JQUlbbeRympnk/kFCe4hj6f8z3myOY/f+zyDo1rIGOwip+xOHmqLmQ/DCZGY8UR+kZoUAabb9W6fjfTfabYW4NF1UODNu/JjJHoxoPcXjo/VQxtH2JHwygrm+LyhjoppveQKcZExKQWmzQZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zb7TlpPR; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zb7TlpPR"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482ddbc11aaso574341f8f.3
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787738024; x=1788342824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5JrH7nWWgGuvLy0NhN9o6PtziTy8uleFbA9BsnogKWU=;
        b=Zb7TlpPRIRVqW8cL99M7NkePzI1VcWZhkYn7Ej7Oh1uain9TIj8lCuRloAlr/X1Cu2
         gqDqRKg7NBaiVk3UpJuBPCjtT5nQVImw4lzHY/PRAoOYiKfnUfHDaIrE32vK9Ye875Xd
         LbJdI5xaKoRaZnEyrLkPD6JG6sn2kAiJkG6ihSBdUoKJitZWXHNQmiWD2IgSGY6GHmSY
         NA9gNouRdU6EYWRD9XE+YIig3W3WkDH5kNAIU4XA59F5OtXkxDyOMXjDo7Ji7K+mWUAD
         R+JKpOxhAb6qlC6g8+8EUd/7z0Lh+xVbTFNQozI5dVyLm+G0F7w+vbvWcDNwVT8kkmD0
         h0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787738024; x=1788342824;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5JrH7nWWgGuvLy0NhN9o6PtziTy8uleFbA9BsnogKWU=;
        b=NlqWi2myPrhyXyWnniAiMJ4ptCBgEFgOEBeip086X0NOXPbLPJJPsiNA/eS/BSQCed
         472CG2YgeG24cpniqp0B+3OXqXxUkzR3q9PC+KRtwsDIoLmhvpZznw2IMbk1x+WmYmEy
         rlaKluvekGnCiMbWGlOhaUYmnhr+0lDbFS/CG7lDRr5fo3wd8zGAhYzzxNx+1GRr5nFC
         5HAHKu94GB0zblGv3OsxcL479eth/5sBuKAa2vU3PBlOQnsJ5JVy7EIbYaVDSlPlRcXi
         HdHtv3z1g+1+80l/Qknx2rPp4qguhCZTAWUjiE4+SazDDbmAIDsYIUkmik2/f+gsCtzN
         UV7Q==
X-Forwarded-Encrypted: i=1; AHgh+RquZiCCMmhJcSMfrOSkvrMnDUp1/xg6RxpVKuFD6VKx4NqVManvZPSK3Lnst7Z/RIQ6ZOW+5YCkIxl1@vger.kernel.org
X-Gm-Message-State: AFuF++mFO/y2FiLt/mu+KSlWZtpKRBtoAcBC6VOe+H49TI54sgZsn68m
	nDSv6ysG95qjL/M4B9qdzNN2ezXKc6EAwr9IqRmIAVFBFNTxntSDLJneezVx+kYmc9g=
X-Gm-Gg: AR+sD10pAanHcUnPrNMS8w/S/fh6TsrNaVIChQbJF3vV5J0dKalUKNhkOAUDIK88Yps
	Hbqn7BQYUJb74XGuMiOXJCjqHT+0PplOFsirUtymyXs2DUOmQNxA7xSWUFpxUwHLY6Bx/Q6l+Xc
	gmF31IuVhdlQYDDbl811Qhwrqy1w52DYz3Jv0z5TvjpOgXX8AgQ3IbRu8zWrHe5kGYENLDEmLFi
	JcguRSTMRlR3IKw9M4AYKNvf0ICZHeKxeuSbPSqEgK7F5EZD5/2Fh0qZcCpbFympf80xc26D67q
	RNeeu2myUT+U4Pi0ZIrxbVJTiTXM6ZaR2bdsj4qspK3F+xxnvtj7N2BiuPsuYgsZN8uD/V/35Bs
	Bi/J0Dm5rIn1+rm7r5x0Z9AxzUEed0dO9yCsyr19RWOurjIVip+lEgmN5SJel3IX6cGQec/jf8L
	Kz8pHe1pOa7AIK0juiRz1Y6/JbSJuhWZcprIdhQXfWmf38/0r0MChH+ri9hWxivf//zpH9X8SdH
	n4U+njf/sfXLALSZKDBpoNphG0g7xcrpxHEJQY2pOPkfA==
X-Received: by 2002:a05:600c:a01:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-499dc7015bfmr42175085e9.7.1787738023576;
        Wed, 26 Aug 2026 02:53:43 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:135f:84f0:37f7:9223:8e7a:9b5f? ([2a0d:e487:135f:84f0:37f7:9223:8e7a:9b5f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dc977b7csm21589845e9.7.2026.08.26.02.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:53:43 -0700 (PDT)
Message-ID: <007e73a9-8220-46bb-89c6-2354740392c8@linaro.org>
Date: Wed, 26 Aug 2026 11:53:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/4] drm/panel: visionox-vtdr6130: Modularize panel config
To: webgeek1234@gmail.com, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260814-rp6-panel-v1-0-111c1aeccf0f@gmail.com>
 <20260814-rp6-panel-v1-3-111c1aeccf0f@gmail.com>
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
In-Reply-To: <20260814-rp6-panel-v1-3-111c1aeccf0f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/26 20:17, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> The vtdr6130 is a DDIC, a common chip that is used by multiple panels.
> Prepare the driver for more panels.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 95 +++++++++++++++++--------
>   1 file changed, 65 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> index b66d6c7128c75..805c9846c2a0b 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> @@ -19,11 +19,28 @@
>   
>   struct visionox_vtdr6130 {
>   	struct drm_panel panel;
> -	struct drm_dsc_config dsc;
> +	struct drm_connector *connector;

Why ? connector is unused in this patch.

>   	struct mipi_dsi_device *dsi;
>   	struct gpio_desc *reset_gpio;
>   	struct regulator_bulk_data *supplies;
>   	enum drm_panel_orientation orientation;
> +	struct visionox_vtdr6130_desc *desc;
> +};
> +
> +struct visionox_vtdr6130_desc {
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
> +	int (*init_sequence)(struct visionox_vtdr6130 *ctx);
> +
> +	struct drm_dsc_config dsc;
>   };
>   
>   static const struct regulator_bulk_data visionox_vtdr6130_supplies[] = {
> @@ -162,7 +179,7 @@ static int visionox_vtdr6130_prepare(struct drm_panel *panel)
>   
>   	visionox_vtdr6130_reset(ctx);
>   
> -	ret = visionox_vtdr6130_on(ctx);
> +	ret = ctx->desc->init_sequence(ctx);
>   	if (ret < 0) {
>   		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>   		regulator_bulk_disable(ARRAY_SIZE(visionox_vtdr6130_supplies),
> @@ -187,34 +204,58 @@ static int visionox_vtdr6130_unprepare(struct drm_panel *panel)
>   	return 0;
>   }
>   
> -static const struct drm_display_mode visionox_vtdr6130_mode = {
> -	.clock = (1080 + 20 + 2 + 20) * (2400 + 20 + 2 + 18) * 144 / 1000,
> -	.hdisplay = 1080,
> -	.hsync_start = 1080 + 20,
> -	.hsync_end = 1080 + 20 + 2,
> -	.htotal = 1080 + 20 + 2 + 20,
> -	.vdisplay = 2400,
> -	.vsync_start = 2400 + 20,
> -	.vsync_end = 2400 + 20 + 2,
> -	.vtotal = 2400 + 20 + 2 + 18,
> +static const struct drm_display_mode visionox_vtdr6130_modes[] = {
> +	{
> +		.clock = (1080 + 20 + 2 + 20) * (2400 + 20 + 2 + 18) * 144 / 1000,
> +		.hdisplay = 1080,
> +		.hsync_start = 1080 + 20,
> +		.hsync_end = 1080 + 20 + 2,
> +		.htotal = 1080 + 20 + 2 + 20,
> +		.vdisplay = 2400,
> +		.vsync_start = 2400 + 20,
> +		.vsync_end = 2400 + 20 + 2,
> +		.vtotal = 2400 + 20 + 2 + 18,
> +	},
> +};
> +
> +static struct visionox_vtdr6130_desc visionox_vtdr6130_panel_desc = {
> +	.modes = visionox_vtdr6130_modes,
> +	.num_modes = ARRAY_SIZE(visionox_vtdr6130_modes),
>   	.width_mm = 71,
>   	.height_mm = 157,

Why did you move the width/height out of the mode ?

Leave it in the mode, since you don't even use the same mode for the Retroid 6 panel

> +	.bpc = 8,
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET |
> +		      MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.init_sequence = visionox_vtdr6130_on,
> +	.dsc = {
> +		.dsc_version_major = 0x1,
> +		.dsc_version_minor = 0x2,
> +		.slice_height = 40,
> +		.slice_width = 540,
> +		.slice_count = 2,
> +		.bits_per_component = 8,
> +		.bits_per_pixel = 8 << 4,
> +		.block_pred_enable = true,
> +	},
>   };
>   
>   static int visionox_vtdr6130_get_modes(struct drm_panel *panel,
>   				       struct drm_connector *connector)
>   {
> +	struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
>   	struct drm_display_mode *mode;
>   
> -	mode = drm_mode_duplicate(connector->dev, &visionox_vtdr6130_mode);
> +	mode = drm_mode_duplicate(connector->dev, ctx->desc->modes);
>   	if (!mode)
>   		return -ENOMEM;
>   
>   	drm_mode_set_name(mode);
>   
>   	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> -	connector->display_info.width_mm = mode->width_mm;
> -	connector->display_info.height_mm = mode->height_mm;
> +	connector->display_info.width_mm = ctx->desc->width_mm;
> +	connector->display_info.height_mm = ctx->desc->height_mm;

Drop this change, take them from the mode.

>   	drm_mode_probed_add(connector, mode);
>   
>   	return 1;
> @@ -284,23 +325,17 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>   		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
>   				     "Failed to get reset-gpios\n");
>   
> +	ctx->desc = (struct visionox_vtdr6130_desc *)of_device_get_match_data(dev);
> +	if (!ctx->desc)
> +		return -ENODEV;
> +
>   	ctx->dsi = dsi;
>   	mipi_dsi_set_drvdata(dsi, ctx);
>   
> -	ctx->dsc.dsc_version_major = 0x1;
> -	ctx->dsc.dsc_version_minor = 0x2;
> -	ctx->dsc.slice_height = 40;
> -	ctx->dsc.slice_width = 540;
> -	ctx->dsc.slice_count = 2;
> -	ctx->dsc.bits_per_component = 8;
> -	ctx->dsc.bits_per_pixel = 8 << 4;
> -	ctx->dsc.block_pred_enable = true;
> -
> -	dsi->dsc = &ctx->dsc;
> -	dsi->lanes = 4;
> -	dsi->format = MIPI_DSI_FMT_RGB888;
> -	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET |
> -			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +	dsi->dsc = &ctx->desc->dsc;
> +	dsi->lanes = ctx->desc->lanes;
> +	dsi->format = ctx->desc->format;
> +	dsi->mode_flags = ctx->desc->mode_flags;
>   	ctx->panel.prepare_prev_first = true;
>   
>   	ret = drm_of_get_panel_orientation(dev->of_node, &ctx->orientation);
> @@ -322,7 +357,7 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>   }
>   
>   static const struct of_device_id visionox_vtdr6130_of_match[] = {
> -	{ .compatible = "visionox,vtdr6130" },
> +	{ .compatible = "visionox,vtdr6130", .data = &visionox_vtdr6130_panel_desc },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, visionox_vtdr6130_of_match);
> 

Thanks,
Neil

