Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0143F4824
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781785425; cv=none; b=GQcwzCoV186mr9nKPuyubuSJyFkT8kl/d98YNrN03wrAHZS/s9t8x1PPfl+XeNIZSWoo/l2v38U0yn/wiRYVKTns57w9Tkz3Bvy0cjhcK6W3mAp66gHeKipyexYPnN51jMy78friG+EgszpAyB9KQV0pmsPbdOCl9njbPyhODas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781785425; c=relaxed/simple;
	bh=C3Ue+0dp2+FFHE5z/WmC42l4yMuleDdXt8q4YWy72hE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kB/uuiZwUJIPFX8IE6ZNQn7d2rdT3nsms78os0Gw0np1Vnb663LYhdb9Yf9E/qs3uzCkQsUNZEWi2JkR0LjBc7YQ2iXYMZdA3kpX5OhQG+NJBIBrgMzGAddiqvW7ix5JPlGLc8DdN0ys2sJJKFMv4CUzlGdf3Ns5j8jho9o9nvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l6MfqIvB; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l6MfqIvB"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso7162915e9.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 05:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781785422; x=1782390222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5FEcOXjp/hefaowFGFjzfPrPE1kEo+L375WErKUiNc=;
        b=l6MfqIvBk118YafTKVhdMD8lLT9xAO1GHwCCqAVv/auP80oDC9qR6TheKKXGBH6eVr
         sNDy7Q1AnPcSeM9Mi/ZVml6Ngmcc3waUiT2LKH/BXc65PHHW5qFVjugyNDlYcGS2xr0r
         JVVyGYOI7COycm/WggWIeDeW0iqa4XACTm3m9Nh7S2jXizci+ASmYIHMTlkjimKm6sSM
         nqQ3OMaBtyAwGYZU7CNRg3seMbF5XUne94auG3BXmvu+deSJ+mZlTNEOLPbKXJcKMquQ
         149HQGE4o+cnG/O/TK/rCmauyVpWo3YbpR3Uu8np1364ejPtepmgpPT3g1ptFqbix58c
         Z4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781785422; x=1782390222;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D5FEcOXjp/hefaowFGFjzfPrPE1kEo+L375WErKUiNc=;
        b=JRwhnWWSj4nhTtC2jJrron5za94RnLaYAwKujhk1EhN+pvkBbgY3VYUFRntzV5Y/h1
         0HTtOv0gBl2i+NqwfLqbkU0aWBvr3bRxGnUvZp5Ztty+ossBJhOnwByqJihOxKhRygo0
         1lHpzi6u+jgkSTXWve2qM8x7XED07oEXTyIoR8LImS8Bp9wQ+ur8yHkQVTlBfPIibtv2
         jNffYXjERecD/rxSlnfNZuovxoreMeNljN1T2tXZYP/3AYHO0/RDyFjuwyXmrf2HEdm1
         WJYIJuNB9QMkpzwHIdwkM7YfMNOJFLi2fOsARw92NNMoZbq9UrggzngEpNLBQ6QdHyEJ
         PD7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/cmiFLrgB6gs+77jAaYBXIx8D/55W2wYWBNIQQxxcotozk3Maug+kmNKjX1nhsKdlyWX/YYwy11N+M@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Uj+tIwCrsUl0mk6gMpuIYSZTh5HU0wx/CxTgNzzemoLkcDer
	v40bO74W2V2eYbRTyYm+RpTHOauM5fV89xrkNgJMyTorCw+dKK4a48tQKg1fqGD6wcc=
X-Gm-Gg: AfdE7cnFRstb4W5gtrlU0BIG6JI0Ffr8aNWdimZrOE6gWoWtiIZ45aABigbCyZWTB+A
	fTvKqtjJDy+e7r5c6pHD4+Cn4DHUnHlblwM023njbBi7BlGvxoQ3BlJjgZm8gX0BFTA5R8KXGQ/
	BWOkB0ZQe9mg+ABJGXlmK8h07wgxBAkwoa+o9ttgykAUvMyTRiEfDMYh/j0BZvsmuLnJyewwR9X
	qu8YIG1EuISSUvYhK2QIVuVGp827Wa6gRz4P8pNLFHM7XGIgXC/v5I9x4nfARtxCZHHnSdx6jPO
	LrEOuKswH9xrggbigx2QBcgKAUR66qkykQ91NRRGAs/PXAMwnm6EkIUgvQw+501uCyySSJcWNmT
	D/PpVn4FZ2i2a34bN7F4mxm5HpJallHyt0+4esR1IrrkNrs7w9ZTqIHbWD1ZzeRK3V8cvz3h/sz
	el7tiybH4fXPQDW7xhKXrsBFxHohN9Fh6jtHSaof4Qo1WYl+dLqCnPSSemSortA3KxVg==
