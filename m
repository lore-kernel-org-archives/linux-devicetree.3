Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286BA3A4520
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781785409; cv=none; b=WIxnmTV5fHfu4IkxhR6kSnVS4tMFoJfKWVcftjg5FvO3y9GK+9EEunxACIIMcjYUf85SdNGsHeA2Pn7cpkbvPpJ+stewTWE0ChjvqVZhbpTlJr/Go2Lw0A90avStn0VmiVLcS4Dfh+kKInT7pY/kHZTGWecCMxIA6bjxreGSWCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781785409; c=relaxed/simple;
	bh=uU5OBoufNUDiJYl4uTWoBMLkpvuL5gBwbsY9sZQoC/s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MKUP0U0s1SPI+ars9zdA05pTYMtpFl4bXe9lJkzH+QTg0N8ZHRBNFjAdKtw6O05oYXfdjjWc/eD1ajIr9miKVss8d1ZAMVl4A0q5Zo55H+Ts6ykUmFJzW9Io+IW4/C0tcsolwvl2jvp4j5vwJBSvb8KPlajIXnbmBVDsDU1XWO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dFGjZrxW; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dFGjZrxW"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b3637b90so6228475e9.3
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 05:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781785406; x=1782390206; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LAtGu/fA9uXxnFye1zu9fsid/L2b+MdGaREMuZCR+iU=;
        b=dFGjZrxW/rxZ/zBLHiuFUs/WEH2l9BIYv9FzpcuEdDVIp+V7S/qKEVYLWJw+tDsnf3
         KQ8QCerZjDadselGIdSF4/IRLtozc+wz+iXsrGZW6U5c6rJfwfGfyrLhAyalFne+kjbY
         Q4qmT9mh4o9EO74speovBsMIlNBNgHlU+7B7wplNVF2IzXjwxLQnAa6sP3sE/JjUsxCR
         Wj5g6587J9FHaeWyXzukGwbmxOe0Qu4DKx+oV803M7xL8A/z8VYDKWMMKu6RqC66aQEX
         F12FPhOMCAV6ou789qcV/zqm2x+OgGJrB4l+OEHolQtqNzL2GortHmNJq2UUiatGYCCf
         fZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781785406; x=1782390206;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LAtGu/fA9uXxnFye1zu9fsid/L2b+MdGaREMuZCR+iU=;
        b=IwjaO6zA2KD4wdmjqOD+NbzKR5KJQvoMdFf6c7Mm77kneNNaIoBKYqS0qba6fSMmFt
         gGQhzsNcDhhPTZUmSF1Ybp/vUR3DUmK3Rpnr7FP3dLyUeVLGUoC9B2wDZVCj956ISW3i
         IqfVkrWZowt1+RR57wV4oxcqTPoCfrZTKajFvH6Q8dzc1GiujgqtFiH864gcfc8HDq8B
         nrOdhDSBse3i8J4An4f+RIBHJlwd/EWHRQNgeOBpPVRG4rII5kcPdehx48ZsH1HMJw6z
         YYYpBj3XUWKlYTWU7gzd522/nshyzbm1Omy9qcM9eiJCbhS3f7mLkmj6dYEa38hUfCVf
         EgwA==
X-Forwarded-Encrypted: i=1; AFNElJ8t0d0H6znGykZolfNYUpjGc2yaoL15hg8QkeyjV3RRoD8p1ABblJ5Sx+l58t0VAaoidM3/8xVk7jZf@vger.kernel.org
X-Gm-Message-State: AOJu0YzBoKEOdKb694um5DqE/IAHQPLKAQEHcJV6yOGKuJI4NZxmnK1D
	oDHNh+SlK6TBiKXHZKdvT6Yy+HUc1LY2uPVFzMfzG5+VAnkE7MVp92e91YeGKr0FNtE=
