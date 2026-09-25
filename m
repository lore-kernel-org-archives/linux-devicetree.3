Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896263CFF77
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326120; cv=none; b=W23nS5l51xulf4b1kpbDgbUn3rkmZG509bNiIqpDBfvdwlBR9Nk7lAcu/qBLyygJKHTLOuRavNCAUfulSlLjPbK7N+A+SLWyYREPdQludYQG1hPBtOvu5lNTyhJVU/qVsrEEcbYkYHFLn/VtOnYCAYlp1VMhAkXuatsCglInanc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326120; c=relaxed/simple;
	bh=1jVjVl4OBaNK7OquoGn25u87dNNFGs/ExKTEsUeRReg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nw3PRxWYdPUzX15DLLjhF3x3XvHAcuyR3Gti9G6IaJhF3W5ZZlj2KHdDOkzoOAOSEzHWYEW1BpjXn8u2y8zhfoBBvQK3CgsZrffUS2dbWqUVwlFew70cmlH9mHpDVNlpCZrAd7Xz1FQjvOvo+pOL4Dw0cGNjlRm2EVY4rRzr56c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iXbG0k4x; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iXbG0k4x"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4888129c46eso118975f8f.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 01:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790326112; x=1790930912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpvSck30Mei4950pB2Qnx5VBLDrG69rUKIF8NRXkiMQ=;
        b=iXbG0k4xk78n5HYinwPrAx1E6h3sqKfPhxR2VDQKnnfs9GAcoYOgGG3QWujTKBg6v3
         W17La63056ZPbsIh4hdUfoD98vBgg3Z/gLDsstdvJHDpCsa3p+eyn3TZVVih9ohJjHQq
         MnM2gTs5QThtaq8Zo9O1O5E0WEq5/0BoBgO+oB1dDjqb49iwY4gDP9TtwH+P+U1dn1Yu
         fLri1Ntpl9ogd+vsZ2lhES6Ja6lhza89E+M+as8CeKPSJo6Zv8UMxVHWRUCWrDBHbc1F
         pp5gzKEILGQekSSPs62YNDle/1KMQc+YKhmy5oMKh8Xz+hmAy6GkIGudAtYrpDf/xz/4
         Ib8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790326112; x=1790930912;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qpvSck30Mei4950pB2Qnx5VBLDrG69rUKIF8NRXkiMQ=;
        b=t2evUeXZOu65U1Fc/p83r+QBLeJeLXRZ6OqFNWfPp4/Eb0Ik6ssn8S1im2ypazdnV9
         UpI0e40jf0mnxgh9puSCjvSC1yJHqq+m+bghWfaeZFHUpkfEWk9MMy8OCaXJ43JG3s2S
         SdqKhqu1/OczfsUcl2GiToGH1MhI4BQS7x73a3sKdK0AznfGR5/wXjo+f2pkuIXaY2IX
         Gdzs3PQFgVOKD/d7OX9ZR0Id0d/tNeI8sa+qbn+D5rXAUCCxGpRB+BBMVEw0+HjkKx7G
         K3kv8Jeceid5pM5PEn/4vGr3IfBGHbxQ14Zq95BnkxrXNW3IFjOndFQ58MVajJOl2bKI
         t3ag==
X-Forwarded-Encrypted: i=1; AKwUvBw2vJHFFzyOd1kaHr+vI3h/PJl+Fav/jTkr1kDmnQ45iWbPx85YKWFI1t69P0ybcAaW8l6/oO5NykWJ@vger.kernel.org
X-Gm-Message-State: AFuF++kXKFBuEwwZ0ekRyBPjp1/5K02lPe3T8w8BEFDQZMyFHxmO+0gy
	dC07EAjfFSX1Jx2I9aqgpAUpUVjVprjlTYU7FiGkkOQOQSu9A67f4VkK/HgMZLpP9Ao=
