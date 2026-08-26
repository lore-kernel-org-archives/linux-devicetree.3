Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4476C3C3BFA
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738349; cv=none; b=l8eYvU50pdf6hLm14fJaY3DlFgKj/VQNPTbZXF5TyF+X71HkFlE+815uZViJ/cC5B3C7QPOCVtPcV4lDJK7snTxDGW9ohZyPI78tRNBTtp/ybXnuQCXDv9zJMS6kcjpxRpka0c2a3DRAFseAMAfr0j2ft9XlXGGVTJ71+AJwa2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738349; c=relaxed/simple;
	bh=NZznLCG6XRdMSRq+voRF6UmObGXy08nOMYbwb/VglSY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=k2DJ+yEYcZ3liYf9fyBDN0ijX3rp/pqUYdeoBP2CknhdTd85aWf8D5NBu7yAyL4pOUtaY3B4c69mftsgw4oB4DAqT40HUjqeqhmXp7VccKhP6T3CYv3LFnA4dbBqe3aaeN5ROO4BAjANsaPsNGSdsKLkhU4oE2XRQsUTfcqeu3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JCQnuj15; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JCQnuj15"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49954b88fffso6199405e9.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787738344; x=1788343144; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dOmSdYlyOAFsl03GMtU/+gDLnQrEtJ7AmptXO+pqeoU=;
        b=JCQnuj15sxN0O4uaPkbypnRXzfdOBE//t+Kktzq6i2q+UybVZzlMu0uVBUw3InZbvy
         rPXlHEd1KBqpZ/oyOo140va+S1B39cFqYg5ggspLvCPL0uhy61RcrwkPFZrNiqrxrUpL
         dBnH3oFsOsci5BypoJF29mdDcE3fGUeEzB6+b/G/TZzhiBULw3Bk3s4PDOiBRyBtjG5K
         cfy0nHcIx+EW1UMEfup3/k0KLSNja/YATYx5EGF39MHee/ch3ksRLKzpnmNYLgziAJfl
         YZpoHbH8kbathBEr1NRKh17LF0G0Knx4XThhtxfV4STNYupD/aA8lQg8neiULB/sluld
         ytZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787738344; x=1788343144;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dOmSdYlyOAFsl03GMtU/+gDLnQrEtJ7AmptXO+pqeoU=;
        b=fVJIrGzuw1fOaXfQAH7YRo4ub0+EartRONrfxrPoyjVC+GDq8o9HY5nxnLcOhMZzm7
         le+VmGX44iQoxONgLu/lSz9LgRulPwr+L9w7qAUrzX3L8f0Ek3noewK6qQun05tTf6lX
         j0nVq9FCsjD+MX/qnO6rP2TxWOvPEXZNKbBb5Y/CRGK+wNse4y9hhiQ6ltZdy+wcX84t
         LPybhAa+I8DOeR5c6c0NQHipBjOEz7rVPSyBmwFyo7d76sPtzbl5Yut1o5R9oDPxCu3L
         cqOLQQaeE5aKDacBOItHn2mC65ZuI9mTzfY+udZwGrJGXu8B5Q0MhuEsTUVCEpACJPz8
         8Fcg==
X-Forwarded-Encrypted: i=1; AHgh+RqxMdptJ8qvxeLvhi/N62xHAcn1y4DeXCqOgI1pToa1sUsL1FLl6WrMvmrszAoXgC0XzKHqkmOsptzw@vger.kernel.org
X-Gm-Message-State: AFuF++lPj9oXKaFOhXljCAnRPqz+g3PFsLRUJUL7AC3y55rYcWOgD7K0
	mCG9oPYqO7FVY/CQvQkB38IImCxTAxKYaKfzjDJ5wGux7gdzoN0HMtA5lixu81lEQKw=