X-Gm-Gg: AfdE7clvjpk1HkK+0TUsGzKYGbUNiPYEvZHDnxS41/kR2B/F2cUkNyI0OYeQGwwcwwX
	jA3cfXnivATpJ+Abzha9I+JF0wMJFMB5ILk/Yrclj+PpYTvuhZmbzo6rDZd35AcTN3HNBlipHfU
	6wbDqDN5DC/dUQTekStMpZNpgTg9j5hVchwSdvyi/xIMI7RpGDrB6qpGRuZb2nstxiSHOE5SH7+
	HuZPp8I/1NFpHzTsj80UiQorD0M+C7jIT1SPjSpEQi9IBDkMMflg7vaL0NCvnLJOU3tTXHv3app
	MOFTxRc2A4JtNvPQJgSHCCW/9plJpOFtfOMexCBl7qzmTG7W6wkG6WQr7KGx2/hl7nm58yeA7dD
	XABQG3aX6oOJnqGGTtTUubK2B3XG24dcsaCDghiZnSj4LBoWrhYaiZ1CSHjE6V9RUIIjZXE0M5b
	RfMWoAAOqE5Z6lrtOcUA0h/NOwVYky+RpBpk494CIJAWydT+SeRg3WhzM0j0CE+k0nMw==
X-Received: by 2002:a05:600c:4ed4:b0:492:1e36:85dd with SMTP id 5b1f17b1804b1-49238231011mr57313945e9.37.1781785406267;
        Thu, 18 Jun 2026 05:23:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6e1b:5a5:b2b5:b2c0? ([2a01:e0a:106d:1080:6e1b:5a5:b2b5:b2c0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-461eaa0d275sm19033981f8f.2.2026.06.18.05.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 05:23:25 -0700 (PDT)
Message-ID: <d7e482c2-80aa-49ec-b339-8bffbdd7e664@linaro.org>
Date: Thu, 18 Jun 2026 14:23:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/3] drm/panel: himax-hx83121a: pass the panel pointer
 when creating BL
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
 <20260608162622.403713-2-zhengxingda@iscas.ac.cn>
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
In-Reply-To: <20260608162622.403713-2-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/8/26 18:26, Icenowy Zheng wrote:
> As backlight powering on/off support will be added, more fields of the
> panel context will be accessed in the backlight update function.
> 
> Pass the whole panel struct instead of the DSI device when creating the
> backlight device.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>   drivers/gpu/drm/panel/panel-himax-hx83121a.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx83121a.c b/drivers/gpu/drm/panel/panel-himax-hx83121a.c
> index bed79aa06f46a..1a7e0125bced8 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx83121a.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx83121a.c
> @@ -193,10 +193,11 @@ static const struct drm_panel_funcs himax_panel_funcs = {
>   
>   static int himax_bl_update_status(struct backlight_device *bl)
>   {
> -	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	struct himax *ctx = bl_get_data(bl);
>   	u16 brightness = backlight_get_brightness(bl);
>   	/* TODO: brightness to raw map table */
> -	return mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
> +	return mipi_dsi_dcs_set_display_brightness_large(to_primary_dsi(ctx),
> +							 brightness);
>   }
>   
>   static const struct backlight_ops himax_bl_ops = {
> @@ -205,9 +206,9 @@ static const struct backlight_ops himax_bl_ops = {
>   };
>   
>   static struct backlight_device *
> -himax_create_backlight(struct mipi_dsi_device *dsi)
> +himax_create_backlight(struct himax *ctx)
>   {
> -	struct device *dev = &dsi->dev;
> +	struct device *dev = &to_primary_dsi(ctx)->dev;
>   	const struct backlight_properties props = {
>   		.type = BACKLIGHT_RAW,
>   		.brightness = 512,
> @@ -215,7 +216,7 @@ himax_create_backlight(struct mipi_dsi_device *dsi)
>   		.scale = BACKLIGHT_SCALE_NON_LINEAR,
>   	};
>   
> -	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, ctx,
>   					      &himax_bl_ops, &props);
>   }
>   
> @@ -646,7 +647,7 @@ static int himax_probe(struct mipi_dsi_device *dsi)
>   	ctx->panel.prepare_prev_first = true;
>   
>   	if (desc->has_dcs_backlight) {
> -		ctx->backlight = himax_create_backlight(to_primary_dsi(ctx));
> +		ctx->backlight = himax_create_backlight(ctx);
>   		if (IS_ERR(ctx->backlight))
>   			return dev_err_probe(dev, PTR_ERR(ctx->backlight),
>   					     "Failed to create backlight\n");

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