X-Gm-Gg: AYBFou1n1+u3LEDn04YJUsLp9MiRNp2uBplZXiEerGju7rzgs8uqX/8eDeyN70dUNJB
	UE/OJiEQNrkeyKKQakKpwwmo8gCc0rnOpoi2ead2WZCWoqA+Ym82eh+cmTmBmyjpHtyc68h9SwW
	KBvJM6faA+3WILHyRtxMY7uNWD7vJAKylDiLVZi1NNmJk7nWzc8CCEah9P0Eq2+jqXX/khr0Y+n
	C/I9peu6NCNcPcWtyvH1A5hzqaeCLl9Mgu8+Z639ZYsmXblvUZkrVCu4x2h+yJpuQ2zMjXhuDdf
	W41GvIwdHUlCM/Ikc3TamjHnZd0LZbf6eEXfv8f5TeAmXUKM8BisOu9uE1soarID7VmEruT2f9X
	61pK5pQnWNTSWIRentb/+a6UIG6ykYFyd2pfW36bMgGy+JpYrakyCltaX8LFLRlUDZcjtl/Ce86
	JlXTDGqf4DYeuqrvWBEtkhyQgiNTU/XYktsd/FxDE/vf6rKS3FpYVZSMbkyLR0sB0naF/jAqN5M
	52qWKzaAcM196CIfitsST+nk6ZEMcuoThKdN2b3KfgflURKlWWSEA==
X-Received: by 2002:a05:6000:4103:b0:488:7496:15b5 with SMTP id ffacd0b85a97d-48874961605mr6151357f8f.47.1790326112423;
        Fri, 25 Sep 2026 01:48:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3151:fc9b:d41c:770b? ([2a01:e0a:106d:1080:3151:fc9b:d41c:770b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm5142693f8f.9.2026.09.25.01.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:48:31 -0700 (PDT)
Message-ID: <2b551580-8f7c-41fc-b1a7-96046e52c4f6@linaro.org>
Date: Fri, 25 Sep 2026 10:48:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/4] drm/panel: visionox-vtdr6130: Modularize panel
 config
To: webgeek1234@gmail.com, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260925-rp6-panel-v2-0-19c425e523de@gmail.com>
 <20260925-rp6-panel-v2-3-19c425e523de@gmail.com>
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
In-Reply-To: <20260925-rp6-panel-v2-3-19c425e523de@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/26 09:08, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> The vtdr6130 is a DDIC, a common chip that is used by multiple panels.
> Prepare the driver for more panels.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 91 +++++++++++++++++--------
>   1 file changed, 61 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> index b66d6c7128c75..278f5acc2d661 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> @@ -19,11 +19,24 @@
>   
>   struct visionox_vtdr6130 {
>   	struct drm_panel panel;
> -	struct drm_dsc_config dsc;
>   	struct mipi_dsi_device *dsi;
>   	struct gpio_desc *reset_gpio;
>   	struct regulator_bulk_data *supplies;
>   	enum drm_panel_orientation orientation;
> +	struct visionox_vtdr6130_desc *desc;
> +};
> +
> +struct visionox_vtdr6130_desc {
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
> @@ -162,7 +175,7 @@ static int visionox_vtdr6130_prepare(struct drm_panel *panel)
>   
>   	visionox_vtdr6130_reset(ctx);
>   
> -	ret = visionox_vtdr6130_on(ctx);
> +	ret = ctx->desc->init_sequence(ctx);
>   	if (ret < 0) {
>   		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>   		regulator_bulk_disable(ARRAY_SIZE(visionox_vtdr6130_supplies),
> @@ -187,26 +200,50 @@ static int visionox_vtdr6130_unprepare(struct drm_panel *panel)
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
> -	.width_mm = 71,
> -	.height_mm = 157,
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
> +		.width_mm = 71,
> +		.height_mm = 157,
> +	},
> +};
> +
> +static struct visionox_vtdr6130_desc visionox_vtdr6130_panel_desc = {
> +	.modes = visionox_vtdr6130_modes,
> +	.num_modes = ARRAY_SIZE(visionox_vtdr6130_modes),
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
> @@ -284,23 +321,17 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
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
> @@ -322,7 +353,7 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>   }
>   
>   static const struct of_device_id visionox_vtdr6130_of_match[] = {
> -	{ .compatible = "visionox,vtdr6130" },
> +	{ .compatible = "visionox,vtdr6130", .data = &visionox_vtdr6130_panel_desc },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, visionox_vtdr6130_of_match);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