X-Received: by 2002:a7b:c8d3:0:b0:492:1e36:9a90 with SMTP id 5b1f17b1804b1-492381a2e79mr37585935e9.18.1781785422212;
        Thu, 18 Jun 2026 05:23:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6e1b:5a5:b2b5:b2c0? ([2a01:e0a:106d:1080:6e1b:5a5:b2b5:b2c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa96f0esm274863325e9.12.2026.06.18.05.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 05:23:41 -0700 (PDT)
Message-ID: <716f71ae-4642-4f22-8a9f-5b1c017d9ac2@linaro.org>
Date: Thu, 18 Jun 2026 14:23:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] drm/panel: himax-hx83121a: add backlight regulator
 support
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260608162622.403713-1-zhengxingda@iscas.ac.cn>
 <20260608162622.403713-3-zhengxingda@iscas.ac.cn>
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
In-Reply-To: <20260608162622.403713-3-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/8/26 18:26, Icenowy Zheng wrote:
> The backlight, when managed by the panel controller, could be powered by
> an external regulator, and shutting down the regulator could power off
> the backlight.
> 
> Add support for such a regulator. It's powered off when the backlight is
> 0 (either by setting brightness to 0 or setting bl_power), and powered
> on when the backlight should be operating.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>   drivers/gpu/drm/panel/panel-himax-hx83121a.c | 26 ++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx83121a.c b/drivers/gpu/drm/panel/panel-himax-hx83121a.c
> index 1a7e0125bced8..e31e2fba0a787 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx83121a.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx83121a.c
> @@ -34,7 +34,9 @@ struct himax {
>   	struct drm_dsc_config dsc;
>   	struct gpio_desc *reset_gpio;
>   	struct regulator_bulk_data *supplies;
> +	struct regulator *bl_supply;
>   	struct backlight_device *backlight;
> +	bool backlight_enabled;
>   };
>   
>   struct panel_desc {
> @@ -195,7 +197,27 @@ static int himax_bl_update_status(struct backlight_device *bl)
>   {
>   	struct himax *ctx = bl_get_data(bl);
>   	u16 brightness = backlight_get_brightness(bl);
> +	int ret = 0;
> +
> +	if (!brightness) {
> +		if (ctx->backlight_enabled)
> +			ret = regulator_disable(ctx->bl_supply);
> +		if (ret)
> +			return ret;
> +
> +		ctx->backlight_enabled = false;
> +
> +		return 0;
> +	}
> +
>   	/* TODO: brightness to raw map table */
> +	if (!ctx->backlight_enabled)
> +		ret = regulator_enable(ctx->bl_supply);
> +	if (ret)
> +		return ret;
> +
> +	ctx->backlight_enabled = true;
> +
>   	return mipi_dsi_dcs_set_display_brightness_large(to_primary_dsi(ctx),
>   							 brightness);
>   }
> @@ -647,6 +669,10 @@ static int himax_probe(struct mipi_dsi_device *dsi)
>   	ctx->panel.prepare_prev_first = true;
>   
>   	if (desc->has_dcs_backlight) {
> +		ctx->bl_supply = devm_regulator_get_optional(dev, "bl");
> +		if (IS_ERR(ctx->bl_supply))
> +			return dev_err_probe(dev, PTR_ERR(ctx->bl_supply),
> +					     "Failed to get backlight supply\n");
>   		ctx->backlight = himax_create_backlight(ctx);
>   		if (IS_ERR(ctx->backlight))
>   			return dev_err_probe(dev, PTR_ERR(ctx->backlight),

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