X-Gm-Gg: AR+sD10LQbUnvbDLlfHfBt6O5f2WH6fuy/gVZSH2vRmqfpi5r4H5BdQjXHJEyL/TXOg
	eqpGutGtaZGZzdvtRlSRbNJ5euF6rx+LgnPk/qNGWlliQ62aOQD+mfrgKITbNtXoOrehpmwtOHu
	jH6u9SqiMWaPznpD0h2QxYgZ9CaqalgBoUM5xYxCXVoD+PvI8Hk1+jV+jnVYF6UjxeQX0/uQ0tR
	OPzHLvwbGKELxZr3VCB0ylhoWAr8/2bDZI9n5M87zi+U+7UX8ZGMviHf93JjeHUEKSRfgT0Zkdd
	0ozfQTdN0gQwO+5RR7CFJKFnM9UW5GuiqU//XFY29LRC6PU+DiL38u+T656jNNWN/iavUTXU74y
	zfSBezqH+DPd/Jq5PcFWiVqUhcs3FrIyILtsPNzegq+0OiWFKILcu6VqeyNCD+hV8waiEqCyVyU
	dDvUYgUwYsm4YGkJnYzymByn1IlztJSUL9kMktaL2V3KZG4IYhHamyeZOjRPqN6xGMjy8hlRJmM
	NLyGYITRaFNshx/up3vZI+dkZzBOc6Iqbbk6POnDCwbZA==
X-Received: by 2002:a05:600c:c4ab:b0:499:a8bd:1930 with SMTP id 5b1f17b1804b1-499dc6ef59dmr47369445e9.5.1787738344263;
        Wed, 26 Aug 2026 02:59:04 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:135f:84f0:37f7:9223:8e7a:9b5f? ([2a0d:e487:135f:84f0:37f7:9223:8e7a:9b5f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd5616f7sm13098775e9.2.2026.08.26.02.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:59:03 -0700 (PDT)
Message-ID: <7d654e24-de41-442d-a388-1767d93d9ae6@linaro.org>
Date: Wed, 26 Aug 2026 11:58:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/4] drm/panel: visionox-vtdr6130: Add panel orientation
 support
To: webgeek1234@gmail.com, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260814-rp6-panel-v1-0-111c1aeccf0f@gmail.com>
 <20260814-rp6-panel-v1-2-111c1aeccf0f@gmail.com>
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
In-Reply-To: <20260814-rp6-panel-v1-2-111c1aeccf0f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/26 20:17, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Fetch orientation from the device tree if provided.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> index 6733e0e1d0612..b66d6c7128c75 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> @@ -11,6 +11,7 @@
>   #include <drm/display/drm_dsc.h>
>   #include <drm/display/drm_dsc_helper.h>
>   #include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_of.h>
>   #include <drm/drm_modes.h>
>   #include <drm/drm_panel.h>
>   
> @@ -22,6 +23,7 @@ struct visionox_vtdr6130 {
>   	struct mipi_dsi_device *dsi;
>   	struct gpio_desc *reset_gpio;
>   	struct regulator_bulk_data *supplies;
> +	enum drm_panel_orientation orientation;
>   };
>   
>   static const struct regulator_bulk_data visionox_vtdr6130_supplies[] = {
> @@ -218,10 +220,18 @@ static int visionox_vtdr6130_get_modes(struct drm_panel *panel,
>   	return 1;
>   }
>   
> +static enum drm_panel_orientation visionox_vtdr6130_get_orientation(struct drm_panel *panel)
> +{
> +	struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
> +
> +	return ctx->orientation;
> +}
> +
>   static const struct drm_panel_funcs visionox_vtdr6130_panel_funcs = {
>   	.prepare = visionox_vtdr6130_prepare,
>   	.unprepare = visionox_vtdr6130_unprepare,
>   	.get_modes = visionox_vtdr6130_get_modes,
> +	.get_orientation = visionox_vtdr6130_get_orientation,
>   };
>   
>   static int visionox_vtdr6130_bl_update_status(struct backlight_device *bl)
> @@ -293,6 +303,12 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>   			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
>   	ctx->panel.prepare_prev_first = true;
>   
> +	ret = drm_of_get_panel_orientation(dev->of_node, &ctx->orientation);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to get orientation %d\n", ret);
> +		return ret;
> +	}
> +
>   	ctx->panel.backlight = visionox_vtdr6130_create_backlight(dsi);
>   	if (IS_ERR(ctx->panel.backlight))
>   		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
